package §catch package class§
{
   import §&#;§.AbstractPacket;
   import projects.tanks.client.panel.model.battleinvite.BattleInviteMessage;
   
   public class §false for with§ extends AbstractPacket
   {
      public var user:String;
      
      public var data:BattleInviteMessage;
      
      public function §false for with§(param1:String = "", param2:BattleInviteMessage = null)
      {
         super();
         this.user = param1;
         this.data = param2;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecBattleInviteMessage");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
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
      
      override public function §4#w§() : AbstractPacket
      {
         return new §false for with§();
      }
      
      override public function §package package final§() : int
      {
         return 15;
      }
      
      override public function getPacketId() : int
      {
         return 810713262;
      }
   }
}

