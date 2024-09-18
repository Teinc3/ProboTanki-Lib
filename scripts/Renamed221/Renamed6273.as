package Renamed221
{
   import alternativa.tanks.model.premiumaccount.alert.PremiumAccountAlertModel;
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.premium.PremiumNotifierModel;
   
   public class Renamed6273 extends Renamed4886
   {
      private var Renamed6274:PremiumNotifierModel;
      
      private var Renamed6275:PremiumAccountAlertModel;
      
      public var modelId:int;
      
      public function Renamed6273()
      {
         super();
         this.modelId = 11;
         this.Renamed6274 = PremiumNotifierModel(modelRegistry.getModel(Long.getLong(302389563,-1379937773)));
         this.Renamed6275 = PremiumAccountAlertModel(modelRegistry.getModel(Long.getLong(287111968,-1381886380)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed6276.Renamed6277:
               this.Renamed6278(param1);
               break;
            case Renamed6276.Renamed6279:
               this.showWelcomeAlert(param1);
               break;
            case Renamed6276.Renamed6280:
               this.updateTimeLeft(param1);
         }
      }
      
      private function Renamed6278(param1:Object) : void
      {
         this.Renamed6274.putInitParams(param1.premiumNotifierCC);
         this.Renamed6274.objectLoaded();
         this.Renamed6275.putInitParams(param1.premiumAccountAlertCC);
         this.Renamed6275.objectLoaded();
      }
      
      private function showWelcomeAlert(param1:Object) : void
      {
         this.Renamed6275.showWelcomeAlert(param1.wasShowAlertForFirstPurchasePremium);
      }
      
      private function updateTimeLeft(param1:Object) : void
      {
         this.Renamed6274.updateTimeLeft(param1.leftTimeInSeconds);
      }
   }
}

