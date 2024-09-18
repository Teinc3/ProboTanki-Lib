package alternativa.tanks.view.battlelist
{
   import Renamed223.Renamed1925;
   import alternativa.tanks.controllers.battlelist.BattleListItemParams;
   import alternativa.tanks.controllers.battlelist.IBattleListViewControllerCallBack;
   import alternativa.tanks.gui.CrystalLabel;
   import alternativa.tanks.help.IHelpService;
   import alternativa.tanks.view.battlelist.forms.BattleListRenderer;
   import alternativa.tanks.view.battlelist.friends.FriendsIndicator;
   import alternativa.tanks.view.battlelist.help.LockedMapsHelper;
   import assets.cellrenderer.battlelist.Abris;
   import assets.scroller.color.ScrollThumbSkinGreen;
   import assets.scroller.color.ScrollTrackGreen;
   import controls.TankWindow;
   import controls.TankWindowHeader;
   import controls.TankWindowInner;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import fl.controls.LabelButton;
   import fl.controls.List;
   import fl.controls.ScrollBar;
   import fl.data.DataProvider;
   import fl.events.ListEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObjectContainer;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import forms.ColorConstants;
   import forms.ConfigureScroll;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.battleselect.model.item.Renamed1620;
   import projects.tanks.client.battleservice.Renamed1586;
   import projects.tanks.client.battleservice.Renamed1587;
   
   public class BattleListView extends Sprite implements IBattleListView
   {
      [Inject]
      public static var helpService:IHelpService;
      
      private static const MIN_FLASH_WIDTH:int = 970;
      
      private static const MIN_FLASH_HEIGHT:int = 530;
      
      private static const HEADER_HEIGHT:int = 60;
      
      private static const ADDITIONAL_SCROLL_AREA_HEIGHT:Number = 7;
      
      private const HELPER_GROUP_KEY:String = "BattleSelectModel";
      
      private const HELPER_NOT_AVAILABLE:int = 1;
      
      private var _lockedMapsHelper:LockedMapsHelper;
      
      private var _stage:Stage;
      
      private var _locale:ILocaleBattleList;
      
      private var _container:DisplayObjectContainer;
      
      private var _callback:IBattleListViewControllerCallBack;
      
      private var _background:TankWindow;
      
      private var _inner:TankWindowInner;
      
      private var _showCreateBattleFormButton:DefaultButtonBase;
      
      private var _battleList:List;
      
      private var _battleModeItems:Vector.<BattleModeCheckBox>;
      
      private var _dataProvider:DataProvider;
      
      private var _timeOutResize:uint;
      
      private var iconWidth:int = 100;
      
      private var oldIconWidth:int = 0;
      
      public function BattleListView(param1:Stage, param2:DisplayObjectContainer, param3:ILocaleBattleList, param4:Boolean)
      {
         super();
         this._stage = param1;
         this._container = param2;
         this._locale = param3;
         this.init(param4);
      }
      
      protected function init(param1:Boolean) : void
      {
         this._background = new TankWindow();
         this._background.headerLang = this._locale.headerLang;
         this._background.header = TankWindowHeader.CURRENT_BATTLES;
         addChild(this._background);
         this._inner = new TankWindowInner(100,100,TankWindowInner.GREEN);
         this._inner.showBlink = true;
         addChild(this._inner);
         this._dataProvider = new DataProvider();
         this._battleList = new List();
         this._battleList.rowHeight = 20;
         this._battleList.setStyle("cellRenderer",BattleListRenderer);
         this._battleList.dataProvider = this._dataProvider;
         this._battleList.focusEnabled = true;
         addChild(this._battleList);
         this._battleList.move(15,15);
         ConfigureScroll.configScrollList(this._battleList,ScrollArrowDownGreen,ScrollArrowUpGreen,ScrollTrackGreen,ScrollThumbSkinGreen);
         this._showCreateBattleFormButton = new DefaultButtonBase();
         this._showCreateBattleFormButton.label = this._locale.showBattleCreateFormLabel;
         this._showCreateBattleFormButton.visible = !param1;
         addChild(this._showCreateBattleFormButton);
         this._battleModeItems = new Vector.<BattleModeCheckBox>();
         this.createBattleModeCheckBox(Renamed1587.DM);
         this.createBattleModeCheckBox(Renamed1587.TDM);
         this.createBattleModeCheckBox(Renamed1587.CTF);
         this.createBattleModeCheckBox(Renamed1587.CP);
         this.onResize();
      }
      
      private function createBattleModeCheckBox(param1:Renamed1587) : void
      {
         var _loc2_:BattleModeCheckBox = new BattleModeCheckBox(param1);
         addChild(_loc2_);
         this._battleModeItems.push(_loc2_);
      }
      
      public function setCallBack(param1:IBattleListViewControllerCallBack) : void
      {
         this._callback = param1;
      }
      
      public function show(param1:Boolean, param2:Boolean, param3:Boolean, param4:Boolean, param5:Boolean) : void
      {
         if(!this._container.contains(this))
         {
            this.onResize();
            this.setEvents();
            this._container.addChild(this);
            this._lockedMapsHelper = new LockedMapsHelper(this._locale.battleSelectLockedMapHelperName,this._locale.battleSelectLockedMapHelperArrowLength);
            helpService.registerHelper(this.HELPER_GROUP_KEY,this.HELPER_NOT_AVAILABLE,this._lockedMapsHelper,false);
            this.getBattleModeCheckBox(Renamed1587.DM).isPressed = param1;
            this.getBattleModeCheckBox(Renamed1587.TDM).isPressed = param2;
            this.getBattleModeCheckBox(Renamed1587.CTF).isPressed = param3;
            this.getBattleModeCheckBox(Renamed1587.CP).isPressed = param4;
         }
      }
      
      public function hide() : void
      {
         if(this._container.contains(this))
         {
            this.removeEvents();
            this._container.removeChild(this);
            helpService.hideHelper(this.HELPER_GROUP_KEY,this.HELPER_NOT_AVAILABLE);
            helpService.unregisterHelper(this.HELPER_GROUP_KEY,this.HELPER_NOT_AVAILABLE);
         }
      }
      
      public function destroy() : void
      {
         this.removeEvents();
         var _loc1_:int = int(this._battleModeItems.length);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            this._battleModeItems[_loc2_].destroy();
            _loc2_++;
         }
         clearTimeout(this._timeOutResize);
         this._battleModeItems = null;
         this._lockedMapsHelper = null;
         this._callback = null;
         this._locale = null;
         this._stage = null;
         this._container = null;
      }
      
      public function setEvents() : void
      {
         this._stage.addEventListener(Event.RESIZE,this.onResize);
         this._showCreateBattleFormButton.addEventListener(MouseEvent.CLICK,this.onShowCreateBattleFormButtonClick);
         this._battleList.addEventListener(ListEvent.ITEM_CLICK,this.onBattleListItemClick);
         this._battleList.addEventListener(Event.CHANGE,this.onListChange);
         this._battleList.verticalScrollBar.addEventListener(Event.ENTER_FRAME,this.updateScrollOnEnterFrame);
         var _loc1_:int = int(this._battleModeItems.length);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            this._battleModeItems[_loc2_].addEventListener(Event.CHANGE,this.onBattleModeChange);
            _loc2_++;
         }
      }
      
      private function updateScrollOnEnterFrame(param1:Event) : void
      {
         var _loc2_:Sprite = null;
         var _loc3_:Sprite = null;
         var _loc4_:ScrollBar = this._battleList.verticalScrollBar;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.numChildren)
         {
            _loc2_ = Sprite(_loc4_.getChildAt(_loc5_));
            if(_loc2_.hitArea != null)
            {
               _loc3_ = _loc2_.hitArea;
               _loc3_.graphics.clear();
            }
            else
            {
               _loc3_ = new Sprite();
               _loc3_.mouseEnabled = false;
               _loc2_.hitArea = _loc3_;
               this._battleList.addChild(_loc3_);
            }
            _loc3_.graphics.beginFill(0,0);
            if(_loc2_ is LabelButton)
            {
               _loc3_.graphics.drawRect(_loc4_.x - ADDITIONAL_SCROLL_AREA_HEIGHT,_loc2_.y - 14,_loc2_.width + ADDITIONAL_SCROLL_AREA_HEIGHT,_loc2_.height + 28);
            }
            else
            {
               _loc3_.graphics.drawRect(_loc4_.x - ADDITIONAL_SCROLL_AREA_HEIGHT,_loc2_.y,_loc2_.width + ADDITIONAL_SCROLL_AREA_HEIGHT,_loc2_.height);
            }
            _loc3_.graphics.endFill();
            _loc5_++;
         }
      }
      
      private function onBattleModeChange(param1:Event) : void
      {
         var _loc2_:BattleModeCheckBox = BattleModeCheckBox(param1.currentTarget);
         this._callback.onBattleModeChange(_loc2_.battleMode,_loc2_.isPressed);
      }
      
      public function removeEvents() : void
      {
         this._battleList.verticalScrollBar.removeEventListener(Event.ENTER_FRAME,this.updateScrollOnEnterFrame);
         this._stage.removeEventListener(Event.RESIZE,this.onResize);
         this._showCreateBattleFormButton.removeEventListener(MouseEvent.CLICK,this.onShowCreateBattleFormButtonClick);
         this._battleList.removeEventListener(ListEvent.ITEM_CLICK,this.onBattleListItemClick);
         this._battleList.removeEventListener(Event.CHANGE,this.onListChange);
         var _loc1_:int = int(this._battleModeItems.length);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            this._battleModeItems[_loc2_].removeEventListener(Event.CHANGE,this.onBattleModeChange);
            _loc2_++;
         }
      }
      
      public function lockFilter(param1:Renamed1587) : void
      {
         this.getBattleModeCheckBox(param1).lock = true;
      }
      
      public function unLockFilter(param1:Renamed1587) : void
      {
         this.getBattleModeCheckBox(param1).lock = false;
      }
      
      private function getBattleModeCheckBox(param1:Renamed1587) : BattleModeCheckBox
      {
         var _loc2_:BattleModeCheckBox = null;
         var _loc3_:int = int(this._battleModeItems.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(this._battleModeItems[_loc4_].battleMode == param1)
            {
               _loc2_ = this._battleModeItems[_loc4_];
               break;
            }
            _loc4_++;
         }
         return _loc2_;
      }
      
      public function resize(param1:Boolean = true) : void
      {
         clearTimeout(this._timeOutResize);
         var _loc2_:int = Math.max(MIN_FLASH_WIDTH,this._stage.stageWidth) / 3;
         var _loc3_:int = Math.max(this._stage.stageHeight - HEADER_HEIGHT,MIN_FLASH_HEIGHT);
         this._background.width = _loc2_;
         this._background.height = _loc3_;
         this.x = _loc2_;
         this.y = HEADER_HEIGHT;
         this._inner.width = _loc2_ - 22;
         this._inner.height = _loc3_ - 58;
         this._inner.y = 11;
         this._inner.x = 11;
         var _loc4_:int = this._inner.width - (this._battleList.maxVerticalScrollPosition > 0 ? 0 : 4);
         this._battleList.setSize(_loc4_,this._inner.height - 8);
         var _loc5_:int = int(this._battleModeItems.length);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            if(_loc6_ == 0)
            {
               this._battleModeItems[_loc6_].x = 11;
            }
            else
            {
               this._battleModeItems[_loc6_].x = this._battleModeItems[_loc6_ - 1].x + this._battleModeItems[_loc6_ - 1].width + 5;
            }
            this._battleModeItems[_loc6_].y = _loc3_ - 42;
            _loc6_++;
         }
         this._showCreateBattleFormButton.x = _loc2_ - this._showCreateBattleFormButton.width - 11;
         this._showCreateBattleFormButton.y = _loc3_ - 42;
         this.resizeListItem(_loc4_);
         if(param1)
         {
            this.resizeWithDelay();
         }
      }
      
      private function resizeWithDelay(param1:int = 400) : void
      {
         clearTimeout(this._timeOutResize);
         this._timeOutResize = setTimeout(this.onResizeWithDelay,param1);
      }
      
      private function onResizeWithDelay() : void
      {
         this.resize(false);
      }
      
      private function resizeListItem(param1:int) : void
      {
         var _loc2_:Object = null;
         var _loc3_:BattleListItemParams = null;
         this.iconWidth = param1 - (this._battleList.maxVerticalScrollPosition > 0 ? 32 : 20);
         if(this.iconWidth == this.oldIconWidth)
         {
            return;
         }
         this.oldIconWidth = this.iconWidth;
         var _loc4_:int = 0;
         while(_loc4_ < this._dataProvider.length)
         {
            _loc2_ = this._dataProvider.getItemAt(_loc4_);
            _loc3_ = _loc2_.dat;
            _loc2_.iconNormal = this.myIcon(false,_loc3_);
            _loc2_.iconSelected = this.myIcon(true,_loc3_);
            this._dataProvider.replaceItemAt(_loc2_,_loc4_);
            this._dataProvider.invalidateItemAt(_loc4_);
            _loc4_++;
         }
      }
      
      private function myIcon(param1:Boolean, param2:BattleListItemParams) : Sprite
      {
         var _loc18_:CrystalLabel = null;
         var _loc3_:LabelBase = null;
         var _loc4_:Abris = null;
         var _loc5_:uint = 0;
         var _loc6_:* = false;
         var _loc7_:FriendsIndicator = null;
         var _loc8_:* = false;
         var _loc9_:* = false;
         var _loc10_:FriendsIndicator = null;
         var _loc11_:FriendsIndicator = null;
         var _loc12_:Sprite = new Sprite();
         var _loc13_:Shape = new Shape();
         var _loc14_:Boolean = param2.accessible;
         var _loc15_:Bitmap = null;
         var _loc16_:int = this.iconWidth;
         var _loc17_:int = int(_loc16_ * 0.55);
         if(param2.proBattle)
         {
            if(param2.Renamed1624)
            {
               (_loc15_ = new Bitmap(Renamed1925.Renamed3929(_loc14_,param1))).y = 3;
               _loc15_.x = -2;
               _loc12_.addChild(_loc15_);
            }
            else
            {
               (_loc15_ = new Bitmap(Renamed1925.Renamed1926(_loc14_,param1))).y = 3;
               _loc15_.x = -2;
               _loc12_.addChild(_loc15_);
            }
         }
         _loc3_ = new LabelBase();
         _loc3_.size = 12;
         if(param2.suspicionLevel != Renamed1620.NONE)
         {
            _loc5_ = this.Renamed3930(param2.suspicionLevel);
         }
         else
         {
            _loc5_ = param1 ? (_loc14_ ? uint(TankWindowInner.GREEN) : uint(5789784)) : (_loc14_ ? uint(5898034) : uint(11645361));
         }
         _loc3_.color = _loc5_;
         _loc3_.text = param2.gamename;
         _loc3_.autoSize = TextFieldAutoSize.NONE;
         _loc3_.width = _loc17_ - 6;
         _loc3_.height = 18;
         _loc3_.x = 8;
         _loc3_.y = -1;
         _loc12_.addChild(_loc3_);
         if(param2.additionalCrystalsPercent > 0)
         {
            _loc18_ = new CrystalLabel();
            _loc18_.setText("+" + param2.additionalCrystalsPercent + "%");
            _loc18_.x = _loc16_ - _loc18_.width + 5;
            _loc18_.y = -1;
            _loc12_.addChild(_loc18_);
         }
         var _loc19_:uint = param1 ? (_loc14_ ? uint(TankWindowInner.GREEN) : uint(5789784)) : (_loc14_ ? uint(5898034) : uint(11645361));
         _loc3_ = new LabelBase();
         _loc3_.size = 12;
         _loc3_.color = _loc19_;
         _loc3_.autoSize = TextFieldAutoSize.RIGHT;
         _loc3_.align = TextFormatAlign.RIGHT;
         _loc3_.text = String(param2.nmap);
         _loc3_.x = _loc16_ - (!!_loc18_ ? _loc18_.width : 0) - _loc3_.textWidth + 2;
         _loc3_.y = -1;
         _loc12_.addChild(_loc3_);
         if(param2.dmatch)
         {
            _loc6_ = param2.all == param2.maxPeople;
            _loc4_ = new Abris();
            _loc4_.gotoAndStop(_loc6_ ? 1 : 2);
            _loc4_.x = _loc17_;
            _loc4_.y = 1;
            _loc12_.addChild(_loc4_);
            _loc3_ = new LabelBase();
            _loc3_.autoSize = TextFieldAutoSize.NONE;
            _loc3_.size = 12;
            _loc3_.color = _loc6_ ? uint(8816262) : uint(16777215);
            _loc3_.align = TextFormatAlign.CENTER;
            _loc3_.text = String(param2.all);
            _loc3_.x = int(_loc17_ - 0.5);
            _loc3_.y = -1;
            _loc3_.width = 52;
            _loc3_.height = 16;
            _loc12_.addChild(_loc3_);
            if(param2.friends > 0)
            {
               (_loc7_ = new FriendsIndicator(param1,_loc14_,param2.friends,_loc19_)).x = _loc17_ + _loc4_.width + 10;
               _loc12_.addChild(_loc7_);
            }
         }
         else
         {
            _loc8_ = param2.reds == param2.maxPeople;
            _loc9_ = param2.blues == param2.maxPeople;
            _loc4_ = new Abris();
            _loc4_.gotoAndStop(_loc8_ ? 3 : 5);
            _loc4_.x = _loc17_;
            _loc4_.y = 1;
            _loc12_.addChild(_loc4_);
            _loc4_ = new Abris();
            _loc4_.gotoAndStop(_loc9_ ? 4 : 6);
            _loc4_.x = _loc17_ + 27;
            _loc4_.y = 1;
            _loc12_.addChild(_loc4_);
            _loc3_ = new LabelBase();
            _loc3_.autoSize = TextFieldAutoSize.NONE;
            _loc3_.size = 12;
            _loc3_.align = TextFormatAlign.CENTER;
            _loc3_.color = _loc8_ ? uint(8816262) : uint(16777215);
            _loc3_.text = String(param2.reds);
            _loc3_.x = int(_loc17_ - 0.5);
            _loc3_.y = -1;
            _loc3_.width = 27;
            _loc3_.height = 16;
            _loc12_.addChild(_loc3_);
            _loc3_ = new LabelBase();
            _loc3_.autoSize = TextFieldAutoSize.NONE;
            _loc3_.align = TextFormatAlign.CENTER;
            _loc3_.color = _loc9_ ? uint(8816262) : uint(16777215);
            _loc3_.text = String(param2.blues);
            _loc3_.x = int(_loc17_ + 26.5);
            _loc3_.y = -1;
            _loc3_.width = 25;
            _loc3_.height = 16;
            _loc12_.addChild(_loc3_);
            if(param2.friendsBlues > 0)
            {
               (_loc10_ = new FriendsIndicator(param1,_loc14_,param2.friendsBlues,_loc19_)).x = _loc17_ + 27 + _loc4_.width + 10;
               _loc12_.addChild(_loc10_);
            }
            if(param2.friendsReds > 0)
            {
               (_loc11_ = new FriendsIndicator(param1,_loc14_,param2.friendsReds,_loc19_)).x = _loc17_ - _loc11_.width - 9;
               _loc12_.addChild(_loc11_);
            }
         }
         return _loc12_;
      }
      
      private function Renamed3930(param1:Renamed1620) : uint
      {
         switch(param1)
         {
            case Renamed1620.HIGH:
               return ColorConstants.BATTLE_SUSPICIOUS_HIGH;
            default:
               return ColorConstants.BATTLE_SUSPICIOUS_LOW;
         }
      }
      
      public function sortBattleList() : void
      {
         this._dataProvider.sortOn(["suspicionLevel","accessible","friends","id"],[Array.NUMERIC | Array.DESCENDING,Array.DESCENDING,Array.NUMERIC | Array.DESCENDING,Array.NUMERIC | Array.DESCENDING]);
      }
      
      public function resetSelectedItem() : void
      {
         this._battleList.selectedItem = null;
      }
      
      public function createItem(param1:BattleListItemParams, param2:Boolean) : void
      {
         var _loc3_:int = this.getItemIndex(param1.id);
         var _loc4_:Object;
         (_loc4_ = new Object()).id = param1.id;
         _loc4_.accessible = param1.accessible;
         _loc4_.iconNormal = this.myIcon(false,param1);
         _loc4_.iconSelected = this.myIcon(true,param1);
         _loc4_.suspicionLevel = param1.suspicionLevel.value;
         _loc4_.dat = param1;
         if(param1.dmatch)
         {
            _loc4_.friends = param1.friends;
         }
         else
         {
            _loc4_.friends = param1.friendsBlues + param1.friendsReds;
         }
         if(_loc3_ < 0)
         {
            this._dataProvider.addItem(_loc4_);
         }
         if(param2)
         {
            this.sortBattleList();
            this.resize();
            helpService.hideHelper(this.HELPER_GROUP_KEY,this.HELPER_NOT_AVAILABLE);
         }
      }
      
      public function removeItem(param1:String) : void
      {
         var _loc2_:int = this.getItemIndex(param1);
         if(_loc2_ >= 0)
         {
            this._dataProvider.removeItemAt(_loc2_);
            this.resizeWithDelay();
         }
      }
      
      public function setSelect(param1:String) : void
      {
         var _loc2_:int = this.getItemIndex(param1);
         if(_loc2_ >= 0)
         {
            this._battleList.selectedIndex = _loc2_;
            this._battleList.scrollToSelected();
         }
         else
         {
            this._battleList.selectedItem = null;
         }
         this._battleList.drawNow();
      }
      
      public function updateName(param1:String, param2:String) : void
      {
         var _loc3_:Object = null;
         var _loc4_:BattleListItemParams = null;
         var _loc5_:Object = null;
         var _loc6_:int = this.getItemIndex(param1);
         if(_loc6_ >= 0)
         {
            _loc3_ = this._dataProvider.getItemAt(_loc6_);
            _loc4_ = _loc3_.dat;
            _loc5_ = this.getItem(_loc4_.id,param2,_loc4_.battleItemGO,_loc4_.dmatch,_loc4_.reds,_loc4_.blues,_loc4_.friendsReds,_loc4_.friendsBlues,_loc4_.all,_loc4_.friends,_loc4_.maxPeople,_loc4_.nmap,_loc4_.accessible,_loc4_.proBattle,_loc4_.noSupplies,_loc4_.suspicionLevel,_loc4_.rankRange,_loc4_.Renamed1624,_loc4_.Renamed1625,_loc4_.additionalCrystalsPercent);
            this._dataProvider.replaceItemAt(_loc5_,_loc6_);
            this._dataProvider.invalidateItemAt(_loc6_);
         }
      }
      
      public function updateSuspicious(param1:String, param2:Renamed1620) : void
      {
         var _loc3_:Object = null;
         var _loc4_:BattleListItemParams = null;
         var _loc5_:Object = null;
         var _loc6_:int = this.getItemIndex(param1);
         if(_loc6_ >= 0)
         {
            _loc3_ = this._dataProvider.getItemAt(_loc6_);
            _loc4_ = _loc3_.dat;
            _loc5_ = this.getItem(_loc4_.id,_loc4_.gamename,_loc4_.battleItemGO,_loc4_.dmatch,_loc4_.reds,_loc4_.blues,_loc4_.friendsReds,_loc4_.friendsBlues,_loc4_.all,_loc4_.friends,_loc4_.maxPeople,_loc4_.nmap,_loc4_.accessible,_loc4_.proBattle,_loc4_.noSupplies,param2,_loc4_.rankRange,_loc4_.Renamed1624,_loc4_.Renamed1625,_loc4_.additionalCrystalsPercent);
            this._dataProvider.replaceItemAt(_loc5_,_loc6_);
            this._dataProvider.invalidateItemAt(_loc6_);
            this.sortBattleList();
         }
      }
      
      public function updateUsersCountTeam(param1:String, param2:int, param3:int, param4:int, param5:uint) : void
      {
         var _loc6_:Object = null;
         var _loc7_:BattleListItemParams = null;
         var _loc8_:Object = null;
         var _loc9_:int = this.getItemIndex(param1);
         if(_loc9_ >= 0)
         {
            _loc6_ = this._dataProvider.getItemAt(_loc9_);
            _loc7_ = _loc6_.dat;
            _loc8_ = this.getItem(_loc7_.id,_loc7_.gamename,_loc7_.battleItemGO,_loc7_.dmatch,param2,param3,param4,param5,_loc7_.all,_loc7_.friends,_loc7_.maxPeople,_loc7_.nmap,_loc7_.accessible,_loc7_.proBattle,_loc7_.noSupplies,_loc7_.suspicionLevel,_loc7_.rankRange,_loc7_.Renamed1624,_loc7_.Renamed1625,_loc7_.additionalCrystalsPercent);
            this._dataProvider.replaceItemAt(_loc8_,_loc9_);
            this._dataProvider.invalidateItemAt(_loc9_);
         }
      }
      
      public function updateUsersCountDm(param1:String, param2:int, param3:int) : void
      {
         var _loc4_:Object = null;
         var _loc5_:BattleListItemParams = null;
         var _loc6_:Object = null;
         var _loc7_:int = this.getItemIndex(param1);
         if(_loc7_ >= 0)
         {
            _loc4_ = this._dataProvider.getItemAt(_loc7_);
            _loc5_ = _loc4_.dat;
            _loc6_ = this.getItem(_loc5_.id,_loc5_.gamename,_loc5_.battleItemGO,_loc5_.dmatch,_loc5_.reds,_loc5_.blues,_loc5_.friendsReds,_loc5_.friendsBlues,param2,param3,_loc5_.maxPeople,_loc5_.nmap,_loc5_.accessible,_loc5_.proBattle,_loc5_.noSupplies,_loc5_.suspicionLevel,_loc5_.rankRange,_loc5_.Renamed1624,_loc5_.Renamed1625,_loc5_.additionalCrystalsPercent);
            this._dataProvider.replaceItemAt(_loc6_,_loc7_);
            this._dataProvider.invalidateItemAt(_loc7_);
         }
      }
      
      public function swapTeams(param1:String, param2:int, param3:int, param4:int, param5:int) : void
      {
         var _loc6_:Object = null;
         var _loc7_:BattleListItemParams = null;
         var _loc8_:Object = null;
         var _loc9_:int = this.getItemIndex(param1);
         if(_loc9_ >= 0)
         {
            _loc6_ = this._dataProvider.getItemAt(_loc9_);
            _loc7_ = _loc6_.dat;
            _loc8_ = this.getItem(_loc7_.id,_loc7_.gamename,_loc7_.battleItemGO,_loc7_.dmatch,param2,param3,param4,param5,_loc7_.all,_loc7_.friends,_loc7_.maxPeople,_loc7_.nmap,_loc7_.accessible,_loc7_.proBattle,_loc7_.noSupplies,_loc7_.suspicionLevel,_loc7_.rankRange,_loc7_.Renamed1624,_loc7_.Renamed1625,_loc7_.additionalCrystalsPercent);
            this._dataProvider.replaceItemAt(_loc8_,_loc9_);
            this._dataProvider.invalidateItemAt(_loc9_);
         }
      }
      
      public function updateAvailableItems(param1:int) : void
      {
         var _loc2_:Object = null;
         var _loc3_:BattleListItemParams = null;
         var _loc4_:Renamed1586 = null;
         var _loc5_:Boolean = false;
         var _loc6_:Object = null;
         var _loc7_:int = int(this._dataProvider.length);
         var _loc8_:int = 0;
         while(_loc8_ < _loc7_)
         {
            _loc2_ = this._dataProvider.getItemAt(_loc8_);
            _loc3_ = _loc2_.dat;
            _loc4_ = Renamed1586(_loc3_.rankRange);
            _loc5_ = param1 >= _loc4_.min && param1 <= _loc4_.max;
            _loc6_ = this.getItem(_loc3_.id,_loc3_.gamename,_loc3_.battleItemGO,_loc3_.dmatch,_loc3_.reds,_loc3_.blues,_loc3_.friendsReds,_loc3_.friendsBlues,_loc3_.all,_loc3_.friends,_loc3_.maxPeople,_loc3_.nmap,_loc5_,_loc3_.proBattle,_loc3_.noSupplies,_loc3_.suspicionLevel,_loc3_.rankRange,_loc3_.Renamed1624,_loc3_.Renamed1625,_loc3_.additionalCrystalsPercent);
            this._dataProvider.replaceItemAt(_loc6_,_loc8_);
            this._dataProvider.invalidateItemAt(_loc8_);
            _loc8_++;
         }
         this.sortBattleList();
      }
      
      private function getItem(param1:String, param2:String, param3:IGameObject, param4:Boolean, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:int, param12:String, param13:Boolean, param14:Boolean, param15:Boolean, param16:Renamed1620, param17:Renamed1586, param18:Boolean, param19:String, param20:int) : Object
      {
         var _loc21_:BattleListItemParams;
         (_loc21_ = new BattleListItemParams()).gamename = param2;
         _loc21_.battleItemGO = param3;
         _loc21_.id = param1;
         _loc21_.dmatch = param4;
         _loc21_.reds = param5;
         _loc21_.blues = param6;
         _loc21_.friendsReds = param7;
         _loc21_.friendsBlues = param8;
         _loc21_.all = param9;
         _loc21_.friends = param10;
         _loc21_.maxPeople = param11;
         _loc21_.nmap = param12;
         _loc21_.accessible = param13;
         _loc21_.rankRange = param17;
         _loc21_.noSupplies = param15;
         _loc21_.proBattle = param14;
         _loc21_.suspicionLevel = param16;
         _loc21_.Renamed1624 = param18;
         _loc21_.Renamed1625 = param19;
         _loc21_.additionalCrystalsPercent = param20;
         var _loc22_:Object;
         (_loc22_ = new Object()).id = param1;
         _loc22_.accessible = param13;
         _loc22_.iconNormal = this.myIcon(false,_loc21_);
         _loc22_.iconSelected = this.myIcon(true,_loc21_);
         _loc22_.suspicionLevel = param16.value;
         _loc22_.dat = _loc21_;
         if(param4)
         {
            _loc22_.friends = _loc21_.friends;
         }
         else
         {
            _loc22_.friends = _loc21_.friendsBlues + _loc21_.friendsReds;
         }
         return _loc22_;
      }
      
      private function Renamed1623(param1:String, param2:Boolean, param3:String) : String
      {
         if(param2)
         {
            param1 = param1 + " " + param3;
         }
         return param1;
      }
      
      public function getItemIndex(param1:String) : int
      {
         var _loc2_:Object = null;
         var _loc3_:int = int(this._dataProvider.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this._dataProvider.getItemAt(_loc4_);
            if(_loc2_.id == param1)
            {
               return _loc4_;
            }
            _loc4_++;
         }
         return -1;
      }
      
      private function onResize(param1:Event = null) : void
      {
         this.resize();
      }
      
      private function onShowCreateBattleFormButtonClick(param1:MouseEvent) : void
      {
         this._callback.onShowCreateBattleFormButtonClick();
      }
      
      private function onBattleListItemClick(param1:ListEvent) : void
      {
         this._callback.onBattleListItemClick(String(param1.item.dat.id));
         var _loc2_:Boolean = Boolean(param1.item.dat.accessible);
         if(!_loc2_)
         {
            this._lockedMapsHelper.targetPoint = new Point(this._stage.mouseX,this._stage.mouseY);
            helpService.showHelper(this.HELPER_GROUP_KEY,this.HELPER_NOT_AVAILABLE);
         }
      }
      
      private function onListChange(param1:Event) : void
      {
         if(this._battleList.selectedItem != null)
         {
            this._callback.onBattleListItemChange(String(this._battleList.selectedItem.dat.id));
         }
      }
   }
}

