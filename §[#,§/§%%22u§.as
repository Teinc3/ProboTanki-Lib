package §[#,§
{
   import §&#;§.AbstractPacket;
   
   public class §%"u§ extends AbstractPacket
   {
      public var shooter:String;
      
      public var barrel:int;
      
      public function §%"u§(param1:String = "", param2:int = 0)
      {
         super();
         this.shooter = param1;
         this.barrel = param2;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.primitive.ByteCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.shooter = param1 as String;
               break;
            case 1:
               this.barrel = param1 as int;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §%"u§();
      }
      
      override public function §package package final§() : int
      {
         return 51;
      }
      
      override public function getPacketId() : int
      {
         return -328554480;
      }
   }
}

