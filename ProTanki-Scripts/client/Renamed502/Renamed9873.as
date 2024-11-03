package Renamed502
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed9873 extends AbstractPacket
   {
      public var timeLeftInSec:int;
      
      public function Renamed9873(param1:int = 0)
      {
         super();
         this.timeLeftInSec = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.timeLeftInSec = param1 as int;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed9873();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 26;
      }
      
      override public function getPacketId() : int
      {
         return -1712113407;
      }
   }
}

