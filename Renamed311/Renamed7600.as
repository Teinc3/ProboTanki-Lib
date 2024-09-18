package Renamed311
{
   import Renamed189.AbstractPacket;
   import projects.tanks.client.battleselect.model.info.BattleInfoUser;
   
   public class Renamed7599 extends AbstractPacket
   {
      public var battleId:String;
      
      public var user:BattleInfoUser;
      
      public function Renamed7599(param1:String = "", param2:BattleInfoUser = null)
      {
         super();
         this.battleId = param1;
         this.user = param2;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecBattleInfoUser");
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
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed7599();
      }
      
      override public function Renamed4883() : int
      {
         return 33;
      }
      
      override public function getPacketId() : int
      {
         return -911626491;
      }
   }
}

