package Renamed406
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed4089 extends AbstractPacket
   {
      public var callbackId:int;
      
      public function Renamed4089(param1:int = 0)
      {
         super();
         this.callbackId = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.callbackId = param1 as int;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed4089();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 4;
      }
      
      override public function getPacketId() : int
      {
         return -82304134;
      }
   }
}

