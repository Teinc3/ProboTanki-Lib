package Renamed221
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed6283 extends AbstractPacket
   {
      public var leftTimeInSeconds:int;
      
      public function Renamed6283(param1:int = 0)
      {
         super();
         this.leftTimeInSeconds = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.leftTimeInSeconds = param1 as int;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed6283();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 11;
      }
      
      override public function getPacketId() : int
      {
         return 1391146385;
      }
   }
}

