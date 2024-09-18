package §import catch super§
{
   import § !g§.§class for case§;
   import §&#;§.AbstractPacket;
   
   public class §8"L§ extends AbstractPacket
   {
      public var battleId:String;
      
      public var userId:String;
      
      public var team:§class for case§;
      
      public function §8"L§(param1:String = "", param2:String = "", param3:§class for case§ = null)
      {
         super();
         this.battleId = param1;
         this.userId = param2;
         this.team = param3;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
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
               this.userId = param1 as String;
               break;
            case 2:
               this.team = param1 as §class for case§;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §8"L§();
      }
      
      override public function §package package final§() : int
      {
         return 32;
      }
      
      override public function getPacketId() : int
      {
         return -169305322;
      }
   }
}

