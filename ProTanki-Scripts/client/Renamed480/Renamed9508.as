package Renamed8372
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed8373 extends AbstractPacket
   {
      public var Renamed9507:Vector.<String>;
      
      public function Renamed8373(param1:Vector.<String> = null)
      {
         super();
         this.Renamed9507 = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.complex.VectorCodecString");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.Renamed9507 = param1 as Vector.<String>;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed8373();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 18;
      }
      
      override public function getPacketId() : int
      {
         return -2040152224;
      }
   }
}

