package §static set if§
{
   import §&#;§.AbstractPacket;
   
   public class §5!_§ extends AbstractPacket
   {
      public var password:String;
      
      public var email:String;
      
      public function §5!_§(param1:String = "", param2:String = "")
      {
         super();
         this.password = param1;
         this.email = param2;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.password = param1 as String;
               break;
            case 1:
               this.email = param1 as String;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §5!_§();
      }
      
      override public function §package package final§() : int
      {
         return 24;
      }
      
      override public function getPacketId() : int
      {
         return 147737736;
      }
   }
}

