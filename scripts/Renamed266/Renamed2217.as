package Renamed266
{
   import Renamed5253.Renamed5254;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.model.shop.ShopWindow;
   import Renamed315.Renamed2234;
   import controls.TankWindowInner;
   import controls.ValidationIcon;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import controls.base.TankInput;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import flash.ui.Keyboard;
   import projects.tanks.clients.flash.commons.services.validate.IValidateService;
   import projects.tanks.clients.flash.commons.services.validate.ValidateService;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import utils.tweener.TweenLite;
   import utils.tweener.core.SimpleTimeline;
   import utils.tweener.easing.Renamed6842;
   
   public class Renamed2217 extends Renamed2234
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var validateService:IValidateService;
      
      [Inject]
      public static var display:IDisplay;
      
      public static const Renamed6843:int = 82;
      
      public static const MARGIN:int = 8;
      
      protected static const Renamed6844:int = 50;
      
      protected static const Renamed6845:int = 5;
      
      protected static const Renamed6846:int = 100;
      
      private var Renamed6847:TankInput;
      
      private var sendButton:DefaultButtonBase;
      
      private var Renamed6848:ValidationIcon;
      
      private var Renamed6849:SimpleTimeline;
      
      private var code:String = "";
      
      private var Renamed6850:TankWindowInner;
      
      private var descriptionLabel:LabelBase;
      
      private var Renamed6851:LabelBase;
      
      public function Renamed2217()
      {
         super();
         this.Renamed6850 = new TankWindowInner(0,0,TankWindowInner.GREEN);
         this.Renamed6850.showBlink = true;
         addChild(this.Renamed6850);
         this.descriptionLabel = this.createDescriptionLabel();
         this.Renamed6850.addChild(this.descriptionLabel);
         this.Renamed6847 = this.Renamed6852();
         addChild(this.Renamed6847);
         this.sendButton = this.Renamed6853();
         addChild(this.sendButton);
         this.Renamed6848 = this.Renamed6854();
         addChild(this.Renamed6848);
         this.Renamed6851 = this.Renamed6855();
         addChild(this.Renamed6851);
      }
      
      private function createDescriptionLabel() : LabelBase
      {
         var _loc1_:LabelBase = new LabelBase();
         _loc1_.autoSize = TextFieldAutoSize.NONE;
         _loc1_.multiline = true;
         _loc1_.wordWrap = true;
         _loc1_.htmlText = localeService.getText(TanksLocale.TEXT_PROMO_CODE_DESCRIPTION_TEXT);
         return _loc1_;
      }
      
      protected function Renamed6852() : TankInput
      {
         var _loc1_:TankInput = new TankInput();
         _loc1_.align = TextFormatAlign.CENTER;
         _loc1_.restrict = ValidateService.Renamed4472;
         return _loc1_;
      }
      
      protected function Renamed6853() : DefaultButtonBase
      {
         var _loc1_:DefaultButtonBase = new DefaultButtonBase();
         _loc1_.tabEnabled = false;
         _loc1_.enable = false;
         _loc1_.label = localeService.getText(TanksLocale.TEXT_BUG_REPORT_BUTTON_SEND_TEXT);
         return _loc1_;
      }
      
      protected function Renamed6854() : ValidationIcon
      {
         var _loc1_:ValidationIcon = new ValidationIcon();
         _loc1_.fadeTime = 0.2;
         _loc1_.mouseEnabled = false;
         _loc1_.mouseChildren = false;
         return _loc1_;
      }
      
      protected function Renamed6855() : LabelBase
      {
         var _loc1_:LabelBase = new LabelBase();
         _loc1_.visible = false;
         _loc1_.text = localeService.getText(TanksLocale.TEXT_PROMO_CODE_INVALID_LABEL);
         return _loc1_;
      }
      
      private function Renamed6856(param1:Event) : void
      {
         display.stage.focus = null;
      }
      
      private function Renamed6857() : SimpleTimeline
      {
         if(!this.Renamed6849)
         {
            this.Renamed6849 = new SimpleTimeline();
            this.Renamed6849.insert(TweenLite.to(this.Renamed6847.textField,0.2,{
               "x":Renamed6846,
               "ease":Renamed6842.easeInOut
            }));
            this.Renamed6849.insert(TweenLite.to(this.Renamed6847.textField,0.2,{
               "x":0,
               "ease":Renamed6842.easeInOut
            }));
         }
         return this.Renamed6849;
      }
      
      private function textInputHandler(param1:TextEvent = null) : void
      {
         this.Renamed6857().restart(true);
      }
      
      private function Renamed6858(param1:Event) : void
      {
         var _loc2_:String = null;
         this.Renamed6847.validValue = true;
         this.Renamed6848.turnOff();
         this.Renamed6851.visible = false;
         var _loc3_:String = "";
         var _loc4_:int = this.Renamed6847.textField.length;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = _loc4_ - this.Renamed6847.textField.selectionBeginIndex;
         this.code = "";
         while(_loc5_ < _loc4_)
         {
            _loc2_ = this.Renamed6847.textField.text.charAt(_loc5_).toUpperCase();
            if(_loc2_ != "-")
            {
               this.code = this.code.concat(_loc2_);
               if(_loc4_ - _loc5_ > 1 && _loc3_.length - Renamed6845 + 1 >= 0 && (_loc3_.length - _loc6_ + 1) % Renamed6845 == 0)
               {
                  _loc2_ = _loc2_.concat("-");
                  _loc6_++;
               }
               _loc3_ = _loc3_.concat(_loc2_);
            }
            _loc5_++;
         }
         if(_loc3_.charAt(_loc3_.length - 1) == "-")
         {
            _loc3_ = _loc3_.substr(0,_loc3_.length - 1);
         }
         this.Renamed6847.maxChars = Renamed6844 + _loc6_;
         this.Renamed6847.textField.text = _loc3_;
         this.Renamed6847.textField.setSelection(_loc3_.length - _loc7_,_loc3_.length - _loc7_);
         this.sendButton.enable = validateService.Renamed4471(this.code);
      }
      
      private function Renamed6859(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.ENTER)
         {
            this.Renamed6860();
         }
      }
      
      protected function Renamed6860(param1:MouseEvent = null) : void
      {
         if(validateService.Renamed4471(this.code))
         {
            this.Renamed6848.startProgress();
            this.sendButton.enable = false;
            this.Renamed6847.enable = false;
            dispatchEvent(new SendPromoCodeEvent(this.Renamed2226()));
         }
         else
         {
            this.textInputHandler();
         }
      }
      
      override public function render(param1:int, param2:int) : void
      {
         super.render(param1,param2);
         this.Renamed6857().restart(true);
         this.sendButton.enable = validateService.Renamed4471(this.code);
         this.Renamed6850.width = param1;
         this.Renamed6850.height = Renamed6843;
         this.descriptionLabel.width = param1 - 2 * ShopWindow.WINDOW_PADDING;
         this.descriptionLabel.height = Renamed6843 - 2 * ShopWindow.WINDOW_PADDING;
         this.descriptionLabel.x = this.descriptionLabel.y = ShopWindow.WINDOW_PADDING;
         var _loc3_:int = param2 - Renamed6843;
         this.Renamed6847.width = Math.max(this.Renamed6847.textField.textWidth,int(param1 * 0.66));
         this.Renamed6847.x = param1 - this.Renamed6847.width - this.sendButton.width - MARGIN >> 1;
         this.Renamed6847.y = (_loc3_ - this.Renamed6847.height >> 1) + Renamed6843;
         this.sendButton.x = this.Renamed6847.x + this.Renamed6847.width + MARGIN;
         this.sendButton.y = this.Renamed6847.y;
         this.Renamed6851.x = int(this.Renamed6847.x + this.Renamed6847.width / 2) - int(this.Renamed6851.width / 2);
         this.Renamed6851.y = int(this.Renamed6847.y + this.Renamed6847.height + MARGIN);
         var _loc4_:* = this.Renamed6847.height - this.Renamed6848.height >> 1;
         this.Renamed6848.x = this.Renamed6847.x + this.Renamed6847.width - _loc4_ - this.Renamed6848.height;
         this.Renamed6848.y = this.Renamed6847.y + _loc4_ + 2;
      }
      
      override public function Renamed2241() : void
      {
         super.Renamed2241();
         this.Renamed6847.addEventListener(TextEvent.TEXT_INPUT,this.textInputHandler);
         this.Renamed6847.addEventListener(Event.CHANGE,this.Renamed6858);
         this.Renamed6847.addEventListener(KeyboardEvent.KEY_DOWN,this.Renamed6859);
         this.sendButton.addEventListener(MouseEvent.CLICK,this.Renamed6860);
         window.addEventListener(Renamed5254.CLICK,this.Renamed6856);
      }
      
      override public function destroy() : void
      {
         this.Renamed6847.removeEventListener(TextEvent.TEXT_INPUT,this.textInputHandler);
         this.Renamed6847.removeEventListener(Event.CHANGE,this.Renamed6858);
         this.Renamed6847.removeEventListener(KeyboardEvent.KEY_DOWN,this.Renamed6859);
         this.sendButton.removeEventListener(MouseEvent.CLICK,this.Renamed6860);
         window.removeEventListener(Renamed5254.CLICK,this.Renamed6856);
         super.destroy();
      }
      
      private function Renamed2226() : String
      {
         return this.code;
      }
      
      public function Renamed2230() : void
      {
         this.Renamed6847.validValue = false;
         this.Renamed6847.enable = true;
         this.Renamed6848.markAsInvalid();
         this.Renamed6851.visible = true;
      }
      
      public function Renamed2228() : void
      {
         this.Renamed6847.enable = true;
         this.Renamed6848.markAsValid();
      }
   }
}

