package Renamed321
{
   import Renamed189.AbstractPacket;
   
   public class Renamed7723 extends AbstractPacket
   {
      public var inviteEnabled:Boolean;
      
      public function Renamed7723(param1:Boolean = false)
      {
         super();
         this.inviteEnabled = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.BooleanCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.inviteEnabled = param1 as Boolean;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed7723();
      }
      
      override public function Renamed4883() : int
      {
         return 5;
      }
      
      override public function getPacketId() : int
      {
         return 444933603;
      }
   }
}

