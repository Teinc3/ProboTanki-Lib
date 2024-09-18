package Renamed314
{
   import Renamed189.AbstractPacket;
   
   public class Renamed7655 extends AbstractPacket
   {
      public var score:int;
      
      public function Renamed7655(param1:int = 0)
      {
         super();
         this.score = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.score = param1 as int;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed7655();
      }
      
      override public function Renamed4883() : int
      {
         return 29;
      }
      
      override public function getPacketId() : int
      {
         return 2116086491;
      }
   }
}

