package Renamed406
{
   import Renamed189.AbstractPacket;
   
   public class Renamed4089 extends AbstractPacket
   {
      public var callbackId:int;
      
      public function Renamed4089(param1:int = 0)
      {
         super();
         this.callbackId = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.callbackId = param1 as int;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed4089();
      }
      
      override public function Renamed4883() : int
      {
         return 4;
      }
      
      override public function getPacketId() : int
      {
         return -82304134;
      }
   }
}

