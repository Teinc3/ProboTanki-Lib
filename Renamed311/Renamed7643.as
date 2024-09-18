package Renamed311
{
   import Renamed189.AbstractPacket;
   
   public class Renamed7643 extends AbstractPacket
   {
      public var battleId:String;
      
      public var userId:String;
      
      public var suspicious:Boolean;
      
      public function Renamed7643(param1:String = "", param2:String = "", param3:Boolean = false)
      {
         super();
         this.battleId = param1;
         this.userId = param2;
         this.suspicious = param3;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param3);
         Renamed4880("scpacker.networking.protocol.codec.primitive.BooleanCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.battleId = param1 as String;
               break;
            case 1:
               this.userId = param1 as String;
               break;
            case 2:
               this.suspicious = param1 as Boolean;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed7643();
      }
      
      override public function Renamed4883() : int
      {
         return 33;
      }
      
      override public function getPacketId() : int
      {
         return -698399183;
      }
   }
}

