package Renamed140
{
   import Renamed189.AbstractPacket;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.logging.LogService;
   import flash.utils.Dictionary;
   
   public class Renamed4936
   {
      public static var logService:LogService;
      
      private static var modelById:Dictionary;
      
      public function Renamed4936()
      {
         super();
         modelById = new Dictionary();
         logService = LogService(OSGi.getInstance().getService(LogService));
      }
      
      public function register(param1:Object) : void
      {
         if(modelById[param1.modelId] == null)
         {
            modelById[param1.modelId] = param1;
         }
      }
      
      public function invoke(param1:AbstractPacket) : void
      {
         var _loc2_:Object = modelById[param1.Renamed4883()];
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.invoke(param1);
      }
   }
}

