package alternativa.tanks.gui.garagelist
{
   import Renamed249.Renamed1927;
   import alternativa.tanks.gui.Renamed1691;
   import alternativa.tanks.gui.category.CategoryButtonsList;
   import alternativa.tanks.gui.category.CategoryButtonsListEvent;
   import alternativa.tanks.model.item.kit.GarageKit;
   import alternativa.tanks.model.item.present.PresentItem;
   import alternativa.tanks.service.garage.GarageService;
   import alternativa.tanks.service.item.ItemService;
   import alternativa.tanks.service.notificationcategories.INotificationGarageCategoriesService;
   import alternativa.tanks.service.notificationcategories.NotificationGarageCategoriesEvent;
   import alternativa.utils.removeDisplayObject;
   import controls.timer.CountDownTimer;
   import flash.events.Event;
   import flash.utils.clearTimeout;
   import flash.utils.getTimer;
   import flash.utils.setTimeout;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.commons.types.ItemCategoryEnum;
   import projects.tanks.client.commons.types.ItemViewCategoryEnum;
   import projects.tanks.client.garage.models.item.kit.KitItem;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.premium.PremiumService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.UserPropertiesServiceEvent;
   
   public class GarageListController
   {
      [Inject]
      public static var itemService:ItemService;
      
      [Inject]
      public static var premiumService:PremiumService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      [Inject]
      public static var storageService:IStorageService;
      
      [Inject]
      public static var notificationGarageCategoriesService:INotificationGarageCategoriesService;
      
      [Inject]
      public static var garageService:GarageService;
      
      private static const DEFAULT_CATEGORY_TO_SHOW:ItemViewCategoryEnum = ItemViewCategoryEnum.WEAPON;
      
      private static const LAST_SHOWED_GARAGE_CATEGORY_SHARED_KEY:String = "LAST_SHOWED_GARAGE_CATEGORY";
      
      private static const UPDATE_VISIBILITY_DISCOUNT_INDICATORS_DELAY:int = 1000;
      
      private var _garageList:GarageList;
      
      private var _categoryButtons:CategoryButtonsList;
      
      private var _itemsInDepot:Vector.<IGameObject>;
      
      private var _itemsInStore:Vector.<IGameObject>;
      
      private var _itemsInStoreFromServer:Vector.<IGameObject>;
      
      private var _currentShowingCategory:ItemViewCategoryEnum;
      
      private var Renamed1928:Renamed1927;
      
      private var _updateVisibilityDiscountIndicatorsTimeoutId:uint;
      
      public function GarageListController(param1:GarageList, param2:CategoryButtonsList)
      {
         super();
         this._garageList = param1;
         this._categoryButtons = param2;
         this.init();
      }
      
      private function init() : void
      {
         this._itemsInDepot = new Vector.<IGameObject>();
         this._itemsInStore = new Vector.<IGameObject>();
         userPropertiesService.addEventListener(UserPropertiesServiceEvent.UPDATE_RANK,this.onRankChange);
         notificationGarageCategoriesService.addEventListener(NotificationGarageCategoriesEvent.NOTIFICATION_CHANGE,this.onChangeNotificationGarageCategory);
         this._categoryButtons.addEventListener(CategoryButtonsListEvent.CATEGORY_SELECTED,this.onCategoryButtonsSelected);
         premiumService.addEventListener(Event.CHANGE,this.onSelfPremiumChanged);
         this.updateVisibilityNotificationIconOnCategories();
      }
      
      private function onRankChange(param1:UserPropertiesServiceEvent) : void
      {
         this.updateStore();
         this.showCategory(this._currentShowingCategory);
      }
      
      private function onCategoryButtonsSelected(param1:CategoryButtonsListEvent) : void
      {
         if(this._currentShowingCategory != param1.getCategory())
         {
            this.showCategory(param1.getCategory());
         }
      }
      
      private function onSelfPremiumChanged(param1:Event) : void
      {
         var _loc2_:IGameObject = null;
         var _loc3_:int = this._garageList.itemsCount() - 1;
         while(_loc3_ >= 0)
         {
            _loc2_ = this._garageList.getItemAt(_loc3_);
            if(itemService.Renamed1768(_loc2_) && this.isItemInStore(_loc2_))
            {
               this._garageList.updateShowLockPremium(_loc2_,!premiumService.hasPremium());
            }
            _loc3_--;
         }
         this._garageList.sort();
         this.selectAndScrollToItemInCategory(this._garageList.selectedItem);
      }
      
      private function onChangeNotificationGarageCategory(param1:NotificationGarageCategoriesEvent) : void
      {
         this.updateVisibilityNotificationIconOnCategories();
      }
      
      private function updateVisibilityNotificationIconOnCategories() : void
      {
         var _loc1_:ItemViewCategoryEnum = null;
         var _loc2_:Vector.<ItemViewCategoryEnum> = ItemViewCategoryEnum.values;
         var _loc3_:int = int(_loc2_.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc1_ = _loc2_[_loc4_];
            if(notificationGarageCategoriesService.Renamed1929(_loc1_))
            {
               if(this._currentShowingCategory == _loc1_)
               {
                  notificationGarageCategoriesService.Renamed1930(_loc1_);
               }
               else
               {
                  this._categoryButtons.hideDiscountIndicator(_loc1_);
                  this._categoryButtons.showNewItemIndicator(_loc1_);
               }
            }
            _loc4_++;
         }
      }
      
      public function initDepot(param1:Vector.<IGameObject>) : void
      {
         this._itemsInDepot = param1;
         this.addItemToItemService(param1);
         this.excludeInventoryFromDepot();
      }
      
      private function addItemToItemService(param1:Vector.<IGameObject>) : void
      {
         var _loc2_:int = int(param1.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            itemService.addItem(param1[_loc3_]);
            _loc3_++;
         }
      }
      
      private function excludeInventoryFromDepot() : void
      {
         var _loc1_:IGameObject = null;
         var _loc2_:Vector.<IGameObject> = new Vector.<IGameObject>();
         var _loc3_:int = int(this._itemsInDepot.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc1_ = this._itemsInDepot[_loc4_];
            if(itemService.getCategory(_loc1_) != ItemCategoryEnum.INVENTORY)
            {
               _loc2_.push(_loc1_);
            }
            else
            {
               this._itemsInStore.push(_loc1_);
            }
            _loc4_++;
         }
         this._itemsInDepot = _loc2_;
      }
      
      private function excludeRepeatingModificationFromDepot() : void
      {
         var _loc1_:IGameObject = null;
         var _loc2_:Vector.<IGameObject> = new Vector.<IGameObject>();
         var _loc3_:int = int(this._itemsInDepot.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc1_ = this._itemsInDepot[_loc4_];
            if(itemService.Renamed1704(_loc1_))
            {
               if(_loc1_ == itemService.Renamed1931(_loc1_))
               {
                  _loc2_.push(_loc1_);
               }
            }
            else
            {
               _loc2_.push(_loc1_);
            }
            _loc4_++;
         }
         this._itemsInDepot = _loc2_;
      }
      
      public function initStore(param1:Vector.<IGameObject>) : void
      {
         this._itemsInStoreFromServer = param1;
         this.updateStore();
      }
      
      private function updateStore() : void
      {
         this.addBuyableItemToStore();
         this.excludeNotBuyableModificationItemFromStore();
         this.updateKitsFromStore();
      }
      
      private function updateKitsFromStore() : void
      {
         var _loc1_:IGameObject = null;
         var _loc2_:Vector.<KitItem> = null;
         var _loc3_:KitItem = null;
         this.Renamed1928 = new Renamed1927();
         var _loc4_:int = int(this._itemsInStore.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc1_ = this._itemsInStore[_loc5_];
            if(itemService.Renamed1700(_loc1_))
            {
               _loc2_ = GarageKit(_loc1_.adapt(GarageKit)).getItems();
               for each(_loc3_ in _loc2_)
               {
                  this.Renamed1928.put(_loc3_.item,_loc1_);
               }
            }
            _loc5_++;
         }
      }
      
      public function updateKitsContainsItem(param1:IGameObject) : void
      {
         var _loc2_:IGameObject = null;
         if(this.Renamed1928 == null)
         {
            return;
         }
         var _loc3_:Vector.<IGameObject> = this.Renamed1928.getValues(param1);
         var _loc4_:int = int(_loc3_.length - 1);
         while(_loc4_ >= 0)
         {
            _loc2_ = _loc3_[_loc4_];
            if(!itemService.canBuy(_loc2_))
            {
               this.removeSingleItemFromStore(_loc2_);
            }
            else
            {
               this._garageList.updateCost(_loc2_,itemService.getPrice(_loc2_));
            }
            _loc4_--;
         }
      }
      
      private function addBuyableItemToStore() : void
      {
         var _loc1_:IGameObject = null;
         var _loc2_:int = int(this._itemsInStoreFromServer.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = this._itemsInStoreFromServer[_loc3_];
            if(itemService.canBuy(_loc1_) && this.availableInPartner(_loc1_))
            {
               this._itemsInStore.push(_loc1_);
            }
            _loc3_++;
         }
      }
      
      private function availableInPartner(param1:IGameObject) : Boolean
      {
         return true;
      }
      
      private function excludeNotBuyableModificationItemFromStore() : void
      {
         var _loc1_:IGameObject = null;
         var _loc2_:IGameObject = null;
         var _loc3_:IGameObject = null;
         var _loc4_:Vector.<IGameObject> = new Vector.<IGameObject>();
         var _loc5_:int = int(this._itemsInStore.length);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc1_ = this._itemsInStore[_loc6_];
            if(itemService.Renamed1704(_loc1_))
            {
               if(itemService.Renamed1768(_loc1_))
               {
                  _loc4_.push(_loc1_);
               }
               else
               {
                  _loc2_ = itemService.Renamed1931(_loc1_);
                  if(_loc2_ == null && itemService.getModificationIndex(_loc1_) == 0)
                  {
                     _loc4_.push(_loc1_);
                  }
               }
            }
            else
            {
               _loc4_.push(_loc1_);
            }
            _loc6_++;
         }
         this._itemsInStore = _loc4_;
      }
      
      public function showCategory(param1:ItemViewCategoryEnum, param2:IGameObject = null) : void
      {
         var _loc3_:ItemViewCategoryEnum = null;
         var _loc4_:IGameObject = null;
         var _loc5_:IGameObject = null;
         var _loc6_:int = 0;
         if(!this._categoryButtons.getCategoryButtonVisibility(param1))
         {
            _loc3_ = this._categoryButtons.findVisibleCategory();
            this.showCategory(_loc3_);
            return;
         }
         this._currentShowingCategory = param1;
         this._categoryButtons.select(param1);
         var _loc7_:Vector.<IGameObject> = this.getItemsByCategory(this._itemsInDepot,param1);
         var _loc8_:Vector.<IGameObject> = this.getItemsByCategory(this._itemsInStore,param1);
         this._garageList.clearList();
         var _loc9_:int = int(_loc7_.length);
         var _loc10_:int = 0;
         while(_loc10_ < _loc9_)
         {
            this._garageList.addItem(this.createData(_loc7_[_loc10_],true));
            _loc10_++;
         }
         _loc9_ = int(_loc8_.length);
         _loc10_ = 0;
         while(_loc10_ < _loc9_)
         {
            this._garageList.addItem(this.createData(_loc8_[_loc10_],false));
            _loc10_++;
         }
         this._garageList.sort();
         storageService.getStorage().data[LAST_SHOWED_GARAGE_CATEGORY_SHARED_KEY] = param1.value;
         if(this._garageList.itemsCount() > 0)
         {
            _loc4_ = this._garageList.getItemAt(0);
            if(param2 == null)
            {
               _loc5_ = this.getMountedItemInCategory(_loc7_);
               if(_loc5_ == null)
               {
                  this.selectAndScrollToItemInCategory(_loc4_);
               }
               else
               {
                  this._garageList.scrollTo(_loc4_);
                  this._garageList.select(_loc5_);
               }
            }
            else
            {
               _loc6_ = this._garageList.indexById(param2);
               if(_loc6_ == -1)
               {
                  this.selectAndScrollToItemInCategory(_loc4_);
               }
               else
               {
                  this.selectAndScrollToItemInCategory(param2);
               }
            }
         }
         this.resetNotificationCategory(param1);
         this.updateVisibilityDiscountIndicators();
      }
      
      private function getMountedItemInCategory(param1:Vector.<IGameObject>) : IGameObject
      {
         var _loc2_:IGameObject = null;
         var _loc3_:IGameObject = null;
         var _loc4_:int = int(param1.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = param1[_loc5_];
            if(itemService.Renamed1774(_loc3_))
            {
               _loc2_ = _loc3_;
               break;
            }
            _loc5_++;
         }
         return _loc2_;
      }
      
      private function resetNotificationCategory(param1:ItemViewCategoryEnum) : void
      {
         this._categoryButtons.hideNewItemIndicator(param1);
         notificationGarageCategoriesService.Renamed1930(param1);
      }
      
      private function selectAndScrollToItemInCategory(param1:IGameObject) : void
      {
         this._garageList.unselect();
         this._garageList.select(param1);
         this._garageList.scrollTo(param1);
      }
      
      private function createData(param1:IGameObject, param2:Boolean) : GarageListRendererData
      {
         var _loc3_:GarageListRendererData = new GarageListRendererData();
         _loc3_.id = param1;
         _loc3_.name = itemService.getName(param1);
         _loc3_.type = itemService.getCategory(param1);
         _loc3_.mod = itemService.getModificationIndex(param1);
         _loc3_.crystalPrice = itemService.getPrice(param1);
         if(param2)
         {
            _loc3_.rank = -1;
            _loc3_.showLockPremium = false;
            _loc3_.discount = this.getDiscountForDepotItem(param1);
         }
         else
         {
            _loc3_.rank = this.determineShowingRankIndex(param1);
            _loc3_.showLockPremium = itemService.Renamed1768(param1) && !premiumService.hasPremium();
            _loc3_.discount = itemService.getDiscount(param1);
         }
         _loc3_.installed = itemService.Renamed1774(param1);
         _loc3_.garageElement = param2;
         _loc3_.count = itemService.getCount(param1);
         _loc3_.preview = itemService.getPreviewResource(param1);
         _loc3_.sort = itemService.getPosition(param1);
         _loc3_.timerDiscount = this.getEndDiscountTimer(param1,param2);
         if(itemService.Renamed1760(param1))
         {
            _loc3_.appearanceTime = PresentItem(param1.adapt(PresentItem)).getDate().time;
         }
         return _loc3_;
      }
      
      private function getDiscountForDepotItem(param1:IGameObject) : int
      {
         var _loc2_:IGameObject = null;
         var _loc3_:int = 0;
         if(itemService.isCountable(param1))
         {
            _loc3_ = itemService.getDiscount(param1);
         }
         else if(itemService.Renamed1704(param1) && itemService.hasNextModification(param1))
         {
            _loc2_ = itemService.Renamed1932(param1);
            _loc3_ = itemService.getDiscount(_loc2_);
         }
         return _loc3_;
      }
      
      private function determineShowingRankIndex(param1:IGameObject) : int
      {
         var _loc2_:int = itemService.Renamed1764(param1);
         var _loc3_:int = itemService.Renamed1763(param1);
         var _loc4_:int = userPropertiesService.rank;
         if(_loc4_ < _loc2_)
         {
            return _loc2_;
         }
         if(_loc4_ > _loc3_)
         {
            return _loc3_;
         }
         return 0;
      }
      
      private function getEndDiscountTimer(param1:IGameObject, param2:Boolean) : CountDownTimer
      {
         if(itemService.Renamed1700(param1))
         {
            return this.getEndDiscountTimerForKit(param1);
         }
         var _loc3_:IGameObject = param1;
         if(itemService.Renamed1704(param1) && param2)
         {
            if(!itemService.hasNextModification(param1))
            {
               return null;
            }
            _loc3_ = itemService.Renamed1932(param1);
         }
         return itemService.getEndDiscountTimer(_loc3_);
      }
      
      private function getEndDiscountTimerForKit(param1:IGameObject) : CountDownTimer
      {
         var _loc2_:CountDownTimer = null;
         var _loc3_:Renamed1691 = null;
         var _loc4_:Vector.<Renamed1691> = garageService.Renamed1933().Renamed1707();
         var _loc5_:int = int(_loc4_.length);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc3_ = _loc4_[_loc6_];
            if(_loc3_.item == param1)
            {
               _loc2_ = _loc3_.timer;
               break;
            }
            _loc6_++;
         }
         return _loc2_;
      }
      
      public function getItemsByCategory(param1:Vector.<IGameObject>, param2:ItemViewCategoryEnum) : Vector.<IGameObject>
      {
         var _loc3_:IGameObject = null;
         var _loc4_:Vector.<IGameObject> = new Vector.<IGameObject>();
         var _loc5_:int = int(param1.length);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc3_ = param1[_loc6_];
            if(itemService.Renamed1934(_loc3_) == param2)
            {
               _loc4_.push(_loc3_);
            }
            _loc6_++;
         }
         return _loc4_;
      }
      
      public function destroy() : void
      {
         userPropertiesService.removeEventListener(UserPropertiesServiceEvent.UPDATE_RANK,this.onRankChange);
         notificationGarageCategoriesService.removeEventListener(NotificationGarageCategoriesEvent.NOTIFICATION_CHANGE,this.onChangeNotificationGarageCategory);
         this._categoryButtons.removeEventListener(CategoryButtonsListEvent.CATEGORY_SELECTED,this.onCategoryButtonsSelected);
         premiumService.removeEventListener(Event.CHANGE,this.onSelfPremiumChanged);
         clearTimeout(this._updateVisibilityDiscountIndicatorsTimeoutId);
         removeDisplayObject(this._garageList);
         removeDisplayObject(this._categoryButtons);
         this._garageList.destroy();
         this._categoryButtons.destroy();
         this._garageList = null;
         this._categoryButtons = null;
         this._itemsInDepot = null;
         this._itemsInStore = null;
      }
      
      public function isItemInDepot(param1:IGameObject) : Boolean
      {
         if(this._itemsInDepot == null)
         {
            return false;
         }
         return this._itemsInDepot.indexOf(param1) != -1;
      }
      
      public function isItemInStore(param1:IGameObject) : Boolean
      {
         if(this._itemsInStore == null)
         {
            return false;
         }
         return this._itemsInStore.indexOf(param1) != -1;
      }
      
      public function addItemToDepot(param1:IGameObject) : void
      {
         if(this.isItemInDepot(param1))
         {
            return;
         }
         itemService.addItem(param1);
         this._itemsInDepot.push(param1);
         this.updateVisibilityDiscountIndicatorsWithDelay();
         if(this._currentShowingCategory == itemService.Renamed1934(param1))
         {
            this._garageList.addItem(this.createData(param1,true));
            this._garageList.sort();
            this.selectAndScrollToItemInCategory(param1);
         }
      }
      
      public function removeItemFromDepot(param1:IGameObject) : void
      {
         var _loc2_:int = int(this._itemsInDepot.indexOf(param1));
         if(_loc2_ != -1)
         {
            itemService.removeItem(param1);
            this._itemsInDepot.splice(_loc2_,1);
         }
         if(this._garageList.indexById(param1) != -1)
         {
            this._garageList.deleteItem(param1);
         }
         this.updateSelection();
      }
      
      public function addItemToStore(param1:IGameObject) : void
      {
         if(this.isItemInStore(param1) || !itemService.canBuy(param1))
         {
            return;
         }
         this._itemsInStore.push(param1);
         if(this._currentShowingCategory == itemService.Renamed1934(param1))
         {
            this._garageList.addItem(this.createData(param1,false));
            this._garageList.sort();
            this.selectAndScrollToItemInCategory(param1);
         }
      }
      
      public function removeSingleItemFromStore(param1:IGameObject) : void
      {
         var _loc2_:Vector.<KitItem> = null;
         var _loc3_:KitItem = null;
         var _loc4_:int = int(this._itemsInStore.indexOf(param1));
         if(_loc4_ != -1)
         {
            this._itemsInStore.splice(_loc4_,1);
         }
         if(this._garageList.indexById(param1) != -1)
         {
            this._garageList.deleteItem(param1);
         }
         if(itemService.Renamed1700(param1))
         {
            _loc2_ = GarageKit(param1.adapt(GarageKit)).getItems();
            for each(_loc3_ in _loc2_)
            {
               this.Renamed1928.remove(_loc3_.item,param1);
            }
         }
      }
      
      public function removeItemFromStore(param1:IGameObject) : void
      {
         if(itemService.isGrouped(param1))
         {
            this.removeGroupedItemsFromStore(param1);
         }
         else
         {
            this.removeSingleItemFromStore(param1);
         }
         this.updateSelection();
      }
      
      private function removeGroupedItemsFromStore(param1:IGameObject) : void
      {
         var _loc2_:IGameObject = null;
         var _loc3_:int = int(this._itemsInStore.length - 1);
         while(_loc3_ >= 0)
         {
            _loc2_ = this._itemsInStore[_loc3_];
            if(itemService.isGrouped(_loc2_))
            {
               this.removeSingleItemFromStore(_loc2_);
            }
            _loc3_--;
         }
      }
      
      public function get itemsInDepot() : Vector.<IGameObject>
      {
         return this._itemsInDepot;
      }
      
      public function showDefaultCategory() : void
      {
         this.showCategory(this.getCategoryFromShared());
      }
      
      private function getCategoryFromShared() : ItemViewCategoryEnum
      {
         var _loc1_:int = 0;
         if(storageService.getStorage().data.hasOwnProperty(LAST_SHOWED_GARAGE_CATEGORY_SHARED_KEY))
         {
            _loc1_ = int(storageService.getStorage().data[LAST_SHOWED_GARAGE_CATEGORY_SHARED_KEY]);
            if(_loc1_ < 0 || _loc1_ >= ItemViewCategoryEnum.values.length)
            {
               return DEFAULT_CATEGORY_TO_SHOW;
            }
            return ItemViewCategoryEnum.values[_loc1_];
         }
         return DEFAULT_CATEGORY_TO_SHOW;
      }
      
      public function showItemInCategory(param1:IGameObject) : void
      {
         var _loc2_:IGameObject = null;
         var _loc3_:IGameObject = param1;
         if(itemService.Renamed1704(param1))
         {
            _loc2_ = itemService.Renamed1931(param1);
            if(_loc2_ != null)
            {
               _loc3_ = _loc2_;
            }
            else
            {
               _loc3_ = itemService.Renamed1935(param1);
            }
         }
         this.showCategory(itemService.Renamed1934(_loc3_),_loc3_);
      }
      
      public function updateSelection() : void
      {
         if(this._garageList.selectedItem == null && this._garageList.itemsCount() > 0)
         {
            this.selectAndScrollToItemInCategory(this._garageList.getItemAt(0));
         }
      }
      
      public function updateDiscount(param1:IGameObject) : void
      {
         var _loc2_:IGameObject = null;
         this.updateKitsContainsItem(param1);
         this.updateVisibilityDiscountIndicatorsWithDelay();
         if(this.isItemInStore(param1))
         {
            this._garageList.updateDiscountAndCost(param1,itemService.getDiscount(param1),itemService.getEndDiscountTimer(param1),itemService.getPrice(param1));
            return;
         }
         if(itemService.Renamed1704(param1))
         {
            _loc2_ = itemService.Renamed1931(param1);
            if(_loc2_ != null && itemService.Renamed1932(_loc2_) == param1)
            {
               this._garageList.updateDiscountWithTimer(_loc2_,itemService.getDiscount(param1),itemService.getEndDiscountTimer(param1));
            }
            return;
         }
         if(itemService.isCountable(param1))
         {
            this._garageList.updateDiscountAndCost(param1,itemService.getDiscount(param1),itemService.getEndDiscountTimer(param1),itemService.getPrice(param1));
         }
      }
      
      private function updateVisibilityDiscountIndicatorsWithDelay() : void
      {
         clearTimeout(this._updateVisibilityDiscountIndicatorsTimeoutId);
         this._updateVisibilityDiscountIndicatorsTimeoutId = setTimeout(this.updateVisibilityDiscountIndicators,UPDATE_VISIBILITY_DISCOUNT_INDICATORS_DELAY);
      }
      
      private function updateVisibilityDiscountIndicators() : void
      {
         var _loc1_:ItemViewCategoryEnum = null;
         var _loc2_:Boolean = false;
         var _loc3_:Vector.<ItemViewCategoryEnum> = ItemViewCategoryEnum.values;
         var _loc4_:int = int(_loc3_.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc1_ = _loc3_[_loc5_];
            _loc2_ = false;
            if(_loc1_ != ItemViewCategoryEnum.KIT && !notificationGarageCategoriesService.Renamed1929(_loc1_))
            {
               if(this.hasAvailableTemporaryDiscounts(_loc1_))
               {
                  _loc2_ = true;
               }
            }
            if(_loc2_)
            {
               this._categoryButtons.showDiscountIndicator(_loc1_);
            }
            else
            {
               this._categoryButtons.hideDiscountIndicator(_loc1_);
            }
            _loc5_++;
         }
      }
      
      private function hasAvailableTemporaryDiscounts(param1:ItemViewCategoryEnum) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:IGameObject = null;
         var _loc5_:IGameObject = null;
         var _loc6_:Vector.<IGameObject> = this.getItemsByCategory(this._itemsInDepot,param1);
         _loc3_ = int(_loc6_.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = _loc6_[_loc2_];
            if(this.isAvailableTemporaryDiscount(_loc4_,true))
            {
               return true;
            }
            _loc2_++;
         }
         var _loc7_:Vector.<IGameObject> = this.getItemsByCategory(this._itemsInStore,param1);
         _loc3_ = int(_loc7_.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc5_ = _loc7_[_loc2_];
            if(this.isAvailableTemporaryDiscount(_loc5_,false))
            {
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      private function isAvailableTemporaryDiscount(param1:IGameObject, param2:Boolean) : Boolean
      {
         var _loc3_:* = false;
         var _loc4_:CountDownTimer = null;
         if(param2)
         {
            if(this.getDiscountForDepotItem(param1) > 0)
            {
               _loc4_ = this.getEndDiscountTimer(param1,param2);
            }
         }
         else if(userPropertiesService.rank >= itemService.Renamed1764(param1))
         {
            _loc4_ = itemService.getEndDiscountTimer(param1);
         }
         if(_loc4_ != null)
         {
            _loc3_ = _loc4_.getEndTime() > getTimer();
         }
         return _loc3_;
      }
      
      public function getCurrentCategoryItemsCount() : int
      {
         return this._garageList.itemsCount();
      }
   }
}

