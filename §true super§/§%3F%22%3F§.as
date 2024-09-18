package §true super§
{
   import §&#;§.AbstractPacket;
   import projects.tanks.client.chat.types.ChatMessage;
   
   public class §?"?§ extends AbstractPacket
   {
      public var messages:Vector.<ChatMessage>;
      
      public function §?"?§(param1:Vector.<ChatMessage> = null)
      {
         super();
         this.messages = param1;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.custom.VectorCodecChatMessage");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.messages = param1 as Vector.<ChatMessage>;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §?"?§();
      }
      
      override public function §package package final§() : int
      {
         return 28;
      }
      
      override public function getPacketId() : int
      {
         return -1263520410;
      }
   }
}

