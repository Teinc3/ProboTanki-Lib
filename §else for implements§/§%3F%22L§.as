package §else for implements§
{
   import §&#;§.AbstractPacket;
   
   public class §?"L§ extends AbstractPacket
   {
      public var uid:String;
      
      public var password:String;
      
      public var rememberMe:Boolean;
      
      public function §?"L§(param1:String = "", param2:String = "", param3:Boolean = false)
      {
         super();
         this.uid = param1;
         this.password = param2;
         this.rememberMe = param3;
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
               this.uid = param1 as String;
               break;
            case 1:
               this.password = param1 as String;
               break;
            case 2:
               this.rememberMe = param1 as Boolean;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §?"L§();
      }
      
      override public function §package package final§() : int
      {
         return 8;
      }
      
      override public function getPacketId() : int
      {
         return 427083290;
      }
   }
}

