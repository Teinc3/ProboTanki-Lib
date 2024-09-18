package Renamed442
{
   import AbstractPackets.AbstractPacket;
   import projects.tanks.client.chat.models.chat.chat.ChatCC;
   
   public class Renamed5168 extends AbstractPacket
   {
      public var initParams:ChatCC;
      
      public function Renamed5168(param1:ChatCC = null)
      {
         super();
         this.initParams = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecChatCC");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.initParams = param1 as ChatCC;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed5168();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 28;
      }
      
      override public function getPacketId() : int
      {
         return 178154988;
      }
   }
}

