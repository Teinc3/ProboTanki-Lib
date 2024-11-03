package Renamed352
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed8100 extends AbstractPacket
   {
      public function Renamed8100()
      {
         super();
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed8100();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 8;
      }
      
      override public function getPacketId() : int
      {
         return -706679202;
      }
   }
}

