package §case const static§
{
   import §&#;§.AbstractPacket;
   import §;"?§.§#">§;
   
   public class §&G§ extends AbstractPacket
   {
      public var shooter:String;
      
      public var target:String;
      
      public var relativeHitPoint:§#">§;
      
      public function §&G§(param1:String = "", param2:String = "", param3:§#">§ = null)
      {
         super();
         this.shooter = param1;
         this.target = param2;
         this.relativeHitPoint = param3;
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
               this.shooter = param1 as String;
               break;
            case 1:
               this.target = param1 as String;
               break;
            case 2:
               this.relativeHitPoint = param1 as §#">§;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §&G§();
      }
      
      override public function §package package final§() : int
      {
         return 52;
      }
      
      override public function getPacketId() : int
      {
         return -190359403;
      }
   }
}

