package Renamed352
{
   import Renamed189.AbstractPacket;
   
   public class Renamed8089 extends AbstractPacket
   {
      public var advicedUids:Vector.<String>;
      
      public function Renamed8089(param1:Vector.<String> = null)
      {
         super();
         this.advicedUids = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.complex.VectorCodecString");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.advicedUids = param1 as Vector.<String>;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed8089();
      }
      
      override public function Renamed4883() : int
      {
         return 8;
      }
      
      override public function getPacketId() : int
      {
         return 442888643;
      }
   }
}

