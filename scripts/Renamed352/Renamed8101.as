package Renamed352
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed8101 extends AbstractPacket
   {
      public function Renamed8101()
      {
         super();
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed8101();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 8;
      }
      
      override public function getPacketId() : int
      {
         return 1003297349;
      }
   }
}

