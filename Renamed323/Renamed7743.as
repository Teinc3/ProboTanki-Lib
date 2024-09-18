package Renamed323
{
   import Renamed189.AbstractPacket;
   import projects.tanks.client.panel.model.battleinvite.BattleInviteMessage;
   
   public class Renamed7743 extends AbstractPacket
   {
      public var user:String;
      
      public var data:BattleInviteMessage;
      
      public function Renamed7743(param1:String = "", param2:BattleInviteMessage = null)
      {
         super();
         this.user = param1;
         this.data = param2;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecBattleInviteMessage");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.user = param1 as String;
               break;
            case 1:
               this.data = param1 as BattleInviteMessage;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed7743();
      }
      
      override public function Renamed4883() : int
      {
         return 15;
      }
      
      override public function getPacketId() : int
      {
         return 810713262;
      }
   }
}

