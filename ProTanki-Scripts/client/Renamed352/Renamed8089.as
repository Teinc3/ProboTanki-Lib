package Renamed352
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed8089 extends AbstractPacket
   {
      public var advicedUids:Vector.<String>;
      
      public function Renamed8089(param1:Vector.<String> = null)
      {
         super();
         this.advicedUids = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.complex.VectorCodecString");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.advicedUids = param1 as Vector.<String>;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed8089();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 8;
      }
      
      override public function getPacketId() : int
      {
         return 442888643;
      }
   }
}

