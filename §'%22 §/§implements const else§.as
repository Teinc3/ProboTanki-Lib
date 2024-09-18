package §'" §
{
   import §&#;§.AbstractPacket;
   import platform.client.fp10.core.resource.Resource;
   
   public class §implements const else§ extends AbstractPacket
   {
      public var image:Resource;
      
      public var bottomText:String;
      
      public var topText:String;
      
      public function §implements const else§(param1:Resource = null, param2:String = "", param3:String = "")
      {
         super();
         this.image = param1;
         this.bottomText = param2;
         this.topText = param3;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param3);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.image = param1 as Resource;
               break;
            case 1:
               this.bottomText = param1 as String;
               break;
            case 2:
               this.topText = param1 as String;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §implements const else§();
      }
      
      override public function §package package final§() : int
      {
         return 21;
      }
      
      override public function getPacketId() : int
      {
         return -875418096;
      }
   }
}

