package alternativa.init
{
   import Renamed501.Renamed579;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.service.IEntranceClientFacade;
   import alternativa.tanks.service.IEntranceServerFacade;
   import alternativa.tanks.service.IExternalEntranceService;
   
   public class UserModelActivator implements IBundleActivator
   {
      public static var osgi:OSGi;
      
      private var _context:EntranceContext;
      
      public function UserModelActivator()
      {
         super();
      }
      
      public static function registerClientFacade(param1:IEntranceClientFacade) : void
      {
         if(osgi.getService(IEntranceClientFacade) != null)
         {
            osgi.unregisterService(IEntranceClientFacade);
         }
         osgi.registerService(IEntranceClientFacade,param1);
      }
      
      public static function registerServerFacade(param1:IEntranceServerFacade) : void
      {
         if(osgi.getService(IEntranceServerFacade) != null)
         {
            osgi.unregisterService(IEntranceServerFacade);
         }
         osgi.registerService(IEntranceServerFacade,param1);
      }
      
      public static function unregisterClientFacade() : void
      {
         osgi.unregisterService(IEntranceClientFacade);
      }
      
      public static function unregisterServerFacade() : void
      {
         osgi.unregisterService(IEntranceServerFacade);
      }
      
      public function start(param1:OSGi) : void
      {
         UserModelActivator.osgi = param1;
         param1.registerService(IExternalEntranceService,new Renamed579());
         this._context = new EntranceContext((param1.getService(IDisplay) as IDisplay).contentUILayer);
      }
      
      public function stop(param1:OSGi) : void
      {
         UserModelActivator.osgi = null;
      }
   }
}

