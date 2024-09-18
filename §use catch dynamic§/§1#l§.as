package §use catch dynamic§
{
   import § !g§.§class for case§;
   import §&#;§.AbstractPacket;
   
   public class §1#l§ extends AbstractPacket
   {
      public var userId:String;
      
      public var message:String;
      
      public var team:§class for case§;
      
      public function §1#l§(param1:String = "", param2:String = "", param3:§class for case§ = null)
      {
         super();
         this.userId = param1;
         this.message = param2;
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
               this.userId = param1 as String;
               break;
            case 1:
               this.message = param1 as String;
               break;
            case 2:
               this.team = param1 as §class for case§;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §1#l§();
      }
      
      override public function §package package final§() : int
      {
         return 61;
      }
      
      override public function getPacketId() : int
      {
         return -449356094;
      }
   }
}

