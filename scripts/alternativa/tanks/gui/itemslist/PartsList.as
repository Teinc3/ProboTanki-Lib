package alternativa.tanks.gui.itemslist
{
   import assets.Diamond;
   import assets.icons.GarageItemBackground;
   import assets.icons.IconGarageMod;
   import assets.icons.InputCheckIcon;
   import base.DiscreteSprite;
   import controls.Money;
   import controls.base.LabelBase;
   import controls.labels.CountDownTimerLabel;
   import controls.saleicons.SaleIcons;
   import controls.timer.CountDownTimer;
   import controls.timer.CountDownTimerOnCompleteBefore;
   import fl.controls.LabelButton;
   import fl.controls.ScrollBar;
   import fl.controls.ScrollBarDirection;
   import fl.controls.TileList;
   import fl.data.DataProvider;
   import fl.events.ListEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.system.Capabilities;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import flash.utils.getTimer;
   import forms.events.PartsListEvent;
   import forms.premium.PremiumItemLock;
   import forms.ranks.BigRankIcon;
   import forms.ranks.RankIcon;
   import forms.registration.CallsignIconStates;
   import platform.client.fp10.core.resource.IResourceLoadingListener;
   import platform.client.fp10.core.resource.Resource;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.commons.types.ItemCategoryEnum;
   import projects.tanks.client.commons.types.ItemGarageProperty;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.disposeBitmapsData;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.removeDisplayObject;
   import utils.ScrollStyleUtils;
   
   public class PartsList extends Sprite implements IResourceLoadingListener, CountDownTimerOnCompleteBefore
   {
      private static const labelRed:Bitmap = SaleIcons.createSaleRedLabelInstance();
      
      private static const MIN_POSIBLE_SPEED:Number = 70;
      
      private static const MAX_DELTA_FOR_SELECT:Number = 7;
      
      private static const ADDITIONAL_SCROLL_AREA_HEIGHT:Number = 3;
      
      private static const PREMIUM_ITEM_LOCK_X:int = 118;
      
      private static const PREMIUM_ITEM_LOCK_Y:int = 58;
      
      private var list:TileList;
      
      private var dp:DataProvider;
      
      private var typeSort:Array;
      
      private var _selectedItem:IGameObject = null;
      
      private var previousPositionX:Number;
      
      private var currrentPositionX:Number;
      
      private var sumDragWay:Number;
      
      private var lastItemIndex:int;
      
      private var previousTime:int;
      
      private var currentTime:int;
      
      private var scrollSpeed:Number = 0;
      
      private var bitmapsData:Array;
      
      private var _width:int;
      
      private var _height:int;
      
      public function PartsList()
      {
         this.typeSort = [ItemCategoryEnum.WEAPON,ItemCategoryEnum.ARMOR,ItemCategoryEnum.COLOR,ItemCategoryEnum.PLUGIN,ItemCategoryEnum.INVENTORY,ItemCategoryEnum.KIT];
         super();
         this.bitmapsData = [];
         this.dp = new DataProvider();
         this.list = new TileList();
         this.list.dataProvider = this.dp;
         this.list.rowCount = 1;
         this.list.rowHeight = 130;
         this.list.columnWidth = 203;
         this.list.setStyle("cellRenderer",PartsListRenderer);
         this.list.direction = ScrollBarDirection.HORIZONTAL;
         this.list.focusEnabled = false;
         this.list.horizontalScrollBar.focusEnabled = false;
         addChild(this.list);
         addEventListener(Event.ADDED_TO_STAGE,this.addListners);
         addEventListener(Event.REMOVED_FROM_STAGE,this.removeListners);
         ScrollStyleUtils.setGreenStyle(this.list);
      }
      
      public function get selectedItem() : IGameObject
      {
         return this._selectedItem;
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = Math.ceil(param1);
         this.list.width = this._width;
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function set height(param1:Number) : void
      {
         this._height = Math.ceil(param1);
         this.list.height = this._height;
      }
      
      override public function get height() : Number
      {
         return this._height;
      }
      
      public function get columnWidth() : int
      {
         return Math.ceil(this.list.columnWidth);
      }
      
      private function updateScrollOnEnterFrame(param1:Event) : void
      {
         var _loc2_:Sprite = null;
         var _loc3_:Sprite = null;
         _loc2_ = null;
         _loc3_ = null;
         var _loc4_:ScrollBar = this.list.horizontalScrollBar;
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
               this.list.addChild(_loc3_);
            }
            _loc3_.graphics.beginFill(0,0);
            if(_loc2_ is LabelButton)
            {
               _loc3_.graphics.drawRect(_loc2_.y - 14,_loc4_.y - ADDITIONAL_SCROLL_AREA_HEIGHT,_loc2_.height + 28,_loc2_.width + ADDITIONAL_SCROLL_AREA_HEIGHT);
            }
            else
            {
               _loc3_.graphics.drawRect(_loc2_.y,_loc4_.y - ADDITIONAL_SCROLL_AREA_HEIGHT,_loc2_.height,_loc2_.width + ADDITIONAL_SCROLL_AREA_HEIGHT);
            }
            _loc3_.graphics.endFill();
            _loc5_++;
         }
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         this.scrollSpeed = 0;
         var _loc2_:Rectangle = this.list.horizontalScrollBar.getBounds(stage);
         _loc2_.top -= ADDITIONAL_SCROLL_AREA_HEIGHT;
         if(!_loc2_.contains(param1.stageX,param1.stageY))
         {
            this.sumDragWay = 0;
            this.previousPositionX = this.currrentPositionX = param1.stageX;
            this.currentTime = this.previousTime = getTimer();
            this.lastItemIndex = this.list.selectedIndex;
            stage.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
            stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         }
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         this.previousPositionX = this.currrentPositionX;
         this.currrentPositionX = param1.stageX;
         this.previousTime = this.currentTime;
         this.currentTime = getTimer();
         var _loc2_:Number = this.currrentPositionX - this.previousPositionX;
         this.sumDragWay += Math.abs(_loc2_);
         if(this.sumDragWay > MAX_DELTA_FOR_SELECT)
         {
            this.list.horizontalScrollPosition -= _loc2_;
         }
         param1.updateAfterEvent();
      }
      
      private function onMouseUp(param1:MouseEvent) : void
      {
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         var _loc2_:Number = (getTimer() - this.previousTime) / 1000;
         if(_loc2_ == 0)
         {
            _loc2_ = 0.1;
         }
         var _loc3_:Number = param1.stageX - this.previousPositionX;
         this.scrollSpeed = _loc3_ / _loc2_;
         this.previousTime = this.currentTime;
         this.currentTime = getTimer();
         addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         this.previousTime = this.currentTime;
         this.currentTime = getTimer();
         var _loc2_:Number = (this.currentTime - this.previousTime) / 1000;
         this.list.horizontalScrollPosition -= this.scrollSpeed * _loc2_;
         var _loc3_:Number = this.list.horizontalScrollPosition;
         var _loc4_:Number = this.list.maxHorizontalScrollPosition;
         if(Math.abs(this.scrollSpeed) > MIN_POSIBLE_SPEED && 0 < _loc3_ && _loc3_ < _loc4_)
         {
            this.scrollSpeed *= Math.exp(-1.5 * _loc2_);
         }
         else
         {
            this.scrollSpeed = 0;
            removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         }
      }
      
      private function selectItem(param1:ListEvent) : void
      {
         var _loc2_:Object = null;
         if(this.sumDragWay < MAX_DELTA_FOR_SELECT)
         {
            _loc2_ = param1.item;
            this.scrollSpeed = 0;
            if(this._selectedItem != _loc2_.dat.id)
            {
               this._selectedItem = _loc2_.dat.id;
               this.list.selectedItem = _loc2_;
               this.list.scrollToSelected();
               dispatchEvent(new PartsListEvent(PartsListEvent.SELECT_PARTS_LIST_ITEM));
            }
            dispatchEvent(new PartsListEvent(PartsListEvent.ITEM_CLICK));
         }
         else
         {
            this.list.addEventListener(Event.CHANGE,this.onChangeItem);
         }
      }
      
      private function onChangeItem(param1:Event) : void
      {
         this.list.selectedIndex = this.lastItemIndex;
         this.list.removeEventListener(Event.CHANGE,this.onChangeItem);
      }
      
      public function addItem(param1:IGameObject, param2:String, param3:ItemCategoryEnum, param4:int, param5:int, param6:int, param7:Boolean, param8:Boolean, param9:int, param10:ImageResource, param11:int = 0, param12:CountDownTimer = null, param13:int = -1, param14:CountDownTimer = null, param15:Vector.<ItemGarageProperty> = null, param16:Boolean = false) : void
      {
         var _loc17_:DisplayObject = null;
         var _loc18_:DisplayObject = null;
         var _loc19_:Object;
         (_loc19_ = {}).id = param1;
         _loc19_.name = param2;
         _loc19_.type = param3;
         _loc19_.typeSort = this.typeSort[param3];
         _loc19_.mod = param13;
         _loc19_.crystalPrice = param5;
         _loc19_.rank = param6 == 0 && !param7 ? -1 : param6;
         _loc19_.showLockPremium = param7;
         _loc19_.installed = false;
         _loc19_.garageElement = param8;
         _loc19_.count = param9;
         _loc19_.preview = param10;
         _loc19_.sort = param4;
         _loc19_.discount = param11;
         _loc19_.timer = param12;
         _loc19_.timerDiscount = param14;
         _loc19_.isUpgradingInAvailableItemsAlert = param16;
         if(param12 != null && param16)
         {
            _loc19_.timer.addListener(CountDownTimerOnCompleteBefore,this);
         }
         _loc17_ = this.myIcon(_loc19_,false);
         _loc18_ = this.myIcon(_loc19_,true);
         this.dp.addItem({
            "iconNormal":_loc17_,
            "iconSelected":_loc18_,
            "dat":_loc19_,
            "rank":_loc19_.rank,
            "type":param3,
            "typesort":_loc19_.typeSort,
            "sort":param4
         });
         this.dp.sortOn(["rank","sort"],[Array.NUMERIC,Array.NUMERIC]);
      }
      
      private function update(param1:IGameObject, param2:String, param3:* = null, param4:Boolean = true) : void
      {
         var _loc5_:int = this.indexById(param1);
         this.updateByIndex(_loc5_,param2,param3,param4);
      }
      
      private function updateByIndex(param1:int, param2:String, param3:*, param4:Boolean) : void
      {
         var _loc5_:DisplayObject = null;
         var _loc6_:DisplayObject = null;
         var _loc7_:Object = this.dp.getItemAt(param1);
         var _loc8_:Object;
         (_loc8_ = _loc7_.dat)[param2] = param3;
         if(param4)
         {
            _loc5_ = this.myIcon(_loc8_,false);
            _loc6_ = this.myIcon(_loc8_,true);
            _loc7_.dat = _loc8_;
            _loc7_.iconNormal = _loc5_;
            _loc7_.iconSelected = _loc6_;
            this.dp.replaceItemAt(_loc7_,param1);
            this.dp.sortOn(["rank","sort"],[Array.NUMERIC,Array.NUMERIC]);
            this.dp.invalidateItemAt(param1);
         }
      }
      
      public function mount(param1:IGameObject) : void
      {
         this.update(param1,"installed",true);
      }
      
      public function unmount(param1:IGameObject) : void
      {
         this.update(param1,"installed",false);
      }
      
      public function updateCount(param1:IGameObject, param2:int) : void
      {
         this.update(param1,"count",param2);
      }
      
      public function updateDiscountWithTimer(param1:IGameObject, param2:int, param3:CountDownTimer) : void
      {
         this.update(param1,"discount",param2,false);
         this.update(param1,"timerDiscount",param3);
      }
      
      public function updateDiscountAndCost(param1:IGameObject, param2:int, param3:CountDownTimer, param4:int) : void
      {
         this.update(param1,"discount",param2,false);
         this.update(param1,"timerDiscount",param3,false);
         this.updateCost(param1,param4);
      }
      
      public function updatePreview(param1:ImageResource) : void
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.dp.length)
         {
            _loc2_ = this.dp.getItemAt(_loc3_);
            if((_loc2_.dat.preview as ImageResource).id == param1.id)
            {
               this.update(_loc2_.dat.id,"preview",param1 as ImageResource);
            }
            _loc3_++;
         }
      }
      
      public function deleteItem(param1:IGameObject) : void
      {
         var _loc2_:int = this.indexById(param1);
         var _loc3_:Object = this.dp.getItemAt(_loc2_);
         if(this.list.selectedIndex == _loc2_)
         {
            this._selectedItem = null;
            this.list.selectedItem = null;
         }
         this.dp.removeItem(_loc3_);
      }
      
      public function select(param1:IGameObject) : void
      {
         var _loc2_:int = 0;
         this.scrollSpeed = 0;
         if(this._selectedItem != param1)
         {
            _loc2_ = this.indexById(param1);
            this.list.selectedIndex = _loc2_;
            this._selectedItem = param1;
            dispatchEvent(new PartsListEvent(PartsListEvent.SELECT_PARTS_LIST_ITEM));
         }
      }
      
      public function selectByIndex(param1:uint) : void
      {
         var _loc2_:Object = null;
         this.scrollSpeed = 0;
         if(this.list.selectedIndex != param1)
         {
            _loc2_ = (this.dp.getItemAt(param1) as Object).dat;
            this.list.selectedIndex = param1;
            this._selectedItem = _loc2_.id;
            dispatchEvent(new PartsListEvent(PartsListEvent.SELECT_PARTS_LIST_ITEM));
         }
      }
      
      public function scrollTo(param1:IGameObject) : void
      {
         this.scrollSpeed = 0;
         var _loc2_:int = this.indexById(param1);
         this.list.scrollToIndex(_loc2_);
      }
      
      public function unselect() : void
      {
         this._selectedItem = null;
         this.list.selectedItem = null;
      }
      
      private function myIcon(param1:Object, param2:Boolean) : DisplayObject
      {
         var _loc3_:BitmapData = null;
         var _loc4_:GarageItemBackground = null;
         var _loc5_:String = null;
         var _loc6_:Bitmap = null;
         var _loc7_:IconGarageMod = null;
         var _loc8_:CountDownTimer = null;
         var _loc9_:CountDownTimerLabel = null;
         var _loc10_:Sprite = new DiscreteSprite();
         var _loc11_:Sprite = new DiscreteSprite();
         var _loc12_:LabelBase = new LabelBase();
         var _loc13_:LabelBase = new LabelBase();
         var _loc14_:LabelBase = new LabelBase();
         var _loc15_:Diamond = new Diamond();
         var _loc16_:InputCheckIcon = new InputCheckIcon();
         if((param1.preview as ImageResource).data == null)
         {
            _loc11_.addChild(_loc16_);
            _loc16_.gotoAndStop(CallsignIconStates.CALLSIGN_ICON_STATE_PROGRESS);
            _loc16_.x = 200 - _loc16_.width >> 1;
            _loc16_.y = 130 - _loc16_.height >> 1;
            (param1.preview as ImageResource).addLazyListener(this);
         }
         else
         {
            (_loc6_ = new Bitmap((param1.preview as ImageResource).data)).x = 19;
            _loc6_.y = 18;
            _loc11_.addChild(_loc6_);
         }
         if(param1.rank > 0 || Boolean(param1.showLockPremium))
         {
            if(param1.type != ItemCategoryEnum.PLUGIN)
            {
               this.addLockItem(param1,_loc11_);
            }
            _loc5_ = "OFF";
            param1.installed = false;
            _loc14_.color = _loc13_.color = _loc12_.color = 12632256;
         }
         else
         {
            _loc14_.color = _loc13_.color = _loc12_.color = 5898034;
            if(Boolean(param1.garageElement) && param1.mod != -1)
            {
               _loc7_ = new IconGarageMod(param1.mod);
               _loc11_.addChild(_loc7_);
               _loc7_.x = 159;
               _loc7_.y = 7;
            }
            switch(param1.type)
            {
               case ItemCategoryEnum.WEAPON:
                  if(Boolean(param1.garageElement) && Boolean(param1.installed))
                  {
                     _loc12_.color = 8693863;
                  }
                  _loc5_ = "GUN";
                  break;
               case ItemCategoryEnum.ARMOR:
                  if(Boolean(param1.garageElement) && Boolean(param1.installed))
                  {
                     _loc12_.color = 9411748;
                  }
                  _loc5_ = "SHIELD";
                  break;
               case ItemCategoryEnum.COLOR:
                  _loc5_ = "COLOR";
                  if(param1.installed)
                  {
                     _loc12_.color = 11049390;
                  }
                  break;
               case ItemCategoryEnum.INVENTORY:
                  _loc5_ = "ENGINE";
                  param1.installed = false;
                  _loc11_.addChild(_loc14_);
                  _loc14_.x = 15;
                  _loc14_.y = 100;
                  _loc14_.autoSize = TextFieldAutoSize.NONE;
                  _loc14_.size = 16;
                  _loc14_.align = TextFormatAlign.LEFT;
                  _loc14_.width = 100;
                  _loc14_.height = 25;
                  _loc14_.text = param1.count == 0 ? " " : "×" + String(param1.count);
                  break;
               default:
                  _loc5_ = "PLUGIN";
            }
         }
         _loc5_ += (Boolean(param1.installed) ? "_INSTALLED" : "_NORMAL") + (param2 ? "_SELECTED" : "");
         _loc4_ = new GarageItemBackground(GarageItemBackground.idByName(_loc5_));
         _loc12_.text = param1.name;
         if(!param1.garageElement || param1.type == ItemCategoryEnum.INVENTORY)
         {
            if(param1.crystalPrice > 0)
            {
               _loc13_.text = Money.numToString(param1.crystalPrice,false);
               _loc13_.x = 181 - _loc13_.textWidth;
               _loc13_.y = 2;
               _loc11_.addChild(_loc15_);
               _loc11_.addChild(_loc13_);
               _loc15_.x = 186;
               _loc15_.y = 6;
            }
         }
         _loc12_.y = 2;
         _loc12_.x = 3;
         _loc11_.addChildAt(_loc4_,0);
         _loc11_.addChild(_loc12_);
         var _loc17_:LabelBase = new LabelBase();
         if(param1.discount > 0 && (param1.rank <= 0 || param1.garageElement))
         {
            labelRed.y = _loc4_.height - labelRed.height - 8;
            labelRed.x = _loc4_.width - labelRed.width - 2;
            _loc11_.addChild(labelRed);
            _loc17_.color = 16777215;
            _loc17_.align = TextFormatAlign.CENTER;
            _loc17_.text = "-" + String(param1.discount) + "%";
            _loc17_.size = 13;
            _loc17_.x = int(labelRed.x + labelRed.width / 2 - _loc17_.textWidth / 2);
            _loc17_.y = labelRed.y + 6;
            _loc11_.addChild(_loc17_);
            if(param1.timerDiscount != null)
            {
               _loc8_ = param1.timerDiscount;
               if(_loc8_.getEndTime() > getTimer())
               {
                  (_loc9_ = new CountDownTimerLabel()).color = 15258050;
                  _loc9_.start(param1.timerDiscount);
                  _loc9_.y = labelRed.y + 18;
                  _loc9_.autoSize = TextFieldAutoSize.NONE;
                  _loc9_.align = TextFormatAlign.CENTER;
                  _loc9_.width = labelRed.width - 8;
                  _loc9_.x = int(labelRed.x + labelRed.width / 2 - _loc9_.width / 2);
                  _loc10_.addChild(_loc9_);
               }
               else
               {
                  param1.timerDiscount = null;
                  _loc17_.y += 5;
               }
            }
            else
            {
               _loc17_.y += 5;
            }
         }
         _loc3_ = new BitmapData(_loc11_.width,_loc11_.height,true,0);
         this.bitmapsData.push(_loc3_);
         _loc3_.draw(_loc11_);
         _loc10_.addChildAt(new Bitmap(_loc3_),0);
         if(param1.timer != null)
         {
            if(param1.isUpgradingInAvailableItemsAlert)
            {
               _loc9_ = new CountDownTimerLabel();
               _loc9_.start(param1.timer);
               _loc9_.y = _loc4_.height - _loc9_.textHeight - 7;
               _loc9_.width = _loc4_.width - 7;
               _loc9_.autoSize = TextFieldAutoSize.NONE;
               _loc9_.align = TextFormatAlign.RIGHT;
               _loc9_.x = 0;
               _loc10_.addChild(_loc9_);
            }
         }
         return _loc10_;
      }
      
      private function addLockItem(param1:Object, param2:Sprite) : void
      {
         if(param1.rank > 0)
         {
            param2.addChild(this.createRankIcon(param1));
         }
         else
         {
            param2.addChild(this.createPremiumIcon());
         }
      }
      
      private function createRankIcon(param1:Object) : RankIcon
      {
         var _loc2_:RankIcon = new BigRankIcon();
         if(param1.showLockPremium)
         {
            _loc2_.setPremium(param1.rank);
            _loc2_.x = PREMIUM_ITEM_LOCK_X;
            _loc2_.y = PREMIUM_ITEM_LOCK_Y;
         }
         else
         {
            _loc2_.setDefaultAccount(param1.rank);
            _loc2_.x = 135;
            _loc2_.y = 65;
         }
         return _loc2_;
      }
      
      private function createPremiumIcon() : Bitmap
      {
         var _loc1_:Bitmap = PremiumItemLock.createInstance();
         _loc1_.x = PREMIUM_ITEM_LOCK_X;
         _loc1_.y = PREMIUM_ITEM_LOCK_Y;
         return _loc1_;
      }
      
      public function indexById(param1:IGameObject) : int
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.dp.length)
         {
            _loc2_ = this.dp.getItemAt(_loc3_);
            if(_loc2_.dat.id == param1)
            {
               return _loc3_;
            }
            _loc3_++;
         }
         return -1;
      }
      
      public function updateCost(param1:IGameObject, param2:int) : void
      {
         this.update(param1,"crystalPrice",param2);
      }
      
      public function updateShowLockPremium(param1:IGameObject, param2:Boolean) : void
      {
         this.update(param1,"showLockPremium",param2);
      }
      
      public function removeDiscountItem(param1:IGameObject) : void
      {
         this.update(param1,"saleImage",null);
      }
      
      public function getItemAt(param1:int) : IGameObject
      {
         return this.dp.getItemAt(param1).dat.id;
      }
      
      public function itemsCount() : int
      {
         return this.dp.length;
      }
      
      private function scrollList(param1:MouseEvent) : void
      {
         this.scrollSpeed = 0;
         this.list.horizontalScrollPosition -= param1.delta * (Boolean(Capabilities.os.search("Linux") != -1) ? 50 : 10);
      }
      
      public function onResourceLoadingComplete(param1:Resource) : void
      {
         this.updatePreview(param1 as ImageResource);
      }
      
      private function addListners(param1:Event) : void
      {
         this.list.horizontalScrollBar.addEventListener(Event.ENTER_FRAME,this.updateScrollOnEnterFrame);
         this.list.addEventListener(ListEvent.ITEM_CLICK,this.selectItem);
         addEventListener(MouseEvent.MOUSE_WHEEL,this.scrollList);
         addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
      }
      
      private function removeListners(param1:Event) : void
      {
         this.list.horizontalScrollBar.removeEventListener(Event.ENTER_FRAME,this.updateScrollOnEnterFrame);
         this.list.removeEventListener(ListEvent.ITEM_CLICK,this.selectItem);
         removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         removeEventListener(MouseEvent.MOUSE_WHEEL,this.scrollList);
         removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
      }
      
      public function onResourceLoadingError(param1:Resource, param2:String) : void
      {
      }
      
      public function onResourceLoadingFatalError(param1:Resource, param2:String) : void
      {
      }
      
      public function onResourceLoadingProgress(param1:Resource, param2:int) : void
      {
      }
      
      public function onResourceLoadingStart(param1:Resource) : void
      {
      }
      
      public function onCompleteBefore(param1:CountDownTimer, param2:Boolean) : void
      {
         var _loc3_:Object = null;
         var _loc4_:int = 0;
         while(_loc4_ < this.dp.length)
         {
            _loc3_ = this.dp.getItemAt(_loc4_).dat;
            if(_loc3_.timer == param1)
            {
               this.updateByIndex(_loc4_,"timer",null,false);
            }
            _loc4_++;
         }
      }
      
      public function destroy() : void
      {
         disposeBitmapsData(this.bitmapsData);
         this.bitmapsData = null;
         removeDisplayObject(this.list);
         this.removePreviewLazyListeners();
         this.removeAllElements();
         this.list.removeAll();
         this.list = null;
         this.dp = null;
      }
      
      private function removeAllElements() : void
      {
         var _loc1_:Object = null;
         var _loc2_:CountDownTimer = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.dp.length)
         {
            _loc1_ = this.dp.getItemAt(_loc3_).dat;
            if(_loc1_.timer != null)
            {
               _loc2_ = _loc1_.timer;
               _loc2_.removeListener(CountDownTimerOnCompleteBefore,this);
            }
            _loc3_++;
         }
         this.dp.removeAll();
      }
      
      private function removePreviewLazyListeners() : void
      {
         var _loc1_:Object = null;
         var _loc2_:ImageResource = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.dp.length)
         {
            _loc1_ = this.dp.getItemAt(_loc3_);
            _loc2_ = _loc1_.dat.preview as ImageResource;
            _loc2_.removeLazyListener(this);
            _loc3_++;
         }
      }
   }
}

