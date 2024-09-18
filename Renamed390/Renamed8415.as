package Renamed390
{
   import Renamed136.Renamed663;
   import Renamed189.AbstractPacket;
   
   public class Renamed8414 extends AbstractPacket
   {
      public var battleId:String;
      
      public var userId:String;
      
      public var team:Renamed663;
      
      public function Renamed8414(param1:String = "", param2:String = "", param3:Renamed663 = null)
      {
         super();
         this.battleId = param1;
         this.userId = param2;
         this.team = param3;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param3);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecBattleTeam");
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
               this.team = param1 as Renamed663;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed8414();
      }
      
      override public function Renamed4883() : int
      {
         return 32;
      }
      
      override public function getPacketId() : int
      {
         return -169305322;
      }
   }
}

