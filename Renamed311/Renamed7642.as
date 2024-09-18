package Renamed311
{
   import Renamed189.AbstractPacket;
   
   public class Renamed7642 extends AbstractPacket
   {
      public var battleId:String;
      
      public var userId:String;
      
      public var kills:int;
      
      public function Renamed7642(param1:String = "", param2:String = "", param3:int = 0)
      {
         super();
         this.battleId = param1;
         this.userId = param2;
         this.kills = param3;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param3);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
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
               this.kills = param1 as int;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed7642();
      }
      
      override public function Renamed4883() : int
      {
         return 33;
      }
      
      override public function getPacketId() : int
      {
         return -1263036614;
      }
   }
}

