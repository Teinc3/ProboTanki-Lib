package §break each§
{
   import § !g§.§class for case§;
   import §&#;§.AbstractPacket;
   import projects.tanks.client.battleselect.model.info.BattleInfoUser;
   
   public class §default var import§ extends AbstractPacket
   {
      public var battleId:String;
      
      public var user:BattleInfoUser;
      
      public var team:§class for case§;
      
      public function §default var import§(param1:String = "", param2:BattleInfoUser = null, param3:§class for case§ = null)
      {
         super();
         this.battleId = param1;
         this.user = param2;
         this.team = param3;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecBattleInfoUser");
         §with catch with§(param3);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecBattleTeam");
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
               break;
            case 2:
               this.team = param1 as §class for case§;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §default var import§();
      }
      
      override public function §package package final§() : int
      {
         return 33;
      }
      
      override public function getPacketId() : int
      {
         return 118447426;
      }
   }
}

