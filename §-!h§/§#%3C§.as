package §-!h§
{
   import §&#;§.AbstractPacket;
   import platform.client.fp10.core.resource.Resource;
   
   public class §#<§ extends AbstractPacket
   {
      public var text:String;
      
      public var sound:Resource;
      
      public function §#<§(param1:String = "", param2:Resource = null)
      {
         super();
         this.text = param1;
         this.sound = param2;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.text = param1 as String;
               break;
            case 1:
               this.sound = param1 as Resource;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §#<§();
      }
      
      override public function §package package final§() : int
      {
         return 65;
      }
      
      override public function getPacketId() : int
      {
         return -666893269;
      }
   }
}

