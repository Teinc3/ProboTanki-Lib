package Renamed4971
{
   import Renamed189.AbstractPacket;
   
   public class Renamed7574 extends AbstractPacket
   {
      public var notificationEnabled:Boolean;
      
      public function Renamed7574(param1:Boolean = false)
      {
         super();
         this.notificationEnabled = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.BooleanCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.notificationEnabled = param1 as Boolean;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed7574();
      }
      
      override public function Renamed4883() : int
      {
         return 23;
      }
      
      override public function getPacketId() : int
      {
         return 1447082276;
      }
   }
}

