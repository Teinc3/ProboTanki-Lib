package Renamed323
{
   import AbstractPackets.AbstractPacket;
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
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecBattleInviteMessage");
      }
      
      override public function Implement(param1:Object, param2:int) : void
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
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed7743();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 15;
      }
      
      override public function getPacketId() : int
      {
         return 810713262;
      }
   }
}

