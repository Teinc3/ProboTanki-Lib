package Renamed406
{
   import Renamed189.AbstractPacket;
   
   public class Renamed8607 extends AbstractPacket
   {
      public var json:String;
      
      public function Renamed8607(param1:String = "")
      {
         super();
         this.json = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.json = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed8607();
      }
      
      override public function Renamed4883() : int
      {
         return 4;
      }
      
      override public function getPacketId() : int
      {
         return -1807685988;
      }
   }
}

