package §9"j§
{
   import §&#;§.AbstractPacket;
   import §;"?§.§#">§;
   
   public class §false var false§ extends AbstractPacket
   {
      public var shooter:String;
      
      public var staticHitPoint:§#">§;
      
      public var targets:Vector.<String>;
      
      public var targetHitPoints:Vector.<§#">§>;
      
      public var impactForce:Number;
      
      public function §false var false§(param1:String = "", param2:§#">§ = null, param3:Vector.<String> = null, param4:Vector.<§#">§> = null, param5:Number = 0)
      {
         super();
         this.shooter = param1;
         this.staticHitPoint = param2;
         this.targets = param3;
         this.targetHitPoints = param4;
         this.impactForce = param5;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecVector3d");
         §with catch with§(param3);
         §super for switch§("scpacker.networking.protocol.codec.complex.VectorCodecString");
         §with catch with§(param4);
         §super for switch§("scpacker.networking.protocol.codec.custom.VectorCodecVector3d");
         §with catch with§(param5);
         §super for switch§("scpacker.networking.protocol.codec.primitive.FloatCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.shooter = param1 as String;
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
               this.impactForce = param1 as Number;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §false var false§();
      }
      
      override public function §package package final§() : int
      {
         return 50;
      }
      
      override public function getPacketId() : int
      {
         return 1184835319;
      }
   }
}

