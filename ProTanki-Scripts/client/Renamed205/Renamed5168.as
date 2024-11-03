package Renamed205
{
   import AbstractPackets.AbstractPacket;
   import Renamed371.Renamed3644;
   
   public class Renamed5168 extends AbstractPacket
   {
      public var initParams:Renamed3644;
      
      public function Renamed5168(param1:Renamed3644 = null)
      {
         super();
         this.initParams = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecUserCountryCC");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.initParams = param1 as Renamed3644;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed5168();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 75;
      }
      
      override public function getPacketId() : int
      {
         return -1232334539;
      }
   }
}

