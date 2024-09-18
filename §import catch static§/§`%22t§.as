package §import catch static§
{
   import §&#;§.AbstractPacket;
   import §;"?§.§#">§;
   
   public class §`"t§ extends AbstractPacket
   {
      public var §-#`§:int;
      
      public var target:String;
      
      public var shotId:int;
      
      public var §&#9§:§#">§;
      
      public var §9!i§:Vector.<§#">§>;
      
      public function §`"t§(param1:int = 0, param2:String = "", param3:int = 0, param4:§#">§ = null, param5:Vector.<§#">§> = null)
      {
         super();
         this.§-#`§ = param1;
         this.target = param2;
         this.shotId = param3;
         this.§&#9§ = param4;
         this.§9!i§ = param5;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param3);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
         §with catch with§(param4);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecVector3d");
         §with catch with§(param5);
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
               this.target = param1 as String;
               break;
            case 2:
               this.shotId = param1 as int;
               break;
            case 3:
               this.§&#9§ = param1 as §#">§;
               break;
            case 4:
               this.§9!i§ = param1 as Vector.<§#">§>;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §`"t§();
      }
      
      override public function §package package final§() : int
      {
         return 53;
      }
      
      override public function getPacketId() : int
      {
         return 1229701582;
      }
   }
}

