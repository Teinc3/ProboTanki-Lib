package alternativa.tanks.view.battleinfo.team
{
   import § !g§.§class for case§;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.service.achievement.IAchievementService;
   import alternativa.tanks.view.battleinfo.BattleInfoParamsView;
   import alternativa.tanks.view.battleinfo.BattleInfoViewEvent;
   import alternativa.tanks.view.battleinfo.ILocaleBattleInfo;
   import alternativa.tanks.view.battleinfo.TeamListRenderer;
   import alternativa.tanks.view.battlelist.forms.BattleBigButton;
   import alternativa.tanks.view.battlelist.forms.NoSubScribeAlert;
   import assets.icons.play_icons_BLUE;
   import assets.icons.play_icons_RED;
   import assets.scroller.color.ScrollThumbSkinBlue;
   import assets.scroller.color.ScrollThumbSkinRed;
   import assets.scroller.color.ScrollTrackBlue;
   import assets.scroller.color.ScrollTrackRed;
   import controls.TankWindow;
   import controls.TankWindowHeader;
   import controls.TankWindowInner;
   import controls.base.LabelBase;
   import fl.controls.List;
   import fl.data.DataProvider;
   import flash.display.BitmapData;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.geom.Point;
   import flash.text.TextFieldAutoSize;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import forms.ConfigureScroll;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   
   public class BattleInfoTeamView extends Sprite implements IBattleInfoTeamView
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
      
      public static const RED_TEAM:Boolean = true;
      
      public static const BLUE_TEAM:Boolean = false;
      
      private var _display:IDisplay;
      
      private var _stage:Stage;
      
      private var _locale:ILocaleBattleInfo;
      
      private var _background:TankWindow;
      
      private var _battleInfo:BattleInfoParamsView;
      
      private var _listInnerRed:TankWindowInner;
      
      private var _listInnerBlue:TankWindowInner;
      
      private var _noSuppliesAlert:NoSubScribeAlert;
      
      private var _fightButtonRed:BattleBigButton;
      
      private var _fightButtonBlue:BattleBigButton;
      
      private var _exitFromBattleButton:BattleBigButton;
      
      private var _returnToBattleButton:BattleBigButton;
      
      private var _listUsersBlue:List;
      
      private var _listUsersRed:List;
      
      private var _redScoreLabel:LabelBase;
      
      private var _blueScoreLabel:LabelBase;
      
      private var _score:MovieClip;
      
      private var _sizeTeam:int;
      
      private var countRed:int = 0;
      
      private var countBlue:int = 0;
      
      private var _timeOutResize:uint;
      
      private var _dataProviderBlue:DataProvider;
      
      private var _dataProviderRed:DataProvider;
      
      private var _battleItemId:String;
      
      private var _minRank:int;
      
      private var _maxRank:int;
      
      private var _spectatorEnabled:Boolean;
      
      public function BattleInfoTeamView(param1:IDisplay, param2:ILocaleBattleInfo)
      {
         super();
         this._display = param1;
         this._stage = param1.stage;
         this._locale = param2;
         this.init();
      }
      
      private function init() : void
      {
         this._background = new TankWindow();
         this._background.headerLang = this._locale.headerLang;
         this._background.header = TankWindowHeader.BATTLE_INFO;
         addChild(this._background);
         this._battleInfo = new BattleInfoParamsView();
         addChild(this._battleInfo);
         this._listInnerRed = new TankWindowInner(100,100,TankWindowInner.RED);
         this._listInnerRed.showBlink = true;
         addChild(this._listInnerRed);
         this._listInnerBlue = new TankWindowInner(100,100,TankWindowInner.BLUE);
         this._listInnerBlue.showBlink = true;
         addChild(this._listInnerBlue);
         this._listUsersBlue = new List();
         this._listUsersBlue.rowHeight = 20;
         this._listUsersBlue.setStyle("cellRenderer",TeamListRenderer);
         this._listUsersBlue.focusEnabled = false;
         addChild(this._listUsersBlue);
         this._listUsersRed = new List();
         this._listUsersRed.rowHeight = 20;
         this._listUsersRed.setStyle("cellRenderer",TeamListRenderer);
         this._listUsersRed.focusEnabled = false;
         addChild(this._listUsersRed);
         ConfigureScroll.configScrollList(this._listUsersRed,ScrollArrowDownRed,ScrollArrowUpRed,ScrollTrackRed,ScrollThumbSkinRed);
         ConfigureScroll.configScrollList(this._listUsersBlue,ScrollArrowDownBlue,ScrollArrowUpBlue,ScrollTrackBlue,ScrollThumbSkinBlue);
         this._fightButtonRed = new BattleBigButton();
         this._fightButtonRed.label = this._locale.fightButtonLabel;
         this._fightButtonRed.icon = new play_icons_RED(0,0);
         addChild(this._fightButtonRed);
         this._fightButtonBlue = new BattleBigButton();
         this._fightButtonBlue.label = this._locale.fightButtonLabel;
         this._fightButtonBlue.icon = new play_icons_BLUE(0,0);
         addChild(this._fightButtonBlue);
         this._exitFromBattleButton = new BattleBigButton();
         this._exitFromBattleButton.label = this._locale.exitFromBattleButtonLabel;
         addChild(this._exitFromBattleButton);
         this._returnToBattleButton = new BattleBigButton();
         this._returnToBattleButton.label = this._locale.returnToBattleButtonLabel;
         addChild(this._returnToBattleButton);
         this._noSuppliesAlert = new NoSubScribeAlert(this._locale.noSubscribeBattleLabel);
         addChild(this._noSuppliesAlert);
         this._score = new MovieClip();
         addChild(this._score);
         this._redScoreLabel = new LabelBase();
         this._redScoreLabel.size = 22;
         this._redScoreLabel.color = TankWindowInner.RED;
         this._redScoreLabel.x = -74;
         this._redScoreLabel.width = 70;
         this._redScoreLabel.autoSize = TextFieldAutoSize.RIGHT;
         this._score.addChild(this._redScoreLabel);
         this._blueScoreLabel = new LabelBase();
         this._blueScoreLabel.size = 22;
         this._blueScoreLabel.color = TankWindowInner.BLUE;
         this._blueScoreLabel.x = 5;
         this._blueScoreLabel.width = 70;
         this._blueScoreLabel.autoSize = TextFieldAutoSize.LEFT;
         this._score.addChild(this._blueScoreLabel);
         var _loc1_:LabelBase = new LabelBase();
         _loc1_.size = 22;
         _loc1_.text = ":";
         _loc1_.x = -4;
         _loc1_.y = -2;
         this._score.addChild(_loc1_);
         this._score.filters = [new GlowFilter(13434828,0.5)];
         this.onResize();
      }
      
      private function setEvents() : void
      {
         this._stage.addEventListener(Event.RESIZE,this.onResize);
         this._fightButtonRed.addEventListener(MouseEvent.CLICK,this.onFightButtonRedClick);
         this._fightButtonBlue.addEventListener(MouseEvent.CLICK,this.onFightButtonBlueClick);
         this._battleInfo.addEventListener(BattleInfoViewEvent.ENTER_SPECTATOR,this.onEnterSpectator);
         this._exitFromBattleButton.addEventListener(MouseEvent.CLICK,this.onExitFromBattleButtonClick);
         this._returnToBattleButton.addEventListener(MouseEvent.CLICK,this.onReturnToBattleButtonClick);
      }
      
      private function removeEvents() : void
      {
         this._stage.removeEventListener(Event.RESIZE,this.onResize);
         this._fightButtonRed.removeEventListener(MouseEvent.CLICK,this.onFightButtonRedClick);
         this._fightButtonBlue.removeEventListener(MouseEvent.CLICK,this.onFightButtonBlueClick);
         this._battleInfo.removeEventListener(BattleInfoViewEvent.ENTER_SPECTATOR,this.onEnterSpectator);
         this._exitFromBattleButton.removeEventListener(MouseEvent.CLICK,this.onExitFromBattleButtonClick);
         this._returnToBattleButton.removeEventListener(MouseEvent.CLICK,this.onReturnToBattleButtonClick);
      }
      
      public function updateInitParams(param1:BattleInfoTeamParams) : void
      {
         this._battleInfo.setUp(param1.battleName,param1.minRank,param1.maxRank,param1.scoreLimit,param1.timeLimitInSec,param1.autoBalance,param1.friendlyFire,param1.battleUrl,param1.battleMode,param1.noSupplies,param1.withoutBonuses,param1.upgradesDisabled,param1.proBattle,param1.withoutCrystals,param1.reArmor,false,param1.§8z§,param1.§;9§);
         this._battleInfo.setClanName(param1.clanName,param1.clanLink);
         this._battleInfo.setPreview(param1.previewResource.data);
         this._dataProviderRed = new DataProvider();
         this._dataProviderBlue = new DataProvider();
         this._listUsersRed.dataProvider = this._dataProviderRed;
         this._listUsersBlue.dataProvider = this._dataProviderBlue;
         this._sizeTeam = param1.maxPeopleCount;
         this.countBlue = 0;
         this.countRed = 0;
         this._battleItemId = param1.battleItemId;
         this._minRank = param1.minRank;
         this._maxRank = param1.maxRank;
         this._spectatorEnabled = param1.spectatorEnabled;
         this.updateScore(§class for case§.RED,param1.scoreRed);
         this.updateScore(§class for case§.BLUE,param1.scoreBlue);
         this.clearUsersInfo();
         this.onResize();
      }
      
      public function clearUsersInfo() : void
      {
         var _loc1_:int = 0;
         this._dataProviderRed.removeAll();
         this._dataProviderBlue.removeAll();
         _loc1_ = 0;
         while(_loc1_ < this._sizeTeam)
         {
            this.updatePlayer(RED_TEAM);
            this.updatePlayer(BLUE_TEAM);
            _loc1_++;
         }
         this.countBlue = 0;
         this.countRed = 0;
      }
      
      public function updateBattleName(param1:String) : void
      {
         this._battleInfo.updateBattleName(param1);
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
         if(this.container.contains(this))
         {
            if(!lobbyLayoutService.inBattle())
            {
               battleInfoService.resetCurrentSelectionBattleId();
            }
            this.removeEvents();
            this.container.removeChild(this);
            achievementService.setBattleStartButtonTargetPoint(new Point());
         }
      }
      
      public function destroy() : void
      {
         this.removeEvents();
         clearTimeout(this._timeOutResize);
         this._background = null;
         this._battleInfo = null;
         this._listInnerRed = null;
         this._listInnerBlue = null;
         this._noSuppliesAlert = null;
         this._fightButtonRed = null;
         this._fightButtonBlue = null;
         this._exitFromBattleButton = null;
         this._returnToBattleButton = null;
         this._listUsersBlue = null;
         this._listUsersRed = null;
         this._redScoreLabel = null;
         this._blueScoreLabel = null;
         this._score = null;
         this._locale = null;
         this._stage = null;
         this._display = null;
         this._battleItemId = null;
      }
      
      public function disableEnterInBattleRed() : void
      {
         this._fightButtonRed.enabled = false;
      }
      
      public function enableEnterInBattleRed() : void
      {
         this._fightButtonRed.enabled = true;
      }
      
      public function disableEnterInBattleBlue() : void
      {
         this._fightButtonBlue.enabled = false;
      }
      
      public function enableEnterInBattleBlue() : void
      {
         this._fightButtonBlue.enabled = true;
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
      
      private function resize(param1:Number, param2:Number, param3:Boolean = true) : void
      {
         var _loc4_:Number = int(Math.max(MIN_FLASH_WIDTH,param1)) / 3;
         var _loc5_:Number = Math.max(param2 - HEADER_HEIGHT,MIN_FLASH_HEIGHT);
         this._background.width = _loc4_;
         this._background.height = _loc5_;
         this.x = _loc4_ * 2;
         this.y = HEADER_HEIGHT;
         this._battleInfo.width = _loc4_ - 22;
         this._battleInfo.height = int(_loc5_ * 0.4);
         this._battleInfo.x = this._battleInfo.y = 11;
         this._listInnerRed.width = int(_loc4_ - 25) / 2;
         this._listInnerRed.height = _loc5_ - this._battleInfo.height - (this._noSuppliesAlert.visible ? 164 : 80);
         this._listInnerRed.x = 11;
         this._listInnerRed.y = this._battleInfo.height + 14;
         this._listInnerBlue.width = _loc4_ - this._listInnerRed.width - 25;
         this._listInnerBlue.height = _loc5_ - this._battleInfo.height - (this._noSuppliesAlert.visible ? 164 : 80);
         this._listInnerBlue.x = 14 + this._listInnerRed.width;
         this._listInnerBlue.y = this._battleInfo.height + 14;
         this._listUsersRed.x = this._listInnerRed.x + 4;
         this._listUsersRed.y = this._listInnerRed.y + 4;
         this._listUsersRed.setSize(this._listInnerRed.width - (this._listUsersRed.maxVerticalScrollPosition > 0 ? 1 : 4),this._listInnerRed.height - 8);
         this._listUsersBlue.x = this._listInnerBlue.x + 4;
         this._listUsersBlue.y = this._listInnerBlue.y + 4;
         this._listUsersBlue.setSize(this._listInnerBlue.width - (this._listUsersBlue.maxVerticalScrollPosition > 0 ? 1 : 4),this._listInnerBlue.height - 8);
         this._noSuppliesAlert.width = _loc4_ - 30;
         this._noSuppliesAlert.x = 15;
         this._noSuppliesAlert.y = _loc5_ - 85 - 55;
         this._fightButtonBlue.width = this._fightButtonRed.width = Math.min(130,int((_loc4_ - 110) / 2));
         this._fightButtonRed.x = 11;
         this._fightButtonRed.y = _loc5_ - 61;
         this._fightButtonBlue.x = _loc4_ - this._fightButtonBlue.width - 11;
         this._fightButtonBlue.y = _loc5_ - 61;
         this._exitFromBattleButton.width = 130;
         this._exitFromBattleButton.x = _loc4_ - this._exitFromBattleButton.width - 11;
         this._exitFromBattleButton.y = _loc5_ - 61;
         this._returnToBattleButton.width = 130;
         this._returnToBattleButton.x = _loc4_ - this._returnToBattleButton.width - 11;
         this._returnToBattleButton.y = _loc5_ - 61;
         this._score.x = this._listInnerBlue.x - 3;
         this._score.y = _loc5_ - 51;
         this.updateAchievementPosition();
         if(param3)
         {
            this.resizeWithDelay();
         }
         else
         {
            this._dataProviderBlue.invalidate();
            this._dataProviderRed.invalidate();
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
      
      private function updateAchievementPosition() : void
      {
         var _loc1_:Point = null;
         if(this._fightButtonRed.enabled)
         {
            _loc1_ = new Point(this.x + this._fightButtonRed.x,this.y + this._fightButtonRed.y);
         }
         else if(this._fightButtonBlue)
         {
            _loc1_ = new Point(this.x + this._fightButtonBlue.x,this.y + this._fightButtonBlue.y);
         }
         else
         {
            _loc1_ = new Point();
         }
         achievementService.setBattleStartButtonTargetPoint(_loc1_);
      }
      
      public function showNoSuppliesAlert() : void
      {
         this._noSuppliesAlert.visible = true;
         this.onResize();
      }
      
      public function hideNoSuppliesAlert() : void
      {
         this._noSuppliesAlert.visible = false;
         this.onResize();
      }
      
      public function setCostProBattle(param1:int) : void
      {
         this._fightButtonRed.cost = param1;
         this._fightButtonBlue.cost = param1;
      }
      
      public function updateScore(param1:§class for case§, param2:int) : void
      {
         if(param1 == §class for case§.RED)
         {
            this._redScoreLabel.text = String(param2);
         }
         if(param1 == §class for case§.BLUE)
         {
            this._blueScoreLabel.text = String(param2);
         }
      }
      
      public function removeUser(param1:String) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         _loc2_ = this.indexById(RED_TEAM,param1);
         if(_loc2_ >= 0)
         {
            this._dataProviderRed.removeItemAt(_loc2_);
            this.updatePlayer(RED_TEAM);
         }
         _loc2_ = this.indexById(BLUE_TEAM,param1);
         if(_loc2_ >= 0)
         {
            this._dataProviderBlue.removeItemAt(_loc2_);
            this.updatePlayer(BLUE_TEAM);
         }
         this.countRed = 0;
         this.countBlue = 0;
         _loc3_ = 0;
         while(_loc3_ < this._dataProviderRed.length)
         {
            this.countRed += this._dataProviderRed.getItemAt(_loc3_).id != null ? 1 : 0;
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < this._dataProviderBlue.length)
         {
            this.countBlue += this._dataProviderBlue.getItemAt(_loc3_).id != null ? 1 : 0;
            _loc3_++;
         }
         this.resizeWithDelay(500);
      }
      
      public function updatePlayer(param1:Boolean, param2:Object = null, param3:int = 0, param4:Boolean = false) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Object = {};
         var _loc8_:DataProvider = param1 == RED_TEAM ? this._dataProviderRed : this._dataProviderBlue;
         _loc7_.playerName = name;
         _loc7_.style = param1 == RED_TEAM ? "red" : "blue";
         _loc7_.noNameText = this._locale.noNameText;
         _loc7_.suspicious = param4;
         _loc7_.kills = param3;
         _loc7_.id = param2;
         _loc5_ = param2 == null ? int(-1) : int(this.indexById(param1,param2));
         if(_loc5_ < 0)
         {
            _loc8_.addItem(_loc7_);
         }
         else
         {
            _loc8_.replaceItemAt(_loc7_,_loc5_);
         }
         this.countRed = 0;
         this.countBlue = 0;
         _loc6_ = 0;
         while(_loc6_ < this._dataProviderRed.length)
         {
            this.countRed += this._dataProviderRed.getItemAt(_loc6_).id != null ? 1 : 0;
            _loc6_++;
         }
         _loc6_ = 0;
         while(_loc6_ < this._dataProviderBlue.length)
         {
            this.countBlue += this._dataProviderBlue.getItemAt(_loc6_).id != null ? 1 : 0;
            _loc6_++;
         }
         this._dataProviderRed.sortOn(["kills","id"],[Array.DESCENDING | Array.NUMERIC,Array.DESCENDING | Array.NUMERIC]);
         this._dataProviderBlue.sortOn(["kills","id"],[Array.DESCENDING | Array.NUMERIC,Array.DESCENDING | Array.NUMERIC]);
         if(_loc8_.length > this._sizeTeam && _loc8_.getItemAt(_loc8_.length - 1).id == null)
         {
            _loc8_.removeItemAt(_loc8_.length - 1);
         }
         this.resizeWithDelay(500);
      }
      
      public function setTime(param1:String) : void
      {
         this._battleInfo.setTime(param1);
      }
      
      private function indexById(param1:Boolean, param2:Object) : int
      {
         var _loc3_:Object = null;
         var _loc4_:DataProvider = param1 == RED_TEAM ? this._dataProviderRed : this._dataProviderBlue;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc3_ = _loc4_.getItemAt(_loc5_);
            if(_loc3_.id == param2)
            {
               return _loc5_;
            }
            _loc5_++;
         }
         return -1;
      }
      
      private function onResize(param1:Event = null) : void
      {
         this.resize(this._stage.stageWidth,this._stage.stageHeight);
      }
      
      private function onFightButtonRedClick(param1:MouseEvent) : void
      {
         dispatchEvent(new BattleInfoViewEvent(BattleInfoViewEvent.ENTER_TEAM,§class for case§.RED));
      }
      
      private function onFightButtonBlueClick(param1:MouseEvent) : void
      {
         dispatchEvent(new BattleInfoViewEvent(BattleInfoViewEvent.ENTER_TEAM,§class for case§.BLUE));
      }
      
      private function onEnterSpectator(param1:BattleInfoViewEvent) : void
      {
         dispatchEvent(param1.clone());
      }
      
      private function onExitFromBattleButtonClick(param1:MouseEvent) : void
      {
         dispatchEvent(new BattleInfoViewEvent(BattleInfoViewEvent.EXIT_FROM_BATTLE));
      }
      
      private function onReturnToBattleButtonClick(param1:MouseEvent) : void
      {
         dispatchEvent(new BattleInfoViewEvent(BattleInfoViewEvent.RETURN_TO_BATTLE));
      }
      
      public function updateInBattleState() : void
      {
         this._exitFromBattleButton.visible = false;
         this._returnToBattleButton.visible = false;
         this._fightButtonBlue.visible = false;
         this._fightButtonRed.visible = false;
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
            this._fightButtonBlue.visible = true;
            this._fightButtonRed.visible = true;
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

