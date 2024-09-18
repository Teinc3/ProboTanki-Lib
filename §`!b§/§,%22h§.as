package §`!b§
{
   import §&#;§.AbstractPacket;
   import §;"?§.§#">§;
   
   public class §,"h§ extends AbstractPacket
   {
      public var time:int;
      
      public var targets:Vector.<String>;
      
      public var §<"_§:Vector.<int>;
      
      public var §var package return§:Vector.<§#">§>;
      
      public var §3!;§:Vector.<§#">§>;
      
      public function §,"h§(param1:int = 0, param2:Vector.<String> = null, param3:Vector.<int> = null, param4:Vector.<§#">§> = null, param5:Vector.<§#">§> = null)
      {
         super();
         this.time = param1;
         this.targets = param2;
         this.§<"_§ = param3;
         this.§var package return§ = param4;
         this.§3!;§ = param5;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.complex.VectorCodecString");
         §with catch with§(param3);
         §super for switch§("scpacker.networking.protocol.codec.custom.VectorCodecShort");
         §with catch with§(param4);
         §super for switch§("scpacker.networking.protocol.codec.custom.VectorCodecVector3d");
         §with catch with§(param5);
         §super for switch§("scpacker.networking.protocol.codec.custom.VectorCodecVector3d");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.time = param1 as int;
               break;
            case 1:
               this.targets = param1 as Vector.<String>;
               break;
            case 2:
               this.§<"_§ = param1 as Vector.<int>;
               break;
            case 3:
               this.§var package return§ = param1 as Vector.<§#">§>;
               break;
            case 4:
               this.§3!;§ = param1 as Vector.<§#">§>;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §,"h§();
      }
      
      override public function §package package final§() : int
      {
         return 57;
      }
      
      override public function getPacketId() : int
      {
         return 1395251766;
      }
   }
}

