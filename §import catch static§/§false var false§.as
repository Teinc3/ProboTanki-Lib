package §import catch static§
{
   import §&#;§.AbstractPacket;
   
   public class §false var false§ extends AbstractPacket
   {
      public var shooter:String;
      
      public var shotDirectionX:int;
      
      public var shotDirectionY:int;
      
      public var shotDirectionZ:int;
      
      public function §false var false§(param1:String = "", param2:int = 0, param3:int = 0, param4:int = 0)
      {
         super();
         this.shooter = param1;
         this.shotDirectionX = param2;
         this.shotDirectionY = param3;
         this.shotDirectionZ = param4;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.primitive.ShortCodec");
         §with catch with§(param3);
         §super for switch§("scpacker.networking.protocol.codec.primitive.ShortCodec");
         §with catch with§(param4);
         §super for switch§("scpacker.networking.protocol.codec.primitive.ShortCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.shooter = param1 as String;
               break;
            case 1:
               this.shotDirectionX = param1 as int;
               break;
            case 2:
               this.shotDirectionY = param1 as int;
               break;
            case 3:
               this.shotDirectionZ = param1 as int;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §false var false§();
      }
      
      override public function §package package final§() : int
      {
         return 53;
      }
      
      override public function getPacketId() : int
      {
         return -118119523;
      }
   }
}

