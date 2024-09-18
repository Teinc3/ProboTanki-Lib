package §native const true§
{
   import §&#;§.AbstractPacket;
   import §;"?§.§#">§;
   
   public class § !y§ extends AbstractPacket
   {
      public var time:int;
      
      public var target:String;
      
      public var §8!c§:int;
      
      public var §package var true§:§#">§;
      
      public function § !y§(param1:int = 0, param2:String = "", param3:int = 0, param4:§#">§ = null)
      {
         super();
         this.time = param1;
         this.target = param2;
         this.§8!c§ = param3;
         this.§package var true§ = param4;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param3);
         §super for switch§("scpacker.networking.protocol.codec.primitive.ShortCodec");
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
               this.target = param1 as String;
               break;
            case 2:
               this.§8!c§ = param1 as int;
               break;
            case 3:
               this.§package var true§ = param1 as §#">§;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new § !y§();
      }
      
      override public function §package package final§() : int
      {
         return 55;
      }
      
      override public function getPacketId() : int
      {
         return 381067984;
      }
   }
}

