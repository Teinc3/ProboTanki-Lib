package Renamed248
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.service.money.IMoneyService;
   import alternativa.tanks.service.money.Renamed1919;
   import assets.Diamond;
   import controls.Money;
   import controls.base.ThreeLineBigButton;
   import controls.labels.MouseDisabledLabel;
   import flash.display.Sprite;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class Renamed4804 extends ThreeLineBigButton implements Renamed1919
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var moneyService:IMoneyService;
      
      private static const Renamed6717:int = 16731648;
      
      private static const Renamed6718:int = 16777215;
      
      private var priceLabel:MouseDisabledLabel;
      
      private var crystals:int;
      
      public function Renamed4804()
      {
         super();
         this.priceLabel = new MouseDisabledLabel();
         this.priceLabel.size = 11;
         super.setText(localeService.getText(TanksLocale.TEXT_DAILY_QUEST_CHANGE));
         moneyService.addListener(this);
      }
      
      public function showButtonWithCrystals(param1:int) : void
      {
         this.crystals = param1;
         var _loc2_:Diamond = new Diamond();
         _loc2_.y = 3;
         var _loc3_:Sprite = new Sprite();
         _loc3_.addChild(this.priceLabel);
         _loc3_.addChild(_loc2_);
         addChild(_loc3_);
         this.priceLabel.text = Money.numToString(param1,false);
         this.priceLabel.x = int(_width / 2 - (this.priceLabel.width + _loc2_.width) / 2);
         _loc2_.x = this.priceLabel.x + this.priceLabel.textWidth + 7;
         this.Renamed6719();
         super.showInTwoRows(captionLabel,_loc3_);
      }
      
      public function Renamed6720() : void
      {
         super.showInOneRow(captionLabel);
      }
      
      public function crystalsChanged(param1:int) : void
      {
         this.Renamed6719();
      }
      
      private function Renamed6719() : void
      {
         this.priceLabel.textColor = moneyService.crystal < this.crystals ? uint(Renamed6717) : uint(Renamed6718);
      }
      
      public function removeListeners() : void
      {
         moneyService.removeListener(this);
      }
   }
}

