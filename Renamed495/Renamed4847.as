package Renamed495
{
   import Renamed189.AbstractPacket;
   
   public class Renamed4847 extends AbstractPacket
   {
      public var time:int;
      
      public function Renamed4847(param1:int = 0)
      {
         super();
         this.time = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.time = param1 as int;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed4847();
      }
      
      override public function Renamed4883() : int
      {
         return 57;
      }
      
      override public function getPacketId() : int
      {
         return -1986638927;
      }
   }
}

