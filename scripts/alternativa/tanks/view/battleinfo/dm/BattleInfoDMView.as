package alternativa.tanks.view.battleinfo.dm
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.service.achievement.IAchievementService;
   import alternativa.tanks.utils.removeDisplayObject;
   import alternativa.tanks.view.battleinfo.BattleInfoParamsView;
   import alternativa.tanks.view.battleinfo.BattleInfoViewEvent;
   import alternativa.tanks.view.battleinfo.ILocaleBattleInfo;
   import alternativa.tanks.view.battleinfo.TeamListRenderer;
   import alternativa.tanks.view.battlelist.forms.BattleBigButton;
   import alternativa.tanks.view.battlelist.forms.NoSubScribeAlert;
   import assets.icons.play_icons_ALL;
   import assets.scroller.color.ScrollThumbSkinGreen;
   import assets.scroller.color.ScrollTrackGreen;
   import controls.TankWindow;
   import controls.TankWindowHeader;
   import controls.TankWindowInner;
   import fl.controls.List;
   import fl.data.DataProvider;
   import flash.display.BitmapData;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import forms.ConfigureScroll;
   import projects.tanks.client.battleselect.model.info.BattleInfoUser;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   
   public class BattleInfoDMView extends Sprite implements IBattleInfoDmView
   {
      [Inject]
      public static var achievementService:IAchievementService;
      
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      private static const MIN_FLASH_WIDTH:int = 970;
      
      private static const MIN_FLASH_HEIGHT:int = 530;
      
      private static const HEADER_HEIGHT:int = 60;
      
      private var _stage:Stage;
      
      private var _locale:ILocaleBattleInfo;
      
      private var _display:IDisplay;
      
      private var _background:TankWindow;
      
      private var _battleInfo:BattleInfoParamsView;
      
      private var _listInner:TankWindowInner;
      
      private var _noSuppliesAlert:NoSubScribeAlert;
      
      private var _fightButton:BattleBigButton;
      
      private var _exitFromBattleButton:BattleBigButton;
      
      private var _returnToBattleButton:BattleBigButton;
      
      private var _listUsers:List;
      
      private var _dataProviderList:DataProvider;
      
      private var _sizeTeam:int;
      
      private var _timeOutResize:uint;
      
      private var _battleItemId:String;
      
      private var _minRank:int;
      
      private var _maxRank:int;
      
      private var _spectatorEnabled:Boolean;
      
      public function BattleInfoDMView(param1:IDisplay, param2:ILocaleBattleInfo)
      {
         super();
         this._display = param1;
         this._stage = param1.stage;
         this._locale = param2;
         this.init();
      }
      
      protected function init() : void
      {
         this._background = new TankWindow();
         this._background.headerLang = this._locale.headerLang;
         this._background.header = TankWindowHeader.BATTLE_INFO;
         addChild(this._background);
         this._battleInfo = new BattleInfoParamsView();
         addChild(this._battleInfo);
         this._listInner = new TankWindowInner(100,100,TankWindowInner.GREEN);
         this._listInner.showBlink = true;
         addChild(this._listInner);
         this._listUsers = new List();
         this._listUsers.rowHeight = 20;
         this._listUsers.setStyle("cellRenderer",TeamListRenderer);
         this._listUsers.focusEnabled = false;
         addChild(this._listUsers);
         ConfigureScroll.configScrollList(this._listUsers,ScrollArrowDownGreen,ScrollArrowUpGreen,ScrollTrackGreen,ScrollThumbSkinGreen);
         this._noSuppliesAlert = new NoSubScribeAlert(this._locale.noSubscribeBattleLabel);
         addChild(this._noSuppliesAlert);
         this._fightButton = new BattleBigButton();
         this._fightButton.label = this._locale.fightButtonLabel;
         this._fightButton.icon = new play_icons_ALL(0,0);
         addChild(this._fightButton);
         this._exitFromBattleButton = new BattleBigButton();
         this._exitFromBattleButton.label = this._locale.exitFromBattleButtonLabel;
         addChild(this._exitFromBattleButton);
         this._returnToBattleButton = new BattleBigButton();
         this._returnToBattleButton.label = this._locale.returnToBattleButtonLabel;
         addChild(this._returnToBattleButton);
         this.onResize();
      }
      
      private function setEvents() : void
      {
         this._stage.addEventListener(Event.RESIZE,this.onResize);
         this._fightButton.addEventListener(MouseEvent.CLICK,this.onFightButtonClick);
         this._exitFromBattleButton.addEventListener(MouseEvent.CLICK,this.onExitFromBattleButtonClick);
         this._returnToBattleButton.addEventListener(MouseEvent.CLICK,this.onReturnToBattleButtonClick);
         this._battleInfo.addEventListener(BattleInfoViewEvent.ENTER_SPECTATOR,this.onEnterSpectator);
      }
      
      private function removeEvents() : void
      {
         this._stage.removeEventListener(Event.RESIZE,this.onResize);
         this._fightButton.removeEventListener(MouseEvent.CLICK,this.onFightButtonClick);
         this._exitFromBattleButton.removeEventListener(MouseEvent.CLICK,this.onExitFromBattleButtonClick);
         this._returnToBattleButton.removeEventListener(MouseEvent.CLICK,this.onReturnToBattleButtonClick);
         this._battleInfo.removeEventListener(BattleInfoViewEvent.ENTER_SPECTATOR,this.onEnterSpectator);
      }
      
      public function updateInitParams(param1:BattleInfoDmParams) : void
      {
         this._battleInfo.setUp(param1.battleName,param1.minRank,param1.maxRank,param1.scoreLimit,param1.timeLimitInSec,false,false,param1.battleUrl,param1.battleMode,param1.noSupplies,param1.withoutBonuses,param1.upgradesDisabled,param1.proBattle,param1.withoutCrystals,param1.reArmor,false,param1.Renamed3642,param1.Renamed1625);
         this._battleInfo.setClanName(param1.clanName,param1.clanLink);
         this._battleInfo.setPreview(param1.previewResource.data);
         this._dataProviderList = new DataProvider();
         this._listUsers.dataProvider = this._dataProviderList;
         this._sizeTeam = param1.maxPeopleCount;
         this._battleItemId = param1.battleItemId;
         this._minRank = param1.minRank;
         this._maxRank = param1.maxRank;
         this._spectatorEnabled = param1.spectatorEnabled;
         this.fillTeam();
         this.onResize();
      }
      
      public function enableEnterInBattle() : void
      {
         this._fightButton.enabled = true;
      }
      
      public function disableEnterInBattle() : void
      {
         this._fightButton.enabled = false;
      }
      
      public function lock() : void
      {
         mouseEnabled = false;
         mouseChildren = false;
      }
      
      public function unlock() : void
      {
         mouseEnabled = true;
         mouseChildren = true;
      }
      
      public function setPreview(param1:BitmapData) : void
      {
         this._battleInfo.setPreview(param1);
      }
      
      public function updateBattleName(param1:String) : void
      {
         this._battleInfo.updateBattleName(param1);
      }
      
      public function addUser(param1:BattleInfoUser) : void
      {
         this.updatePlayer(param1.user,param1.kills,param1.suspicious);
      }
      
      public function removeUser(param1:String) : void
      {
         var _loc2_:int = this.indexById(param1);
         if(_loc2_ >= 0)
         {
            this._dataProviderList.removeItemAt(_loc2_);
            this.updatePlayer();
         }
         this.resizeWithDelay(500);
      }
      
      public function setTime(param1:String) : void
      {
         this._battleInfo.setTime(param1);
      }
      
      public function showNoSuppliesAlert() : void
      {
         this._noSuppliesAlert.visible = true;
      }
      
      public function hideNoSuppliesAlert() : void
      {
         this._noSuppliesAlert.visible = false;
      }
      
      public function setCostProBattle(param1:int) : void
      {
         this._fightButton.cost = param1;
      }
      
      public function updatePlayer(param1:String = null, param2:int = 0, param3:Boolean = false) : void
      {
         var _loc4_:Object;
         (_loc4_ = {}).id = param1;
         _loc4_.style = "green";
         _loc4_.noNameText = this._locale.noNameText;
         _loc4_.suspicious = param3;
         _loc4_.kills = param2;
         var _loc5_:int = param1 == null ? int(-1) : int(this.indexById(param1));
         if(_loc5_ < 0)
         {
            this._dataProviderList.addItem(_loc4_);
         }
         else
         {
            this._dataProviderList.replaceItemAt(_loc4_,_loc5_);
         }
         this._dataProviderList.sortOn(["kills","id"],[Array.DESCENDING | Array.NUMERIC,Array.DESCENDING | Array.NUMERIC]);
         if(this._dataProviderList.length > this._sizeTeam)
         {
            this._dataProviderList.removeItemAt(this._dataProviderList.length - 1);
         }
         this.resizeWithDelay(500);
      }
      
      private function indexById(param1:String) : int
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         while(_loc3_ < this._dataProviderList.length)
         {
            _loc2_ = this._dataProviderList.getItemAt(_loc3_);
            if(_loc2_.id == param1)
            {
               return _loc3_;
            }
            _loc3_++;
         }
         return -1;
      }
      
      public function fillTeam() : void
      {
         this._dataProviderList.removeAll();
         var _loc1_:int = 0;
         while(_loc1_ < this._sizeTeam)
         {
            this.updatePlayer();
            _loc1_++;
         }
      }
      
      public function show() : void
      {
         if(!this.container.contains(this))
         {
            battleInfoService.setCurrentSelectionBattle(this._battleItemId,this._minRank,this._maxRank);
            this.setEvents();
            this.container.addChild(this);
            this.onResize();
         }
      }
      
      public function hide() : void
      {
         if(!lobbyLayoutService.inBattle())
         {
            battleInfoService.resetCurrentSelectionBattleId();
         }
         this.removeEvents();
         removeDisplayObject(this);
         achievementService.setBattleStartButtonTargetPoint(new Point());
      }
      
      public function destroy() : void
      {
         this.removeEvents();
         clearTimeout(this._timeOutResize);
         this._background = null;
         this._battleInfo = null;
         this._listInner = null;
         this._noSuppliesAlert = null;
         this._fightButton = null;
         this._exitFromBattleButton = null;
         this._returnToBattleButton = null;
         this._listUsers = null;
         this._dataProviderList = null;
         this._locale = null;
         this._stage = null;
         this._display = null;
         this._battleItemId = null;
      }
      
      public function resize(param1:Number, param2:Number, param3:Boolean = true) : void
      {
         var _loc4_:Number = int(Math.max(MIN_FLASH_WIDTH,param1)) / 3;
         var _loc5_:Number = Math.max(param2 - HEADER_HEIGHT,MIN_FLASH_HEIGHT);
         this._background.width = _loc4_;
         this._background.height = _loc5_;
         this.x = _loc4_ * 2;
         this.y = HEADER_HEIGHT;
         this._battleInfo.width = _loc4_ - 22;
         this._battleInfo.height = int(_loc5_ * 0.4);
         this._battleInfo.y = 11;
         this._battleInfo.x = 11;
         this._listInner.width = _loc4_ - 22;
         this._listInner.height = _loc5_ - this._battleInfo.height - (this._noSuppliesAlert.visible ? 164 : 80);
         this._listInner.x = 11;
         this._listInner.y = this._battleInfo.height + 14;
         this._listUsers.setSize(this._listInner.width - (this._listUsers.maxVerticalScrollPosition > 0 ? 1 : 4),this._listInner.height - 8);
         this._listUsers.x = this._listInner.x + 4;
         this._listUsers.y = this._listInner.y + 4;
         this._noSuppliesAlert.width = _loc4_ - 30;
         this._noSuppliesAlert.x = 15;
         this._noSuppliesAlert.y = _loc5_ - 85 - 55;
         this._fightButton.width = 130;
         this._fightButton.x = _loc4_ - this._fightButton.width - 11;
         this._fightButton.y = _loc5_ - 61;
         this._exitFromBattleButton.width = 130;
         this._exitFromBattleButton.x = _loc4_ - this._exitFromBattleButton.width - 11;
         this._exitFromBattleButton.y = _loc5_ - 61;
         this._returnToBattleButton.width = 130;
         this._returnToBattleButton.x = _loc4_ - this._returnToBattleButton.width - 11;
         this._returnToBattleButton.y = _loc5_ - 61;
         this.updateAchievementPosition();
         if(param3)
         {
            this.resizeWithDelay();
         }
         else
         {
            this._dataProviderList.invalidate();
         }
      }
      
      private function updateAchievementPosition() : void
      {
         if(this._fightButton.visible && this._fightButton.enabled)
         {
            achievementService.setBattleStartButtonTargetPoint(new Point(this.x + this._fightButton.x,this.y + this._fightButton.y));
         }
         else
         {
            achievementService.setBattleStartButtonTargetPoint(new Point());
         }
      }
      
      private function resizeWithDelay(param1:int = 200) : void
      {
         clearTimeout(this._timeOutResize);
         this._timeOutResize = setTimeout(this.onResizeWithDelay,param1);
      }
      
      private function onResizeWithDelay() : void
      {
         this.resize(this._stage.stageWidth,this._stage.stageHeight,false);
      }
      
      private function onResize(param1:Event = null) : void
      {
         this.resize(this._stage.stageWidth,this._stage.stageHeight);
      }
      
      private function onFightButtonClick(param1:MouseEvent) : void
      {
         dispatchEvent(new BattleInfoViewEvent(BattleInfoViewEvent.ENTER_DM));
      }
      
      private function onExitFromBattleButtonClick(param1:MouseEvent) : void
      {
         dispatchEvent(new BattleInfoViewEvent(BattleInfoViewEvent.EXIT_FROM_BATTLE));
      }
      
      private function onReturnToBattleButtonClick(param1:MouseEvent) : void
      {
         dispatchEvent(new BattleInfoViewEvent(BattleInfoViewEvent.RETURN_TO_BATTLE));
      }
      
      private function onEnterSpectator(param1:BattleInfoViewEvent) : void
      {
         dispatchEvent(param1.clone());
      }
      
      public function updateInBattleState() : void
      {
         this._exitFromBattleButton.visible = false;
         this._returnToBattleButton.visible = false;
         this._fightButton.visible = false;
         if(battleInfoService.hasCurrentBattleId())
         {
            if(battleInfoService.currentBattleId == this._battleItemId)
            {
               this._returnToBattleButton.visible = true;
            }
            else
            {
               this._exitFromBattleButton.visible = true;
            }
         }
         else
         {
            this._fightButton.visible = true;
         }
         if(battleInfoService.isSpectatorMode())
         {
            this._battleInfo.spectatorEnabled = battleInfoService.currentBattleId != this._battleItemId;
         }
         else
         {
            this._battleInfo.spectatorEnabled = this._spectatorEnabled;
         }
         this.updateAchievementPosition();
      }
      
      private function get container() : DisplayObjectContainer
      {
         return this._display.systemLayer;
      }
   }
}

