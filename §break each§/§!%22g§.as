package §break each§
{
   import §&#;§.AbstractPacket;
   import projects.tanks.client.battleselect.model.info.BattleInfoUser;
   
   public class §!"g§ extends AbstractPacket
   {
      public var battleId:String;
      
      public var user:BattleInfoUser;
      
      public function §!"g§(param1:String = "", param2:BattleInfoUser = null)
      {
         super();
         this.battleId = param1;
         this.user = param2;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecBattleInfoUser");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
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
      
      override public function §4#w§() : AbstractPacket
      {
         return new §!"g§();
      }
      
      override public function §package package final§() : int
      {
         return 33;
      }
      
      override public function getPacketId() : int
      {
         return -911626491;
      }
   }
}

