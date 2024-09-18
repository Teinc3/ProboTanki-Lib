package Renamed221
{
   import Renamed189.AbstractPacket;
   
   public class Renamed6281 extends AbstractPacket
   {
      public var wasShowAlertForFirstPurchasePremium:Boolean;
      
      public function Renamed6281(param1:Boolean = false)
      {
         super();
         this.wasShowAlertForFirstPurchasePremium = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.BooleanCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.wasShowAlertForFirstPurchasePremium = param1 as Boolean;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed6281();
      }
      
      override public function Renamed4883() : int
      {
         return 11;
      }
      
      override public function getPacketId() : int
      {
         return -478572181;
      }
   }
}

