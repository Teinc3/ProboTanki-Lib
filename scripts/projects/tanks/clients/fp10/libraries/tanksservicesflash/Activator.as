package projects.tanks.clients.fp10.libraries.tanksservicesflash
{
   import Renamed135.Renamed4496;
   import Renamed4533.Renamed4534;
   import Renamed265.Renamed4506;
   import Renamed290.Renamed4535;
   import Renamed4498.Renamed4500;
   import Renamed4489.Renamed4490;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.osgi.service.logging.LogService;
   import alternativa.tanks.gui.friends.list.FriendsList;
   import alternativa.tanks.help.IHelpService;
   import alternativa.tanks.loader.ILoaderWindowService;
   import alternativa.tanks.model.friends.loader.FriendsLoaderModel;
   import alternativa.tanks.newbieservice.Renamed583;
   import Renamed386.Renamed4502;
   import Renamed393.Renamed4495;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.fp10.core.registry.ModelRegistry;
   import projects.tanks.client.tanksservices.model.notifier.battle.Renamed4388;
   import projects.tanks.client.tanksservices.model.notifier.online.Renamed4393;
   import projects.tanks.client.tanksservices.model.notifier.premium.IPremiumNotifierModelBase;
   import projects.tanks.client.tanksservices.model.notifier.rank.Renamed4401;
   import projects.tanks.client.tanksservices.model.notifier.uid.Renamed4405;
   import projects.tanks.client.users.model.friends.Renamed4414;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.Renamed4483;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.FriendsModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.IFriends;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.UserRefresh;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.Renamed4486;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.Renamed4484;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.accepted.FriendsAcceptedModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.acceptednotificator.FriendsAcceptedNotificatorModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.incoming.FriendsIncomingModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.incomingnotificator.FriendsIncomingNotificatorModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.outgoing.FriendsOutgoingModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.listener.UserNotifier;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.listener.UserNotifierModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.listener.Renamed4504;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.listener.Renamed4505;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.battle.BattleLinkData;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.battle.BattleNotifierModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.online.OnlineNotifierModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.premium.PremiumNotifierModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.rank.RankNotifierModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.uid.UidNotifierModel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.Renamed4485;
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
   import Renamed427.Renamed4492;
   
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
            Renamed4535.battleInviteService = IBattleInviteService(param1);
         },function():IBattleInviteService
         {
            return Renamed4535.battleInviteService;
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
            Renamed583.storageService = IStorageService(param1);
         },function():IStorageService
         {
            return Renamed583.storageService;
         });
         modelRegister = osgi.getService(ModelRegistry) as ModelRegistry;
         modelRegisterAdapt = osgi.getService(ModelRegistry) as ModelRegistry;
         modelRegister.add(new UidCheckModel(),Vector.<Class>([Renamed4506,ObjectLoadListener,ObjectUnloadListener,UidCheckService]));
         modelRegisterAdapt.registerAdapt(UidCheckService,UidCheckServiceAdapt);
         modelRegisterAdapt.registerEvents(UidCheckService,UidCheckServiceEvents);
         modelRegister.add(new Renamed4535(),Vector.<Class>([Renamed4534,ObjectLoadListener,ObjectUnloadListener]));
         modelRegister.add(new PremiumNotifierModel(),Vector.<Class>([IPremiumNotifierModelBase,ObjectLoadListener,ObjectUnloadListener]));
         modelRegister.add(new FriendsAcceptedNotificatorModel(),Vector.<Class>([Renamed4492,ObjectLoadListener,ObjectUnloadListener]));
         modelRegister.add(new FriendsIncomingModel(),Vector.<Class>([Renamed4495,ObjectLoadListener]));
         modelRegister.add(new FriendsAcceptedModel(),Vector.<Class>([Renamed4490,ObjectLoadListener]));
         modelRegister.add(new FriendsIncomingNotificatorModel(),Vector.<Class>([Renamed4496,ObjectLoadListener,ObjectUnloadListener]));
         modelRegister.add(new FriendsOutgoingModel(),Vector.<Class>([Renamed4500,ObjectLoadListener]));
         modelRegisterAdapt.registerAdapt(IFriends,Renamed4484);
         modelRegisterAdapt.registerEvents(IFriends,Renamed4485);
         modelRegister.add(new FriendsModel(),Vector.<Class>([Renamed4414,ObjectLoadListener,ObjectUnloadListener,IFriends]));
         modelRegisterAdapt.registerAdapt(UserRefresh,Renamed4486);
         modelRegisterAdapt.registerEvents(UserRefresh,Renamed4483);
         modelRegister.add(new RankNotifierModel(),Vector.<Class>([Renamed4401,UserRefresh]));
         modelRegister.add(new OnlineNotifierModel(),Vector.<Class>([Renamed4393,UserRefresh]));
         modelRegister.add(new UidNotifierModel(),Vector.<Class>([Renamed4405,UserRefresh]));
         modelRegister.add(new BattleNotifierModel(),Vector.<Class>([Renamed4388,UserRefresh,ObjectLoadListener,ObjectUnloadListener]));
         modelRegisterAdapt.registerAdapt(UserNotifier,Renamed4505);
         modelRegisterAdapt.registerEvents(UserNotifier,Renamed4504);
         modelRegister.add(new UserNotifierModel(),Vector.<Class>([Renamed4502,UserNotifier,ObjectLoadListener,ObjectUnloadListener]));
      }
      
      public function stop(param1:OSGi) : void
      {
      }
   }
}

