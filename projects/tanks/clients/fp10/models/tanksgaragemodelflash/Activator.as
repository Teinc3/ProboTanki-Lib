package projects.tanks.clients.fp10.models.tanksgaragemodelflash
{
   import Renamed149.Renamed4763;
   import Renamed149.Renamed4764;
   import Renamed190.Renamed4765;
   import Renamed1687.Renamed4766;
   import Renamed1687.Renamed1688;
   import Renamed1687.Renamed4767;
   import Renamed233.Renamed4768;
   import Renamed2090.Renamed4769;
   import Renamed2090.Renamed2091;
   import Renamed2090.Renamed4770;
   import Renamed2090.Renamed4771;
   import Renamed2090.Renamed4772;
   import Renamed2090.Renamed4773;
   import Renamed2090.Renamed2092;
   import Renamed2090.Renamed4774;
   import Renamed305.Renamed4775;
   import Renamed4776.Renamed4777;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.osgi.service.command.CommandService;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.dump.IDumpService;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.osgi.service.logging.LogService;
   import alternativa.tanks.blur.IBlurService;
   import alternativa.tanks.gui.Renamed1743;
   import alternativa.tanks.gui.ConfirmAlert;
   import alternativa.tanks.gui.GarageWindow;
   import alternativa.tanks.gui.ItemInfoPanel;
   import alternativa.tanks.gui.buttons.CrystalButton;
   import alternativa.tanks.gui.buttons.GarageButton;
   import alternativa.tanks.gui.effects.BlinkEffect;
   import alternativa.tanks.gui.effects.FlashEffect;
   import alternativa.tanks.gui.effects.GlowEffect;
   import alternativa.tanks.gui.garagelist.GarageListController;
   import alternativa.tanks.gui.tankpreview.TankPreviewWindow;
   import alternativa.tanks.gui.upgrade.SelectUpgradeWindow;
   import alternativa.tanks.gui.upgrade.UpgradeButton;
   import alternativa.tanks.gui.upgrade.UpgradeInfoForm;
   import alternativa.tanks.gui.upgrade.UpgradeWindowBase;
   import alternativa.tanks.help.FirstMoneyHelper;
   import alternativa.tanks.help.IHelpService;
   import alternativa.tanks.loader.ILoaderWindowService;
   import alternativa.tanks.model.garage.Renamed2111;
   import alternativa.tanks.model.garage.GarageModel;
   import alternativa.tanks.model.garage.Renamed2112;
   import alternativa.tanks.model.garage.Renamed2095;
   import alternativa.tanks.model.item.buyable.BuyableModel;
   import alternativa.tanks.model.item.buyable.IBuyable;
   import alternativa.tanks.model.item.buyable.IBuyableAdapt;
   import alternativa.tanks.model.item.buyable.IBuyableEvents;
   import alternativa.tanks.model.item.category.IItemCategory;
   import alternativa.tanks.model.item.category.IItemCategoryAdapt;
   import alternativa.tanks.model.item.category.IItemCategoryEvents;
   import alternativa.tanks.model.item.category.IItemViewCategory;
   import alternativa.tanks.model.item.category.IItemViewCategoryAdapt;
   import alternativa.tanks.model.item.category.IItemViewCategoryEvents;
   import alternativa.tanks.model.item.category.ItemCategoryModel;
   import alternativa.tanks.model.item.category.ItemViewCategoryModel;
   import alternativa.tanks.model.item.countable.CountableItemModel;
   import alternativa.tanks.model.item.countable.ICountableItem;
   import alternativa.tanks.model.item.countable.ICountableItemAdapt;
   import alternativa.tanks.model.item.countable.ICountableItemEvents;
   import alternativa.tanks.model.item.discount.DiscountCollectorModel;
   import alternativa.tanks.model.item.discount.DiscountModel;
   import alternativa.tanks.model.item.discount.ICollectDiscount;
   import alternativa.tanks.model.item.discount.ICollectDiscountAdapt;
   import alternativa.tanks.model.item.discount.ICollectDiscountEvents;
   import alternativa.tanks.model.item.discount.IDiscount;
   import alternativa.tanks.model.item.discount.IDiscountAdapt;
   import alternativa.tanks.model.item.discount.IDiscountEvents;
   import alternativa.tanks.model.item.item.IItem;
   import alternativa.tanks.model.item.item.IItemAdapt;
   import alternativa.tanks.model.item.item.IItemEvents;
   import alternativa.tanks.model.item.item.ItemModel;
   import alternativa.tanks.model.item.kit.Renamed2140;
   import alternativa.tanks.model.item.kit.GarageKit;
   import alternativa.tanks.model.item.kit.Renamed2141;
   import alternativa.tanks.model.item.kit.Renamed2145;
   import alternativa.tanks.model.item.modification.IModification;
   import alternativa.tanks.model.item.modification.IModificationAdapt;
   import alternativa.tanks.model.item.modification.IModificationEvents;
   import alternativa.tanks.model.item.modification.ModificationModel;
   import alternativa.tanks.model.item.present.PresentItem;
   import alternativa.tanks.model.item.present.PresentItemAdapt;
   import alternativa.tanks.model.item.present.PresentItemEvents;
   import alternativa.tanks.model.item.present.PresentItemModel;
   import alternativa.tanks.model.item.properties.ItemProperties;
   import alternativa.tanks.model.item.properties.ItemPropertiesAdapt;
   import alternativa.tanks.model.item.properties.ItemPropertiesEvents;
   import alternativa.tanks.model.item.properties.ItemPropertiesModel;
   import alternativa.tanks.model.item.temporary.ITemporaryItem;
   import alternativa.tanks.model.item.temporary.ITemporaryItemAdapt;
   import alternativa.tanks.model.item.temporary.ITemporaryItemEvents;
   import alternativa.tanks.model.item.temporary.TemporaryItemModel;
   import alternativa.tanks.model.item.upgradable.UpgradableItem;
   import alternativa.tanks.model.item.upgradable.UpgradableItemAdapt;
   import alternativa.tanks.model.item.upgradable.UpgradableItemEvents;
   import alternativa.tanks.model.item.upgradable.UpgradableItemPropertyValue;
   import alternativa.tanks.model.item.upgradable.UpgradableParamsModel;
   import alternativa.tanks.model.item3d.Item3DModel;
   import alternativa.tanks.model.useremailandpassword.PasswordService;
   import alternativa.tanks.service.achievement.IAchievementService;
   import alternativa.tanks.service.delaymountcategory.IDelayMountCategoryService;
   import alternativa.tanks.service.delaymountcategory.Renamed560;
   import alternativa.tanks.service.dialogs.IDialogsService;
   import alternativa.tanks.service.fps.FPSService;
   import alternativa.tanks.service.garage.GarageService;
   import alternativa.tanks.service.item.Renamed562;
   import alternativa.tanks.service.item.ItemService;
   import alternativa.tanks.service.item.upgradable.speedup.SpeedUpCostCalculatorService;
   import alternativa.tanks.service.item3d.ITank3DViewer;
   import alternativa.tanks.service.itempropertyparams.Renamed564;
   import alternativa.tanks.service.itempropertyparams.ItemPropertyParamsService;
   import alternativa.tanks.service.money.IMoneyService;
   import alternativa.tanks.service.notificationcategories.INotificationGarageCategoriesService;
   import alternativa.tanks.service.panel.IPanelView;
   import alternativa.tanks.service.temporaryitem.ITemporaryItemService;
   import alternativa.tanks.service.temporaryitem.Renamed565;
   import alternativa.tanks.service.temporaryitemnotify.Renamed2093;
   import alternativa.tanks.service.temporaryitemnotify.ITemporaryItemNotifyService;
   import alternativa.tanks.tracker.ITrackerService;
   import controls.timer.CountDownTimerOnCompleteBefore;
   import Renamed378.Renamed2094;
   import Renamed378.Renamed4778;
   import Renamed378.Renamed4779;
   import Renamed378.Renamed4780;
   import Renamed407.Renamed4781;
   import Renamed407.Renamed4782;
   import Renamed407.Renamed4783;
   import Renamed407.Renamed3678;
   import Renamed412.Renamed4784;
   import platform.client.fp10.core.model.IObjectLoadListener;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.clients.fp10.libraries.alternativapartners.service.IPartnerService;
   import projects.tanks.client.garage.models.garage.IGarageModelBase;
   import projects.tanks.client.garage.models.item.buyable.IBuyableModelBase;
   import projects.tanks.client.garage.models.item.category.IItemCategoryModelBase;
   import projects.tanks.client.garage.models.item.countable.ICountableItemModelBase;
   import projects.tanks.client.garage.models.item.discount.IDiscountCollectorModelBase;
   import projects.tanks.client.garage.models.item.discount.IDiscountModelBase;
   import projects.tanks.client.garage.models.item.item.IItemModelBase;
   import projects.tanks.client.garage.models.item.item3d.IItem3DModelBase;
   import projects.tanks.client.garage.models.item.kit.Renamed2139;
   import projects.tanks.client.garage.models.item.modification.IModificationModelBase;
   import projects.tanks.client.garage.models.item.present.IPresentItemModelBase;
   import projects.tanks.client.garage.models.item.properties.IItemPropertiesModelBase;
   import projects.tanks.client.garage.models.item.temporary.ITemporaryItemModelBase;
   import projects.tanks.client.garage.models.item.upgradeable.IUpgradeableParamsConstructorModelBase;
   import projects.tanks.client.garage.models.item.view.IItemViewCategoryModelBase;
   import projects.tanks.clients.flash.commons.services.validate.IValidateService;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.uidcheck.UidCheckService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.premium.PremiumService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import Renamed414.Renamed4785;
   import Renamed421.Renamed4786;
   import Renamed426.Renamed4787;
   import Renamed426.Renamed4788;
   import Renamed433.Renamed4789;
   import Renamed437.Renamed4790;
   import Renamed437.Renamed1711;
   import Renamed437.Renamed4791;
   import Renamed437.Renamed4792;
   import Renamed438.Renamed4793;
   import Renamed438.Renamed1712;
   import utils.resource.IResourceLoadingComplete;
   
   public class Activator implements IBundleActivator
   {
      public static var osgi:OSGi;
      
      public function Activator()
      {
         super();
      }
      
      public function start(param1:OSGi) : void
      {
         var modelRegister:ModelRegistry;
         var modelRegisterAdapt:ModelRegistry;
         var _osgi:OSGi = param1;
         osgi = _osgi;
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed4768.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed4768.localeService;
         });
         osgi.injectService(UidCheckService,function(param1:Object):void
         {
            Renamed4768.Renamed4794 = UidCheckService(param1);
         },function():UidCheckService
         {
            return Renamed4768.Renamed4794;
         });
         osgi.injectService(ItemService,function(param1:Object):void
         {
            GarageListController.itemService = ItemService(param1);
         },function():ItemService
         {
            return GarageListController.itemService;
         });
         osgi.injectService(PremiumService,function(param1:Object):void
         {
            GarageListController.premiumService = PremiumService(param1);
         },function():PremiumService
         {
            return GarageListController.premiumService;
         });
         osgi.injectService(IUserPropertiesService,function(param1:Object):void
         {
            GarageListController.userPropertiesService = IUserPropertiesService(param1);
         },function():IUserPropertiesService
         {
            return GarageListController.userPropertiesService;
         });
         osgi.injectService(IStorageService,function(param1:Object):void
         {
            GarageListController.storageService = IStorageService(param1);
         },function():IStorageService
         {
            return GarageListController.storageService;
         });
         osgi.injectService(INotificationGarageCategoriesService,function(param1:Object):void
         {
            GarageListController.notificationGarageCategoriesService = INotificationGarageCategoriesService(param1);
         },function():INotificationGarageCategoriesService
         {
            return GarageListController.notificationGarageCategoriesService;
         });
         osgi.injectService(GarageService,function(param1:Object):void
         {
            GarageListController.garageService = GarageService(param1);
         },function():GarageService
         {
            return GarageListController.garageService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            ConfirmAlert.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return ConfirmAlert.localeService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            ItemInfoPanel.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return ItemInfoPanel.localeService;
         });
         osgi.injectService(IUserPropertiesService,function(param1:Object):void
         {
            ItemInfoPanel.userPropertiesService = IUserPropertiesService(param1);
         },function():IUserPropertiesService
         {
            return ItemInfoPanel.userPropertiesService;
         });
         osgi.injectService(ItemService,function(param1:Object):void
         {
            ItemInfoPanel.itemService = ItemService(param1);
         },function():ItemService
         {
            return ItemInfoPanel.itemService;
         });
         osgi.injectService(IClientLog,function(param1:Object):void
         {
            ItemInfoPanel.clientLog = IClientLog(param1);
         },function():IClientLog
         {
            return ItemInfoPanel.clientLog;
         });
         osgi.injectService(IMoneyService,function(param1:Object):void
         {
            ItemInfoPanel.moneyService = IMoneyService(param1);
         },function():IMoneyService
         {
            return ItemInfoPanel.moneyService;
         });
         osgi.injectService(IPanelView,function(param1:Object):void
         {
            ItemInfoPanel.panelView = IPanelView(param1);
         },function():IPanelView
         {
            return ItemInfoPanel.panelView;
         });
         osgi.injectService(ItemPropertyParamsService,function(param1:Object):void
         {
            ItemInfoPanel.propertyService = ItemPropertyParamsService(param1);
         },function():ItemPropertyParamsService
         {
            return ItemInfoPanel.propertyService;
         });
         osgi.injectService(IDialogsService,function(param1:Object):void
         {
            ItemInfoPanel.dialogService = IDialogsService(param1);
         },function():IDialogsService
         {
            return ItemInfoPanel.dialogService;
         });
         osgi.injectService(ITank3DViewer,function(param1:Object):void
         {
            ItemInfoPanel.Renamed1713 = ITank3DViewer(param1);
         },function():ITank3DViewer
         {
            return ItemInfoPanel.Renamed1713;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            UpgradeButton.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return UpgradeButton.localeService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            UpgradeWindowBase.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return UpgradeWindowBase.localeService;
         });
         osgi.injectService(IMoneyService,function(param1:Object):void
         {
            SelectUpgradeWindow.moneyService = IMoneyService(param1);
         },function():IMoneyService
         {
            return SelectUpgradeWindow.moneyService;
         });
         osgi.injectService(IDialogsService,function(param1:Object):void
         {
            SelectUpgradeWindow.dialogService = IDialogsService(param1);
         },function():IDialogsService
         {
            return SelectUpgradeWindow.dialogService;
         });
         osgi.injectService(ItemPropertyParamsService,function(param1:Object):void
         {
            SelectUpgradeWindow.propertyService = ItemPropertyParamsService(param1);
         },function():ItemPropertyParamsService
         {
            return SelectUpgradeWindow.propertyService;
         });
         osgi.injectService(ItemPropertyParamsService,function(param1:Object):void
         {
            UpgradeInfoForm.propertyService = ItemPropertyParamsService(param1);
         },function():ItemPropertyParamsService
         {
            return UpgradeInfoForm.propertyService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            UpgradeInfoForm.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return UpgradeInfoForm.localeService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            GarageWindow.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return GarageWindow.localeService;
         });
         osgi.injectService(IUserPropertiesService,function(param1:Object):void
         {
            GarageWindow.userPropertiesService = IUserPropertiesService(param1);
         },function():IUserPropertiesService
         {
            return GarageWindow.userPropertiesService;
         });
         osgi.injectService(IClientLog,function(param1:Object):void
         {
            GarageWindow.clientLog = IClientLog(param1);
         },function():IClientLog
         {
            return GarageWindow.clientLog;
         });
         osgi.injectService(IAlertService,function(param1:Object):void
         {
            GarageWindow.alertService = IAlertService(param1);
         },function():IAlertService
         {
            return GarageWindow.alertService;
         });
         osgi.injectService(ItemService,function(param1:Object):void
         {
            GarageWindow.itemService = ItemService(param1);
         },function():ItemService
         {
            return GarageWindow.itemService;
         });
         osgi.injectService(IMoneyService,function(param1:Object):void
         {
            GarageWindow.moneyService = IMoneyService(param1);
         },function():IMoneyService
         {
            return GarageWindow.moneyService;
         });
         osgi.injectService(ILobbyLayoutService,function(param1:Object):void
         {
            GarageWindow.lobbyLayoutService = ILobbyLayoutService(param1);
         },function():ILobbyLayoutService
         {
            return GarageWindow.lobbyLayoutService;
         });
         osgi.injectService(ITrackerService,function(param1:Object):void
         {
            GarageWindow.trackerService = ITrackerService(param1);
         },function():ITrackerService
         {
            return GarageWindow.trackerService;
         });
         osgi.injectService(IBattleInfoService,function(param1:Object):void
         {
            GarageWindow.battleInfoService = IBattleInfoService(param1);
         },function():IBattleInfoService
         {
            return GarageWindow.battleInfoService;
         });
         osgi.injectService(ITank3DViewer,function(param1:Object):void
         {
            GarageWindow.tank3DViewer = ITank3DViewer(param1);
         },function():ITank3DViewer
         {
            return GarageWindow.tank3DViewer;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            GarageButton.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return GarageButton.localeService;
         });
         osgi.injectService(IMoneyService,function(param1:Object):void
         {
            GarageButton.moneyService = IMoneyService(param1);
         },function():IMoneyService
         {
            return GarageButton.moneyService;
         });
         osgi.injectService(PremiumService,function(param1:Object):void
         {
            GarageButton.premiumService = PremiumService(param1);
         },function():PremiumService
         {
            return GarageButton.premiumService;
         });
         osgi.injectService(IMoneyService,function(param1:Object):void
         {
            CrystalButton.moneyService = IMoneyService(param1);
         },function():IMoneyService
         {
            return CrystalButton.moneyService;
         });
         osgi.injectService(FPSService,function(param1:Object):void
         {
            GlowEffect.fpsService = FPSService(param1);
         },function():FPSService
         {
            return GlowEffect.fpsService;
         });
         osgi.injectService(FPSService,function(param1:Object):void
         {
            FlashEffect.fpsService = FPSService(param1);
         },function():FPSService
         {
            return FlashEffect.fpsService;
         });
         osgi.injectService(FPSService,function(param1:Object):void
         {
            BlinkEffect.fpsService = FPSService(param1);
         },function():FPSService
         {
            return BlinkEffect.fpsService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed564.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed564.localeService;
         });
         osgi.injectService(IClientLog,function(param1:Object):void
         {
            Renamed564.logger = IClientLog(param1);
         },function():IClientLog
         {
            return Renamed564.logger;
         });
         osgi.injectService(ItemPropertyParamsService,function(param1:Object):void
         {
            UpgradableItemPropertyValue.propertyParamsService = ItemPropertyParamsService(param1);
         },function():ItemPropertyParamsService
         {
            return UpgradableItemPropertyValue.propertyParamsService;
         });
         osgi.injectService(SpeedUpCostCalculatorService,function(param1:Object):void
         {
            UpgradableItemPropertyValue.speedUpCostCalculator = SpeedUpCostCalculatorService(param1);
         },function():SpeedUpCostCalculatorService
         {
            return UpgradableItemPropertyValue.speedUpCostCalculator;
         });
         osgi.injectService(ItemService,function(param1:Object):void
         {
            UpgradableItemPropertyValue.itemService = ItemService(param1);
         },function():ItemService
         {
            return UpgradableItemPropertyValue.itemService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            FirstMoneyHelper.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return FirstMoneyHelper.localeService;
         });
         osgi.injectService(ITrackerService,function(param1:Object):void
         {
            GarageModel.trackerService = ITrackerService(param1);
         },function():ITrackerService
         {
            return GarageModel.trackerService;
         });
         osgi.injectService(IDumpService,function(param1:Object):void
         {
            GarageModel.dumpService = IDumpService(param1);
         },function():IDumpService
         {
            return GarageModel.dumpService;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            GarageModel.display = IDisplay(param1);
         },function():IDisplay
         {
            return GarageModel.display;
         });
         osgi.injectService(ModelRegistry,function(param1:Object):void
         {
            GarageModel.modelRegistry = ModelRegistry(param1);
         },function():ModelRegistry
         {
            return GarageModel.modelRegistry;
         });
         osgi.injectService(IHelpService,function(param1:Object):void
         {
            GarageModel.helpService = IHelpService(param1);
         },function():IHelpService
         {
            return GarageModel.helpService;
         });
         osgi.injectService(IUserPropertiesService,function(param1:Object):void
         {
            GarageModel.userPropertiesService = IUserPropertiesService(param1);
         },function():IUserPropertiesService
         {
            return GarageModel.userPropertiesService;
         });
         osgi.injectService(IClientLog,function(param1:Object):void
         {
            GarageModel.clientLog = IClientLog(param1);
         },function():IClientLog
         {
            return GarageModel.clientLog;
         });
         osgi.injectService(ItemService,function(param1:Object):void
         {
            GarageModel.itemService = ItemService(param1);
         },function():ItemService
         {
            return GarageModel.itemService;
         });
         osgi.injectService(IBlurService,function(param1:Object):void
         {
            GarageModel.blurService = IBlurService(param1);
         },function():IBlurService
         {
            return GarageModel.blurService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            GarageModel.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return GarageModel.localeService;
         });
         osgi.injectService(ITemporaryItemService,function(param1:Object):void
         {
            GarageModel.temporaryItemService = ITemporaryItemService(param1);
         },function():ITemporaryItemService
         {
            return GarageModel.temporaryItemService;
         });
         osgi.injectService(ITemporaryItemNotifyService,function(param1:Object):void
         {
            GarageModel.temporaryItemNotifyService = ITemporaryItemNotifyService(param1);
         },function():ITemporaryItemNotifyService
         {
            return GarageModel.temporaryItemNotifyService;
         });
         osgi.injectService(ILobbyLayoutService,function(param1:Object):void
         {
            GarageModel.lobbyLayoutService = ILobbyLayoutService(param1);
         },function():ILobbyLayoutService
         {
            return GarageModel.lobbyLayoutService;
         });
         osgi.injectService(ITank3DViewer,function(param1:Object):void
         {
            GarageModel.tank3DViewer = ITank3DViewer(param1);
         },function():ITank3DViewer
         {
            return GarageModel.tank3DViewer;
         });
         osgi.injectService(IAchievementService,function(param1:Object):void
         {
            GarageModel.achievementService = IAchievementService(param1);
         },function():IAchievementService
         {
            return GarageModel.achievementService;
         });
         osgi.injectService(IMoneyService,function(param1:Object):void
         {
            GarageModel.moneyService = IMoneyService(param1);
         },function():IMoneyService
         {
            return GarageModel.moneyService;
         });
         osgi.injectService(ILoaderWindowService,function(param1:Object):void
         {
            GarageModel.loaderWindowService = ILoaderWindowService(param1);
         },function():ILoaderWindowService
         {
            return GarageModel.loaderWindowService;
         });
         osgi.injectService(GarageService,function(param1:Object):void
         {
            GarageModel.garageService = GarageService(param1);
         },function():GarageService
         {
            return GarageModel.garageService;
         });
         osgi.injectService(CommandService,function(param1:Object):void
         {
            GarageModel.commandService = CommandService(param1);
         },function():CommandService
         {
            return GarageModel.commandService;
         });
         osgi.injectService(IBattleInfoService,function(param1:Object):void
         {
            GarageModel.battleInfoService = IBattleInfoService(param1);
         },function():IBattleInfoService
         {
            return GarageModel.battleInfoService;
         });
         osgi.injectService(IDelayMountCategoryService,function(param1:Object):void
         {
            GarageModel.Renamed1714 = IDelayMountCategoryService(param1);
         },function():IDelayMountCategoryService
         {
            return GarageModel.Renamed1714;
         });
         osgi.injectService(ItemPropertyParamsService,function(param1:Object):void
         {
            UpgradableParamsModel.propertyService = ItemPropertyParamsService(param1);
         },function():ItemPropertyParamsService
         {
            return UpgradableParamsModel.propertyService;
         });
         osgi.injectService(ItemService,function(param1:Object):void
         {
            UpgradableParamsModel.itemService = ItemService(param1);
         },function():ItemService
         {
            return UpgradableParamsModel.itemService;
         });
         osgi.injectService(IClientLog,function(param1:Object):void
         {
            UpgradableParamsModel.logger = IClientLog(param1);
         },function():IClientLog
         {
            return UpgradableParamsModel.logger;
         });
         osgi.injectService(ItemService,function(param1:Object):void
         {
            Item3DModel.itemService = ItemService(param1);
         },function():ItemService
         {
            return Item3DModel.itemService;
         });
         osgi.injectService(ITank3DViewer,function(param1:Object):void
         {
            Item3DModel.tank3DViewer = ITank3DViewer(param1);
         },function():ITank3DViewer
         {
            return Item3DModel.tank3DViewer;
         });
         osgi.injectService(ResourceRegistry,function(param1:Object):void
         {
            Item3DModel.resourceRegistry = ResourceRegistry(param1);
         },function():ResourceRegistry
         {
            return Item3DModel.resourceRegistry;
         });
         osgi.injectService(ITemporaryItemService,function(param1:Object):void
         {
            TemporaryItemModel.temporaryItemService = ITemporaryItemService(param1);
         },function():ITemporaryItemService
         {
            return TemporaryItemModel.temporaryItemService;
         });
         osgi.injectService(ITemporaryItemNotifyService,function(param1:Object):void
         {
            TemporaryItemModel.temporaryItemNotifyService = ITemporaryItemNotifyService(param1);
         },function():ITemporaryItemNotifyService
         {
            return TemporaryItemModel.temporaryItemNotifyService;
         });
         osgi.injectService(ITemporaryItemNotifyService,function(param1:Object):void
         {
            Renamed565.temporaryItemNotifyService = ITemporaryItemNotifyService(param1);
         },function():ITemporaryItemNotifyService
         {
            return Renamed565.temporaryItemNotifyService;
         });
         osgi.injectService(GarageService,function(param1:Object):void
         {
            DiscountModel.garageService = GarageService(param1);
         },function():GarageService
         {
            return DiscountModel.garageService;
         });
         osgi.injectService(ItemService,function(param1:Object):void
         {
            Renamed2140.itemService = ItemService(param1);
         },function():ItemService
         {
            return Renamed2140.itemService;
         });
         osgi.injectService(IUserPropertiesService,function(param1:Object):void
         {
            Renamed2140.userPropertyService = IUserPropertiesService(param1);
         },function():IUserPropertiesService
         {
            return Renamed2140.userPropertyService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed1712.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed1712.localeService;
         });
         osgi.injectService(ItemService,function(param1:Object):void
         {
            Renamed1712.itemService = ItemService(param1);
         },function():ItemService
         {
            return Renamed1712.itemService;
         });
         osgi.injectService(ItemService,function(param1:Object):void
         {
            Renamed4793.itemService = ItemService(param1);
         },function():ItemService
         {
            return Renamed4793.itemService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed4793.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed4793.localeService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed1743.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed1743.localeService;
         });
         osgi.injectService(ItemService,function(param1:Object):void
         {
            Renamed4772.itemService = ItemService(param1);
         },function():ItemService
         {
            return Renamed4772.itemService;
         });
         osgi.injectService(ItemService,function(param1:Object):void
         {
            Renamed560.itemService = ItemService(param1);
         },function():ItemService
         {
            return Renamed560.itemService;
         });
         osgi.injectService(LogService,function(param1:Object):void
         {
            Renamed560.logService = LogService(param1);
         },function():LogService
         {
            return Renamed560.logService;
         });
         osgi.injectService(ILobbyLayoutService,function(param1:Object):void
         {
            ItemInfoPanel.lobbyLayoutService = ILobbyLayoutService(param1);
         },function():ILobbyLayoutService
         {
            return ItemInfoPanel.lobbyLayoutService;
         });
         osgi.injectService(IBattleInfoService,function(param1:Object):void
         {
            ItemInfoPanel.battleInfoService = IBattleInfoService(param1);
         },function():IBattleInfoService
         {
            return ItemInfoPanel.battleInfoService;
         });
         osgi.injectService(IDelayMountCategoryService,function(param1:Object):void
         {
            ItemInfoPanel.Renamed1714 = IDelayMountCategoryService(param1);
         },function():IDelayMountCategoryService
         {
            return ItemInfoPanel.Renamed1714;
         });
         osgi.injectService(IDelayMountCategoryService,function(param1:Object):void
         {
            Renamed4775.Renamed1714 = IDelayMountCategoryService(param1);
         },function():IDelayMountCategoryService
         {
            return Renamed4775.Renamed1714;
         });
         osgi.injectService(ILobbyLayoutService,function(param1:Object):void
         {
            Renamed4775.lobbyLayoutService = ILobbyLayoutService(param1);
         },function():ILobbyLayoutService
         {
            return Renamed4775.lobbyLayoutService;
         });
         osgi.injectService(IBattleInfoService,function(param1:Object):void
         {
            Renamed4775.battleInfoService = IBattleInfoService(param1);
         },function():IBattleInfoService
         {
            return Renamed4775.battleInfoService;
         });
         osgi.injectService(LogService,function(param1:Object):void
         {
            Renamed4775.logService = LogService(param1);
         },function():LogService
         {
            return Renamed4775.logService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            TankPreviewWindow.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return TankPreviewWindow.localeService;
         });
         osgi.injectService(ILobbyLayoutService,function(param1:Object):void
         {
            TankPreviewWindow.lobbyLayoutService = ILobbyLayoutService(param1);
         },function():ILobbyLayoutService
         {
            return TankPreviewWindow.lobbyLayoutService;
         });
         osgi.injectService(IUserPropertiesService,function(param1:Object):void
         {
            Renamed562.userPropertyService = IUserPropertiesService(param1);
         },function():IUserPropertiesService
         {
            return Renamed562.userPropertyService;
         });
         osgi.injectService(ItemPropertyParamsService,function(param1:Object):void
         {
            Renamed562.propertyService = ItemPropertyParamsService(param1);
         },function():ItemPropertyParamsService
         {
            return Renamed562.propertyService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed562.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed562.localeService;
         });
         osgi.injectService(GarageService,function(param1:Object):void
         {
            Renamed562.garageService = GarageService(param1);
         },function():GarageService
         {
            return Renamed562.garageService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed4788.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed4788.localeService;
         });
         osgi.injectService(IAlertService,function(param1:Object):void
         {
            Renamed4788.alertService = IAlertService(param1);
         },function():IAlertService
         {
            return Renamed4788.alertService;
         });
         osgi.injectService(IStorageService,function(param1:Object):void
         {
            Renamed4788.storageService = IStorageService(param1);
         },function():IStorageService
         {
            return Renamed4788.storageService;
         });
         osgi.injectService(IPartnerService,function(param1:Object):void
         {
            Renamed4788.partnerService = IPartnerService(param1);
         },function():IPartnerService
         {
            return Renamed4788.partnerService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed4787.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed4787.localeService;
         });
         osgi.injectService(UidCheckService,function(param1:Object):void
         {
            Renamed4787.Renamed4795 = UidCheckService(param1);
         },function():UidCheckService
         {
            return Renamed4787.Renamed4795;
         });
         osgi.injectService(PasswordService,function(param1:Object):void
         {
            Renamed4787.Renamed2181 = PasswordService(param1);
         },function():PasswordService
         {
            return Renamed4787.Renamed2181;
         });
         osgi.injectService(IValidateService,function(param1:Object):void
         {
            Renamed4787.validateService = IValidateService(param1);
         },function():IValidateService
         {
            return Renamed4787.validateService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed4785.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed4785.localeService;
         });
         osgi.injectService(IMoneyService,function(param1:Object):void
         {
            Renamed4785.moneyService = IMoneyService(param1);
         },function():IMoneyService
         {
            return Renamed4785.moneyService;
         });
         modelRegister = osgi.getService(ModelRegistry) as ModelRegistry;
         modelRegisterAdapt = osgi.getService(ModelRegistry) as ModelRegistry;
         modelRegisterAdapt.registerAdapt(PresentItem,PresentItemAdapt);
         modelRegisterAdapt.registerEvents(PresentItem,PresentItemEvents);
         modelRegister.add(new PresentItemModel(),Vector.<Class>([IPresentItemModelBase,PresentItem]));
         modelRegister.add(new ItemModel(),Vector.<Class>([IItemModelBase,IItem]));
         modelRegisterAdapt.registerAdapt(IItem,IItemAdapt);
         modelRegisterAdapt.registerEvents(IItem,IItemEvents);
         modelRegisterAdapt.registerAdapt(IItemViewCategory,IItemViewCategoryAdapt);
         modelRegisterAdapt.registerEvents(IItemViewCategory,IItemViewCategoryEvents);
         modelRegisterAdapt.registerAdapt(IItemCategory,IItemCategoryAdapt);
         modelRegisterAdapt.registerEvents(IItemCategory,IItemCategoryEvents);
         modelRegister.add(new ItemCategoryModel(),Vector.<Class>([IItemCategoryModelBase,IItemCategory]));
         modelRegister.add(new ItemViewCategoryModel(),Vector.<Class>([IItemViewCategoryModelBase,IItemViewCategory]));
         modelRegister.add(new BuyableModel(),Vector.<Class>([IBuyableModelBase,IBuyable]));
         modelRegisterAdapt.registerAdapt(IBuyable,IBuyableAdapt);
         modelRegisterAdapt.registerEvents(IBuyable,IBuyableEvents);
         modelRegisterAdapt.registerAdapt(IModification,IModificationAdapt);
         modelRegisterAdapt.registerEvents(IModification,IModificationEvents);
         modelRegister.add(new ModificationModel(),Vector.<Class>([IModificationModelBase,IModification]));
         modelRegisterAdapt.registerAdapt(ItemProperties,ItemPropertiesAdapt);
         modelRegisterAdapt.registerEvents(ItemProperties,ItemPropertiesEvents);
         modelRegister.add(new ItemPropertiesModel(),Vector.<Class>([IItemPropertiesModelBase,ItemProperties]));
         modelRegister.add(new UpgradableParamsModel(),Vector.<Class>([IUpgradeableParamsConstructorModelBase,ObjectLoadPostListener,UpgradableItem,ObjectUnloadListener]));
         modelRegisterAdapt.registerAdapt(UpgradableItem,UpgradableItemAdapt);
         modelRegisterAdapt.registerEvents(UpgradableItem,UpgradableItemEvents);
         modelRegister.add(new CountableItemModel(),Vector.<Class>([ICountableItemModelBase,ICountableItem,IObjectLoadListener]));
         modelRegisterAdapt.registerAdapt(ICountableItem,ICountableItemAdapt);
         modelRegisterAdapt.registerEvents(ICountableItem,ICountableItemEvents);
         modelRegister.add(new Item3DModel(),Vector.<Class>([IItem3DModelBase,IObjectLoadListener]));
         modelRegister.add(new TemporaryItemModel(),Vector.<Class>([ITemporaryItemModelBase,ITemporaryItem,IObjectLoadListener]));
         modelRegisterAdapt.registerAdapt(ITemporaryItem,ITemporaryItemAdapt);
         modelRegisterAdapt.registerEvents(ITemporaryItem,ITemporaryItemEvents);
         modelRegister.add(new DiscountModel(),Vector.<Class>([IDiscountModelBase,ICollectDiscount,ObjectLoadPostListener,ObjectUnloadListener,CountDownTimerOnCompleteBefore]));
         modelRegister.add(new DiscountCollectorModel(),Vector.<Class>([IDiscountCollectorModelBase,IDiscount]));
         modelRegisterAdapt.registerAdapt(IDiscount,IDiscountAdapt);
         modelRegisterAdapt.registerEvents(IDiscount,IDiscountEvents);
         modelRegisterAdapt.registerAdapt(ICollectDiscount,ICollectDiscountAdapt);
         modelRegisterAdapt.registerEvents(ICollectDiscount,ICollectDiscountEvents);
         modelRegisterAdapt.registerAdapt(GarageKit,Renamed2145);
         modelRegisterAdapt.registerEvents(GarageKit,Renamed2141);
         modelRegister.add(new Renamed2140(),Vector.<Class>([Renamed2139,GarageKit,ICollectDiscount]));
         modelRegister.add(new Renamed4790(),Vector.<Class>([Renamed4784,Renamed1711]));
         modelRegisterAdapt.registerAdapt(Renamed1711,Renamed4791);
         modelRegisterAdapt.registerEvents(Renamed1711,Renamed4792);
         modelRegister.add(new Renamed4773(),Vector.<Class>([Renamed4763,Renamed2091]));
         modelRegisterAdapt.registerAdapt(Renamed2092,Renamed4774);
         modelRegisterAdapt.registerEvents(Renamed2092,Renamed4771);
         modelRegister.add(new Renamed4772(),Vector.<Class>([Renamed4764,Renamed2092]));
         modelRegisterAdapt.registerAdapt(Renamed2091,Renamed4770);
         modelRegisterAdapt.registerEvents(Renamed2091,Renamed4796);
         modelRegister.add(new GarageModel(),Vector.<Class>([IGarageModelBase,ObjectLoadListener,Renamed2093,Renamed2095,IResourceLoadingComplete]));
         modelRegisterAdapt.registerAdapt(Renamed2095,Renamed2112);
         modelRegisterAdapt.registerEvents(Renamed2095,Renamed2111);
         modelRegister.add(new Renamed4775(),Vector.<Class>([Renamed4789,ObjectLoadPostListener,ObjectUnloadListener]));
         modelRegisterAdapt.registerAdapt(Renamed3678,Renamed4783);
         modelRegisterAdapt.registerEvents(Renamed3678,Renamed4781);
         modelRegister.add(new Renamed4782(),Vector.<Class>([Renamed4765,Renamed3678]));
         modelRegisterAdapt.registerAdapt(Renamed2094,Renamed4780);
         modelRegisterAdapt.registerEvents(Renamed2094,Renamed4778);
         modelRegister.add(new Renamed4779(),Vector.<Class>([Renamed4777,Renamed2094]));
         modelRegister.add(new Renamed4788(),Vector.<Class>([Renamed4786,Renamed1688,ObjectLoadListener,ObjectUnloadListener]));
         modelRegisterAdapt.registerAdapt(Renamed1688,Renamed4767);
         modelRegisterAdapt.registerEvents(Renamed1688,Renamed4766);
      }
      
      public function stop(param1:OSGi) : void
      {
      }
   }
}

