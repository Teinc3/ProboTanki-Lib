package Renamed425
{
   import Renamed189.AbstractPacket;
   
   public class Renamed8756 extends AbstractPacket
   {
      public var password:String;
      
      public var email:String;
      
      public function Renamed8756(param1:String = "", param2:String = "")
      {
         super();
         this.password = param1;
         this.email = param2;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.password = param1 as String;
               break;
            case 1:
               this.email = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed8756();
      }
      
      override public function Renamed4883() : int
      {
         return 24;
      }
      
      override public function getPacketId() : int
      {
         return 147737736;
      }
   }
}

