package Renamed436
{
   import Renamed189.AbstractPacket;
   
   public class Renamed8882 extends AbstractPacket
   {
      public var userId:String;
      
      public var suspicious:Boolean;
      
      public function Renamed8882(param1:String = "", param2:Boolean = false)
      {
         super();
         this.userId = param1;
         this.suspicious = param2;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.BooleanCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.userId = param1 as String;
               break;
            case 1:
               this.suspicious = param1 as Boolean;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed8882();
      }
      
      override public function Renamed4883() : int
      {
         return 37;
      }
      
      override public function getPacketId() : int
      {
         return 446781737;
      }
   }
}

