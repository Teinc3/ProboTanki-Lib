package §break each§
{
   import § !g§.§class for case§;
   import §&#;§.AbstractPacket;
   
   public class §static var while§ extends AbstractPacket
   {
      public var battleId:String;
      
      public var teamType:§class for case§;
      
      public var score:int;
      
      public function §static var while§(param1:String = "", param2:§class for case§ = null, param3:int = 0)
      {
         super();
         this.battleId = param1;
         this.teamType = param2;
         this.score = param3;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecBattleTeam");
         §with catch with§(param3);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.battleId = param1 as String;
               break;
            case 1:
               this.teamType = param1 as §class for case§;
               break;
            case 2:
               this.score = param1 as int;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §static var while§();
      }
      
      override public function §package package final§() : int
      {
         return 33;
      }
      
      override public function getPacketId() : int
      {
         return 1428217189;
      }
   }
}

