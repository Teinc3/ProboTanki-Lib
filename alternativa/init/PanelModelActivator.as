package alternativa.init
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.osgi.service.dump.IDumpService;
   import alternativa.tanks.model.panel.CapabilitiesDumper;
   import alternativa.tanks.service.achievement.IAchievementService;
   import alternativa.tanks.service.achievement.§finally for extends§;
   import alternativa.tanks.service.country.CountryService;
   import alternativa.tanks.service.country.§^"+§;
   import alternativa.tanks.service.dailyquest.DailyQuestNotifierService;
   import alternativa.tanks.service.dailyquest.§extends for class§;
   import alternativa.tanks.service.fps.§ v§;
   import alternativa.tanks.service.fps.FPSService;
   import alternativa.tanks.service.money.IMoneyService;
   import alternativa.tanks.service.money.§for var true§;
   import alternativa.tanks.service.notificationcategories.INotificationGarageCategoriesService;
   import alternativa.tanks.service.notificationcategories.§]"S§;
   import alternativa.tanks.service.panel.IPanelView;
   import alternativa.tanks.service.panel.§continue var implements§;
   import alternativa.tanks.service.settings.§;!Y§;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.service.settings.keybinding.§>!D§;
   import alternativa.tanks.service.settings.keybinding.KeysBindingService;
   import alternativa.tanks.service.socialnetwork.§5!p§;
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
         param1.registerService(IPanelView,new §continue var implements§());
         param1.registerService(ISettingsService,new §;!Y§());
         param1.registerService(IAchievementService,new §finally for extends§());
         param1.registerService(IMoneyService,new §for var true§());
         param1.registerService(ISocialNetworkPanelService,new §5!p§());
         param1.registerService(FPSService,new § v§());
         param1.registerService(IBlurService,new BlurService());
         param1.registerService(IDialogsService,new DialogsService());
         param1.registerService(INotificationGarageCategoriesService,new §]"S§());
         param1.registerService(KeysBindingService,new §>!D§());
         param1.registerService(CountryService,new §^"+§());
         IDumpService(param1.getService(IDumpService)).registerDumper(this.capabilitiesDumper);
         param1.registerService(DailyQuestNotifierService,new §extends for class§());
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

