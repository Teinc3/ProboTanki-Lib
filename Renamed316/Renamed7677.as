package Renamed316
{
   import Renamed189.AbstractPacket;
   
   public class Renamed7677 extends AbstractPacket
   {
      public var Renamed7669:int;
      
      public function Renamed7677(param1:int = 0)
      {
         super();
         this.Renamed7669 = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.Renamed7669 = param1 as int;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed7677();
      }
      
      override public function Renamed4883() : int
      {
         return 52;
      }
      
      override public function getPacketId() : int
      {
         return -136344740;
      }
   }
}

