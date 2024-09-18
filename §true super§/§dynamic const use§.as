package §true super§
{
   import §&#;§.AbstractPacket;
   import projects.tanks.client.chat.models.chat.chat.ChatCC;
   
   public class §dynamic const use§ extends AbstractPacket
   {
      public var initParams:ChatCC;
      
      public function §dynamic const use§(param1:ChatCC = null)
      {
         super();
         this.initParams = param1;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecChatCC");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.initParams = param1 as ChatCC;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §dynamic const use§();
      }
      
      override public function §package package final§() : int
      {
         return 28;
      }
      
      override public function getPacketId() : int
      {
         return 178154988;
      }
   }
}

