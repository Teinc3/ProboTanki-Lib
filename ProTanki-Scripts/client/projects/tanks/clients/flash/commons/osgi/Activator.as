package projects.tanks.clients.flash.commons.osgi
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.launcherparams.ILauncherParams;
   import projects.tanks.clients.flash.commons.services.fullscreen.FullscreenServiceImpl;
   import projects.tanks.clients.flash.commons.services.fullscreen.FullscreenStateServiceImpl;
   import projects.tanks.clients.flash.commons.services.layout.LobbyLayoutService;
   import projects.tanks.clients.flash.commons.services.notification.INotificationService;
   import projects.tanks.clients.flash.commons.services.notification.NotificationService;
   import projects.tanks.clients.flash.commons.services.notification.sound.Renamed4453;
   import projects.tanks.clients.flash.commons.services.notification.sound.INotificationSoundService;
   import projects.tanks.clients.flash.commons.services.serverhalt.IServerHaltService;
   import projects.tanks.clients.flash.commons.services.serverhalt.ServerHaltService;
   import projects.tanks.clients.flash.commons.services.timeunit.ITimeUnitService;
   import projects.tanks.clients.flash.commons.services.timeunit.Renamed4454;
   import projects.tanks.clients.flash.commons.services.validate.IValidateService;
   import projects.tanks.clients.flash.commons.services.validate.ValidateService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.fullscreen.FullscreenService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.fullscreen.FullscreenStateService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.LobbyLayoutServiceBase;
   
   public class Activator implements IBundleActivator
   {
      public function Activator()
      {
         super();
      }
      
      public function start(param1:OSGi) : void
      {
         var _loc2_:ILobbyLayoutService = new LobbyLayoutService();
         param1.registerService(ILobbyLayoutService,_loc2_);
         param1.registerService(LobbyLayoutServiceBase,_loc2_);
         param1.registerService(INotificationService,new NotificationService(_loc2_));
         param1.registerService(IServerHaltService,new ServerHaltService());
         param1.registerService(IValidateService,new ValidateService());
         param1.registerService(INotificationSoundService,new Renamed4453());
         param1.registerService(ITimeUnitService,new Renamed4454());
         var _loc3_:IDisplay = IDisplay(OSGi.getInstance().getService(IDisplay));
         var _loc4_:ILauncherParams = ILauncherParams(OSGi.getInstance().getService(ILauncherParams));
         var _loc5_:FullscreenServiceImpl = new FullscreenServiceImpl(_loc3_);
         param1.registerService(FullscreenService,_loc5_);
         param1.registerService(FullscreenStateService,new FullscreenStateServiceImpl(_loc3_,_loc5_.isAvailable()));
      }
      
      public function stop(param1:OSGi) : void
      {
      }
   }
}

