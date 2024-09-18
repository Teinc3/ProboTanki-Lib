package Renamed492
{
   import alternativa.tanks.model.donationalert.DonationAlertModel;
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   
   public class Renamed9641 extends Renamed4886
   {
      private var Renamed9642:DonationAlertModel;
      
      public var modelId:int;
      
      public function Renamed9641()
      {
         super();
         this.modelId = 69;
         this.Renamed9642 = DonationAlertModel(modelRegistry.getModel(Long.getLong(0,300050019)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed9636.Renamed9637:
               this.showDonationAlert(param1);
         }
      }
      
      private function showDonationAlert(param1:Object) : void
      {
         this.Renamed9642.showDonationAlert(Long.getLong(0,0),param1.donation,param1.packageBonusCrystals,param1.bonusCrystals,param1.image);
      }
   }
}

