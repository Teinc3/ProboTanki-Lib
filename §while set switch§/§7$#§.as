package §while set switch§
{
   import §&#;§.AbstractPacket;
   import §;"?§.§#">§;
   import projects.tanks.client.battlefield.models.tankparts.weapons.common.§default for break§;
   
   public class §7$#§ extends AbstractPacket
   {
      public var §-#`§:int;
      
      public var direction:§#">§;
      
      public var targets:Vector.<§default for break§>;
      
      public function §7$#§(param1:int = 0, param2:§#">§ = null, param3:Vector.<§default for break§> = null)
      {
         super();
         this.§-#`§ = param1;
         this.direction = param2;
         this.targets = param3;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecVector3d");
         §with catch with§(param3);
         §super for switch§("scpacker.networking.protocol.codec.custom.VectorCodecTargetPosition");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.§-#`§ = param1 as int;
               break;
            case 1:
               this.direction = param1 as §#">§;
               break;
            case 2:
               this.targets = param1 as Vector.<§default for break§>;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §7$#§();
      }
      
      override public function §package package final§() : int
      {
         return 70;
      }
      
      override public function getPacketId() : int
      {
         return -541655881;
      }
   }
}

