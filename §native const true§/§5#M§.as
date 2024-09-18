package §native const true§
{
   import §&#;§.AbstractPacket;
   import §;"?§.§#">§;
   
   public class §5#M§ extends AbstractPacket
   {
      public var time:int;
      
      public var §8!c§:int;
      
      public var §&#9§:§#">§;
      
      public var §package var true§:§#">§;
      
      public function §5#M§(param1:int = 0, param2:int = 0, param3:§#">§ = null, param4:§#">§ = null)
      {
         super();
         this.time = param1;
         this.§8!c§ = param2;
         this.§&#9§ = param3;
         this.§package var true§ = param4;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.primitive.ShortCodec");
         §with catch with§(param3);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecVector3d");
         §with catch with§(param4);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecVector3d");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.time = param1 as int;
               break;
            case 1:
               this.§8!c§ = param1 as int;
               break;
            case 2:
               this.§&#9§ = param1 as §#">§;
               break;
            case 3:
               this.§package var true§ = param1 as §#">§;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §5#M§();
      }
      
      override public function §package package final§() : int
      {
         return 55;
      }
      
      override public function getPacketId() : int
      {
         return 244072998;
      }
   }
}

