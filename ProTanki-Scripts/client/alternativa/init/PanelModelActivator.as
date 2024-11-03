package alternativa.init
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.osgi.service.dump.IDumpService;
   import alternativa.tanks.model.panel.CapabilitiesDumper;
   import alternativa.tanks.service.achievement.IAchievementService;
   import alternativa.tanks.service.achievement.Renamed567;
   import alternativa.tanks.service.country.CountryService;
   import alternativa.tanks.service.country.Renamed568;
   import alternativa.tanks.service.dailyquest.DailyQuestNotifierService;
   import alternativa.tanks.service.dailyquest.Renamed569;
   import alternativa.tanks.service.fps.Renamed570;
   import alternativa.tanks.service.fps.FPSService;
   import alternativa.tanks.service.money.IMoneyService;
   import alternativa.tanks.service.money.Renamed571;
   import alternativa.tanks.service.notificationcategories.INotificationGarageCategoriesService;
   import alternativa.tanks.service.notificationcategories.Renamed572;
   import alternativa.tanks.service.panel.IPanelView;
   import alternativa.tanks.service.panel.Renamed573;
   import alternativa.tanks.service.settings.Renamed574;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.service.settings.keybinding.Renamed575;
   import alternativa.tanks.service.settings.keybinding.KeysBindingService;
   import alternativa.tanks.service.socialnetwork.Renamed576;
   import alternativa.tanks.service.socialnetwork.ISocialNetworkPanelService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.blur.BlurService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.blur.IBlurService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.DialogsService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.IDialogsService;
   
   public class PanelModelActivator implements IBundleActivator
   {
      private var capabilitiesDumper:CapabilitiesDumper;
      
      public function PanelModelActivator()
      {
         super();
         this.capabilitiesDumper = new CapabilitiesDumper();
      }
      
      public function start(param1:OSGi) : void
      {
         param1.registerService(IPanelView,new Renamed573());
         param1.registerService(ISettingsService,new Renamed574());
         param1.registerService(IAchievementService,new Renamed567());
         param1.registerService(IMoneyService,new Renamed571());
         param1.registerService(ISocialNetworkPanelService,new Renamed576());
         param1.registerService(FPSService,new Renamed570());
         param1.registerService(IBlurService,new BlurService());
         param1.registerService(IDialogsService,new DialogsService());
         param1.registerService(INotificationGarageCategoriesService,new Renamed572());
         param1.registerService(KeysBindingService,new Renamed575());
         param1.registerService(CountryService,new Renamed568());
         IDumpService(param1.getService(IDumpService)).registerDumper(this.capabilitiesDumper);
         param1.registerService(DailyQuestNotifierService,new Renamed569());
      }
      
      public function stop(param1:OSGi) : void
      {
         IDumpService(param1.getService(IDumpService)).unregisterDumper(this.capabilitiesDumper.dumperName);
         param1.unregisterService(IPanelView);
         param1.unregisterService(ISettingsService);
         param1.unregisterService(IMoneyService);
         param1.unregisterService(IAchievementService);
         param1.unregisterService(ISocialNetworkPanelService);
         param1.unregisterService(FPSService);
         param1.unregisterService(DailyQuestNotifierService);
         param1.unregisterService(KeysBindingService);
         this.capabilitiesDumper = null;
      }
   }
}

