package Renamed311
{
   import Renamed136.Renamed663;
   import Renamed189.AbstractPacket;
   
   public class Renamed7647 extends AbstractPacket
   {
      public var battleId:String;
      
      public var teamType:Renamed663;
      
      public var score:int;
      
      public function Renamed7647(param1:String = "", param2:Renamed663 = null, param3:int = 0)
      {
         super();
         this.battleId = param1;
         this.teamType = param2;
         this.score = param3;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecBattleTeam");
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
               this.teamType = param1 as Renamed663;
               break;
            case 2:
               this.score = param1 as int;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed7647();
      }
      
      override public function Renamed4883() : int
      {
         return 33;
      }
      
      override public function getPacketId() : int
      {
         return 1428217189;
      }
   }
}

