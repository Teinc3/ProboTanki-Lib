package §while set switch§
{
   import §&#;§.AbstractPacket;
   import §;"?§.§#">§;
   import §each throw§.§super set var§;
   
   public class §1"H§ extends AbstractPacket
   {
      public var shooter:String;
      
      public var direction:§#">§;
      
      public var targets:Vector.<§super set var§>;
      
      public function §1"H§(param1:String = "", param2:§#">§ = null, param3:Vector.<§super set var§> = null)
      {
         super();
         this.shooter = param1;
         this.direction = param2;
         this.targets = param3;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecVector3d");
         §with catch with§(param3);
         §super for switch§("scpacker.networking.protocol.codec.custom.VectorCodecTargetHit");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.shooter = param1 as String;
               break;
            case 1:
               this.direction = param1 as §#">§;
               break;
            case 2:
               this.targets = param1 as Vector.<§super set var§>;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §1"H§();
      }
      
      override public function §package package final§() : int
      {
         return 70;
      }
      
      override public function getPacketId() : int
      {
         return 471157826;
      }
   }
}

