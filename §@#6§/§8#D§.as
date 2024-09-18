package §@#6§
{
   import §&#;§.AbstractPacket;
   import §;"?§.§#">§;
   
   public class §8#D§ extends AbstractPacket
   {
      public var §-#`§:int;
      
      public var target:String;
      
      public var §8!c§:int;
      
      public var §&#9§:§#">§;
      
      public var hitPoint:§#">§;
      
      public var §const package return§:§#">§;
      
      public function §8#D§(param1:int = 0, param2:String = "", param3:int = 0, param4:§#">§ = null, param5:§#">§ = null, param6:§#">§ = null)
      {
         super();
         this.§-#`§ = param1;
         this.target = param2;
         this.§8!c§ = param3;
         this.§&#9§ = param4;
         this.hitPoint = param5;
         this.§const package return§ = param6;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param3);
         §super for switch§("scpacker.networking.protocol.codec.primitive.ShortCodec");
         §with catch with§(param4);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecVector3d");
         §with catch with§(param5);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecVector3d");
         §with catch with§(param6);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecVector3d");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.§-#`§ = param1 as int;
               break;
            case 1:
               this.target = param1 as String;
               break;
            case 2:
               this.§8!c§ = param1 as int;
               break;
            case 3:
               this.§&#9§ = param1 as §#">§;
               break;
            case 4:
               this.hitPoint = param1 as §#">§;
               break;
            case 5:
               this.§const package return§ = param1 as §#">§;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §8#D§();
      }
      
      override public function §package package final§() : int
      {
         return 49;
      }
      
      override public function getPacketId() : int
      {
         return 229267683;
      }
   }
}

