package Renamed418
{
   import Renamed189.AbstractPacket;
   
   public class Renamed8708 extends AbstractPacket
   {
      public var tankId:String;
      
      public function Renamed8708(param1:String = "")
      {
         super();
         this.tankId = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.tankId = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed8708();
      }
      
      override public function Renamed4883() : int
      {
         return 39;
      }
      
      override public function getPacketId() : int
      {
         return 1868573511;
      }
   }
}

