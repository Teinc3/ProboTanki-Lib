package §finally each§
{
   import §&#;§.AbstractPacket;
   
   public class §^u§ extends AbstractPacket
   {
      public var §null const final§:Vector.<String>;
      
      public var §0"C§:String;
      
      public function §^u§(param1:Vector.<String> = null, param2:String = "")
      {
         super();
         this.§null const final§ = param1;
         this.§0"C§ = param2;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.complex.VectorCodecString");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.§null const final§ = param1 as Vector.<String>;
               break;
            case 1:
               this.§0"C§ = param1 as String;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §^u§();
      }
      
      override public function §package package final§() : int
      {
         return 76;
      }
      
      override public function getPacketId() : int
      {
         return -762658127;
      }
   }
}

