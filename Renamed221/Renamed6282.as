package Renamed221
{
   import Renamed189.AbstractPacket;
   import projects.tanks.client.panel.model.premiumaccount.alert.PremiumAccountAlertCC;
   import projects.tanks.client.tanksservices.model.notifier.premium.PremiumNotifierCC;
   
   public class Renamed6282 extends AbstractPacket
   {
      public var premiumAccountAlertCC:PremiumAccountAlertCC;
      
      public var premiumNotifierCC:PremiumNotifierCC;
      
      public function Renamed6282(param1:PremiumAccountAlertCC = null, param2:PremiumNotifierCC = null)
      {
         super();
         this.premiumAccountAlertCC = param1;
         this.premiumNotifierCC = param2;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecPremiumAccountAlertCC");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecPremiumNotifierCC");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.premiumAccountAlertCC = param1 as PremiumAccountAlertCC;
               break;
            case 1:
               this.premiumNotifierCC = param1 as PremiumNotifierCC;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed6282();
      }
      
      override public function Renamed4883() : int
      {
         return 11;
      }
      
      override public function getPacketId() : int
      {
         return 1405859779;
      }
   }
}

