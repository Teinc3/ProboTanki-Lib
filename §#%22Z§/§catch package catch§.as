package §#"Z§
{
   import §&#;§.AbstractPacket;
   
   public class §catch package catch§ extends AbstractPacket
   {
      public var itemId:String;
      
      public var count:int;
      
      public function §catch package catch§(param1:String = "", param2:int = 0)
      {
         super();
         this.itemId = param1;
         this.count = param2;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.itemId = param1 as String;
               break;
            case 1:
               this.count = param1 as int;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §catch package catch§();
      }
      
      override public function §package package final§() : int
      {
         return 43;
      }
      
      override public function getPacketId() : int
      {
         return -502907094;
      }
   }
}

