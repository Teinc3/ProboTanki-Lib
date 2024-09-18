package Renamed463
{
   import Renamed189.AbstractPacket;
   
   public class Renamed9275 extends AbstractPacket
   {
      public var suicideDelayMS:int;
      
      public function Renamed9275(param1:int = 0)
      {
         super();
         this.suicideDelayMS = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.suicideDelayMS = param1 as int;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed9275();
      }
      
      override public function Renamed4883() : int
      {
         return 59;
      }
      
      override public function getPacketId() : int
      {
         return -911983090;
      }
   }
}

