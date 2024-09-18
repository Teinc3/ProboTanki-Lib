package Renamed248
{
   import Renamed478.Renamed6714;
   import alternativa.osgi.service.locale.ILocaleService;
   import controls.base.ThreeLineBigButton;
   import controls.labels.MouseDisabledLabel;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class Renamed4803 extends ThreeLineBigButton
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      private var priceLabel:MouseDisabledLabel;
      
      public function Renamed4803()
      {
         super();
         this.priceLabel = new MouseDisabledLabel();
         this.priceLabel.size = 11;
         setSkin(Renamed6714.Renamed6715);
         super.setText(localeService.getText(TanksLocale.TEXT_DAILY_QUEST_GET_PRIZE));
         super.showInOneRow(captionLabel);
      }
   }
}

