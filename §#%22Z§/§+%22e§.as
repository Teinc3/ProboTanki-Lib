package §#"Z§
{
   import §&#;§.AbstractPacket;
   
   public class §+"e§ extends AbstractPacket
   {
      public var itemId:String;
      
      public var time:int;
      
      public var decrease:Boolean;
      
      public function §+"e§(param1:String = "", param2:int = 0, param3:Boolean = false)
      {
         super();
         this.itemId = param1;
         this.time = param2;
         this.decrease = param3;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
         §with catch with§(param3);
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
               this.time = param1 as int;
               break;
            case 2:
               this.decrease = param1 as Boolean;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §+"e§();
      }
      
      override public function §package package final§() : int
      {
         return 43;
      }
      
      override public function getPacketId() : int
      {
         return 2032104949;
      }
   }
}

