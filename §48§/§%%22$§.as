package §48§
{
   import §]#e§.§static catch set§;
   import alternativa.osgi.service.locale.ILocaleService;
   import controls.base.ThreeLineBigButton;
   import controls.labels.MouseDisabledLabel;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class §%"$§ extends ThreeLineBigButton
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      private var priceLabel:MouseDisabledLabel;
      
      public function §%"$§()
      {
         super();
         this.priceLabel = new MouseDisabledLabel();
         this.priceLabel.size = 11;
         setSkin(§static catch set§.§throw const for§);
         super.setText(localeService.getText(TanksLocale.TEXT_DAILY_QUEST_GET_PRIZE));
         super.showInOneRow(captionLabel);
      }
   }
}

