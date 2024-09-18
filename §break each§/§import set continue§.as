package §break each§
{
   import §&#;§.AbstractPacket;
   
   public class §import set continue§ extends AbstractPacket
   {
      public var battleId:String;
      
      public var userId:String;
      
      public var suspicious:Boolean;
      
      public function §import set continue§(param1:String = "", param2:String = "", param3:Boolean = false)
      {
         super();
         this.battleId = param1;
         this.userId = param2;
         this.suspicious = param3;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param3);
         §super for switch§("scpacker.networking.protocol.codec.primitive.BooleanCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.battleId = param1 as String;
               break;
            case 1:
               this.userId = param1 as String;
               break;
            case 2:
               this.suspicious = param1 as Boolean;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §import set continue§();
      }
      
      override public function §package package final§() : int
      {
         return 33;
      }
      
      override public function getPacketId() : int
      {
         return -698399183;
      }
   }
}

