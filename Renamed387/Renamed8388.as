package Renamed387
{
   import Renamed189.AbstractPacket;
   
   public class Renamed8388 extends AbstractPacket
   {
      public var enabled:Boolean;
      
      public function Renamed8388(param1:Boolean = false)
      {
         super();
         this.enabled = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.BooleanCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.enabled = param1 as Boolean;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed8388();
      }
      
      override public function Renamed4883() : int
      {
         return 10;
      }
      
      override public function getPacketId() : int
      {
         return 150222118;
      }
   }
}

