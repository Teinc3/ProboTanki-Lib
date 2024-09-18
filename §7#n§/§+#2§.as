package §7#n§
{
   import §&#;§.AbstractPacket;
   import §;"?§.§#">§;
   
   public class §+#2§ extends AbstractPacket
   {
      public var §-#`§:int;
      
      public var staticHitPoint:§#">§;
      
      public var targets:Vector.<String>;
      
      public var targetHitPoints:Vector.<§#">§>;
      
      public var §throw package override§:Vector.<int>;
      
      public var §var package return§:Vector.<§#">§>;
      
      public var §3!;§:Vector.<§#">§>;
      
      public function §+#2§(param1:int = 0, param2:§#">§ = null, param3:Vector.<String> = null, param4:Vector.<§#">§> = null, param5:Vector.<int> = null, param6:Vector.<§#">§> = null, param7:Vector.<§#">§> = null)
      {
         super();
         this.§-#`§ = param1;
         this.staticHitPoint = param2;
         this.targets = param3;
         this.targetHitPoints = param4;
         this.§throw package override§ = param5;
         this.§var package return§ = param6;
         this.§3!;§ = param7;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecVector3d");
         §with catch with§(param3);
         §super for switch§("scpacker.networking.protocol.codec.complex.VectorCodecString");
         §with catch with§(param4);
         §super for switch§("scpacker.networking.protocol.codec.custom.VectorCodecVector3d");
         §with catch with§(param5);
         §super for switch§("scpacker.networking.protocol.codec.custom.VectorCodecShort");
         §with catch with§(param6);
         §super for switch§("scpacker.networking.protocol.codec.custom.VectorCodecVector3d");
         §with catch with§(param7);
         §super for switch§("scpacker.networking.protocol.codec.custom.VectorCodecVector3d");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.§-#`§ = param1 as int;
               break;
            case 1:
               this.staticHitPoint = param1 as §#">§;
               break;
            case 2:
               this.targets = param1 as Vector.<String>;
               break;
            case 3:
               this.targetHitPoints = param1 as Vector.<§#">§>;
               break;
            case 4:
               this.§throw package override§ = param1 as Vector.<int>;
               break;
            case 5:
               this.§var package return§ = param1 as Vector.<§#">§>;
               break;
            case 6:
               this.§3!;§ = param1 as Vector.<§#">§>;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §+#2§();
      }
      
      override public function §package package final§() : int
      {
         return 54;
      }
      
      override public function getPacketId() : int
      {
         return -484994657;
      }
   }
}

