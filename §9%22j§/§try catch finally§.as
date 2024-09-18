package §9"j§
{
   import §&#;§.AbstractPacket;
   import §;"?§.§#">§;
   
   public class §try catch finally§ extends AbstractPacket
   {
      public var targetTank:String;
      
      public var localSpotPosition:§#">§;
      
      public function §try catch finally§(param1:String = "", param2:§#">§ = null)
      {
         super();
         this.targetTank = param1;
         this.localSpotPosition = param2;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecVector3d");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.targetTank = param1 as String;
               break;
            case 1:
               this.localSpotPosition = param1 as §#">§;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §try catch finally§();
      }
      
      override public function §package package final§() : int
      {
         return 50;
      }
      
      override public function getPacketId() : int
      {
         return -1517837003;
      }
   }
}

