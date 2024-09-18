package §[!X§
{
   import §&#;§.AbstractPacket;
   import §;"?§.§#">§;
   
   public class §9!p§ extends AbstractPacket
   {
      public var flagId:int;
      
      public var position:§#">§;
      
      public function §9!p§(param1:int = 0, param2:§#">§ = null)
      {
         super();
         this.flagId = param1;
         this.position = param2;
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
               this.flagId = param1 as int;
               break;
            case 1:
               this.position = param1 as §#">§;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §9!p§();
      }
      
      override public function §package package final§() : int
      {
         return 71;
      }
      
      override public function getPacketId() : int
      {
         return 1817559787;
      }
   }
}

