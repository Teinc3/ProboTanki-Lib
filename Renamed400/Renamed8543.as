package Renamed400
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed8543 extends AbstractPacket
   {
      public var time:int;
      
      public function Renamed8543(param1:int = 0)
      {
         super();
         this.time = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.time = param1 as int;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed8543();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 55;
      }
      
      override public function getPacketId() : int
      {
         return -248693565;
      }
   }
}

