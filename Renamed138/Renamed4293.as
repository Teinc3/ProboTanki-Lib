package Renamed4292
{
   import Renamed189.AbstractPacket;
   
   public class Renamed4293 extends AbstractPacket
   {
      public var rememberMe:Boolean;
      
      public function Renamed4293(param1:Boolean = false)
      {
         super();
         this.rememberMe = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.BooleanCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.rememberMe = param1 as Boolean;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed4293();
      }
      
      override public function Renamed4883() : int
      {
         return 3;
      }
      
      override public function getPacketId() : int
      {
         return -1967950183;
      }
   }
}

