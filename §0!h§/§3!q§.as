package §0!h§
{
   import alternativa.tanks.model.premiumaccount.alert.PremiumAccountAlertModel;
   import alternativa.types.Long;
   import §if try§.§return package if§;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.premium.PremiumNotifierModel;
   
   public class §3!q§ extends §return package if§
   {
      private var §!"4§:PremiumNotifierModel;
      
      private var §+#e§:PremiumAccountAlertModel;
      
      public var modelId:int;
      
      public function §3!q§()
      {
         super();
         this.modelId = 11;
         this.§!"4§ = PremiumNotifierModel(modelRegistry.getModel(Long.getLong(302389563,-1379937773)));
         this.§+#e§ = PremiumAccountAlertModel(modelRegistry.getModel(Long.getLong(287111968,-1381886380)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case §@!A§.§ "<§:
               this.§in include§(param1);
               break;
            case §@!A§.§^" §:
               this.showWelcomeAlert(param1);
               break;
            case §@!A§.§4]§:
               this.updateTimeLeft(param1);
         }
      }
      
      private function §in include§(param1:Object) : void
      {
         this.§!"4§.putInitParams(param1.premiumNotifierCC);
         this.§!"4§.objectLoaded();
         this.§+#e§.putInitParams(param1.premiumAccountAlertCC);
         this.§+#e§.objectLoaded();
      }
      
      private function showWelcomeAlert(param1:Object) : void
      {
         this.§+#e§.showWelcomeAlert(param1.wasShowAlertForFirstPurchasePremium);
      }
      
      private function updateTimeLeft(param1:Object) : void
      {
         this.§!"4§.updateTimeLeft(param1.leftTimeInSeconds);
      }
   }
}

