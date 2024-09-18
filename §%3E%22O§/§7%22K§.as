package §>"O§
{
   import §&#;§.AbstractPacket;
   
   public class §7"K§ extends AbstractPacket
   {
      public var itemId:String;
      
      public function §7"K§(param1:String = "")
      {
         super();
         this.itemId = param1;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.itemId = param1 as String;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §7"K§();
      }
      
      override public function §package package final§() : int
      {
         return 34;
      }
      
      override public function getPacketId() : int
      {
         return -803365239;
      }
   }
}

