package Renamed425
{
   import Renamed189.AbstractPacket;
   
   public class Renamed5168 extends AbstractPacket
   {
      public var email:String;
      
      public var emailConfirmed:Boolean;
      
      public function Renamed5168(param1:String = "", param2:Boolean = false)
      {
         super();
         this.email = param1;
         this.emailConfirmed = param2;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.BooleanCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.email = param1 as String;
               break;
            case 1:
               this.emailConfirmed = param1 as Boolean;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed5168();
      }
      
      override public function Renamed4883() : int
      {
         return 24;
      }
      
      override public function getPacketId() : int
      {
         return 613462801;
      }
   }
}

