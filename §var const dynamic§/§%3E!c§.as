package §var const dynamic§
{
   import §&#;§.AbstractPacket;
   import §;"?§.§#">§;
   
   public class §>!c§ extends AbstractPacket
   {
      public var §-#`§:int;
      
      public var direction:§#">§;
      
      public function §>!c§(param1:int = 0, param2:§#">§ = null)
      {
         super();
         this.§-#`§ = param1;
         this.direction = param2;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
         §with catch with§(param2);
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
               this.direction = param1 as §#">§;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §>!c§();
      }
      
      override public function §package package final§() : int
      {
         return 74;
      }
      
      override public function getPacketId() : int
      {
         return 299028276;
      }
   }
}

