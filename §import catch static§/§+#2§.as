package §import catch static§
{
   import §&#;§.AbstractPacket;
   
   public class §+#2§ extends AbstractPacket
   {
      public var §-#`§:int;
      
      public var shotId:int;
      
      public var shotDirectionX:int;
      
      public var shotDirectionY:int;
      
      public var shotDirectionZ:int;
      
      public function §+#2§(param1:int = 0, param2:int = 0, param3:int = 0, param4:int = 0, param5:int = 0)
      {
         super();
         this.§-#`§ = param1;
         this.shotId = param2;
         this.shotDirectionX = param3;
         this.shotDirectionY = param4;
         this.shotDirectionZ = param5;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
         §with catch with§(param3);
         §super for switch§("scpacker.networking.protocol.codec.primitive.ShortCodec");
         §with catch with§(param4);
         §super for switch§("scpacker.networking.protocol.codec.primitive.ShortCodec");
         §with catch with§(param5);
         §super for switch§("scpacker.networking.protocol.codec.primitive.ShortCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.§-#`§ = param1 as int;
               break;
            case 1:
               this.shotId = param1 as int;
               break;
            case 2:
               this.shotDirectionX = param1 as int;
               break;
            case 3:
               this.shotDirectionY = param1 as int;
               break;
            case 4:
               this.shotDirectionZ = param1 as int;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §+#2§();
      }
      
      override public function §package package final§() : int
      {
         return 53;
      }
      
      override public function getPacketId() : int
      {
         return -1907971330;
      }
   }
}

