package Renamed6836
{
   import AbstractPackets.AbstractPacket;
   import platform.client.models.commons.types.ValidationStatus;
   
   public class Renamed7135 extends AbstractPacket
   {
      public var status:ValidationStatus;
      
      public function Renamed7135(param1:ValidationStatus = null)
      {
         super();
         this.status = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecValidationStatus");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.status = param1 as ValidationStatus;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed7135();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 35;
      }
      
      override public function getPacketId() : int
      {
         return -1565553333;
      }
   }
}

