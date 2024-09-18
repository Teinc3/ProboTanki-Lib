package AbstractPackets
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.logging.LogService;
   import flash.utils.Dictionary;
   
   public class AbstractPacketManager
   {
      public static var logService:LogService;
      
      private static var packetDict:Dictionary;
      
      public function AbstractPacketManager()
      {
         super();
         packetDict = new Dictionary();
         logService = LogService(OSGi.getInstance().getService(LogService));
      }
      
      public function setAbsPacket(param1:AbstractPacket) : void
      {
         var _loc2_:int = param1.getPacketId();
         if(packetDict[_loc2_] != null)
         {
            return;
         }
         packetDict[_loc2_] = param1;
      }
      
      public function getAbsPacket(param1:int) : AbstractPacket
      {
         var _loc2_:AbstractPacket = packetDict[param1];
         if(_loc2_ == null)
         {
            return null;
         }
         return _loc2_;
      }
   }
}

