package Renamed436
{
   import Renamed189.AbstractPacket;
   
   public class Renamed7645 extends AbstractPacket
   {
      public var timeLimitInSec:int;
      
      public function Renamed7645(param1:int = 0)
      {
         super();
         this.timeLimitInSec = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.timeLimitInSec = param1 as int;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed7645();
      }
      
      override public function Renamed4883() : int
      {
         return 37;
      }
      
      override public function getPacketId() : int
      {
         return 732434644;
      }
   }
}

