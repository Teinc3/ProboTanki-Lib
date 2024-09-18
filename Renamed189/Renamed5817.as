package Renamed189
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.logging.LogService;
   import flash.utils.Dictionary;
   
   public class Renamed5817
   {
      public static var logService:LogService;
      
      private static var Renamed5818:Dictionary;
      
      public function Renamed5817()
      {
         super();
         Renamed5818 = new Dictionary();
         logService = LogService(OSGi.getInstance().getService(LogService));
      }
      
      public function Renamed5819(param1:AbstractPacket) : void
      {
         var _loc2_:int = param1.getPacketId();
         if(Renamed5818[_loc2_] != null)
         {
            return;
         }
         Renamed5818[_loc2_] = param1;
      }
      
      public function Renamed5820(param1:int) : AbstractPacket
      {
         var _loc2_:AbstractPacket = Renamed5818[param1];
         if(_loc2_ == null)
         {
            return null;
         }
         return _loc2_;
      }
   }
}

