package Renamed221
{
   import Renamed189.AbstractPacket;
   
   public class Renamed6283 extends AbstractPacket
   {
      public var leftTimeInSeconds:int;
      
      public function Renamed6283(param1:int = 0)
      {
         super();
         this.leftTimeInSeconds = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.leftTimeInSeconds = param1 as int;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed6283();
      }
      
      override public function Renamed4883() : int
      {
         return 11;
      }
      
      override public function getPacketId() : int
      {
         return 1391146385;
      }
   }
}

