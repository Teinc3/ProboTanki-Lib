package Renamed502
{
   import Renamed189.AbstractPacket;
   
   public class Renamed9873 extends AbstractPacket
   {
      public var timeLeftInSec:int;
      
      public function Renamed9873(param1:int = 0)
      {
         super();
         this.timeLeftInSec = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.timeLeftInSec = param1 as int;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed9873();
      }
      
      override public function Renamed4883() : int
      {
         return 26;
      }
      
      override public function getPacketId() : int
      {
         return -1712113407;
      }
   }
}

