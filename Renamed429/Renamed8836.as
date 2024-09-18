package Renamed429
{
   import Renamed189.AbstractPacket;
   
   public class Renamed8836 extends AbstractPacket
   {
      public var pointId:int;
      
      public var tankId:String;
      
      public function Renamed8836(param1:int = 0, param2:String = "")
      {
         super();
         this.pointId = param1;
         this.tankId = param2;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.pointId = param1 as int;
               break;
            case 1:
               this.tankId = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed8836();
      }
      
      override public function Renamed4883() : int
      {
         return 60;
      }
      
      override public function getPacketId() : int
      {
         return -456245145;
      }
   }
}

