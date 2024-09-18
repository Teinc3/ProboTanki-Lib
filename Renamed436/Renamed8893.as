package Renamed436
{
   import Renamed189.AbstractPacket;
   
   public class Renamed8893 extends AbstractPacket
   {
      public var fund:int;
      
      public function Renamed8893(param1:int = 0)
      {
         super();
         this.fund = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.fund = param1 as int;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed8893();
      }
      
      override public function Renamed4883() : int
      {
         return 37;
      }
      
      override public function getPacketId() : int
      {
         return 1149211509;
      }
   }
}

