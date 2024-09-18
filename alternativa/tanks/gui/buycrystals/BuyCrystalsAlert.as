package alternativa.tanks.gui.buycrystals
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.model.panel.PanelModel;
   import controls.TankWindowHeader;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import controls.labels.MouseDisabledLabel;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import forms.base.BaseFormWithInner;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.gui.DialogWindow;
   
   public class BuyCrystalsAlert extends DialogWindow
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      private static const bitmapClass:Class = BuyCrystalsAlert_bitmapClass;
      
      public static const image:Bitmap = new Bitmap(new bitmapClass().bitmapData);
      
      private static const plusBitmapClass:Class = BuyCrystalsAlert_plusBitmapClass;
      
      public static const plus:Bitmap = new Bitmap(new plusBitmapClass().bitmapData);
      
      private static const VERTICAL_MARGIN:int = 8;
      
      private var §7!a§:BaseFormWithInner;
      
      private var buyButton:DefaultButtonBase;
      
      private var closeButton:DefaultButtonBase;
      
      private var buyCaption:Sprite;
      
      private var label:LabelBase;
      
      private var crystals:int;
      
      public function BuyCrystalsAlert(param1:int)
      {
         super();
         this.§7!a§ = new BaseFormWithInner(416,270,30);
         addChild(this.§7!a§);
         this.crystals = param1;
         this.§7!a§.window.headerLang = localeService.getText(TanksLocale.TEXT_GUI_LANG);
         this.§7!a§.window.header = TankWindowHeader.ATTANTION;
         this.buyButton = new DefaultButtonBase();
         this.buyButton.width = 150;
         this.buyCaption = new Sprite();
         this.label = new MouseDisabledLabel();
         this.label.text = localeService.getText(TanksLocale.TEXT_GARAGE_BUY_TEXT);
         this.label.y = 5;
         plus.y = (this.buyButton.height - plus.height) * 0.5;
         this.label.x = plus.width;
         this.buyCaption.addChild(plus);
         this.buyCaption.addChild(this.label);
         this.buyButton.x = this.§7!a§.inner.x;
         this.buyButton.y = this.§7!a§.inner.y + this.§7!a§.inner.height + VERTICAL_MARGIN;
         this.buyCaption.x = int(this.buyButton.x + (this.buyButton.width - this.buyCaption.width) * 0.5);
         this.buyCaption.y = this.buyButton.y;
         this.§7!a§.window.addChild(this.buyButton);
         this.buyCaption.mouseEnabled = false;
         this.buyCaption.filters = [new DropShadowFilter(1,45,0,0.7,1,1,1)];
         this.§7!a§.window.addChild(this.buyCaption);
         this.closeButton = new DefaultButtonBase();
         this.closeButton.width = 95;
         this.closeButton.label = localeService.getText(TanksLocale.TEXT_GARAGE_CLOSE_TEXT);
         this.closeButton.y = this.buyButton.y;
         this.closeButton.x = this.§7!a§.inner.x + this.§7!a§.inner.width - this.closeButton.width;
         var _loc2_:Bitmap = new Bitmap(localeService.getImage(TanksLocale.IMAGE_GARAGE_ADD_MORE_CRYSTALS));
         _loc2_.x = int((this.§7!a§.inner.width - _loc2_.width) / 2);
         _loc2_.y = 14;
         this.§7!a§.inner.addChild(_loc2_);
         image.x = (this.§7!a§.inner.width - image.width) * 0.5 + 3;
         image.y = _loc2_.y + _loc2_.height + 3;
         this.§7!a§.inner.addChild(image);
         this.§7!a§.window.addChild(this.closeButton);
         this.buyButton.addEventListener(MouseEvent.CLICK,this.onBuy);
         this.closeButton.addEventListener(MouseEvent.CLICK,this.onCancel);
         dialogService.addDialog(this);
      }
      
      public function onBuy(param1:Event = null) : void
      {
         dispatchEvent(new BuyCrystalsEvent(this.crystals));
         this.hide();
         PanelModel.switchPayment();
      }
      
      public function onCancel(param1:Event = null) : void
      {
         this.hide();
      }
      
      private function hide() : void
      {
         this.buyButton.removeEventListener(MouseEvent.CLICK,this.onBuy);
         this.closeButton.removeEventListener(MouseEvent.CLICK,this.onCancel);
         dialogService.removeDialog(this);
      }
      
      override protected function cancelKeyPressed() : void
      {
         this.onCancel();
      }
      
      override protected function confirmationKeyPressed() : void
      {
         this.onBuy();
      }
   }
}

