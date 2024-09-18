package §else for implements§
{
   import §&#;§.AbstractPacket;
   import platform.client.fp10.core.resource.Resource;
   
   public class §for for null§ extends AbstractPacket
   {
      public var bgResource:Resource;
      
      public var enableRequiredEmail:Boolean;
      
      public var maxPasswordLength:int;
      
      public var minPasswordLength:int;
      
      public function §for for null§(param1:Resource = null, param2:Boolean = false, param3:int = 0, param4:int = 0)
      {
         super();
         this.bgResource = param1;
         this.enableRequiredEmail = param2;
         this.maxPasswordLength = param3;
         this.minPasswordLength = param4;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         §with catch with§(param3);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
         §with catch with§(param4);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.bgResource = param1 as Resource;
               break;
            case 1:
               this.enableRequiredEmail = param1 as Boolean;
               break;
            case 2:
               this.maxPasswordLength = param1 as int;
               break;
            case 3:
               this.minPasswordLength = param1 as int;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §for for null§();
      }
      
      override public function §package package final§() : int
      {
         return 8;
      }
      
      override public function getPacketId() : int
      {
         return -1277343167;
      }
   }
}

