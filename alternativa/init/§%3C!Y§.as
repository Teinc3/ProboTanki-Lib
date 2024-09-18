package alternativa.init
{
   import §`C§.§'!J§;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.tanks.bg.IBackgroundService;
   import alternativa.tanks.bg.§include package static§;
   import alternativa.tanks.blur.BlurService;
   import alternativa.tanks.blur.IBlurService;
   import alternativa.tanks.help.HelpService;
   import alternativa.tanks.help.IHelpService;
   import alternativa.tanks.loader.§1#o§;
   import alternativa.tanks.loader.ILoaderWindowService;
   import alternativa.tanks.newbieservice.NewbieUserService;
   import alternativa.tanks.newbieservice.§^#-§;
   import alternativa.tanks.service.IPasswordParamsService;
   import alternativa.tanks.service.dialogs.DialogsService;
   import alternativa.tanks.service.dialogs.IDialogsService;
   import alternativa.tanks.tracker.ITrackerService;
   import alternativa.tanks.tracker.TrackerService;
   import projects.tanks.clients.flash.commons.services.battlelinkactivator.BattleLinkActivatorService;
   import projects.tanks.clients.flash.commons.services.battlelinkactivator.IBattleLinkActivatorService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.§,'§;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.blockuser.BlockUserService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.blockuser.IBlockUserService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.§3"2§;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.IDialogWindowsDispatcherService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendActionService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.battleinvite.BattleInviteService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.battleinvite.IBattleInviteService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.§do var in§;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.§include var switch§;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.notifier.battle.IBattleNotifierService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.notifier.battle.§catch const else§;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.notifier.online.§<$"§;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.notifier.online.IOnlineNotifierService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.premium.PremiumService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.premium.§each const import§;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.§default set null§;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.UserInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.§final var include§;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.BattleFormatUtil;
   
   public class §<!Y§ implements IBundleActivator
   {
      public static var osgi:OSGi;
      
      public function §<!Y§()
      {
         super();
      }
      
      public function start(param1:OSGi) : void
      {
         §<!Y§.osgi = param1;
         var _loc2_:IBackgroundService = new §include package static§();
         param1.registerService(IStorageService,new §default set null§(param1.createSharedObject("name")));
         param1.registerService(IBackgroundService,_loc2_);
         param1.registerService(IHelpService,new HelpService());
         param1.registerService(IBlurService,new BlurService());
         param1.registerService(ITrackerService,new TrackerService());
         param1.registerService(IBlockUserService,new BlockUserService());
         param1.registerService(IFriendInfoService,new §do var in§());
         param1.registerService(IFriendActionService,new §include var switch§());
         param1.registerService(IDialogsService,new DialogsService());
         param1.registerService(IBattleInfoService,new §,'§());
         param1.registerService(IBattleInviteService,new BattleInviteService());
         param1.registerService(IDialogWindowsDispatcherService,new §3"2§());
         param1.registerService(ILoaderWindowService,new §1#o§());
         param1.registerService(IUserPropertiesService,new §final var include§());
         param1.registerService(IUserInfoService,new UserInfoService());
         param1.registerService(IOnlineNotifierService,new §<$"§());
         param1.registerService(IBattleNotifierService,new §catch const else§());
         param1.registerService(IBattleLinkActivatorService,new BattleLinkActivatorService());
         param1.registerService(IPasswordParamsService,new §'!J§());
         param1.registerService(PremiumService,new §each const import§());
         param1.registerService(BattleFormatUtil,new BattleFormatUtil());
         param1.registerService(NewbieUserService,new §^#-§());
         _loc2_.showBg();
      }
      
      public function stop(param1:OSGi) : void
      {
         param1.unregisterService(IBackgroundService);
         param1.unregisterService(IHelpService);
         param1.unregisterService(ILoaderWindowService);
         param1.unregisterService(IBlockUserService);
         param1.unregisterService(IFriendActionService);
         param1.unregisterService(IFriendInfoService);
         param1.unregisterService(IDialogsService);
         param1.unregisterService(IBlurService);
         param1.unregisterService(IBattleInfoService);
         param1.unregisterService(IBattleInviteService);
         param1.unregisterService(IDialogWindowsDispatcherService);
         param1.unregisterService(IUserPropertiesService);
         param1.unregisterService(IUserInfoService);
         §<!Y§.osgi = null;
      }
   }
}

