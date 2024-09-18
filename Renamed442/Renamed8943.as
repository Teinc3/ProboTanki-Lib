package Renamed442
{
   import Renamed189.AbstractPacket;
   
   public class Renamed8943 extends AbstractPacket
   {
      public var symbolCost:int;
      
      public var enterCost:int;
      
      public function Renamed8943(param1:int = 0, param2:int = 0)
      {
         super();
         this.symbolCost = param1;
         this.enterCost = param2;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.symbolCost = param1 as int;
               break;
            case 1:
               this.enterCost = param1 as int;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed8943();
      }
      
      override public function Renamed4883() : int
      {
         return 28;
      }
      
      override public function getPacketId() : int
      {
         return 744948472;
      }
   }
}

