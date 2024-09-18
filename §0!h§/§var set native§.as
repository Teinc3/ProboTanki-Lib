package §0!h§
{
   import §&#;§.AbstractPacket;
   import projects.tanks.client.panel.model.premiumaccount.alert.PremiumAccountAlertCC;
   import projects.tanks.client.tanksservices.model.notifier.premium.PremiumNotifierCC;
   
   public class §var set native§ extends AbstractPacket
   {
      public var premiumAccountAlertCC:PremiumAccountAlertCC;
      
      public var premiumNotifierCC:PremiumNotifierCC;
      
      public function §var set native§(param1:PremiumAccountAlertCC = null, param2:PremiumNotifierCC = null)
      {
         super();
         this.premiumAccountAlertCC = param1;
         this.premiumNotifierCC = param2;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecPremiumAccountAlertCC");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecPremiumNotifierCC");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
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
      
      override public function §4#w§() : AbstractPacket
      {
         return new §var set native§();
      }
      
      override public function §package package final§() : int
      {
         return 11;
      }
      
      override public function getPacketId() : int
      {
         return 1405859779;
      }
   }
}

