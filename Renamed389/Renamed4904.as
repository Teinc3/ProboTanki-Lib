package Renamed389
{
   import Renamed189.AbstractPacket;
   
   public class Renamed4904 extends AbstractPacket
   {
      public var Renamed6864:int;
      
      public function Renamed4904(param1:int = 0)
      {
         super();
         this.Renamed6864 = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.Renamed6864 = param1 as int;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed4904();
      }
      
      override public function Renamed4883() : int
      {
         return 53;
      }
      
      override public function getPacketId() : int
      {
         return 1147113344;
      }
   }
}

