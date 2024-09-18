package Renamed311
{
   import Renamed189.AbstractPacket;
   
   public class Renamed7646 extends AbstractPacket
   {
      public var battleId:String;
      
      public var name:String;
      
      public function Renamed7646(param1:String = "", param2:String = "")
      {
         super();
         this.battleId = param1;
         this.name = param2;
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
               this.battleId = param1 as String;
               break;
            case 1:
               this.name = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed7646();
      }
      
      override public function Renamed4883() : int
      {
         return 33;
      }
      
      override public function getPacketId() : int
      {
         return 1561014187;
      }
   }
}

