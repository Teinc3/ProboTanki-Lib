package §>"O§
{
   import §&#;§.AbstractPacket;
   
   public class §<!g§ extends AbstractPacket
   {
      public var itemId:String;
      
      public var mounted:Boolean;
      
      public function §<!g§(param1:String = "", param2:Boolean = false)
      {
         super();
         this.itemId = param1;
         this.mounted = param2;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.primitive.BooleanCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.itemId = param1 as String;
               break;
            case 1:
               this.mounted = param1 as Boolean;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §<!g§();
      }
      
      override public function §package package final§() : int
      {
         return 34;
      }
      
      override public function getPacketId() : int
      {
         return 2062201643;
      }
   }
}

