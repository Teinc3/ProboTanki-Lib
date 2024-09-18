package Renamed2402
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed4141 extends AbstractPacket
   {
      public var Renamed706:Vector.<int>;
      
      public function Renamed4141(param1:Vector.<int> = null)
      {
         super();
         this.Renamed706 = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.complex.VectorCodecInt");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.Renamed706 = param1 as Vector.<int>;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed4141();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 36;
      }
      
      override public function getPacketId() : int
      {
         return -745598420;
      }
   }
}

