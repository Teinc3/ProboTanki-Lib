package §["@§
{
   import § !g§.§class for case§;
   import §&#;§.AbstractPacket;
   
   public class §+!n§ extends AbstractPacket
   {
      public var team:§class for case§;
      
      public var score:int;
      
      public function §+!n§(param1:§class for case§ = null, param2:int = 0)
      {
         super();
         this.team = param1;
         this.score = param2;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecBattleTeam");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.team = param1 as §class for case§;
               break;
            case 1:
               this.score = param1 as int;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §+!n§();
      }
      
      override public function §package package final§() : int
      {
         return 44;
      }
      
      override public function getPacketId() : int
      {
         return 561771020;
      }
   }
}

