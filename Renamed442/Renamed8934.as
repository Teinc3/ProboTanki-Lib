package Renamed442
{
   import Renamed189.AbstractPacket;
   import projects.tanks.client.chat.types.ChatMessage;
   
   public class Renamed8933 extends AbstractPacket
   {
      public var messages:Vector.<ChatMessage>;
      
      public function Renamed8933(param1:Vector.<ChatMessage> = null)
      {
         super();
         this.messages = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.custom.VectorCodecChatMessage");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.messages = param1 as Vector.<ChatMessage>;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed8933();
      }
      
      override public function Renamed4883() : int
      {
         return 28;
      }
      
      override public function getPacketId() : int
      {
         return -1263520410;
      }
   }
}

