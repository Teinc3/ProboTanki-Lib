package §<">§
{
   import §&#;§.AbstractPacket;
   import §;"?§.§#">§;
   
   public class §native var set§ extends AbstractPacket
   {
      public var bonusId:String;
      
      public var position:§#">§;
      
      public var §class package static§:int;
      
      public function §native var set§(param1:String = "", param2:§#">§ = null, param3:int = 0)
      {
         super();
         this.bonusId = param1;
         this.position = param2;
         this.§class package static§ = param3;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecVector3d");
         §with catch with§(param3);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.bonusId = param1 as String;
               break;
            case 1:
               this.position = param1 as §#">§;
               break;
            case 2:
               this.§class package static§ = param1 as int;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §native var set§();
      }
      
      override public function §package package final§() : int
      {
         return 36;
      }
      
      override public function getPacketId() : int
      {
         return 1831462385;
      }
   }
}

