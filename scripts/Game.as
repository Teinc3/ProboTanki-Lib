package
{
   import Renamed1.Renamed2;
   import alternativa.ClientConfigurator;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.launcherparams.LauncherParams;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.osgi.service.locale.LocaleService;
   import alternativa.register.ModelsRegister;
   import alternativa.service.IModelService;
   import alternativa.startup.ConnectionParameters;
   import alternativa.startup.StartupSettings;
   import alternativa.tanks.loader.ILoaderWindowService;
   import alternativa.types.Long;
   import flash.display.DisplayObjectContainer;
   import flash.display.LoaderInfo;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import platform.client.fp10.core.registry.SpaceRegistry;
   import platform.client.fp10.core.type.ISpace;
   import platform.client.fp10.core.type.impl.Space;
   import projects.tanks.clients.flash.commons.models.gpu.GPUCapabilities;
   import scpacker.networking.Network;
   import scpacker.networking.connecting.ServerConnectionService;
   import scpacker.networking.connecting.ServerConnectionServiceImpl;
   import scpacker.utils.LocalizationLoader;
   
   public class Game extends Sprite
   {
      private var container:DisplayObjectContainer;
      
      public function Game()
      {
         super();
         if(numChildren > 1)
         {
            removeChildAt(0);
            removeChildAt(0);
         }
      }
      
      public static function onResourceLoaded() : void
      {
         (OSGi.getInstance().getService(ILoaderWindowService) as ILoaderWindowService).hideLoaderWindow();
         (OSGi.getInstance().getService(ILoaderWindowService) as ILoaderWindowService).lockLoaderWindow();
      }
      
      public function activateAllModels(param1:LoaderInfo) : void
      {
         var _loc3_:ILocaleService = null;
         var _loc2_:IModelService = new ModelsRegister();
         OSGi.getInstance().registerService(IModelService,_loc2_);
         new ClientConfigurator().start(this.container,new LauncherParams(),new ConnectionParameters(param1.parameters["ip"],Vector.<int>([param1.parameters["port"]]),null,param1.parameters["resources"],false,false),null);
         _loc3_ = new LocaleService(param1.parameters["lang"],"en");
         OSGi.getInstance().registerService(ILocaleService,_loc3_);
         new LocalizationLoader().Renamed3(param1.parameters["resources"] + "/localized.data_" + _loc3_.language + "?rand=" + Math.random(),this.activate);
      }
      
      private function activate() : void
      {
         new EntranceActivator().start(OSGi.getInstance());
         new Renamed4().start(OSGi.getInstance());
         ILoaderWindowService(OSGi.getInstance().getService(ILoaderWindowService)).showLoaderWindow();
         var _loc1_:GPUCapabilities = new GPUCapabilities(IDisplay(OSGi.getInstance().getService(IDisplay)).stage);
         _loc1_.addEventListener(Event.COMPLETE,this.Renamed5);
         _loc1_.detect();
         StartupSettings.preLauncher = Sprite(parent.parent.parent);
         this.Renamed6();
      }
      
      public function SUPER(param1:Stage, param2:DisplayObjectContainer, param3:LoaderInfo = null) : void
      {
         this.container = param2;
         param1.dispatchEvent(new Event("EntranceModel.objectLoaded",true));
         OSGi.getInstance().registerService(Network,new Network());
         this.activateAllModels(param3);
      }
      
      private function Renamed5(param1:Event) : void
      {
         OSGi.clientLog.log("GPUDetection","GPU detection completed, %1",GPUCapabilities.gpuEnabled);
         this.serverNormal();
      }
      
      private function serverNormal() : void
      {
         Renamed2.init();
         var _loc1_:ServerConnectionService = new ServerConnectionServiceImpl();
         _loc1_.connect();
      }
      
      private function Renamed6() : void
      {
         var _loc1_:ISpace = new Space(Long.getLong(884380667,214),null,null,false);
         var _loc2_:ISpace = new Space(Long.getLong(59235923,646943),null,null,false);
         var _loc3_:ISpace = new Space(Long.getLong(52835823,6349643),null,null,false);
         var _loc4_:ISpace = new Space(Long.getLong(10568210,51255591),null,null,false);
         SpaceRegistry(OSGi.getInstance().getService(SpaceRegistry)).addSpace(_loc4_);
         SpaceRegistry(OSGi.getInstance().getService(SpaceRegistry)).addSpace(_loc3_);
         SpaceRegistry(OSGi.getInstance().getService(SpaceRegistry)).addSpace(_loc2_);
         SpaceRegistry(OSGi.getInstance().getService(SpaceRegistry)).addSpace(_loc1_);
      }
   }
}

