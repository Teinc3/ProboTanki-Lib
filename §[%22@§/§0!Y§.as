package §["@§
{
   import § !g§.§class for case§;
   import §&#;§.AbstractPacket;
   import projects.tanks.client.battleservice.model.statistics.§in for for§;
   
   public class §0!Y§ extends AbstractPacket
   {
      public var userId:String;
      
      public var usersInfo:Vector.<§in for for§>;
      
      public var team:§class for case§;
      
      public function §0!Y§(param1:String = "", param2:Vector.<§in for for§> = null, param3:§class for case§ = null)
      {
         super();
         this.userId = param1;
         this.usersInfo = param2;
         this.team = param3;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.custom.VectorCodecUserInfo");
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
               this.usersInfo = param1 as Vector.<§in for for§>;
               break;
            case 2:
               this.team = param1 as §class for case§;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §0!Y§();
      }
      
      override public function §package package final§() : int
      {
         return 44;
      }
      
      override public function getPacketId() : int
      {
         return 2040021062;
      }
   }
}

