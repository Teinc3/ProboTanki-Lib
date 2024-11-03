package alternativa.tanks.model.shop.items.premuimitem
{
   import alternativa.tanks.model.shop.items.base.ShopItemBase;
   import controls.base.LabelBase;
   import Renamed355.Renamed2270;
   import flash.display.Bitmap;
   import flash.text.TextFieldAutoSize;
   import projects.tanks.clients.flash.commons.services.timeunit.ITimeUnitService;
   
   public class PremiumPackageItem extends ShopItemBase
   {
      [Inject]
      public static var Renamed2271:ITimeUnitService;
      
      private static const LEFT_PADDING:int = 18;
      
      private static const MONEY_TEXT_LABEL_COLOR:uint = 4144959;
      
      private const PREMIUM_TEXT_LABEL_COLOR:uint = 3432728;
      
      private var premiumLabel:LabelBase;
      
      private var priceLabel:LabelBase;
      
      private var icon:Bitmap;
      
      private var additionalData:Object;
      
      public function PremiumPackageItem(param1:String, param2:Object)
      {
         this.additionalData = param2;
         super(param1,Renamed2270.Renamed2273);
      }
      
      override protected function init() : void
      {
         super.init();
         this.initCrystalsAndPrice();
         this.initPremiumIcon();
         this.render();
      }
      
      private function initCrystalsAndPrice() : void
      {
         this.premiumLabel = new LabelBase();
         this.premiumLabel.text = "+" + Renamed2271.Renamed2274(this.additionalData.premium_duration);
         this.premiumLabel.color = this.PREMIUM_TEXT_LABEL_COLOR;
         this.premiumLabel.autoSize = TextFieldAutoSize.LEFT;
         this.premiumLabel.size = 30;
         this.premiumLabel.bold = true;
         this.premiumLabel.mouseEnabled = false;
         addChild(this.premiumLabel);
         this.priceLabel = new LabelBase();
         fixChineseCurrencyLabelRendering(this.priceLabel);
         this.priceLabel.text = this.additionalData.price + " " + this.additionalData.currency;
         this.priceLabel.color = MONEY_TEXT_LABEL_COLOR;
         this.priceLabel.autoSize = TextFieldAutoSize.LEFT;
         this.priceLabel.size = 22;
         this.priceLabel.bold = true;
         this.priceLabel.mouseEnabled = false;
         addChild(this.priceLabel);
      }
      
      private function initPremiumIcon() : void
      {
         this.icon = new Bitmap(PremiumPackageItemIcons.premiumIcon);
         addChild(this.icon);
      }
      
      private function render() : void
      {
         this.icon.x = LEFT_PADDING - 5;
         this.premiumLabel.x = this.icon.x + this.icon.width - 7;
         this.priceLabel.x = this.premiumLabel.x;
         this.icon.y = HEIGHT - this.icon.height >> 1;
         this.premiumLabel.y = this.icon.y + 2;
         this.priceLabel.y = this.icon.y + this.icon.height - this.priceLabel.height;
      }
   }
}

