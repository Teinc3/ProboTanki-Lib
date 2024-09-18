package Renamed429
{
   import Renamed189.AbstractPacket;
   
   public class Renamed8849 extends AbstractPacket
   {
      public var pointId:int;
      
      public function Renamed8849(param1:int = 0)
      {
         super();
         this.pointId = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.pointId = param1 as int;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed8849();
      }
      
      override public function Renamed4883() : int
      {
         return 60;
      }
      
      override public function getPacketId() : int
      {
         return -1548609916;
      }
   }
}

