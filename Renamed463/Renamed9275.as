package Renamed463
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed9275 extends AbstractPacket
   {
      public var suicideDelayMS:int;
      
      public function Renamed9275(param1:int = 0)
      {
         super();
         this.suicideDelayMS = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.suicideDelayMS = param1 as int;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed9275();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 59;
      }
      
      override public function getPacketId() : int
      {
         return -911983090;
      }
   }
}

