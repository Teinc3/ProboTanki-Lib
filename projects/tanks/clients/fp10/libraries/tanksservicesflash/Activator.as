package projects.tanks.clients.fp10.libraries.tanksservicesflash
{
   import § !a§.§+!P§;
   import §,"i§.§static var get§;
   import §7!S§.§#!d§;
   import §9v§.§do var finally§;
   import §?"O§.§return const super§;
   import §^"!§.§#!?§;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.osgi.service.logging.LogService;
   import alternativa.tanks.gui.friends.list.FriendsList;
   import alternativa.tanks.help.IHelpService;
   import alternativa.tanks.loader.ILoaderWindowService;
   import alternativa.tanks.model.friends.loader.FriendsLoaderModel;
   import alternativa.tanks.newbieservice.§^#-§;
   import §implements const catch§.§case catch return§;
   import §import implements§.§#"Y§;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.fp10.core.registry.ModelRegistry;
   import projects.tanks.client.tanksservices.model.notifier.battle.§85§;
   import projects.tanks.client.tanksservices.model.notifier.online.§4"q§;
   import projects.tanks.client.tanksservices.model.notifier.premium.IPremiumNotifierModelBase;
   import projects.tanks.client.tanksservices.model.notifier.rank.§set var include§;
   import projects.tanks.client.tanksservices.model.notifier.uid.§<!o§;
   import projects.tanks.client.users.model.friends.§0U§;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.§;#W§;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.FriendsModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.IFriends;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.UserRefresh;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.§^"Q§;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.§else const with§;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.accepted.FriendsAcceptedModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.acceptednotificator.FriendsAcceptedNotificatorModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.incoming.FriendsIncomingModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.incomingnotificator.FriendsIncomingNotificatorModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.outgoing.FriendsOutgoingModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.listener.UserNotifier;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.listener.UserNotifierModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.listener.§case const finally§;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.listener.§false set finally§;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.battle.BattleLinkData;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.battle.BattleNotifierModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.online.OnlineNotifierModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.premium.PremiumNotifierModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.rank.RankNotifierModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.uid.UidNotifierModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.§true catch false§;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.uidcheck.UidCheckModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.uidcheck.UidCheckService;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.uidcheck.UidCheckServiceAdapt;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.uidcheck.UidCheckServiceEvents;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.blockuser.BlockUserService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.blur.BlurService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.blur.IBlurService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.DialogsService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.IDialogsService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.gui.DialogWindow;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.IDialogWindowsDispatcherService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendActionService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.battleinvite.BattleInviteService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.battleinvite.IBattleInviteService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.fullscreen.FullscreenStateService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.notifier.battle.IBattleNotifierService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.notifier.online.IOnlineNotifierService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.premium.PremiumService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.UserInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.AlertUtils;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.BattleFormatUtil;
   import services.buttonbar.IButtonBarService;
   import §static var throw§.§="o§;
   
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
            BattleFormatUtil.localeService = ILocaleService(param1);
         },function():ILocaleService
         {
            return BattleFormatUtil.localeService;
         });
         osgi.injectService(PremiumService,function(param1:Object):void
         {
            UserInfoService.premiumService = PremiumService(param1);
         },function():PremiumService
         {
            return UserInfoService.premiumService;
         });
         osgi.injectService(IFriendInfoService,function(param1:Object):void
         {
            BattleInviteService.friendInfoService = IFriendInfoService(param1);
         },function():IFriendInfoService
         {
            return BattleInviteService.friendInfoService;
         });
         osgi.injectService(IBattleInfoService,function(param1:Object):void
         {
            BattleInviteService.battleInfoService = IBattleInfoService(param1);
         },function():IBattleInfoService
         {
            return BattleInviteService.battleInfoService;
         });
         osgi.injectService(IHelpService,function(param1:Object):void
         {
            BlurService.helperService = IHelpService(param1);
         },function():IHelpService
         {
            return BlurService.helperService;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            DialogsService.display = IDisplay(param1);
         },function():IDisplay
         {
            return DialogsService.display;
         });
         osgi.injectService(IBlurService,function(param1:Object):void
         {
            DialogsService.blurService = IBlurService(param1);
         },function():IBlurService
         {
            return DialogsService.blurService;
         });
         osgi.injectService(IDialogWindowsDispatcherService,function(param1:Object):void
         {
            DialogsService.dialogWindowsDispatcherService = IDialogWindowsDispatcherService(param1);
         },function():IDialogWindowsDispatcherService
         {
            return DialogsService.dialogWindowsDispatcherService;
         });
         osgi.injectService(ILoaderWindowService,function(param1:Object):void
         {
            DialogsService.loaderWindowService = ILoaderWindowService(param1);
         },function():ILoaderWindowService
         {
            return DialogsService.loaderWindowService;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            DialogWindow.display = IDisplay(param1);
         },function():IDisplay
         {
            return DialogWindow.display;
         });
         osgi.injectService(IDialogsService,function(param1:Object):void
         {
            DialogWindow.dialogService = IDialogsService(param1);
         },function():IDialogsService
         {
            return DialogWindow.dialogService;
         });
         osgi.injectService(IStorageService,function(param1:Object):void
         {
            BlockUserService.storageService = IStorageService(param1);
         },function():IStorageService
         {
            return BlockUserService.storageService;
         });
         osgi.injectService(IUserPropertiesService,function(param1:Object):void
         {
            PremiumNotifierModel.userPropertiesService = IUserPropertiesService(param1);
         },function():IUserPropertiesService
         {
            return PremiumNotifierModel.userPropertiesService;
         });
         osgi.injectService(PremiumService,function(param1:Object):void
         {
            PremiumNotifierModel.premiumService = PremiumService(param1);
         },function():PremiumService
         {
            return PremiumNotifierModel.premiumService;
         });
         osgi.injectService(IUserInfoService,function(param1:Object):void
         {
            PremiumNotifierModel.userInfoService = IUserInfoService(param1);
         },function():IUserInfoService
         {
            return PremiumNotifierModel.userInfoService;
         });
         osgi.injectService(FullscreenStateService,function(param1:Object):void
         {
            AlertUtils.fullscreenStateService = FullscreenStateService(param1);
         },function():FullscreenStateService
         {
            return AlertUtils.fullscreenStateService;
         });
         osgi.injectService(IUserInfoService,function(param1:Object):void
         {
            BattleLinkData.userInfoService = IUserInfoService(param1);
         },function():IUserInfoService
         {
            return BattleLinkData.userInfoService;
         });
         osgi.injectService(IUserPropertiesService,function(param1:Object):void
         {
            BattleLinkData.userPropertiesService = IUserPropertiesService(param1);
         },function():IUserPropertiesService
         {
            return BattleLinkData.userPropertiesService;
         });
         osgi.injectService(IBattleNotifierService,function(param1:Object):void
         {
            BattleNotifierModel.battleNotifierService = IBattleNotifierService(param1);
         },function():IBattleNotifierService
         {
            return BattleNotifierModel.battleNotifierService;
         });
         osgi.injectService(IFriendInfoService,function(param1:Object):void
         {
            FriendsAcceptedModel.friendsInfoService = IFriendInfoService(param1);
         },function():IFriendInfoService
         {
            return FriendsAcceptedModel.friendsInfoService;
         });
         osgi.injectService(LogService,function(param1:Object):void
         {
            FriendsAcceptedNotificatorModel.logService = LogService(param1);
         },function():LogService
         {
            return FriendsAcceptedNotificatorModel.logService;
         });
         osgi.injectService(IFriendInfoService,function(param1:Object):void
         {
            FriendsAcceptedNotificatorModel.friendsInfoService = IFriendInfoService(param1);
         },function():IFriendInfoService
         {
            return FriendsAcceptedNotificatorModel.friendsInfoService;
         });
         osgi.injectService(IFriendInfoService,function(param1:Object):void
         {
            FriendsIncomingModel.friendsInfoService = IFriendInfoService(param1);
         },function():IFriendInfoService
         {
            return FriendsIncomingModel.friendsInfoService;
         });
         osgi.injectService(IFriendInfoService,function(param1:Object):void
         {
            FriendsOutgoingModel.friendsInfoService = IFriendInfoService(param1);
         },function():IFriendInfoService
         {
            return FriendsOutgoingModel.friendsInfoService;
         });
         osgi.injectService(LogService,function(param1:Object):void
         {
            FriendsIncomingNotificatorModel.logService = LogService(param1);
         },function():LogService
         {
            return FriendsIncomingNotificatorModel.logService;
         });
         osgi.injectService(IFriendInfoService,function(param1:Object):void
         {
            FriendsIncomingNotificatorModel.friendsInfoService = IFriendInfoService(param1);
         },function():IFriendInfoService
         {
            return FriendsIncomingNotificatorModel.friendsInfoService;
         });
         osgi.injectService(IFriendInfoService,function(param1:Object):void
         {
            FriendsList.friendInfoService = IFriendInfoService(param1);
         },function():IFriendInfoService
         {
            return FriendsList.friendInfoService;
         });
         osgi.injectService(IUserInfoService,function(param1:Object):void
         {
            FriendsList.userInfoService = IUserInfoService(param1);
         },function():IUserInfoService
         {
            return FriendsList.userInfoService;
         });
         osgi.injectService(IDisplay,function(param1:Object):void
         {
            FriendsLoaderModel.display = IDisplay(param1);
         },function():IDisplay
         {
            return FriendsLoaderModel.display;
         });
         osgi.injectService(IFriendInfoService,function(param1:Object):void
         {
            FriendsLoaderModel.friendInfoService = IFriendInfoService(param1);
         },function():IFriendInfoService
         {
            return FriendsLoaderModel.friendInfoService;
         });
         osgi.injectService(IButtonBarService,function(param1:Object):void
         {
            FriendsLoaderModel.buttonBarService = IButtonBarService(param1);
         },function():IButtonBarService
         {
            return FriendsLoaderModel.buttonBarService;
         });
         osgi.injectService(IFriendActionService,function(param1:Object):void
         {
            FriendsModel.friendsActionService = IFriendActionService(param1);
         },function():IFriendActionService
         {
            return FriendsModel.friendsActionService;
         });
         osgi.injectService(IBattleInviteService,function(param1:Object):void
         {
            §do var finally§.battleInviteService = IBattleInviteService(param1);
         },function():IBattleInviteService
         {
            return §do var finally§.battleInviteService;
         });
         osgi.injectService(IOnlineNotifierService,function(param1:Object):void
         {
            OnlineNotifierModel.onlineNotifierService = IOnlineNotifierService(param1);
         },function():IOnlineNotifierService
         {
            return OnlineNotifierModel.onlineNotifierService;
         });
         osgi.injectService(IUserInfoService,function(param1:Object):void
         {
            UserNotifierModel.userInfoService = IUserInfoService(param1);
         },function():IUserInfoService
         {
            return UserNotifierModel.userInfoService;
         });
         osgi.injectService(IStorageService,function(param1:Object):void
         {
            §^#-§.storageService = IStorageService(param1);
         },function():IStorageService
         {
            return §^#-§.storageService;
         });
         modelRegister = osgi.getService(ModelRegistry) as ModelRegistry;
         modelRegisterAdapt = osgi.getService(ModelRegistry) as ModelRegistry;
         modelRegister.add(new UidCheckModel(),Vector.<Class>([§#!d§,ObjectLoadListener,ObjectUnloadListener,UidCheckService]));
         modelRegisterAdapt.registerAdapt(UidCheckService,UidCheckServiceAdapt);
         modelRegisterAdapt.registerEvents(UidCheckService,UidCheckServiceEvents);
         modelRegister.add(new §do var finally§(),Vector.<Class>([§static var get§,ObjectLoadListener,ObjectUnloadListener]));
         modelRegister.add(new PremiumNotifierModel(),Vector.<Class>([IPremiumNotifierModelBase,ObjectLoadListener,ObjectUnloadListener]));
         modelRegister.add(new FriendsAcceptedNotificatorModel(),Vector.<Class>([§="o§,ObjectLoadListener,ObjectUnloadListener]));
         modelRegister.add(new FriendsIncomingModel(),Vector.<Class>([§#"Y§,ObjectLoadListener]));
         modelRegister.add(new FriendsAcceptedModel(),Vector.<Class>([§#!?§,ObjectLoadListener]));
         modelRegister.add(new FriendsIncomingNotificatorModel(),Vector.<Class>([§+!P§,ObjectLoadListener,ObjectUnloadListener]));
         modelRegister.add(new FriendsOutgoingModel(),Vector.<Class>([§return const super§,ObjectLoadListener]));
         modelRegisterAdapt.registerAdapt(IFriends,§else const with§);
         modelRegisterAdapt.registerEvents(IFriends,§true catch false§);
         modelRegister.add(new FriendsModel(),Vector.<Class>([§0U§,ObjectLoadListener,ObjectUnloadListener,IFriends]));
         modelRegisterAdapt.registerAdapt(UserRefresh,§^"Q§);
         modelRegisterAdapt.registerEvents(UserRefresh,§;#W§);
         modelRegister.add(new RankNotifierModel(),Vector.<Class>([§set var include§,UserRefresh]));
         modelRegister.add(new OnlineNotifierModel(),Vector.<Class>([§4"q§,UserRefresh]));
         modelRegister.add(new UidNotifierModel(),Vector.<Class>([§<!o§,UserRefresh]));
         modelRegister.add(new BattleNotifierModel(),Vector.<Class>([§85§,UserRefresh,ObjectLoadListener,ObjectUnloadListener]));
         modelRegisterAdapt.registerAdapt(UserNotifier,§false set finally§);
         modelRegisterAdapt.registerEvents(UserNotifier,§case const finally§);
         modelRegister.add(new UserNotifierModel(),Vector.<Class>([§case catch return§,UserNotifier,ObjectLoadListener,ObjectUnloadListener]));
      }
      
      public function stop(param1:OSGi) : void
      {
      }
   }
}

