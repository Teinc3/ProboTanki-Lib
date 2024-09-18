package §set package native§
{
   import § !g§.§class for case§;
   import §&#;§.AbstractPacket;
   import §;"?§.§#">§;
   
   public class §finally for catch§ extends AbstractPacket
   {
      public var tankId:String;
      
      public var team:§class for case§;
      
      public var position:§#">§;
      
      public var orientation:§#">§;
      
      public var health:int;
      
      public var incarnationId:int;
      
      public function §finally for catch§(param1:String = "", param2:§class for case§ = null, param3:§#">§ = null, param4:§#">§ = null, param5:int = 0, param6:int = 0)
      {
         super();
         this.tankId = param1;
         this.team = param2;
         this.position = param3;
         this.orientation = param4;
         this.health = param5;
         this.incarnationId = param6;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecBattleTeam");
         §with catch with§(param3);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecVector3d");
         §with catch with§(param4);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecVector3d");
         §with catch with§(param5);
         §super for switch§("scpacker.networking.protocol.codec.primitive.ShortCodec");
         §with catch with§(param6);
         §super for switch§("scpacker.networking.protocol.codec.primitive.ShortCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.tankId = param1 as String;
               break;
            case 1:
               this.team = param1 as §class for case§;
               break;
            case 2:
               this.position = param1 as §#">§;
               break;
            case 3:
               this.orientation = param1 as §#">§;
               break;
            case 4:
               this.health = param1 as int;
               break;
            case 5:
               this.incarnationId = param1 as int;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §finally for catch§();
      }
      
      override public function §package package final§() : int
      {
         return 39;
      }
      
      override public function getPacketId() : int
      {
         return 875259457;
      }
   }
}

