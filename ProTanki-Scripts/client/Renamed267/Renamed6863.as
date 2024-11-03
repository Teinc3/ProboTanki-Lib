package Renamed267
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed4902 extends AbstractPacket
   {
      public var time:int;
      
      public function Renamed4902(param1:int = 0)
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
         return new Renamed4902();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 54;
      }
      
      override public function getPacketId() : int
      {
         return -1759063234;
      }
   }
}

