package Renamed262
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed5800 extends AbstractPacket
   {
      public function Renamed5800()
      {
         super();
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed5800();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 45;
      }
      
      override public function getPacketId() : int
      {
         return 1484572481;
      }
   }
}

