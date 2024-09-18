package § M§
{
   import §&#;§.AbstractPacket;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.logging.LogService;
   import flash.utils.Dictionary;
   
   public class §true else§
   {
      public static var logService:LogService;
      
      private static var modelById:Dictionary;
      
      public function §true else§()
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
         var _loc2_:Object = modelById[param1.§package package final§()];
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.invoke(param1);
      }
   }
}

