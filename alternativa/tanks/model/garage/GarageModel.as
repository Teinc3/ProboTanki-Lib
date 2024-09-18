package alternativa.tanks.model.garage
{
   import §;"-§.§[Z§;
   import §;"-§.§finally for implements§;
   import alternativa.engine3d.materials.TextureResourcesRegistry;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.osgi.service.command.CommandService;
   import alternativa.osgi.service.command.FormattedOutput;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.dump.IDumpService;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.blur.IBlurService;
   import alternativa.tanks.gui.§1#^§;
   import alternativa.tanks.gui.ConfirmAlert;
   import alternativa.tanks.gui.GarageWindow;
   import alternativa.tanks.gui.GarageWindowEvent;
   import alternativa.tanks.help.FirstMoneyHelper;
   import alternativa.tanks.help.IHelpService;
   import alternativa.tanks.loader.ILoaderWindowService;
   import alternativa.tanks.model.item.ItemDumper;
   import alternativa.tanks.model.item.category.IItemCategory;
   import alternativa.tanks.model.item.category.IItemViewCategory;
   import alternativa.tanks.model.item.item.IItem;
   import alternativa.tanks.model.item.kit.GarageKit;
   import alternativa.tanks.model.item.temporary.ITemporaryItem;
   import alternativa.tanks.model.item.upgradable.UpgradableItem;
   import alternativa.tanks.service.achievement.IAchievementService;
   import alternativa.tanks.service.delaymountcategory.IDelayMountCategoryService;
   import alternativa.tanks.service.garage.GarageService;
   import alternativa.tanks.service.item.ItemService;
   import alternativa.tanks.service.item3d.ITank3DViewer;
   import alternativa.tanks.service.money.IMoneyService;
   import alternativa.tanks.service.temporaryitem.ITemporaryItemService;
   import alternativa.tanks.service.temporaryitemnotify.§3M§;
   import alternativa.tanks.service.temporaryitemnotify.ITemporaryItemNotifyService;
   import alternativa.tanks.tracker.ITrackerService;
   import controls.timer.CountDownTimer;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.display.StageQuality;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import §get const function§.§'-§;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.client.fp10.core.resource.IResourceLoadingListener;
   import platform.client.fp10.core.resource.Resource;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.commons.types.ItemCategoryEnum;
   import projects.tanks.client.commons.types.ItemViewCategoryEnum;
   import projects.tanks.client.garage.models.garage.GarageModelBase;
   import projects.tanks.client.garage.models.garage.IGarageModelBase;
   import projects.tanks.client.garage.models.item.kit.KitItem;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.UserPropertiesServiceEvent;
   import services.alertservice.Alert;
   import services.alertservice.§get const use§;
   
   public class GarageModel extends GarageModelBase implements IGarageModelBase, ObjectLoadListener, ObjectUnloadListener, IResourceLoadingListener, §3M§, §null package override§
   {
      [Inject]
      public static var trackerService:ITrackerService;
      
      [Inject]
      public static var dumpService:IDumpService;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var modelRegistry:ModelRegistry;
      
      [Inject]
      public static var helpService:IHelpService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      [Inject]
      public static var clientLog:IClientLog;
      
      [Inject]
      public static var itemService:ItemService;
      
      [Inject]
      public static var blurService:IBlurService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var temporaryItemService:ITemporaryItemService;
      
      [Inject]
      public static var temporaryItemNotifyService:ITemporaryItemNotifyService;
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      [Inject]
      public static var tank3DViewer:ITank3DViewer;
      
      [Inject]
      public static var achievementService:IAchievementService;
      
      [Inject]
      public static var moneyService:IMoneyService;
      
      [Inject]
      public static var loaderWindowService:ILoaderWindowService;
      
      [Inject]
      public static var garageService:GarageService;
      
      [Inject]
      public static var commandService:CommandService;
      
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      [Inject]
      public static var §super set dynamic§:IDelayMountCategoryService;
      
      private static const GA_CATEGORY:String = "garage";
      
      private const HELPER_STORE:int = 2;
      
      private const HELPER_WAREHOUSE:int = 3;
      
      private const HELPER_MONEY_FIRST:int = 700;
      
      private const HELPER_GROUP_KEY:String = "GarageModel";
      
      private var itemDumper:ItemDumper;
      
      private var garageWindow:GarageWindow;
      
      private var warehouseSelectedItem:IGameObject;
      
      private var itemWaitingForConfirmation:IGameObject;
      
      private var confirmAlert:ConfirmAlert;
      
      private var selectedItem:IGameObject;
      
      private var items:Vector.<IGameObject>;
      
      private var firstMoneyHelper:FirstMoneyHelper;
      
      public function GarageModel()
      {
         super();
      }
      
      private function onUpdateRank(param1:UserPropertiesServiceEvent) : void
      {
         var _loc2_:IGameObject = null;
         var _loc3_:Vector.<IGameObject> = this.garageWindow.itemsInStore.slice();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc2_ = _loc3_[_loc4_];
            this.garageWindow.removeItemFromStore(_loc2_);
            this.garageWindow.addItemToMarket(_loc2_);
            _loc4_++;
         }
         var _loc5_:IGameObject = this.garageWindow.selectedItem;
         this.garageWindow.selectItemInStore(_loc5_);
         this.garageWindow.scrollToItemInStore(_loc5_);
         this.garageWindow.updateStore();
      }
      
      public function objectLoaded() : void
      {
         this.garageWindow = new GarageWindow(getInitParam().garageBox,false);
         garageService.§8c§(this.garageWindow);
      }
      
      public function objectUnloaded() : void
      {
         if(this.garageWindow != null)
         {
            this.unregisterDumpers();
            temporaryItemNotifyService.removeListener(this);
            this.destroyGarageWindow();
            this.unregisterHelpers();
         }
         this.items = null;
         itemService.reset();
         if(!battleInfoService.isInBattle())
         {
            TextureResourcesRegistry.releaseTextureResources();
         }
      }
      
      private function registerHelpers() : void
      {
         this.firstMoneyHelper = new FirstMoneyHelper();
         helpService.registerHelper(this.HELPER_GROUP_KEY,this.HELPER_MONEY_FIRST,this.firstMoneyHelper,false);
         display.stage.addEventListener(Event.RESIZE,this.alignHelpers);
         this.alignHelpers();
      }
      
      private function unregisterHelpers() : void
      {
         display.stage.removeEventListener(Event.RESIZE,this.alignHelpers);
         helpService.hideHelp();
         helpService.unregisterHelper(this.HELPER_GROUP_KEY,this.HELPER_MONEY_FIRST);
         this.firstMoneyHelper = null;
      }
      
      public function reloadGarage(param1:String, param2:int) : void
      {
         loaderWindowService.showLoaderWindow();
         CountDownTimer.resetAllTimers();
         itemService.reset();
         moneyService.§class catch§(param2 - moneyService.crystal);
         var _loc3_:Alert = new Alert();
         _loc3_.showAlert(param1,Vector.<String>([§get const use§.OK]));
         display.dialogsLayer.addChild(_loc3_);
         this.destroyGarageWindow();
         this.unregisterDumpers();
      }
      
      private function initGarageWindow() : void
      {
         var _loc1_:DisplayObjectContainer = display.systemLayer;
         display.mainContainer.blendMode = BlendMode.LAYER;
         _loc1_.addChild(this.garageWindow);
         this.alignWindow();
         this.setEvents();
      }
      
      private function setEvents() : void
      {
         display.stage.addEventListener(Event.RESIZE,this.alignWindow);
         userPropertiesService.addEventListener(UserPropertiesServiceEvent.UPDATE_RANK,this.onUpdateRank);
      }
      
      private function removeEvents() : void
      {
         display.stage.removeEventListener(Event.RESIZE,this.alignWindow);
         userPropertiesService.removeEventListener(UserPropertiesServiceEvent.UPDATE_RANK,this.onUpdateRank);
      }
      
      private function destroyGarageWindow() : void
      {
         this.removeEvents();
         var _loc1_:DisplayObjectContainer = display.systemLayer;
         if(_loc1_.contains(this.garageWindow))
         {
            display.mainContainer.blendMode = BlendMode.NORMAL;
            this.garageWindow.destroy();
            _loc1_.removeChild(this.garageWindow);
         }
         tank3DViewer.resetView();
         garageService.§<#h§();
         this.garageWindow = null;
      }
      
      private function alignWindow(param1:Event = null) : void
      {
         var _loc2_:Stage = display.stage;
         var _loc3_:int = int(Math.max(1000,_loc2_.stageWidth));
         this.garageWindow.x = Math.round(_loc3_ / 3);
         this.garageWindow.y = 60;
         this.garageWindow.resize(Math.round(_loc3_ * 2 / 3),Math.max(display.stage.stageHeight - 60,530));
      }
      
      private function alignHelpers(param1:Event = null) : void
      {
         var _loc2_:int = int(Math.max(1000,display.stage.stageWidth));
         var _loc3_:int = int(Math.max(600,display.stage.stageHeight));
         this.firstMoneyHelper.targetPoint = new Point(_loc2_ - 400,30);
         this.updateAchievementPositions();
      }
      
      public function initMounted(param1:Vector.<IGameObject>) : void
      {
         var _loc2_:IGameObject = null;
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_ = param1[_loc3_];
            itemService.§8#X§(itemService.getCategory(_loc2_));
            this.mountItem(_loc2_);
            _loc3_++;
         }
      }
      
      public function initDepot(param1:Vector.<IGameObject>) : void
      {
         this.checkAllItemsLoaded(param1,"depot");
         this.initGarage();
         this.garageWindow.initDepot(param1);
         this.garageWindow.addEventListener(GarageWindowEvent.WAREHOUSE_ITEM_SELECTED,this.onDepotListSelect);
         this.garageWindow.addEventListener(GarageWindowEvent.SETUP_ITEM,this.onSetupClick);
         this.garageWindow.addEventListener(GarageWindowEvent.UPGRADE_ITEM,this.onUpgradeClick);
      }
      
      private function checkAllItemsLoaded(param1:Vector.<IGameObject>, param2:String) : void
      {
         var _loc3_:IGameObject = null;
         for each(_loc3_ in param1)
         {
            if(_loc3_ == null)
            {
               throw new Error("Not all items have been loaded into the " + param2);
            }
         }
      }
      
      private function initGarage() : void
      {
         this.registerDumpers();
         display.stage.quality = StageQuality.HIGH;
         this.registerHelpers();
         temporaryItemNotifyService.addListener(this);
      }
      
      public function initMarket(param1:Vector.<IGameObject>) : void
      {
         this.checkAllItemsLoaded(param1,"market");
         this.garageWindow.initStore(param1);
         this.garageWindow.addEventListener(GarageWindowEvent.STORE_ITEM_SELECTED,this.onStoreListSelect);
         this.garageWindow.addEventListener(GarageWindowEvent.BUY_ITEM,this.onBuyClick);
         this.garageWindow.addEventListener(GarageWindowEvent.DELETE_PRESENT,getFunctionWrapper(this.§^r§));
         this.initGarageWindow();
      }
      
      private function §^r§(param1:GarageWindowEvent) : void
      {
         §[Z§(object.adapt(§[Z§)).removePresent(param1.item);
      }
      
      public function select(param1:IGameObject) : void
      {
         var _loc2_:IGameObject = null;
         if(itemService.§!"p§(param1))
         {
            _loc2_ = itemService.§case const else§(param1);
            if(_loc2_ != null)
            {
               param1 = _loc2_;
            }
         }
         if(this.garageWindow.isItemInStore(param1))
         {
            this.garageWindow.selectItemInStore(param1);
            this.garageWindow.scrollToItemInStore(param1);
         }
         else
         {
            this.garageWindow.selectItemInWarehouse(param1);
            this.garageWindow.scrollToItemInWarehouse(param1);
         }
      }
      
      public function selectFirstItemInDepot() : void
      {
         this.garageWindow.showDefaultCategory();
      }
      
      private function loadItemPreview(param1:IGameObject) : void
      {
         var _loc2_:ImageResource = IItem(param1.adapt(IItem)).getPreviewResource();
         if(!_loc2_.isLoaded)
         {
            _loc2_.loadLazyResource(this);
         }
      }
      
      private function onDepotListSelect(param1:GarageWindowEvent) : void
      {
         var _loc2_:IGameObject = null;
         var _loc3_:IGameObject = param1.item;
         var _loc4_:ItemCategoryEnum = itemService.getCategory(_loc3_);
         this.warehouseSelectedItem = _loc3_;
         if(_loc4_ == ItemCategoryEnum.WEAPON || _loc4_ == ItemCategoryEnum.ARMOR)
         {
            _loc2_ = itemService.§6#y§(_loc3_);
            if(_loc2_ != null)
            {
               this.loadItemPreview(_loc2_);
            }
         }
         this.garageWindow.showItemInfo(_loc3_,false);
         this.updateAchievementPositions();
         if(this.selectedItem != _loc3_)
         {
            this.selectedItem = _loc3_;
         }
      }
      
      private function onStoreListSelect(param1:GarageWindowEvent) : void
      {
         var _loc2_:IGameObject = param1.item;
         this.garageWindow.showItemInfo(_loc2_,true);
         this.updateAchievementPositions();
         if(this.selectedItem != _loc2_)
         {
            this.selectedItem = _loc2_;
         }
      }
      
      private function onSetupClick(param1:GarageWindowEvent) : void
      {
         this.mountItem(this.warehouseSelectedItem);
         server.itemMounted(this.warehouseSelectedItem);
      }
      
      private function onUpgradeClick(param1:GarageWindowEvent) : void
      {
         this.itemWaitingForConfirmation = param1.item;
      }
      
      private function mountItem(param1:IGameObject) : void
      {
         itemService.mountItem(param1);
      }
      
      public function showConfirmAlert(param1:String, param2:int, param3:BitmapData, param4:Boolean, param5:int, param6:int = -1, param7:Boolean = false) : void
      {
         blurService.blur();
         this.confirmAlert = new ConfirmAlert(param1,param2,param3,param4,param5,param7 ? localeService.getText(TanksLocale.§set for finally§) : (param4 ? localeService.getText(TanksLocale.TEXT_GARAGE_CONFIRM_ALERT_BUY_QEUSTION_TEXT) : localeService.getText(TanksLocale.TEXT_GARAGE_CONFIRM_ALERT_UPGRADE_QEUSTION_TEXT)),param6,param7);
         display.dialogsLayer.addChild(this.confirmAlert);
         this.confirmAlert.confirmButton.addEventListener(MouseEvent.CLICK,this.onBuyAlertConfirm);
         this.confirmAlert.cancelButton.addEventListener(MouseEvent.CLICK,this.hideConfirmAlert);
         this.alignConfirmAlert();
         display.stage.addEventListener(Event.RESIZE,this.alignConfirmAlert);
      }
      
      private function alignConfirmAlert(param1:Event = null) : void
      {
         this.confirmAlert.x = Math.round((display.stage.stageWidth - this.confirmAlert.width) * 0.5);
         this.confirmAlert.y = Math.round((display.stage.stageHeight - this.confirmAlert.height) * 0.5);
      }
      
      private function buyNextModification() : void
      {
         var _loc1_:IGameObject = itemService.§6#y§(this.itemWaitingForConfirmation);
         var _loc2_:IGameObject = itemService.§!#P§(_loc1_);
         var _loc3_:int = itemService.getPrice(_loc1_);
         moneyService.§case package final§(itemService.getPrice(_loc1_));
         server.nextModificationBought(_loc2_,_loc3_);
         this.forceUpgradePreviosModifications(_loc1_);
         this.upgradeItem(_loc2_,_loc1_);
      }
      
      private function onBuyAlertConfirm(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         this.hideConfirmAlert();
         if(itemService.§2"J§(this.itemWaitingForConfirmation))
         {
            this.buyKit();
            if(!itemService.canBuy(this.itemWaitingForConfirmation))
            {
               this.§4j§(this.itemWaitingForConfirmation);
            }
            return;
         }
         if(itemService.§!"p§(this.itemWaitingForConfirmation) && itemService.§null var continue§(this.itemWaitingForConfirmation))
         {
            this.buyNextModification();
         }
         else
         {
            _loc3_ = itemService.getPrice(this.itemWaitingForConfirmation);
            if(itemService.isCountable(this.itemWaitingForConfirmation))
            {
               _loc2_ = this.garageWindow.itemInfoPanel.inventoryNumStepper.value;
               _loc3_ *= _loc2_;
            }
            else
            {
               _loc2_ = 1;
            }
            moneyService.§case package final§(_loc3_);
            if(itemService.§extends const each§(this.itemWaitingForConfirmation))
            {
               §finally for implements§(this.itemWaitingForConfirmation.adapt(§finally for implements§)).confirmPresentPurchase(this.itemWaitingForConfirmation);
               return;
            }
            server.itemBought(this.itemWaitingForConfirmation,_loc2_,_loc3_);
            this.buyItem(this.itemWaitingForConfirmation,_loc2_);
            this.garageWindow.updateKitsContainsItem(this.itemWaitingForConfirmation);
         }
      }
      
      private function buyKit() : void
      {
         var _loc1_:KitItem = null;
         var _loc2_:IGameObject = null;
         var _loc3_:GarageKit = GarageKit(this.itemWaitingForConfirmation.adapt(GarageKit));
         var _loc4_:int = _loc3_.getPrice();
         if(moneyService.crystal < _loc4_)
         {
            return;
         }
         moneyService.§case package final§(_loc4_);
         server.kitBought(this.itemWaitingForConfirmation,_loc4_);
         for each(_loc1_ in _loc3_.getItems())
         {
            _loc2_ = _loc1_.item;
            this.§import for native§(_loc2_,_loc1_.count,_loc1_.mount);
            if(!itemService.isCountable(_loc2_))
            {
               this.garageWindow.updateKitsContainsItem(_loc2_);
            }
         }
         this.garageWindow.showItemInCategory(this.itemWaitingForConfirmation);
      }
      
      private function §4j§(param1:IGameObject) : void
      {
         var _loc2_:§1#^§ = null;
         for each(_loc2_ in this.garageWindow.§#"_§)
         {
            if(param1 == _loc2_.item)
            {
               _loc2_.removeListener();
            }
         }
      }
      
      private function §import for native§(param1:IGameObject, param2:int, param3:Boolean) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:IGameObject = null;
         if(itemService.canBuy(param1))
         {
            this.buyItem(param1,param2,param3);
            this.mountItem(param1);
            server.itemMounted(param1);
         }
      }
      
      private function forceUpgradePreviosModifications(param1:IGameObject) : void
      {
         var _loc2_:IGameObject = null;
         var _loc3_:UpgradableItem = null;
         var _loc4_:Vector.<IGameObject> = itemService.§;#U§(param1);
         for each(_loc2_ in _loc4_)
         {
            _loc3_ = UpgradableItem(_loc2_.adapt(UpgradableItem));
            if(_loc3_.isUpgrading())
            {
               _loc3_.getCountDownTimer().stop();
            }
         }
      }
      
      private function buyItem(param1:IGameObject, param2:int, param3:Boolean = true) : void
      {
         var _loc4_:int = 0;
         var _loc5_:ItemCategoryEnum = itemService.getCategory(param1);
         if(param1.hasModel(ITemporaryItem) && itemService.getCategory(param1) == ItemCategoryEnum.PLUGIN)
         {
            ITemporaryItem(param1.adapt(ITemporaryItem)).startTiming(0);
         }
         if(_loc5_ != ItemCategoryEnum.INVENTORY)
         {
            if(itemService.§!"p§(param1))
            {
               this.garageWindow.removeAllModifications(param1);
            }
            else
            {
               this.garageWindow.removeItemFromStore(param1);
            }
            this.garageWindow.addItemToDepot(param1);
         }
         else if(param1.name != "1000_scores_m0")
         {
            _loc4_ = itemService.getCount(param1);
            if(param2 > 0)
            {
               itemService.setCount(param1,_loc4_ + param2);
               this.garageWindow.updateCount(param1);
            }
         }
         if(param3 && itemService.§include for each§(param1) && this.§break package§(param1))
         {
            this.mountItem(param1);
            server.itemMounted(param1);
         }
      }
      
      public function §break package§(param1:IGameObject) : Boolean
      {
         if(!lobbyLayoutService.inBattle())
         {
            return true;
         }
         if(!battleInfoService.reArmorEnabled)
         {
            return false;
         }
         var _loc2_:CountDownTimer = §super set dynamic§.§+N§(param1);
         return _loc2_.getRemainingSeconds() <= 0;
      }
      
      private function hideConfirmAlert(param1:MouseEvent = null) : void
      {
         display.stage.removeEventListener(Event.RESIZE,this.alignConfirmAlert);
         display.dialogsLayer.removeChild(this.confirmAlert);
         blurService.unblur();
         this.confirmAlert = null;
      }
      
      private function upgradeItem(param1:IGameObject, param2:IGameObject) : void
      {
         this.garageWindow.addItemToDepot(param2);
         this.garageWindow.selectItemInWarehouse(param2);
         if(!itemService.§,!S§(param2))
         {
            this.mountItem(param2);
            server.itemMounted(param2);
         }
         this.garageWindow.removeItemFromDepot(param1);
         this.garageWindow.updateKitsContainsItem(param2);
      }
      
      private function onBuyClick(param1:GarageWindowEvent) : void
      {
         var _loc2_:BitmapData = null;
         var _loc3_:ItemCategoryEnum = null;
         var _loc4_:int = 0;
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = §'-§(param1.item.adapt(§'-§)).isForRent();
         this.itemWaitingForConfirmation = param1.item;
         var _loc7_:int = this.getPrice(itemService.§null var continue§(param1.item) && itemService.§!"p§(param1.item) ? itemService.§6#y§(param1.item) : param1.item);
         if(moneyService.§while package dynamic§(_loc7_))
         {
            if(itemService.§extends const each§(this.itemWaitingForConfirmation))
            {
               §finally for implements§(param1.item.adapt(§finally for implements§)).preparePresent(this.itemWaitingForConfirmation);
               return;
            }
            if(itemService.§null var continue§(this.itemWaitingForConfirmation) && itemService.§!"p§(this.itemWaitingForConfirmation))
            {
               _loc2_ = itemService.getPreviewResource(itemService.§6#y§(this.itemWaitingForConfirmation)).data;
               _loc3_ = itemService.getCategory(itemService.§6#y§(this.itemWaitingForConfirmation));
               _loc4_ = itemService.getPrice(itemService.§6#y§(this.itemWaitingForConfirmation));
               _loc5_ = itemService.isCountable(itemService.§6#y§(this.itemWaitingForConfirmation));
               this.showConfirmAlert(itemService.getName(itemService.§6#y§(this.itemWaitingForConfirmation)),_loc4_,_loc2_,false,_loc3_ == ItemCategoryEnum.ARMOR || _loc3_ == ItemCategoryEnum.WEAPON ? int(itemService.getModificationIndex(itemService.§6#y§(param1.item))) : int(-1),_loc5_ ? int(this.garageWindow.itemInfoPanel.inventoryNumStepper.value) : int(-1),_loc6_);
            }
            else
            {
               _loc2_ = itemService.getPreviewResource(this.itemWaitingForConfirmation).data;
               _loc3_ = itemService.getCategory(this.itemWaitingForConfirmation);
               _loc4_ = itemService.getPrice(this.itemWaitingForConfirmation);
               _loc5_ = itemService.isCountable(this.itemWaitingForConfirmation);
               this.showConfirmAlert(itemService.getName(this.itemWaitingForConfirmation),_loc7_,_loc2_,true,_loc3_ == ItemCategoryEnum.ARMOR || _loc3_ == ItemCategoryEnum.WEAPON ? int(itemService.getModificationIndex(param1.item)) : int(-1),_loc5_ ? int(this.garageWindow.itemInfoPanel.inventoryNumStepper.value) : int(-1),_loc6_);
            }
         }
         else
         {
            trackerService.trackEvent(GA_CATEGORY,GarageWindowEvent.ADD_CRYSTALS,itemService.getName(this.selectedItem));
         }
      }
      
      public function §case package throw§(param1:Vector.<IGameObject>) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:IGameObject = null;
         for each(_loc3_ in param1)
         {
            IItemCategory(_loc3_.adapt(IItemCategory)).setCategory(ItemCategoryEnum.GIVEN_PRESENT);
            IItemViewCategory(_loc3_.adapt(IItemViewCategory)).setCategory(ItemViewCategoryEnum.GIVEN_PRESENTS);
            this.garageWindow.addItemToDepot(_loc3_);
            _loc2_ = true;
         }
         this.garageWindow.setCategoryButtonVisibility(ItemViewCategoryEnum.GIVEN_PRESENTS,_loc2_);
      }
      
      public function showCategory(param1:ItemViewCategoryEnum) : void
      {
         this.garageWindow.showCategory(param1);
      }
      
      private function updateAchievementPositions() : void
      {
         var _loc1_:int = 0;
         if(this.garageWindow.itemInfoPanel.buyButton.enabled && this.garageWindow.itemInfoPanel.buyButton.visible)
         {
            _loc1_ = this.garageWindow.x + this.garageWindow.itemInfoPanel.x;
            achievementService.setGarageBuyButtonTargetPoint(new Point(this.garageWindow.itemInfoPanel.buyButton.x + _loc1_,this.garageWindow.itemInfoPanel.buyButton.y + 75));
         }
         else
         {
            achievementService.setGarageBuyButtonTargetPoint(new Point(0,0));
         }
      }
      
      public function temporaryItemTimeIsUp(param1:IGameObject) : void
      {
         if(this.garageWindow != null)
         {
            this.garageWindow.removeItemFromDepot(param1);
            if(itemService.getPrice(param1) > 0 && itemService.isBuyable(param1))
            {
               this.garageWindow.addItemToMarket(param1);
            }
            else
            {
               this.garageWindow.updateSelection();
            }
         }
      }
      
      private function getPrice(param1:IGameObject) : int
      {
         var _loc2_:int = itemService.getPrice(param1);
         if(itemService.isCountable(param1))
         {
            _loc2_ *= this.garageWindow.itemInfoPanel.inventoryNumStepper.value;
         }
         return _loc2_;
      }
      
      private function registerDumpers() : void
      {
         this.itemDumper = new ItemDumper();
         dumpService.registerDumper(this.itemDumper);
      }
      
      private function traceUpgrades(param1:FormattedOutput) : void
      {
         var _loc2_:IGameObject = null;
         for each(_loc2_ in this.items)
         {
            if(_loc2_.hasModel(UpgradableItem))
            {
               UpgradableItem(_loc2_.adapt(UpgradableItem)).traceUpgrades();
            }
         }
         param1.addText("смотреть в flashlog.txt");
      }
      
      private function unregisterDumpers() : void
      {
         dumpService.unregisterDumper(this.itemDumper.dumperName);
         this.itemDumper = null;
      }
      
      public function onResourceLoadingStart(param1:Resource) : void
      {
      }
      
      public function onResourceLoadingProgress(param1:Resource, param2:int) : void
      {
      }
      
      public function onResourceLoadingComplete(param1:Resource) : void
      {
      }
      
      public function onResourceLoadingError(param1:Resource, param2:String) : void
      {
      }
      
      public function onResourceLoadingFatalError(param1:Resource, param2:String) : void
      {
      }
   }
}

