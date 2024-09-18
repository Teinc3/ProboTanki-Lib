package alternativa.init
{
   import Renamed501.Renamed580;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.tanks.bg.IBackgroundService;
   import alternativa.tanks.bg.Renamed581;
   import alternativa.tanks.blur.BlurService;
   import alternativa.tanks.blur.IBlurService;
   import alternativa.tanks.help.HelpService;
   import alternativa.tanks.help.IHelpService;
   import alternativa.tanks.loader.Renamed582;
   import alternativa.tanks.loader.ILoaderWindowService;
   import alternativa.tanks.newbieservice.NewbieUserService;
   import alternativa.tanks.newbieservice.Renamed583;
   import alternativa.tanks.service.IPasswordParamsService;
   import alternativa.tanks.service.dialogs.DialogsService;
   import alternativa.tanks.service.dialogs.IDialogsService;
   import alternativa.tanks.tracker.ITrackerService;
   import alternativa.tanks.tracker.TrackerService;
   import projects.tanks.clients.flash.commons.services.battlelinkactivator.BattleLinkActivatorService;
   import projects.tanks.clients.flash.commons.services.battlelinkactivator.IBattleLinkActivatorService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.Renamed584;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.blockuser.BlockUserService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.blockuser.IBlockUserService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.Renamed585;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.IDialogWindowsDispatcherService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendActionService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.battleinvite.BattleInviteService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.battleinvite.IBattleInviteService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.Renamed586;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.Renamed587;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.notifier.battle.IBattleNotifierService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.notifier.battle.Renamed588;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.notifier.online.Renamed589;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.notifier.online.IOnlineNotifierService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.premium.PremiumService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.premium.Renamed590;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.Renamed591;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.UserInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.Renamed592;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.BattleFormatUtil;
   
   public class Renamed0 implements IBundleActivator
   {
      public static var osgi:OSGi;
      
      public function Renamed0()
      {
         super();
      }
      
      public function start(param1:OSGi) : void
      {
         Renamed0.osgi = param1;
         var _loc2_:IBackgroundService = new Renamed581();
         param1.registerService(IStorageService,new Renamed591(param1.createSharedObject("name")));
         param1.registerService(IBackgroundService,_loc2_);
         param1.registerService(IHelpService,new HelpService());
         param1.registerService(IBlurService,new BlurService());
         param1.registerService(ITrackerService,new TrackerService());
         param1.registerService(IBlockUserService,new BlockUserService());
         param1.registerService(IFriendInfoService,new Renamed586());
         param1.registerService(IFriendActionService,new Renamed587());
         param1.registerService(IDialogsService,new DialogsService());
         param1.registerService(IBattleInfoService,new Renamed584());
         param1.registerService(IBattleInviteService,new BattleInviteService());
         param1.registerService(IDialogWindowsDispatcherService,new Renamed585());
         param1.registerService(ILoaderWindowService,new Renamed582());
         param1.registerService(IUserPropertiesService,new Renamed592());
         param1.registerService(IUserInfoService,new UserInfoService());
         param1.registerService(IOnlineNotifierService,new Renamed589());
         param1.registerService(IBattleNotifierService,new Renamed588());
         param1.registerService(IBattleLinkActivatorService,new BattleLinkActivatorService());
         param1.registerService(IPasswordParamsService,new Renamed580());
         param1.registerService(PremiumService,new Renamed590());
         param1.registerService(BattleFormatUtil,new BattleFormatUtil());
         param1.registerService(NewbieUserService,new Renamed583());
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
         Renamed0.osgi = null;
      }
   }
}

