package Renamed284
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed4354 extends AbstractPacket
   {
      public var questId:int;
      
      public function Renamed4354(param1:int = 0)
      {
         super();
         this.questId = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.questId = param1 as int;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed4354();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 19;
      }
      
      override public function getPacketId() : int
      {
         return 1642608662;
      }
   }
}

