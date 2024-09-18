package Renamed314
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed7655 extends AbstractPacket
   {
      public var score:int;
      
      public function Renamed7655(param1:int = 0)
      {
         super();
         this.score = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.score = param1 as int;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed7655();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 29;
      }
      
      override public function getPacketId() : int
      {
         return 2116086491;
      }
   }
}

