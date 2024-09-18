package Renamed495
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed4847 extends AbstractPacket
   {
      public var time:int;
      
      public function Renamed4847(param1:int = 0)
      {
         super();
         this.time = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.time = param1 as int;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed4847();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 57;
      }
      
      override public function getPacketId() : int
      {
         return -1986638927;
      }
   }
}

