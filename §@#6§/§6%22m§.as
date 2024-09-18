package §@#6§
{
   import §&#;§.AbstractPacket;
   import §;"?§.§#">§;
   
   public class §6"m§ extends AbstractPacket
   {
      public var §-#`§:int;
      
      public var hitPoint:§#">§;
      
      public function §6"m§(param1:int = 0, param2:§#">§ = null)
      {
         super();
         this.§-#`§ = param1;
         this.hitPoint = param2;
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
               this.hitPoint = param1 as §#">§;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §6"m§();
      }
      
      override public function §package package final§() : int
      {
         return 49;
      }
      
      override public function getPacketId() : int
      {
         return 1470597926;
      }
   }
}

