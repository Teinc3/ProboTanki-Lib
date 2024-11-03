package projects.tanks.clients.fp10.models.tankspanelmodelflash
{
   import Renamed145.Renamed2175;
   import Renamed2081.Renamed2083;
   import Renamed1959.Renamed4797;
   import Renamed1959.Renamed1961;
   import Renamed151.Renamed4798;
   import Renamed191.Renamed4799;
   import Renamed4800.Renamed4801;
   import Renamed218.Renamed4802;
   import Renamed245.Renamed2282;
   import Renamed248.Renamed4803;
   import Renamed248.Renamed4804;
   import Renamed266.Renamed2217;
   import Renamed4805.Renamed4806;
   import Renamed291.Renamed4807;
   import Renamed4808.Renamed4809;
   import Renamed2170.Renamed2171;
   import Renamed303.Renamed1962;
   import Renamed466.Renamed4810;
   import Renamed504.Renamed4811;
   import Renamed504.Renamed4812;
   import Renamed504.Renamed4813;
   import Renamed504.Renamed4814;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.blur.IBlurService;
   import alternativa.tanks.gui.Renamed1907;
   import alternativa.tanks.gui.CongratulationsWindowPresent;
   import alternativa.tanks.gui.CongratulationsWindowWithBanner;
   import alternativa.tanks.gui.NewsAlertWindow;
   import alternativa.tanks.gui.RankUpSupplyBonusAlert;
   import alternativa.tanks.gui.ReferralWindow;
   import alternativa.tanks.gui.RepatriateBonusWindow;
   import alternativa.tanks.gui.ThanksForPurchaseWindow;
   import alternativa.tanks.gui.alerts.ItemsAlert;
   import alternativa.tanks.gui.battle.BattleFinishNotification;
   import alternativa.tanks.gui.buycrystals.BuyCrystalsAlert;
   import alternativa.tanks.gui.error.ErrorForm;
   import alternativa.tanks.gui.error.ErrorNotification;
   import alternativa.tanks.gui.friends.AddRequestView;
   import alternativa.tanks.gui.friends.FriendsWindow;
   import alternativa.tanks.gui.friends.battleLink.BattleLink;
   import alternativa.tanks.gui.friends.battleinvite.BattleInviteNotification;
   import alternativa.tanks.gui.friends.list.AcceptedList;
   import alternativa.tanks.gui.friends.list.IncomingList;
   import alternativa.tanks.gui.friends.list.OutgoingList;
   import alternativa.tanks.gui.friends.list.dataprovider.FriendsDataProvider;
   import alternativa.tanks.gui.friends.list.renderer.FriendsAcceptedListRenderer;
   import alternativa.tanks.gui.friends.list.renderer.FriendsIncomingListRenderer;
   import alternativa.tanks.gui.friends.list.renderer.FriendsOutgoingListRenderer;
   import alternativa.tanks.gui.friends.list.renderer.HeaderAcceptedList;
   import alternativa.tanks.gui.premiumaccount.PremiumAccountWelcomeAlert;
   import alternativa.tanks.gui.presents.NewPresentsAlert;
   import alternativa.tanks.gui.settings.Renamed1969;
   import alternativa.tanks.gui.settings.SettingsWindow;
   import alternativa.tanks.help.IHelpService;
   import alternativa.tanks.help.Renamed2024;
   import alternativa.tanks.model.achievement.AchievementModel;
   import alternativa.tanks.model.achievement.IAchievement;
   import alternativa.tanks.model.bonus.showing.image.BonusImageShowingModel;
   import alternativa.tanks.model.bonus.showing.info.BonusInfo;
   import alternativa.tanks.model.bonus.showing.info.BonusInfoAdapt;
   import alternativa.tanks.model.bonus.showing.info.BonusInfoEvents;
   import alternativa.tanks.model.bonus.showing.info.BonusInfoModel;
   import alternativa.tanks.model.bonus.showing.items.BonusItem;
   import alternativa.tanks.model.bonus.showing.items.BonusItemAdapt;
   import alternativa.tanks.model.bonus.showing.items.BonusItemEvents;
   import alternativa.tanks.model.bonus.showing.items.BonusItemModel;
   import alternativa.tanks.model.bonus.showing.items.BonusItemsShowingModel;
   import alternativa.tanks.model.donationalert.DonationAlertModel;
   import alternativa.tanks.model.friends.battleinvite.BattleInviteModel;
   import alternativa.tanks.model.friends.loader.FriendsLoaderModel;
   import alternativa.tanks.model.garage.availableitems.AvailableItemsModel;
   import alternativa.tanks.model.garage.rankupsupplybonus.RankUpSupplyBonusModel;
   import alternativa.tanks.model.news.News;
   import alternativa.tanks.model.news.NewsAdapt;
   import alternativa.tanks.model.news.NewsEvents;
   import alternativa.tanks.model.news.NewsItemModel;
   import alternativa.tanks.model.news.NewsShowingModel;
   import alternativa.tanks.model.panel.PanelModel;
   import alternativa.tanks.model.premiumaccount.alert.PremiumAccountAlertModel;
   import alternativa.tanks.model.premiumaccount.notification.PremiumCompleteNotification;
   import alternativa.tanks.model.presents.NewPresentsShowingModel;
   import alternativa.tanks.model.settings.SettingsModel;
   import alternativa.tanks.model.shop.Renamed2239;
   import alternativa.tanks.model.shop.items.crystallitem.CrystalPackageItem;
   import alternativa.tanks.model.shop.items.premuimitem.PremiumPackageItem;
   import alternativa.tanks.model.socialnetwork.SocialNetworkPanelModel;
   import alternativa.tanks.model.useremailandpassword.IUserEmailAndPassword;
   import alternativa.tanks.model.useremailandpassword.PasswordService;
   import alternativa.tanks.model.useremailandpassword.UserEmailAndPasswordModel;
   import alternativa.tanks.model.useremailandpassword.Renamed2296;
   import alternativa.tanks.model.useremailandpassword.Renamed2297;
   import alternativa.tanks.model.userproperties.Renamed2298;
   import alternativa.tanks.model.userproperties.IUserProperties;
   import alternativa.tanks.model.userproperties.UserPropertiesModel;
   import alternativa.tanks.model.userproperties.Renamed2299;
   import alternativa.tanks.newbieservice.NewbieUserService;
   import alternativa.tanks.servermodels.loginbyhash.LoginByHashModel;
   import alternativa.tanks.service.IEntranceClientFacade;
   import alternativa.tanks.service.IExternalEntranceService;
   import alternativa.tanks.service.achievement.IAchievementService;
   import alternativa.tanks.service.achievement.Renamed567;
   import alternativa.tanks.service.country.CountryService;
   import alternativa.tanks.service.dailyquest.DailyQuestNotifierService;
   import alternativa.tanks.service.dailyquest.Renamed3660;
   import alternativa.tanks.service.dialogs.IDialogsService;
   import alternativa.tanks.service.fps.Renamed570;
   import alternativa.tanks.service.money.IMoneyService;
   import alternativa.tanks.service.money.Renamed571;
   import alternativa.tanks.service.notificationcategories.INotificationGarageCategoriesService;
   import alternativa.tanks.service.notificationcategories.Renamed572;
   import alternativa.tanks.service.panel.IPanelView;
   import alternativa.tanks.service.panel.Renamed573;
   import alternativa.tanks.service.settings.Renamed574;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.service.settings.keybinding.KeysBindingService;
   import alternativa.tanks.service.settings.keybinding.Renamed3769;
   import alternativa.tanks.service.socialnetwork.ISocialNetworkPanelService;
   import alternativa.tanks.tracker.ITrackerService;
   import alternativa.tanks.view.forms.freeuids.FreeUidsForm;
   import alternativa.types.Long;
   import Renamed313.Renamed2155;
   import Renamed331.Renamed4815;
   import Renamed336.Renamed2088;
   import Renamed367.Renamed2113;
   import Renamed371.Renamed4816;
   import Renamed376.Renamed4817;
   import Renamed376.Renamed4818;
   import Renamed376.Renamed4819;
   import Renamed376.Renamed4820;
   import Renamed376.Renamed4821;
   import Renamed395.Renamed4822;
   import platform.client.fp10.core.model.IObjectLoadListener;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.fp10.core.model.ObjectUnloadPostListener;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.service.address.AddressService;
   import platform.clients.fp10.libraries.alternativapartners.service.IPartnerService;
   import projects.tanks.client.panel.model.battleinvite.Renamed2084;
   import projects.tanks.client.panel.model.bonus.showing.image.IBonusImageShowingModelBase;
   import projects.tanks.client.panel.model.bonus.showing.info.IBonusInfoModelBase;
   import projects.tanks.client.panel.model.bonus.showing.items.IBonusItemModelBase;
   import projects.tanks.client.panel.model.bonus.showing.items.IBonusItemsShowingModelBase;
   import projects.tanks.client.panel.model.dailyquest.Renamed4351;
   import projects.tanks.client.panel.model.garage.rankupsupplybonus.IRankUpSupplyBonusModelBase;
   import projects.tanks.client.panel.model.news.item.INewsItemModelBase;
   import projects.tanks.client.panel.model.news.showing.INewsShowingModelBase;
   import projects.tanks.client.panel.model.premiumaccount.alert.Renamed2168;
   import projects.tanks.client.panel.model.profile.userproperty.IUserPropertyModelBase;
   import projects.tanks.client.panel.model.socialnetwork.Renamed2275;
   import projects.tanks.clients.flash.commons.services.battlelinkactivator.BattleLinkActivatorService;
   import projects.tanks.clients.flash.commons.services.battlelinkactivator.IBattleLinkActivatorService;
   import projects.tanks.clients.flash.commons.services.notification.INotificationService;
   import projects.tanks.clients.flash.commons.services.notification.sound.INotificationSoundService;
   import projects.tanks.clients.flash.commons.services.timeunit.ITimeUnitService;
   import projects.tanks.clients.flash.commons.services.validate.IValidateService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.IDialogWindowsDispatcherService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendActionService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.battleinvite.IBattleInviteService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.fullscreen.FullscreenService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.notifier.battle.IBattleNotifierService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.notifier.online.IOnlineNotifierService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.premium.PremiumService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import Renamed413.Renamed3659;
   import services.contextmenu.IContextMenuService;
   import Renamed416.Renamed2074;
   import Renamed419.Renamed1963;
   import Renamed420.Renamed4823;
   import Renamed445.Renamed1964;
   import Renamed445.Renamed4824;
   import Renamed445.Renamed4825;
   import Renamed450.Renamed4826;
   import utils.TimeFormatter;
   
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
            PremiumAccountWelcomeAlert.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return PremiumAccountWelcomeAlert.localeService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            PremiumCompleteNotification.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return PremiumCompleteNotification.localeService;
         });
         osgi.injectService(INotificationService,function(param1:Object):void
         {
            PremiumAccountAlertModel.notificationService = INotificationService(param1);
         },function():INotificationService
         {
            return PremiumAccountAlertModel.notificationService;
         });
         osgi.injectService(PremiumService,function(param1:Object):void
         {
            PremiumAccountAlertModel.premiumService = PremiumService(param1);
         },function():PremiumService
         {
            return PremiumAccountAlertModel.premiumService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            PremiumAccountAlertModel.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return PremiumAccountAlertModel.localeService;
         });
         osgi.injectService(IContextMenuService,function(param1:Object):void
         {
            AcceptedList.contextMenuService = IContextMenuService(param1);
         },function():IContextMenuService
         {
            return AcceptedList.contextMenuService;
         });
         osgi.injectService(IOnlineNotifierService,function(param1:Object):void
         {
            AcceptedList.onlineNotifierService = IOnlineNotifierService(param1);
         },function():IOnlineNotifierService
         {
            return AcceptedList.onlineNotifierService;
         });
         osgi.injectService(IBattleNotifierService,function(param1:Object):void
         {
            AcceptedList.battleNotifierService = IBattleNotifierService(param1);
         },function():IBattleNotifierService
         {
            return AcceptedList.battleNotifierService;
         });
         osgi.injectService(IBattleInfoService,function(param1:Object):void
         {
            AcceptedList.battleInfoService = IBattleInfoService(param1);
         },function():IBattleInfoService
         {
            return AcceptedList.battleInfoService;
         });
         osgi.injectService(IBattleInviteService,function(param1:Object):void
         {
            AcceptedList.battleInviteService = IBattleInviteService(param1);
         },function():IBattleInviteService
         {
            return AcceptedList.battleInviteService;
         });
         osgi.injectService(IBattleInviteService,function(param1:Object):void
         {
            BattleInviteModel.battleInviteService = IBattleInviteService(param1);
         },function():IBattleInviteService
         {
            return BattleInviteModel.battleInviteService;
         });
         osgi.injectService(INotificationService,function(param1:Object):void
         {
            BattleInviteModel.notificationService = INotificationService(param1);
         },function():INotificationService
         {
            return BattleInviteModel.notificationService;
         });
         osgi.injectService(IBattleInfoService,function(param1:Object):void
         {
            BattleInviteModel.battleInfoService = IBattleInfoService(param1);
         },function():IBattleInfoService
         {
            return BattleInviteModel.battleInfoService;
         });
         osgi.injectService(IBattleLinkActivatorService,function(param1:Object):void
         {
            BattleInviteModel.battleLinkActivatorService = IBattleLinkActivatorService(param1);
         },function():IBattleLinkActivatorService
         {
            return BattleInviteModel.battleLinkActivatorService;
         });
         osgi.injectService(IAlertService,function(param1:Object):void
         {
            BattleInviteModel.alertService = IAlertService(param1);
         },function():IAlertService
         {
            return BattleInviteModel.alertService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            BattleInviteModel.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return BattleInviteModel.localeService;
         });
         osgi.injectService(ILobbyLayoutService,function(param1:Object):void
         {
            BattleInviteModel.lobbyLayoutService = ILobbyLayoutService(param1);
         },function():ILobbyLayoutService
         {
            return BattleInviteModel.lobbyLayoutService;
         });
         osgi.injectService(IUserInfoService,function(param1:Object):void
         {
            BattleInviteModel.userInfoService = IUserInfoService(param1);
         },function():IUserInfoService
         {
            return BattleInviteModel.userInfoService;
         });
         osgi.injectService(IBlurService,function(param1:Object):void
         {
            BattleInviteModel.blurService = IBlurService(param1);
         },function():IBlurService
         {
            return BattleInviteModel.blurService;
         });
         osgi.injectService(IFriendInfoService,function(param1:Object):void
         {
            BattleInviteModel.friendInfoService = IFriendInfoService(param1);
         },function():IFriendInfoService
         {
            return BattleInviteModel.friendInfoService;
         });
         osgi.injectService(IDialogWindowsDispatcherService,function(param1:Object):void
         {
            BattleInviteModel.dialogWindowsDispatcherService = IDialogWindowsDispatcherService(param1);
         },function():IDialogWindowsDispatcherService
         {
            return BattleInviteModel.dialogWindowsDispatcherService;
         });
         osgi.injectService(INotificationSoundService,function(param1:Object):void
         {
            BattleInviteModel.Renamed2086 = INotificationSoundService(param1);
         },function():INotificationSoundService
         {
            return BattleInviteModel.Renamed2086;
         });
         osgi.injectService(IBattleInviteService,function(param1:Object):void
         {
            BattleInviteNotification.battleInviteService = IBattleInviteService(param1);
         },function():IBattleInviteService
         {
            return BattleInviteNotification.battleInviteService;
         });
         osgi.injectService(IAlertService,function(param1:Object):void
         {
            BattleInviteNotification.battleAlertService = IAlertService(param1);
         },function():IAlertService
         {
            return BattleInviteNotification.battleAlertService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            BattleInviteNotification.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return BattleInviteNotification.localeService;
         });
         osgi.injectService(IStorageService,function(param1:Object):void
         {
            BattleInviteNotification.storageService = IStorageService(param1);
         },function():IStorageService
         {
            return BattleInviteNotification.storageService;
         });
         osgi.injectService(IUserInfoService,function(param1:Object):void
         {
            BattleLink.userInfoService = IUserInfoService(param1);
         },function():IUserInfoService
         {
            return BattleLink.userInfoService;
         });
         osgi.injectService(ILobbyLayoutService,function(param1:Object):void
         {
            BattleLink.lobbyLayoutService = ILobbyLayoutService(param1);
         },function():ILobbyLayoutService
         {
            return BattleLink.lobbyLayoutService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            BattleLink.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return BattleLink.localeService;
         });
         osgi.injectService(IUserPropertiesService,function(param1:Object):void
         {
            BattleLink.userPropertiesService = IUserPropertiesService(param1);
         },function():IUserPropertiesService
         {
            return BattleLink.userPropertiesService;
         });
         osgi.injectService(IPanelView,function(param1:Object):void
         {
            UserPropertiesModel.panelView = IPanelView(param1);
         },function():IPanelView
         {
            return UserPropertiesModel.panelView;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            UserPropertiesModel.display = IDisplay(param1);
         },function():IDisplay
         {
            return UserPropertiesModel.display;
         });
         osgi.injectService(IHelpService,function(param1:Object):void
         {
            UserPropertiesModel.helpService = IHelpService(param1);
         },function():IHelpService
         {
            return UserPropertiesModel.helpService;
         });
         osgi.injectService(IUserPropertiesService,function(param1:Object):void
         {
            UserPropertiesModel.userPropertiesService = IUserPropertiesService(param1);
         },function():IUserPropertiesService
         {
            return UserPropertiesModel.userPropertiesService;
         });
         osgi.injectService(IMoneyService,function(param1:Object):void
         {
            UserPropertiesModel.moneyService = IMoneyService(param1);
         },function():IMoneyService
         {
            return UserPropertiesModel.moneyService;
         });
         osgi.injectService(IPanelView,function(param1:Object):void
         {
            Renamed571.panelView = IPanelView(param1);
         },function():IPanelView
         {
            return Renamed571.panelView;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed573.display = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed573.display;
         });
         osgi.injectService(ILobbyLayoutService,function(param1:Object):void
         {
            AvailableItemsModel.lobbyLayoutService = ILobbyLayoutService(param1);
         },function():ILobbyLayoutService
         {
            return AvailableItemsModel.lobbyLayoutService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            AvailableItemsModel.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return AvailableItemsModel.localeService;
         });
         osgi.injectService(INotificationGarageCategoriesService,function(param1:Object):void
         {
            AvailableItemsModel.notificationGarageCategoriesService = INotificationGarageCategoriesService(param1);
         },function():INotificationGarageCategoriesService
         {
            return AvailableItemsModel.notificationGarageCategoriesService;
         });
         osgi.injectService(IStorageService,function(param1:Object):void
         {
            Renamed572.storageService = IStorageService(param1);
         },function():IStorageService
         {
            return Renamed572.storageService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            RepatriateBonusWindow.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return RepatriateBonusWindow.localeService;
         });
         osgi.injectService(IEntranceClientFacade,function(param1:Object):void
         {
            LoginByHashModel.clientFacade = IEntranceClientFacade(param1);
         },function():IEntranceClientFacade
         {
            return LoginByHashModel.clientFacade;
         });
         osgi.injectService(IStorageService,function(param1:Object):void
         {
            LoginByHashModel.storageService = IStorageService(param1);
         },function():IStorageService
         {
            return LoginByHashModel.storageService;
         });
         osgi.injectService(IDialogsService,function(param1:Object):void
         {
            NewsShowingModel.dialogsService = IDialogsService(param1);
         },function():IDialogsService
         {
            return NewsShowingModel.dialogsService;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            NewsShowingModel.display = IDisplay(param1);
         },function():IDisplay
         {
            return NewsShowingModel.display;
         });
         osgi.injectService(IHelpService,function(param1:Object):void
         {
            Renamed567.helpService = IHelpService(param1);
         },function():IHelpService
         {
            return Renamed567.helpService;
         });
         osgi.injectService(IClientLog,function(param1:Object):void
         {
            Renamed567.clientLog = IClientLog(param1);
         },function():IClientLog
         {
            return Renamed567.clientLog;
         });
         osgi.injectService(ModelRegistry,function(param1:Object):void
         {
            Renamed567.modelRegister = ModelRegistry(param1);
         },function():ModelRegistry
         {
            return Renamed567.modelRegister;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed567.display = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed567.display;
         });
         osgi.injectService(ISettingsService,function(param1:Object):void
         {
            Renamed567.settingsService = ISettingsService(param1);
         },function():ISettingsService
         {
            return Renamed567.settingsService;
         });
         osgi.injectService(ILobbyLayoutService,function(param1:Object):void
         {
            Renamed567.lobbyLayoutService = ILobbyLayoutService(param1);
         },function():ILobbyLayoutService
         {
            return Renamed567.lobbyLayoutService;
         });
         osgi.injectService(IPartnerService,function(param1:Object):void
         {
            Renamed567.partnersService = IPartnerService(param1);
         },function():IPartnerService
         {
            return Renamed567.partnersService;
         });
         osgi.injectService(IPanelView,function(param1:Object):void
         {
            Renamed567.panelView = IPanelView(param1);
         },function():IPanelView
         {
            return Renamed567.panelView;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            CongratulationsWindowPresent.display = IDisplay(param1);
         },function():IDisplay
         {
            return CongratulationsWindowPresent.display;
         });
         osgi.injectService(IDialogsService,function(param1:Object):void
         {
            CongratulationsWindowPresent.dialogsService = IDialogsService(param1);
         },function():IDialogsService
         {
            return CongratulationsWindowPresent.dialogsService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            CongratulationsWindowPresent.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return CongratulationsWindowPresent.localeService;
         });
         osgi.injectService(IAchievementService,function(param1:Object):void
         {
            AchievementModel.achievementService = IAchievementService(param1);
         },function():IAchievementService
         {
            return AchievementModel.achievementService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            RankUpSupplyBonusAlert.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return RankUpSupplyBonusAlert.localeService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            BattleFinishNotification.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return BattleFinishNotification.localeService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            ErrorNotification.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return ErrorNotification.localeService;
         });
         osgi.injectService(AddressService,function(param1:Object):void
         {
            ErrorNotification.addressService = AddressService(param1);
         },function():AddressService
         {
            return ErrorNotification.addressService;
         });
         osgi.injectService(IStorageService,function(param1:Object):void
         {
            BattleLinkActivatorService.storageService = IStorageService(param1);
         },function():IStorageService
         {
            return BattleLinkActivatorService.storageService;
         });
         osgi.injectService(IBattleInfoService,function(param1:Object):void
         {
            BattleLinkActivatorService.battleInfoService = IBattleInfoService(param1);
         },function():IBattleInfoService
         {
            return BattleLinkActivatorService.battleInfoService;
         });
         osgi.injectService(IUserPropertiesService,function(param1:Object):void
         {
            BattleLinkActivatorService.userPropertyService = IUserPropertiesService(param1);
         },function():IUserPropertiesService
         {
            return BattleLinkActivatorService.userPropertyService;
         });
         osgi.injectService(IAlertService,function(param1:Object):void
         {
            BattleLinkActivatorService.alertService = IAlertService(param1);
         },function():IAlertService
         {
            return BattleLinkActivatorService.alertService;
         });
         osgi.injectService(ILobbyLayoutService,function(param1:Object):void
         {
            BattleLinkActivatorService.lobbyLayoutService = ILobbyLayoutService(param1);
         },function():ILobbyLayoutService
         {
            return BattleLinkActivatorService.lobbyLayoutService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            BattleLinkActivatorService.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return BattleLinkActivatorService.localeService;
         });
         osgi.injectService(IDialogWindowsDispatcherService,function(param1:Object):void
         {
            BattleLinkActivatorService.dialogWindowsDispatcherService = IDialogWindowsDispatcherService(param1);
         },function():IDialogWindowsDispatcherService
         {
            return BattleLinkActivatorService.dialogWindowsDispatcherService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            BuyCrystalsAlert.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return BuyCrystalsAlert.localeService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            BonusItemsShowingModel.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return BonusItemsShowingModel.localeService;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            BonusItemsShowingModel.display = IDisplay(param1);
         },function():IDisplay
         {
            return BonusItemsShowingModel.display;
         });
         osgi.injectService(ResourceRegistry,function(param1:Object):void
         {
            BonusItemsShowingModel.resourceRegistry = ResourceRegistry(param1);
         },function():ResourceRegistry
         {
            return BonusItemsShowingModel.resourceRegistry;
         });
         osgi.injectService(ModelRegistry,function(param1:Object):void
         {
            BonusItemsShowingModel.modelRegister = ModelRegistry(param1);
         },function():ModelRegistry
         {
            return BonusItemsShowingModel.modelRegister;
         });
         osgi.injectService(IDialogsService,function(param1:Object):void
         {
            BonusItemsShowingModel.dialogsService = IDialogsService(param1);
         },function():IDialogsService
         {
            return BonusItemsShowingModel.dialogsService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            CongratulationsWindowWithBanner.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return CongratulationsWindowWithBanner.localeService;
         });
         osgi.injectService(AddressService,function(param1:Object):void
         {
            ErrorForm.addressService = AddressService(param1);
         },function():AddressService
         {
            return ErrorForm.addressService;
         });
         osgi.injectService(IStorageService,function(param1:Object):void
         {
            BattleLinkActivatorService.storageService = IStorageService(param1);
         },function():IStorageService
         {
            return BattleLinkActivatorService.storageService;
         });
         osgi.injectService(IBattleInfoService,function(param1:Object):void
         {
            BattleLinkActivatorService.battleInfoService = IBattleInfoService(param1);
         },function():IBattleInfoService
         {
            return BattleLinkActivatorService.battleInfoService;
         });
         osgi.injectService(IUserPropertiesService,function(param1:Object):void
         {
            BattleLinkActivatorService.userPropertyService = IUserPropertiesService(param1);
         },function():IUserPropertiesService
         {
            return BattleLinkActivatorService.userPropertyService;
         });
         osgi.injectService(IAlertService,function(param1:Object):void
         {
            BattleLinkActivatorService.alertService = IAlertService(param1);
         },function():IAlertService
         {
            return BattleLinkActivatorService.alertService;
         });
         osgi.injectService(ILobbyLayoutService,function(param1:Object):void
         {
            BattleLinkActivatorService.lobbyLayoutService = ILobbyLayoutService(param1);
         },function():ILobbyLayoutService
         {
            return BattleLinkActivatorService.lobbyLayoutService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            BattleLinkActivatorService.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return BattleLinkActivatorService.localeService;
         });
         osgi.injectService(IDialogWindowsDispatcherService,function(param1:Object):void
         {
            BattleLinkActivatorService.dialogWindowsDispatcherService = IDialogWindowsDispatcherService(param1);
         },function():IDialogWindowsDispatcherService
         {
            return BattleLinkActivatorService.dialogWindowsDispatcherService;
         });
         osgi.injectService(IDialogsService,function(param1:Object):void
         {
            DonationAlertModel.dialogsService = IDialogsService(param1);
         },function():IDialogsService
         {
            return DonationAlertModel.dialogsService;
         });
         osgi.injectService(IAlertService,function(param1:Object):void
         {
            DonationAlertModel.alertService = IAlertService(param1);
         },function():IAlertService
         {
            return DonationAlertModel.alertService;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            DonationAlertModel.display = IDisplay(param1);
         },function():IDisplay
         {
            return DonationAlertModel.display;
         });
         osgi.injectService(ITrackerService,function(param1:Object):void
         {
            DonationAlertModel.trackerService = ITrackerService(param1);
         },function():ITrackerService
         {
            return DonationAlertModel.trackerService;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed570.Renamed3672 = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed570.Renamed3672;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            FreeUidsForm.display = IDisplay(param1);
         },function():IDisplay
         {
            return FreeUidsForm.display;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            FreeUidsForm.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return FreeUidsForm.localeService;
         });
         osgi.injectService(IBattleLinkActivatorService,function(param1:Object):void
         {
            FriendsAcceptedListRenderer.battleLinkActivatorService = IBattleLinkActivatorService(param1);
         },function():IBattleLinkActivatorService
         {
            return FriendsAcceptedListRenderer.battleLinkActivatorService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            FriendsAcceptedListRenderer.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return FriendsAcceptedListRenderer.localeService;
         });
         osgi.injectService(IContextMenuService,function(param1:Object):void
         {
            FriendsAcceptedListRenderer.contextMenuService = IContextMenuService(param1);
         },function():IContextMenuService
         {
            return FriendsAcceptedListRenderer.contextMenuService;
         });
         osgi.injectService(IUserPropertiesService,function(param1:Object):void
         {
            FriendsAcceptedListRenderer.userPropertiesService = IUserPropertiesService(param1);
         },function():IUserPropertiesService
         {
            return FriendsAcceptedListRenderer.userPropertiesService;
         });
         osgi.injectService(IFriendInfoService,function(param1:Object):void
         {
            FriendsDataProvider.friendInfoService = IFriendInfoService(param1);
         },function():IFriendInfoService
         {
            return FriendsDataProvider.friendInfoService;
         });
         osgi.injectService(IUserInfoService,function(param1:Object):void
         {
            FriendsDataProvider.userInfoService = IUserInfoService(param1);
         },function():IUserInfoService
         {
            return FriendsDataProvider.userInfoService;
         });
         osgi.injectService(IBattleInfoService,function(param1:Object):void
         {
            FriendsDataProvider.battleInfoService = IBattleInfoService(param1);
         },function():IBattleInfoService
         {
            return FriendsDataProvider.battleInfoService;
         });
         osgi.injectService(IUserPropertiesService,function(param1:Object):void
         {
            FriendsDataProvider.userPropertiesService = IUserPropertiesService(param1);
         },function():IUserPropertiesService
         {
            return FriendsDataProvider.userPropertiesService;
         });
         osgi.injectService(IPartnerService,function(param1:Object):void
         {
            FriendsDataProvider.partnerService = IPartnerService(param1);
         },function():IPartnerService
         {
            return FriendsDataProvider.partnerService;
         });
         osgi.injectService(IContextMenuService,function(param1:Object):void
         {
            FriendsIncomingListRenderer.contextMenuService = IContextMenuService(param1);
         },function():IContextMenuService
         {
            return FriendsIncomingListRenderer.contextMenuService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            FriendsIncomingListRenderer.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return FriendsIncomingListRenderer.localeService;
         });
         osgi.injectService(ISettingsService,function(param1:Object):void
         {
            SettingsModel.settingsService = ISettingsService(param1);
         },function():ISettingsService
         {
            return SettingsModel.settingsService;
         });
         osgi.injectService(IPanelView,function(param1:Object):void
         {
            SettingsModel.panelView = IPanelView(param1);
         },function():IPanelView
         {
            return SettingsModel.panelView;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            SettingsModel.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return SettingsModel.localeService;
         });
         osgi.injectService(IBattleInviteService,function(param1:Object):void
         {
            SettingsModel.battleInviteService = IBattleInviteService(param1);
         },function():IBattleInviteService
         {
            return SettingsModel.battleInviteService;
         });
         osgi.injectService(IAlertService,function(param1:Object):void
         {
            SettingsModel.alertService = IAlertService(param1);
         },function():IAlertService
         {
            return SettingsModel.alertService;
         });
         osgi.injectService(FullscreenService,function(param1:Object):void
         {
            SettingsModel.fullscreenService = FullscreenService(param1);
         },function():FullscreenService
         {
            return SettingsModel.fullscreenService;
         });
         osgi.injectService(PasswordService,function(param1:Object):void
         {
            SettingsModel.Renamed2181 = PasswordService(param1);
         },function():PasswordService
         {
            return SettingsModel.Renamed2181;
         });
         osgi.injectService(IStorageService,function(param1:Object):void
         {
            Renamed574.storageService = IStorageService(param1);
         },function():IStorageService
         {
            return Renamed574.storageService;
         });
         osgi.injectService(IBattleInviteService,function(param1:Object):void
         {
            Renamed574.battleInviteService = IBattleInviteService(param1);
         },function():IBattleInviteService
         {
            return Renamed574.battleInviteService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed1969.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed1969.localeService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            SettingsWindow.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return SettingsWindow.localeService;
         });
         osgi.injectService(IHelpService,function(param1:Object):void
         {
            SettingsWindow.helperService = IHelpService(param1);
         },function():IHelpService
         {
            return SettingsWindow.helperService;
         });
         osgi.injectService(IPartnerService,function(param1:Object):void
         {
            SettingsWindow.partnersService = IPartnerService(param1);
         },function():IPartnerService
         {
            return SettingsWindow.partnersService;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed1962.display = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed1962.display;
         });
         osgi.injectService(IPartnerService,function(param1:Object):void
         {
            Renamed1962.partnersService = IPartnerService(param1);
         },function():IPartnerService
         {
            return Renamed1962.partnersService;
         });
         osgi.injectService(ISocialNetworkPanelService,function(param1:Object):void
         {
            Renamed1962.socialNetworkService = ISocialNetworkPanelService(param1);
         },function():ISocialNetworkPanelService
         {
            return Renamed1962.socialNetworkService;
         });
         osgi.injectService(IExternalEntranceService,function(param1:Object):void
         {
            Renamed1962.Renamed3564 = IExternalEntranceService(param1);
         },function():IExternalEntranceService
         {
            return Renamed1962.Renamed3564;
         });
         osgi.injectService(IValidateService,function(param1:Object):void
         {
            Renamed1962.validateService = IValidateService(param1);
         },function():IValidateService
         {
            return Renamed1962.validateService;
         });
         osgi.injectService(IHelpService,function(param1:Object):void
         {
            Renamed1962.helperService = IHelpService(param1);
         },function():IHelpService
         {
            return Renamed1962.helperService;
         });
         osgi.injectService(ISettingsService,function(param1:Object):void
         {
            Renamed1961.settingsService = ISettingsService(param1);
         },function():ISettingsService
         {
            return Renamed1961.settingsService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed1961.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed1961.localeService;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed4797.display = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed4797.display;
         });
         osgi.injectService(KeysBindingService,function(param1:Object):void
         {
            Renamed4824.Renamed719 = KeysBindingService(param1);
         },function():KeysBindingService
         {
            return Renamed4824.Renamed719;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed4824.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed4824.localeService;
         });
         osgi.injectService(FullscreenService,function(param1:Object):void
         {
            Renamed1964.Renamed3844 = FullscreenService(param1);
         },function():FullscreenService
         {
            return Renamed1964.Renamed3844;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed1964.display = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed1964.display;
         });
         osgi.injectService(KeysBindingService,function(param1:Object):void
         {
            Renamed4825.Renamed719 = KeysBindingService(param1);
         },function():KeysBindingService
         {
            return Renamed4825.Renamed719;
         });
         osgi.injectService(IBattleInviteService,function(param1:Object):void
         {
            Renamed1963.battleInviteService = IBattleInviteService(param1);
         },function():IBattleInviteService
         {
            return Renamed1963.battleInviteService;
         });
         osgi.injectService(IPanelView,function(param1:Object):void
         {
            PanelModel.panelView = IPanelView(param1);
         },function():IPanelView
         {
            return PanelModel.panelView;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            PanelModel.display = IDisplay(param1);
         },function():IDisplay
         {
            return PanelModel.display;
         });
         osgi.injectService(IHelpService,function(param1:Object):void
         {
            PanelModel.helpService = IHelpService(param1);
         },function():IHelpService
         {
            return PanelModel.helpService;
         });
         osgi.injectService(ILobbyLayoutService,function(param1:Object):void
         {
            PanelModel.lobbyLayoutService = ILobbyLayoutService(param1);
         },function():ILobbyLayoutService
         {
            return PanelModel.lobbyLayoutService;
         });
         osgi.injectService(IAchievementService,function(param1:Object):void
         {
            PanelModel.achievementService = IAchievementService(param1);
         },function():IAchievementService
         {
            return PanelModel.achievementService;
         });
         osgi.injectService(IBattleInfoService,function(param1:Object):void
         {
            PanelModel.battleInfoService = IBattleInfoService(param1);
         },function():IBattleInfoService
         {
            return PanelModel.battleInfoService;
         });
         osgi.injectService(IAlertService,function(param1:Object):void
         {
            PanelModel.alertService = IAlertService(param1);
         },function():IAlertService
         {
            return PanelModel.alertService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            PanelModel.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return PanelModel.localeService;
         });
         osgi.injectService(DailyQuestNotifierService,function(param1:Object):void
         {
            Renamed4810.Renamed4827 = DailyQuestNotifierService(param1);
         },function():DailyQuestNotifierService
         {
            return Renamed4810.Renamed4827;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed4814.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed4814.localeService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed4812.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed4812.localeService;
         });
         osgi.injectService(IMoneyService,function(param1:Object):void
         {
            Renamed4812.moneyService = IMoneyService(param1);
         },function():IMoneyService
         {
            return Renamed4812.moneyService;
         });
         osgi.injectService(DailyQuestNotifierService,function(param1:Object):void
         {
            Renamed4812.Renamed3661 = DailyQuestNotifierService(param1);
         },function():DailyQuestNotifierService
         {
            return Renamed4812.Renamed3661;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed4811.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed4811.localeService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed4813.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed4813.localeService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed4803.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed4803.localeService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed4804.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed4804.localeService;
         });
         osgi.injectService(IMoneyService,function(param1:Object):void
         {
            Renamed4804.moneyService = IMoneyService(param1);
         },function():IMoneyService
         {
            return Renamed4804.moneyService;
         });
         osgi.injectService(DailyQuestNotifierService,function(param1:Object):void
         {
            Renamed3660.Renamed3661 = DailyQuestNotifierService(param1);
         },function():DailyQuestNotifierService
         {
            return Renamed3660.Renamed3661;
         });
         osgi.injectService(IPanelView,function(param1:Object):void
         {
            Renamed4821.panelView = IPanelView(param1);
         },function():IPanelView
         {
            return Renamed4821.panelView;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed1907.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed1907.localeService;
         });
         osgi.injectService(IFriendActionService,function(param1:Object):void
         {
            AddRequestView.friendsActionService = IFriendActionService(param1);
         },function():IFriendActionService
         {
            return AddRequestView.friendsActionService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            AddRequestView.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return AddRequestView.localeService;
         });
         osgi.injectService(IAlertService,function(param1:Object):void
         {
            AddRequestView.alertService = IAlertService(param1);
         },function():IAlertService
         {
            return AddRequestView.alertService;
         });
         osgi.injectService(IDialogWindowsDispatcherService,function(param1:Object):void
         {
            AddRequestView.dialogWindowsDispatcherService = IDialogWindowsDispatcherService(param1);
         },function():IDialogWindowsDispatcherService
         {
            return AddRequestView.dialogWindowsDispatcherService;
         });
         osgi.injectService(IBlurService,function(param1:Object):void
         {
            AddRequestView.blurService = IBlurService(param1);
         },function():IBlurService
         {
            return AddRequestView.blurService;
         });
         osgi.injectService(IUserPropertiesService,function(param1:Object):void
         {
            AddRequestView.userPropertiesService = IUserPropertiesService(param1);
         },function():IUserPropertiesService
         {
            return AddRequestView.userPropertiesService;
         });
         osgi.injectService(IContextMenuService,function(param1:Object):void
         {
            FriendsOutgoingListRenderer.contextMenuService = IContextMenuService(param1);
         },function():IContextMenuService
         {
            return FriendsOutgoingListRenderer.contextMenuService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            FriendsWindow.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return FriendsWindow.localeService;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            FriendsWindow.display = IDisplay(param1);
         },function():IDisplay
         {
            return FriendsWindow.display;
         });
         osgi.injectService(IDialogWindowsDispatcherService,function(param1:Object):void
         {
            FriendsWindow.dialogWindowsDispatcherService = IDialogWindowsDispatcherService(param1);
         },function():IDialogWindowsDispatcherService
         {
            return FriendsWindow.dialogWindowsDispatcherService;
         });
         osgi.injectService(IBattleLinkActivatorService,function(param1:Object):void
         {
            FriendsWindow.battleLinkActivatorService = IBattleLinkActivatorService(param1);
         },function():IBattleLinkActivatorService
         {
            return FriendsWindow.battleLinkActivatorService;
         });
         osgi.injectService(IFriendInfoService,function(param1:Object):void
         {
            FriendsWindow.friendInfoService = IFriendInfoService(param1);
         },function():IFriendInfoService
         {
            return FriendsWindow.friendInfoService;
         });
         osgi.injectService(IFriendActionService,function(param1:Object):void
         {
            FriendsWindow.friendsActionService = IFriendActionService(param1);
         },function():IFriendActionService
         {
            return FriendsWindow.friendsActionService;
         });
         osgi.injectService(IAlertService,function(param1:Object):void
         {
            FriendsWindow.alertService = IAlertService(param1);
         },function():IAlertService
         {
            return FriendsWindow.alertService;
         });
         osgi.injectService(IBlurService,function(param1:Object):void
         {
            FriendsWindow.blurService = IBlurService(param1);
         },function():IBlurService
         {
            return FriendsWindow.blurService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            HeaderAcceptedList.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return HeaderAcceptedList.localeService;
         });
         osgi.injectService(IPartnerService,function(param1:Object):void
         {
            HeaderAcceptedList.partnersService = IPartnerService(param1);
         },function():IPartnerService
         {
            return HeaderAcceptedList.partnersService;
         });
         osgi.injectService(IFriendInfoService,function(param1:Object):void
         {
            IncomingList.friendInfoService = IFriendInfoService(param1);
         },function():IFriendInfoService
         {
            return IncomingList.friendInfoService;
         });
         osgi.injectService(IContextMenuService,function(param1:Object):void
         {
            IncomingList.contextMenuService = IContextMenuService(param1);
         },function():IContextMenuService
         {
            return IncomingList.contextMenuService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            ItemsAlert.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return ItemsAlert.localeService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed3769.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed3769.localeService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            NewPresentsAlert.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return NewPresentsAlert.localeService;
         });
         osgi.injectService(INotificationGarageCategoriesService,function(param1:Object):void
         {
            NewPresentsShowingModel.notificationGarageCategoriesService = INotificationGarageCategoriesService(param1);
         },function():INotificationGarageCategoriesService
         {
            return NewPresentsShowingModel.notificationGarageCategoriesService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            NewsAlertWindow.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return NewsAlertWindow.localeService;
         });
         osgi.injectService(IFriendInfoService,function(param1:Object):void
         {
            OutgoingList.friendInfoService = IFriendInfoService(param1);
         },function():IFriendInfoService
         {
            return OutgoingList.friendInfoService;
         });
         osgi.injectService(IContextMenuService,function(param1:Object):void
         {
            OutgoingList.contextMenuService = IContextMenuService(param1);
         },function():IContextMenuService
         {
            return OutgoingList.contextMenuService;
         });
         osgi.injectService(ResourceRegistry,function(param1:Object):void
         {
            RepatriateBonusWindow.resourceService = ResourceRegistry(param1);
         },function():ResourceRegistry
         {
            return RepatriateBonusWindow.resourceService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            RepatriateBonusWindow.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return RepatriateBonusWindow.localeService;
         });
         osgi.injectService(IClientLog,function(param1:Object):void
         {
            RepatriateBonusWindow.clientLog = IClientLog(param1);
         },function():IClientLog
         {
            return RepatriateBonusWindow.clientLog;
         });
         osgi.injectService(ISocialNetworkPanelService,function(param1:Object):void
         {
            SocialNetworkPanelModel.socialNetworkService = ISocialNetworkPanelService(param1);
         },function():ISocialNetworkPanelService
         {
            return SocialNetworkPanelModel.socialNetworkService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            SocialNetworkPanelModel.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return SocialNetworkPanelModel.localeService;
         });
         osgi.injectService(IAlertService,function(param1:Object):void
         {
            SocialNetworkPanelModel.alertService = IAlertService(param1);
         },function():IAlertService
         {
            return SocialNetworkPanelModel.alertService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            ThanksForPurchaseWindow.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return ThanksForPurchaseWindow.localeService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            TimeFormatter.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return TimeFormatter.localeService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed4806.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed4806.localeService;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed2217.display = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed2217.display;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed2217.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed2217.localeService;
         });
         osgi.injectService(IValidateService,function(param1:Object):void
         {
            Renamed2217.validateService = IValidateService(param1);
         },function():IValidateService
         {
            return Renamed2217.validateService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed4799.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed4799.localeService;
         });
         osgi.injectService(NewbieUserService,function(param1:Object):void
         {
            Renamed4799.Renamed4828 = NewbieUserService(param1);
         },function():NewbieUserService
         {
            return Renamed4799.Renamed4828;
         });
         osgi.injectService(ILobbyLayoutService,function(param1:Object):void
         {
            Renamed4802.lobbyLayoutService = ILobbyLayoutService(param1);
         },function():ILobbyLayoutService
         {
            return Renamed4802.lobbyLayoutService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed2024.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed2024.localeService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            CrystalPackageItem.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return CrystalPackageItem.localeService;
         });
         osgi.injectService(ITimeUnitService,function(param1:Object):void
         {
            CrystalPackageItem.Renamed2271 = ITimeUnitService(param1);
         },function():ITimeUnitService
         {
            return CrystalPackageItem.Renamed2271;
         });
         osgi.injectService(ITimeUnitService,function(param1:Object):void
         {
            PremiumPackageItem.Renamed2271 = ITimeUnitService(param1);
         },function():ITimeUnitService
         {
            return PremiumPackageItem.Renamed2271;
         });
         osgi.injectService(CountryService,function(param1:Object):void
         {
            Renamed4798.Renamed2243 = CountryService(param1);
         },function():CountryService
         {
            return Renamed4798.Renamed2243;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed4798.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed4798.localeService;
         });
         osgi.injectService(CountryService,function(param1:Object):void
         {
            Renamed4826.Renamed2243 = CountryService(param1);
         },function():CountryService
         {
            return Renamed4826.Renamed2243;
         });
         osgi.injectService(ILobbyLayoutService,function(param1:Object):void
         {
            Renamed4826.lobbyLayoutService = ILobbyLayoutService(param1);
         },function():ILobbyLayoutService
         {
            return Renamed4826.lobbyLayoutService;
         });
         osgi.injectService(CountryService,function(param1:Object):void
         {
            Renamed2239.Renamed2243 = CountryService(param1);
         },function():CountryService
         {
            return Renamed2239.Renamed2243;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed2239.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed2239.localeService;
         });
         osgi.injectService(ILobbyLayoutService,function(param1:Object):void
         {
            Renamed2239.lobbyLayoutService = ILobbyLayoutService(param1);
         },function():ILobbyLayoutService
         {
            return Renamed2239.lobbyLayoutService;
         });
         osgi.injectService(ModelRegistry,function(param1:Object):void
         {
            Renamed4807.modelRegister = ModelRegistry(param1);
         },function():ModelRegistry
         {
            return Renamed4807.modelRegister;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            Renamed4807.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return Renamed4807.localeService;
         });
         osgi.injectService(IDialogsService,function(param1:Object):void
         {
            Renamed4807.dialogService = IDialogsService(param1);
         },function():IDialogsService
         {
            return Renamed4807.dialogService;
         });
         osgi.injectService(IPanelView,function(param1:Object):void
         {
            Renamed4807.panelView = IPanelView(param1);
         },function():IPanelView
         {
            return Renamed4807.panelView;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            Renamed4807.display = IDisplay(param1);
         },function():IDisplay
         {
            return Renamed4807.display;
         });
         osgi.injectService(IDialogWindowsDispatcherService,function(param1:Object):void
         {
            Renamed4807.dialogWindowsDispatcherService = IDialogWindowsDispatcherService(param1);
         },function():IDialogWindowsDispatcherService
         {
            return Renamed4807.dialogWindowsDispatcherService;
         });
         osgi.injectService(IUserPropertiesService,function(param1:Object):void
         {
            Renamed4807.userPropertiesService = IUserPropertiesService(param1);
         },function():IUserPropertiesService
         {
            return Renamed4807.userPropertiesService;
         });
         osgi.injectService(ILocaleService,function(param1:Object):void
         {
            ReferralWindow.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return ReferralWindow.localeService;
         });
         modelRegister = osgi.getService(ModelRegistry) as ModelRegistry;
         modelRegisterAdapt = osgi.getService(ModelRegistry) as ModelRegistry;
         modelRegister.add(new AvailableItemsModel(),Vector.<Class>([Renamed2113]));
         modelRegister.add(new NewsShowingModel(),Vector.<Class>([INewsShowingModelBase,IObjectLoadListener]));
         modelRegisterAdapt.registerAdapt(News,NewsAdapt);
         modelRegisterAdapt.registerEvents(News,NewsEvents);
         modelRegister.add(new NewsItemModel(),Vector.<Class>([INewsItemModelBase,News]));
         modelRegister.register(Long.getLong(0,300050051),Long.getLong(0,300050031));
         modelRegister.add(new AchievementModel(),Vector.<Class>([Renamed2074,IAchievement,IObjectLoadListener]));
         modelRegister.add(new RankUpSupplyBonusModel(),Vector.<Class>([IRankUpSupplyBonusModelBase]));
         modelRegister.add(new BonusInfoModel(),Vector.<Class>([IBonusInfoModelBase,BonusInfo]));
         modelRegisterAdapt.registerAdapt(BonusInfo,BonusInfoAdapt);
         modelRegisterAdapt.registerEvents(BonusInfo,BonusInfoEvents);
         modelRegister.add(new BonusItemsShowingModel(),Vector.<Class>([IBonusItemsShowingModelBase,IObjectLoadListener]));
         modelRegister.add(new BonusItemModel(),Vector.<Class>([IBonusItemModelBase,BonusItem]));
         modelRegisterAdapt.registerAdapt(BonusItem,BonusItemAdapt);
         modelRegisterAdapt.registerEvents(BonusItem,BonusItemEvents);
         modelRegister.add(new BonusImageShowingModel(),Vector.<Class>([IBonusImageShowingModelBase,IObjectLoadListener]));
         modelRegister.add(new Renamed3660(),Vector.<Class>([Renamed3659,ObjectLoadPostListener,ObjectUnloadPostListener]));
         modelRegisterAdapt.registerAdapt(Renamed4817,Renamed4820);
         modelRegisterAdapt.registerEvents(Renamed4817,Renamed4818);
         modelRegister.add(new Renamed4819(),Vector.<Class>([Renamed4351,Renamed4817]));
         modelRegister.add(new Renamed4821(),Vector.<Class>([Renamed4809,ObjectLoadPostListener,ObjectUnloadPostListener]));
         modelRegister.add(new Renamed4822(),Vector.<Class>([Renamed4815]));
         modelRegister.add(new PanelModel(),Vector.<Class>([Renamed2155,IObjectLoadListener]));
         modelRegister.add(new PremiumAccountAlertModel(),Vector.<Class>([Renamed2168,ObjectLoadListener,ObjectUnloadListener]));
         modelRegister.add(new UserPropertiesModel(),Vector.<Class>([IUserPropertyModelBase,IObjectLoadListener,IUserProperties]));
         modelRegisterAdapt.registerAdapt(IUserProperties,Renamed2299);
         modelRegisterAdapt.registerEvents(IUserProperties,Renamed2298);
         modelRegister.add(new SettingsModel(),Vector.<Class>([Renamed2175,IObjectLoadListener]));
         modelRegister.add(new FriendsLoaderModel(),Vector.<Class>([Renamed2088,ObjectLoadPostListener,ObjectUnloadListener]));
         modelRegister.add(new SocialNetworkPanelModel(),Vector.<Class>([Renamed2275,ObjectLoadListener,ObjectUnloadListener]));
         modelRegister.add(new UserEmailAndPasswordModel(),Vector.<Class>([Renamed2282,IUserEmailAndPassword,IObjectLoadListener]));
         modelRegisterAdapt.registerAdapt(IUserEmailAndPassword,Renamed2296);
         modelRegisterAdapt.registerEvents(IUserEmailAndPassword,Renamed2297);
         modelRegister.add(new NewPresentsShowingModel(),Vector.<Class>([Renamed2171]));
         modelRegister.add(new DonationAlertModel(),Vector.<Class>([Renamed2083]));
         modelRegister.add(new BattleInviteModel(),Vector.<Class>([Renamed2084,ObjectLoadListener,ObjectUnloadListener]));
         modelRegister.add(new Renamed4802(),Vector.<Class>([Renamed4801,ObjectUnloadListener]));
         modelRegister.add(new Renamed4826(),Vector.<Class>([Renamed4816,ObjectLoadListener,ObjectUnloadListener]));
         modelRegister.add(new Renamed4807(),Vector.<Class>([Renamed4823,IObjectLoadListener]));
      }
      
      public function stop(param1:OSGi) : void
      {
      }
   }
}

