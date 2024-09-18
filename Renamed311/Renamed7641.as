package Renamed311
{
   import Renamed136.Renamed663;
   import Renamed189.AbstractPacket;
   import projects.tanks.client.battleselect.model.info.BattleInfoUser;
   
   public class Renamed7641 extends AbstractPacket
   {
      public var battleId:String;
      
      public var user:BattleInfoUser;
      
      public var team:Renamed663;
      
      public function Renamed7641(param1:String = "", param2:BattleInfoUser = null, param3:Renamed663 = null)
      {
         super();
         this.battleId = param1;
         this.user = param2;
         this.team = param3;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecBattleInfoUser");
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
               this.user = param1 as BattleInfoUser;
               break;
            case 2:
               this.team = param1 as Renamed663;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed7641();
      }
      
      override public function Renamed4883() : int
      {
         return 33;
      }
      
      override public function getPacketId() : int
      {
         return 118447426;
      }
   }
}

