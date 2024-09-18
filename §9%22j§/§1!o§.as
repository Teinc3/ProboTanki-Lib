package §9"j§
{
   import §&#;§.AbstractPacket;
   import §;"?§.§#">§;
   
   public class §1!o§ extends AbstractPacket
   {
      public var shooterId:String;
      
      public var targetTank:String;
      
      public var localSpotPosition:§#">§;
      
      public function §1!o§(param1:String = "", param2:String = "", param3:§#">§ = null)
      {
         super();
         this.shooterId = param1;
         this.targetTank = param2;
         this.localSpotPosition = param3;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param3);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecVector3d");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.shooterId = param1 as String;
               break;
            case 1:
               this.targetTank = param1 as String;
               break;
            case 2:
               this.localSpotPosition = param1 as §#">§;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §1!o§();
      }
      
      override public function §package package final§() : int
      {
         return 50;
      }
      
      override public function getPacketId() : int
      {
         return 11992250;
      }
   }
}

