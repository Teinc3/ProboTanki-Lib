package Renamed436
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed7645 extends AbstractPacket
   {
      public var timeLimitInSec:int;
      
      public function Renamed7645(param1:int = 0)
      {
         super();
         this.timeLimitInSec = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.timeLimitInSec = param1 as int;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed7645();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 37;
      }
      
      override public function getPacketId() : int
      {
         return 732434644;
      }
   }
}

