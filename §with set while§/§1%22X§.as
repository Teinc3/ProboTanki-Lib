package §with set while§
{
   import §&#;§.AbstractPacket;
   
   public class §1"X§ extends AbstractPacket
   {
      public var itemId:String;
      
      public var §dynamic set case§:String;
      
      public function §1"X§(param1:String = "", param2:String = "")
      {
         super();
         this.itemId = param1;
         this.§dynamic set case§ = param2;
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
               this.itemId = param1 as String;
               break;
            case 1:
               this.§dynamic set case§ = param1 as String;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §1"X§();
      }
      
      override public function §package package final§() : int
      {
         return 16;
      }
      
      override public function getPacketId() : int
      {
         return 880756819;
      }
   }
}

