package Renamed442
{
   import AbstractPackets.AbstractPacket;
   import projects.tanks.client.chat.types.ChatMessage;
   
   public class Renamed8933 extends AbstractPacket
   {
      public var messages:Vector.<ChatMessage>;
      
      public function Renamed8933(param1:Vector.<ChatMessage> = null)
      {
         super();
         this.messages = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.VectorCodecChatMessage");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.messages = param1 as Vector.<ChatMessage>;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed8933();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 28;
      }
      
      override public function getPacketId() : int
      {
         return -1263520410;
      }
   }
}

