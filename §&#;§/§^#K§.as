package §&#;§
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.logging.LogService;
   import flash.utils.Dictionary;
   
   public class §^#K§
   {
      public static var logService:LogService;
      
      private static var §function package default§:Dictionary;
      
      public function §^#K§()
      {
         super();
         §function package default§ = new Dictionary();
         logService = LogService(OSGi.getInstance().getService(LogService));
      }
      
      public function §"k§(param1:AbstractPacket) : void
      {
         var _loc2_:int = param1.getPacketId();
         if(§function package default§[_loc2_] != null)
         {
            return;
         }
         §function package default§[_loc2_] = param1;
      }
      
      public function §function package do§(param1:int) : AbstractPacket
      {
         var _loc2_:AbstractPacket = §function package default§[param1];
         if(_loc2_ == null)
         {
            return null;
         }
         return _loc2_;
      }
   }
}

