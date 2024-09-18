package alternativa.tanks.controllers.battleinfo
{
   import § !g§.§class for case§;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.controllers.BattleSelectVectorUtil;
   import alternativa.tanks.service.money.IMoneyService;
   import alternativa.tanks.view.battleinfo.BattleInfoViewEvent;
   import alternativa.tanks.view.battleinfo.team.BattleInfoTeamParams;
   import alternativa.tanks.view.battleinfo.team.BattleInfoTeamView;
   import alternativa.tanks.view.battleinfo.team.IBattleInfoTeamView;
   import alternativa.types.Long;
   import flash.events.EventDispatcher;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   import platform.client.fp10.core.resource.types.ImageResource;
   import projects.tanks.client.battleselect.model.info.BattleInfoUser;
   import projects.tanks.clients.flash.commons.services.layout.LobbyLayoutServiceEvent;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.AlertServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.UserPropertiesServiceEvent;
   import services.alertservice.§get const use§;
   import utils.preview.IImageResource;
   import utils.preview.ImageResourceLoadingWrapper;
   
   public class BattleInfoTeamController extends EventDispatcher implements IImageResource
   {
      [Inject]
      public static var moneyService:IMoneyService;
      
      [Inject]
      public static var battleAlertService:IAlertService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      private var _view:IBattleInfoTeamView;
      
      private var _usersInfoRed:Vector.<BattleInfoUser>;
      
      private var _usersInfoBlue:Vector.<BattleInfoUser>;
      
      private var _countDownTimer:Timer;
      
      private var _countDown:int = 0;
      
      private var _timeLimitInSec:int = 0;
      
      private var _startTimeInSec:int = 0;
      
      private var _setupTime:int;
      
      private var _rememberBattleTeam:§class for case§;
      
      private var _userAlreadyPaid:Boolean;
      
      private var _proBattle:Boolean;
      
      private var _autoBalance:Boolean;
      
      private var _proBattleEnterPrice:int;
      
      private var _noSuppliesTimeLeftInSec:int;
      
      private var _available:Boolean;
      
      private var _maxPeopleCount:int;
      
      private var _previewLoadingId:Long;
      
      private var _minRank:int;
      
      private var _maxRank:int;
      
      private var _battleItemId:String;
      
      public function BattleInfoTeamController(param1:IBattleInfoTeamView)
      {
         super();
         this._view = param1;
         this.init();
      }
      
      private static function onExitFromBattle(param1:BattleInfoViewEvent) : void
      {
         lobbyLayoutService.exitFromBattle();
      }
      
      private static function onReturnToBattle(param1:BattleInfoViewEvent) : void
      {
         lobbyLayoutService.showBattleSelect();
      }
      
      private function init() : void
      {
         this._countDownTimer = new Timer(500);
         this._usersInfoBlue = new Vector.<BattleInfoUser>();
         this._usersInfoRed = new Vector.<BattleInfoUser>();
      }
      
      public function showForm(param1:BattleInfoTeamParams) : void
      {
         this._proBattle = param1.proBattle;
         this._maxPeopleCount = param1.maxPeopleCount;
         this._userAlreadyPaid = param1.userPaidNoSuppliesBattle;
         this._proBattleEnterPrice = param1.proBattleEnterPrice;
         this._noSuppliesTimeLeftInSec = param1.noSuppliesTimeLeftInSec;
         this._timeLimitInSec = param1.timeLimitInSec;
         this._autoBalance = param1.autoBalance;
         this._minRank = param1.minRank;
         this._maxRank = param1.maxRank;
         this._battleItemId = param1.battleItemId;
         this.setEvents();
         this.updateNoSupplies();
         var _loc2_:ImageResource = param1.previewResource;
         if(_loc2_.isLazy && !_loc2_.isLoaded)
         {
            this._previewLoadingId = _loc2_.id;
            _loc2_.loadLazyResource(new ImageResourceLoadingWrapper(this));
         }
         this._view.updateInitParams(param1);
         this.onLobbyLayoutStateChange();
         this.updateSettingsTimeLimit(param1.roundStarted,param1.timeLeftInSec);
         this.updateUsersInfo(param1.usersBlue,param1.usersRed);
         this.updateAvailable(userPropertiesService.rank);
         this.updateAvailableEnterInBattle();
         this._view.show();
      }
      
      public function setPreviewResource(param1:ImageResource) : void
      {
         if(this._previewLoadingId == param1.id)
         {
            this._view.setPreview(param1.data);
         }
      }
      
      private function updateNoSupplies() : void
      {
         if(this._proBattle)
         {
            if(this._userAlreadyPaid)
            {
               this._view.hideNoSuppliesAlert();
               this._view.setCostProBattle(0);
            }
            else if(this._noSuppliesTimeLeftInSec == 0)
            {
               this._view.showNoSuppliesAlert();
               this._view.setCostProBattle(this._proBattleEnterPrice);
            }
            else
            {
               this._view.hideNoSuppliesAlert();
               this._view.setCostProBattle(0);
            }
         }
         else
         {
            this._view.hideNoSuppliesAlert();
            this._view.setCostProBattle(0);
         }
      }
      
      private function setEvents() : void
      {
         this._view.addEventListener(BattleInfoViewEvent.EXIT_FROM_BATTLE,onExitFromBattle);
         this._view.addEventListener(BattleInfoViewEvent.RETURN_TO_BATTLE,onReturnToBattle);
         this._view.addEventListener(BattleInfoViewEvent.ENTER_TEAM,this.onEnterTeam);
         this._view.addEventListener(BattleInfoViewEvent.ENTER_SPECTATOR,this.onEnterSpectator);
         userPropertiesService.addEventListener(UserPropertiesServiceEvent.UPDATE_RANK,this.onUpdateRank);
         lobbyLayoutService.addEventListener(LobbyLayoutServiceEvent.BEGIN_LAYOUT_SWITCH,this.onLobbyLayoutStateChange);
         lobbyLayoutService.addEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,this.onLobbyLayoutStateChange);
      }
      
      private function onUpdateRank(param1:UserPropertiesServiceEvent) : void
      {
         this.updateAvailable(param1.userProperties.rank);
         this.updateAvailableEnterInBattle();
      }
      
      private function updateSettingsTimeLimit(param1:Boolean, param2:int) : void
      {
         this.stopTimerCountDown();
         if(this._timeLimitInSec != 0)
         {
            if(param1)
            {
               this.restartTimerCountDown(param2);
            }
            this._countDown = param2 > 0 ? int(param2) : int(this._timeLimitInSec);
            this._view.setTime(TimeStringUtils.getTimeStr(this._countDown));
         }
      }
      
      private function updateUsersInfo(param1:Vector.<BattleInfoUser>, param2:Vector.<BattleInfoUser>) : void
      {
         var _loc3_:BattleInfoUser = null;
         var _loc4_:BattleInfoUser = null;
         this._usersInfoBlue.length = 0;
         var _loc5_:int = int(param1.length);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc3_ = param1[_loc6_];
            this._usersInfoBlue.push(_loc3_);
            this.updateBlueUser(_loc3_);
            _loc6_++;
         }
         this._usersInfoRed.length = 0;
         _loc5_ = int(param2.length);
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc4_ = param2[_loc6_];
            this._usersInfoRed.push(_loc4_);
            this.updateRedUser(_loc4_);
            _loc6_++;
         }
      }
      
      private function updateAvailable(param1:int) : void
      {
         if(param1 >= this._minRank && param1 <= this._maxRank)
         {
            this._available = true;
         }
         else
         {
            this._available = false;
         }
      }
      
      public function updateAvailableEnterInBattle() : void
      {
         if(this._available)
         {
            if(this._usersInfoBlue.length < this._maxPeopleCount && (!this._autoBalance || this._usersInfoBlue.length <= this._usersInfoRed.length))
            {
               this._view.enableEnterInBattleBlue();
            }
            else
            {
               this._view.disableEnterInBattleBlue();
            }
            if(this._usersInfoRed.length < this._maxPeopleCount && (!this._autoBalance || this._usersInfoRed.length <= this._usersInfoBlue.length))
            {
               this._view.enableEnterInBattleRed();
            }
            else
            {
               this._view.disableEnterInBattleRed();
            }
         }
         else
         {
            this._view.disableEnterInBattleRed();
            this._view.disableEnterInBattleBlue();
         }
      }
      
      public function hideForm() : void
      {
         this.removeEvents();
         this.stopTimerCountDown();
         this._view.hide();
      }
      
      public function addFormToStage() : void
      {
         this._view.show();
      }
      
      public function removeFormFromStage() : void
      {
         this._view.hide();
      }
      
      private function removeEvents() : void
      {
         this._view.removeEventListener(BattleInfoViewEvent.EXIT_FROM_BATTLE,onExitFromBattle);
         this._view.removeEventListener(BattleInfoViewEvent.RETURN_TO_BATTLE,onReturnToBattle);
         lobbyLayoutService.removeEventListener(LobbyLayoutServiceEvent.BEGIN_LAYOUT_SWITCH,this.onLobbyLayoutStateChange);
         lobbyLayoutService.removeEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,this.onLobbyLayoutStateChange);
         this._view.removeEventListener(BattleInfoViewEvent.ENTER_TEAM,this.onEnterTeam);
         this._view.removeEventListener(BattleInfoViewEvent.ENTER_SPECTATOR,this.onEnterSpectator);
         userPropertiesService.removeEventListener(UserPropertiesServiceEvent.UPDATE_RANK,this.onUpdateRank);
      }
      
      public function destroy() : void
      {
         this.hideForm();
         this.removeEvents();
         this.stopTimerCountDown();
         this._view.destroy();
         this._view = null;
         this._usersInfoBlue = null;
         this._usersInfoRed = null;
         this._countDownTimer = null;
         this._battleItemId = null;
      }
      
      public function updateName(param1:String) : void
      {
         this._view.updateBattleName(param1);
      }
      
      public function addUserTeam(param1:BattleInfoUser, param2:§class for case§) : void
      {
         if(param2 == §class for case§.RED)
         {
            this._usersInfoRed.push(param1);
            this.updateRedUser(param1);
         }
         if(param2 == §class for case§.BLUE)
         {
            this._usersInfoBlue.push(param1);
            this.updateBlueUser(param1);
         }
         this.updateAvailableEnterInBattle();
      }
      
      public function removeUser(param1:String) : void
      {
         if(BattleSelectVectorUtil.getUsersById(this._usersInfoBlue,param1) != null)
         {
            BattleSelectVectorUtil.deleteElementInUsersVector(this._usersInfoBlue,param1);
         }
         else if(BattleSelectVectorUtil.getUsersById(this._usersInfoRed,param1) != null)
         {
            BattleSelectVectorUtil.deleteElementInUsersVector(this._usersInfoRed,param1);
         }
         this._view.removeUser(param1);
         this.updateAvailableEnterInBattle();
      }
      
      public function updateTeamScore(param1:§class for case§, param2:int) : void
      {
         this._view.updateScore(param1,param2);
      }
      
      public function updateUserScore(param1:String, param2:int) : void
      {
         var _loc3_:BattleInfoUser = null;
         var _loc4_:BattleInfoUser = BattleSelectVectorUtil.getUsersById(this._usersInfoBlue,param1);
         if(_loc4_ != null)
         {
            _loc4_.score = param2;
            this.updateBlueUser(_loc4_);
         }
         else
         {
            _loc3_ = BattleSelectVectorUtil.getUsersById(this._usersInfoRed,param1);
            if(_loc3_ != null)
            {
               _loc3_.score = param2;
               this.updateRedUser(_loc3_);
            }
         }
      }
      
      public function updateUserSuspiciousState(param1:String, param2:Boolean) : void
      {
         var _loc3_:BattleInfoUser = null;
         var _loc4_:BattleInfoUser = BattleSelectVectorUtil.getUsersById(this._usersInfoBlue,param1);
         if(_loc4_ != null)
         {
            _loc4_.suspicious = param2;
            this.updateBlueUser(_loc4_);
         }
         else
         {
            _loc3_ = BattleSelectVectorUtil.getUsersById(this._usersInfoRed,param1);
            if(_loc3_ != null)
            {
               _loc3_.suspicious = param2;
               this.updateRedUser(_loc3_);
            }
         }
      }
      
      private function updateRedUser(param1:BattleInfoUser) : void
      {
         this._view.updatePlayer(BattleInfoTeamView.RED_TEAM,param1.user,param1.score,param1.suspicious);
      }
      
      private function updateBlueUser(param1:BattleInfoUser) : void
      {
         this._view.updatePlayer(BattleInfoTeamView.BLUE_TEAM,param1.user,param1.score,param1.suspicious);
      }
      
      public function swapTeams() : void
      {
         var _loc1_:Vector.<BattleInfoUser> = new Vector.<BattleInfoUser>();
         var _loc2_:int = int(this._usersInfoBlue.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_.push(this._usersInfoBlue[_loc3_]);
            _loc3_++;
         }
         var _loc4_:Vector.<BattleInfoUser> = new Vector.<BattleInfoUser>();
         _loc2_ = int(this._usersInfoRed.length);
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_.push(this._usersInfoRed[_loc3_]);
            _loc3_++;
         }
         this._view.clearUsersInfo();
         this.updateUsersInfo(_loc4_,_loc1_);
         this.updateAvailableEnterInBattle();
      }
      
      public function roundStart() : void
      {
         this.restartTimerCountDown(this._timeLimitInSec);
      }
      
      public function roundFinish() : void
      {
         this.stopTimerCountDown();
         this._countDown = 0;
         this._view.setTime(TimeStringUtils.getTimeStr(this._countDown));
      }
      
      public function battleStop() : void
      {
         this.stopTimerCountDown();
         this._countDown = this._timeLimitInSec;
         this._view.setTime(TimeStringUtils.getTimeStr(this._countDown));
      }
      
      private function startCountDown() : void
      {
         this._countDownTimer.addEventListener(TimerEvent.TIMER,this.onTimer);
         this._countDownTimer.start();
         this.onTimer(null);
      }
      
      private function stopTimerCountDown() : void
      {
         this._countDownTimer.stop();
         this._countDownTimer.removeEventListener(TimerEvent.TIMER,this.onTimer);
      }
      
      private function restartTimerCountDown(param1:int) : void
      {
         this._startTimeInSec = param1;
         this._countDown = param1;
         this._setupTime = getTimer();
         this.stopTimerCountDown();
         this.startCountDown();
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         var _loc2_:int = 0;
         if(this._countDown < 0)
         {
            this._countDownTimer.removeEventListener(TimerEvent.TIMER,this.onTimer);
            this._countDownTimer.stop();
         }
         else
         {
            this._view.setTime(TimeStringUtils.getTimeStr(this._countDown));
            _loc2_ = getTimer();
            this._countDown = this._startTimeInSec - (_loc2_ - this._setupTime) / 1000;
         }
      }
      
      public function durationBattleNoSuppliesIsOverAboniment() : void
      {
         this._noSuppliesTimeLeftInSec = 0;
         this.updateNoSupplies();
         this.updateAvailableEnterInBattle();
      }
      
      private function onEnterTeam(param1:BattleInfoViewEvent) : void
      {
         if(this._proBattle && this._noSuppliesTimeLeftInSec == 0 && !this._userAlreadyPaid)
         {
            if(moneyService.§while package dynamic§(this._proBattleEnterPrice))
            {
               this.showPayedBattleAlert(param1.team);
            }
         }
         else
         {
            this._view.disableEnterInBattleBlue();
            this._view.disableEnterInBattleRed();
            dispatchEvent(param1.clone());
         }
      }
      
      private function showPayedBattleAlert(param1:§class for case§) : void
      {
         this._rememberBattleTeam = param1;
         var _loc2_:Vector.<String> = Vector.<String>([§get const use§.ENTER,§get const use§.§in package get§]);
         battleAlertService.showAlert(localeService.getText(TanksLocale.§'"H§),_loc2_);
         battleAlertService.addEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onAlertButtonPressed);
      }
      
      private function onAlertButtonPressed(param1:AlertServiceEvent) : void
      {
         battleAlertService.removeEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onAlertButtonPressed);
         if(param1.typeButton == localeService.getText(TanksLocale.TEXT_BATTLEINFO_PANEL_PAID_BATTLES_ALERT_ANSWER_ENTER))
         {
            dispatchEvent(new BattleInfoViewEvent(BattleInfoViewEvent.ENTER_TEAM,this._rememberBattleTeam));
         }
      }
      
      private function onEnterSpectator(param1:BattleInfoViewEvent) : void
      {
         if(lobbyLayoutService.inBattle())
         {
            lobbyLayoutService.exitFromBattle();
         }
         else
         {
            dispatchEvent(param1.clone());
         }
      }
      
      private function onLobbyLayoutStateChange(param1:LobbyLayoutServiceEvent = null) : void
      {
         if(lobbyLayoutService.isSwitchInProgress())
         {
            this._view.lock();
         }
         else
         {
            this._view.unlock();
         }
         this._view.updateInBattleState();
      }
      
      public function getBattleItemId() : String
      {
         return this._battleItemId;
      }
   }
}

