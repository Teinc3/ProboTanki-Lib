package alternativa.tanks.controllers.battleinfo
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.controllers.BattleSelectVectorUtil;
   import alternativa.tanks.service.money.IMoneyService;
   import alternativa.tanks.view.battleinfo.BattleInfoViewEvent;
   import alternativa.tanks.view.battleinfo.dm.BattleInfoDmParams;
   import alternativa.tanks.view.battleinfo.dm.IBattleInfoDmView;
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
   
   public class BattleInfoDMController extends EventDispatcher implements IImageResource
   {
      [Inject]
      public static var moneyService:IMoneyService;
      
      [Inject]
      public static var battleAlertService:IAlertService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      private var _view:IBattleInfoDmView;
      
      private var _usersInfo:Vector.<BattleInfoUser>;
      
      private var _countDownTimer:Timer;
      
      private var _countDown:int = 0;
      
      private var _timeLimitInSec:int = 0;
      
      private var _startTimeInSec:int = 0;
      
      private var _setupTime:int;
      
      private var _userAlreadyPaid:Boolean;
      
      private var _proBattle:Boolean;
      
      private var _proBattleEnterPrice:int;
      
      private var _noSuppliesTimeLeftInSec:int;
      
      private var _available:Boolean;
      
      private var _maxPeopleCount:int;
      
      private var _previewLoadingId:Long;
      
      private var _minRank:int;
      
      private var _maxRank:int;
      
      private var _battleItemId:String;
      
      public function BattleInfoDMController(param1:IBattleInfoDmView)
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
         this._usersInfo = new Vector.<BattleInfoUser>();
      }
      
      public function showForm(param1:BattleInfoDmParams) : void
      {
         this._maxPeopleCount = param1.maxPeopleCount;
         this._proBattle = param1.proBattle;
         this._userAlreadyPaid = param1.userPaidNoSuppliesBattle;
         this._proBattleEnterPrice = param1.proBattleEnterPrice;
         this._noSuppliesTimeLeftInSec = param1.noSuppliesTimeLeftInSec;
         this._timeLimitInSec = param1.timeLimitInSec;
         this._minRank = param1.minRank;
         this._maxRank = param1.maxRank;
         this._battleItemId = param1.battleItemId;
         this.setEvents();
         var _loc2_:ImageResource = param1.previewResource;
         if(_loc2_.isLazy && !_loc2_.isLoaded)
         {
            this._previewLoadingId = _loc2_.id;
            _loc2_.loadLazyResource(new ImageResourceLoadingWrapper(this));
         }
         this.updateNoSupplies();
         this._view.updateInitParams(param1);
         this.onLobbyLayoutStateChange();
         this.updateSettingsTimeLimit(param1.roundStarted,param1.timeLeftInSec);
         this.updateUsersInfo(param1.users);
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
      
      private function setEvents() : void
      {
         this._view.addEventListener(BattleInfoViewEvent.EXIT_FROM_BATTLE,onExitFromBattle);
         this._view.addEventListener(BattleInfoViewEvent.RETURN_TO_BATTLE,onReturnToBattle);
         this._view.addEventListener(BattleInfoViewEvent.ENTER_DM,this.onEnterDm);
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
      
      private function updateUsersInfo(param1:Vector.<BattleInfoUser>) : void
      {
         var _loc2_:BattleInfoUser = null;
         this._usersInfo.length = 0;
         var _loc3_:int = int(param1.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = param1[_loc4_];
            this._usersInfo.push(_loc2_);
            this._view.updatePlayer(_loc2_.user,_loc2_.kills,_loc2_.suspicious);
            _loc4_++;
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
         if(this._available && this._usersInfo.length < this._maxPeopleCount)
         {
            this._view.enableEnterInBattle();
         }
         else
         {
            this._view.disableEnterInBattle();
         }
      }
      
      public function hideForm() : void
      {
         this.removeEvents();
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
         lobbyLayoutService.removeEventListener(LobbyLayoutServiceEvent.BEGIN_LAYOUT_SWITCH,this.onLobbyLayoutStateChange);
         lobbyLayoutService.removeEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,this.onLobbyLayoutStateChange);
         this._view.removeEventListener(BattleInfoViewEvent.EXIT_FROM_BATTLE,onExitFromBattle);
         this._view.removeEventListener(BattleInfoViewEvent.RETURN_TO_BATTLE,onReturnToBattle);
         this._view.removeEventListener(BattleInfoViewEvent.ENTER_DM,this.onEnterDm);
         this._view.removeEventListener(BattleInfoViewEvent.ENTER_SPECTATOR,this.onEnterSpectator);
         userPropertiesService.removeEventListener(UserPropertiesServiceEvent.UPDATE_RANK,this.onUpdateRank);
      }
      
      public function destroy() : void
      {
         this.hideForm();
         this.removeEvents();
         this.stopTimerCountDown();
         this._view.destroy();
         this._usersInfo = null;
         this._countDownTimer = null;
         this._view = null;
         this._battleItemId = null;
      }
      
      public function updateName(param1:String) : void
      {
         this._view.updateBattleName(param1);
      }
      
      public function addUser(param1:BattleInfoUser) : void
      {
         this._usersInfo.push(param1);
         this.updateAvailableEnterInBattle();
         this._view.addUser(param1);
      }
      
      public function removeUser(param1:String) : void
      {
         BattleSelectVectorUtil.deleteElementInUsersVector(this._usersInfo,param1);
         this.updateAvailableEnterInBattle();
         this._view.removeUser(param1);
      }
      
      public function updateUserScore(param1:String, param2:int) : void
      {
         var _loc3_:BattleInfoUser = BattleSelectVectorUtil.getUsersById(this._usersInfo,param1);
         _loc3_.kills = param2;
         this._view.updatePlayer(_loc3_.user,_loc3_.kills,_loc3_.suspicious);
      }
      
      public function updateUserSuspiciousState(param1:String, param2:Boolean) : void
      {
         var _loc3_:BattleInfoUser = BattleSelectVectorUtil.getUsersById(this._usersInfo,param1);
         _loc3_.suspicious = param2;
         this._view.updatePlayer(_loc3_.user,_loc3_.kills,_loc3_.suspicious);
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
      
      private function onEnterDm(param1:BattleInfoViewEvent) : void
      {
         if(this._proBattle && this._noSuppliesTimeLeftInSec == 0 && !this._userAlreadyPaid)
         {
            if(moneyService.§while package dynamic§(this._proBattleEnterPrice))
            {
               this.showPayedBattleAlert();
            }
         }
         else
         {
            this._view.disableEnterInBattle();
            dispatchEvent(param1.clone());
         }
      }
      
      private function showPayedBattleAlert() : void
      {
         var _loc1_:Vector.<String> = Vector.<String>([§get const use§.ENTER,§get const use§.§in package get§]);
         battleAlertService.showAlert(localeService.getText(TanksLocale.§'"H§),_loc1_);
         battleAlertService.addEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onAlertButtonPressed);
      }
      
      private function onAlertButtonPressed(param1:AlertServiceEvent) : void
      {
         battleAlertService.removeEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onAlertButtonPressed);
         if(param1.typeButton == localeService.getText(TanksLocale.TEXT_BATTLEINFO_PANEL_PAID_BATTLES_ALERT_ANSWER_ENTER))
         {
            dispatchEvent(new BattleInfoViewEvent(BattleInfoViewEvent.ENTER_DM));
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

