package Renamed6836
{
   import Renamed189.AbstractPacket;
   import platform.client.models.commons.types.ValidationStatus;
   
   public class Renamed7135 extends AbstractPacket
   {
      public var status:ValidationStatus;
      
      public function Renamed7135(param1:ValidationStatus = null)
      {
         super();
         this.status = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecValidationStatus");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.status = param1 as ValidationStatus;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed7135();
      }
      
      override public function Renamed4883() : int
      {
         return 35;
      }
      
      override public function getPacketId() : int
      {
         return -1565553333;
      }
   }
}

