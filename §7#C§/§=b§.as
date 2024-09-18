package §7#C§
{
   import §""O§.§do const if§;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.model.shop.ShopWindow;
   import §break set null§.§each for each§;
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
   import utils.tweener.easing.§get const finally§;
   
   public class §=b§ extends §each for each§
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var validateService:IValidateService;
      
      [Inject]
      public static var display:IDisplay;
      
      public static const §],§:int = 82;
      
      public static const MARGIN:int = 8;
      
      protected static const §null const default§:int = 50;
      
      protected static const §&"S§:int = 5;
      
      protected static const §continue package extends§:int = 100;
      
      private var §function package case§:TankInput;
      
      private var sendButton:DefaultButtonBase;
      
      private var §import var case§:ValidationIcon;
      
      private var §'!r§:SimpleTimeline;
      
      private var code:String = "";
      
      private var §;#;§:TankWindowInner;
      
      private var descriptionLabel:LabelBase;
      
      private var §;#C§:LabelBase;
      
      public function §=b§()
      {
         super();
         this.§;#;§ = new TankWindowInner(0,0,TankWindowInner.GREEN);
         this.§;#;§.showBlink = true;
         addChild(this.§;#;§);
         this.descriptionLabel = this.createDescriptionLabel();
         this.§;#;§.addChild(this.descriptionLabel);
         this.§function package case§ = this.§override var static§();
         addChild(this.§function package case§);
         this.sendButton = this.§function set return§();
         addChild(this.sendButton);
         this.§import var case§ = this.§2i§();
         addChild(this.§import var case§);
         this.§;#C§ = this.§&"R§();
         addChild(this.§;#C§);
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
      
      protected function §override var static§() : TankInput
      {
         var _loc1_:TankInput = new TankInput();
         _loc1_.align = TextFormatAlign.CENTER;
         _loc1_.restrict = ValidateService.§use package continue§;
         return _loc1_;
      }
      
      protected function §function set return§() : DefaultButtonBase
      {
         var _loc1_:DefaultButtonBase = new DefaultButtonBase();
         _loc1_.tabEnabled = false;
         _loc1_.enable = false;
         _loc1_.label = localeService.getText(TanksLocale.TEXT_BUG_REPORT_BUTTON_SEND_TEXT);
         return _loc1_;
      }
      
      protected function §2i§() : ValidationIcon
      {
         var _loc1_:ValidationIcon = new ValidationIcon();
         _loc1_.fadeTime = 0.2;
         _loc1_.mouseEnabled = false;
         _loc1_.mouseChildren = false;
         return _loc1_;
      }
      
      protected function §&"R§() : LabelBase
      {
         var _loc1_:LabelBase = new LabelBase();
         _loc1_.visible = false;
         _loc1_.text = localeService.getText(TanksLocale.TEXT_PROMO_CODE_INVALID_LABEL);
         return _loc1_;
      }
      
      private function §super const extends§(param1:Event) : void
      {
         display.stage.focus = null;
      }
      
      private function §+[§() : SimpleTimeline
      {
         if(!this.§'!r§)
         {
            this.§'!r§ = new SimpleTimeline();
            this.§'!r§.insert(TweenLite.to(this.§function package case§.textField,0.2,{
               "x":§continue package extends§,
               "ease":§get const finally§.easeInOut
            }));
            this.§'!r§.insert(TweenLite.to(this.§function package case§.textField,0.2,{
               "x":0,
               "ease":§get const finally§.easeInOut
            }));
         }
         return this.§'!r§;
      }
      
      private function textInputHandler(param1:TextEvent = null) : void
      {
         this.§+[§().restart(true);
      }
      
      private function §3$!§(param1:Event) : void
      {
         var _loc2_:String = null;
         this.§function package case§.validValue = true;
         this.§import var case§.turnOff();
         this.§;#C§.visible = false;
         var _loc3_:String = "";
         var _loc4_:int = this.§function package case§.textField.length;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = _loc4_ - this.§function package case§.textField.selectionBeginIndex;
         this.code = "";
         while(_loc5_ < _loc4_)
         {
            _loc2_ = this.§function package case§.textField.text.charAt(_loc5_).toUpperCase();
            if(_loc2_ != "-")
            {
               this.code = this.code.concat(_loc2_);
               if(_loc4_ - _loc5_ > 1 && _loc3_.length - §&"S§ + 1 >= 0 && (_loc3_.length - _loc6_ + 1) % §&"S§ == 0)
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
         this.§function package case§.maxChars = §null const default§ + _loc6_;
         this.§function package case§.textField.text = _loc3_;
         this.§function package case§.textField.setSelection(_loc3_.length - _loc7_,_loc3_.length - _loc7_);
         this.sendButton.enable = validateService.§,!4§(this.code);
      }
      
      private function §6O§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.ENTER)
         {
            this.§-!C§();
         }
      }
      
      protected function §-!C§(param1:MouseEvent = null) : void
      {
         if(validateService.§,!4§(this.code))
         {
            this.§import var case§.startProgress();
            this.sendButton.enable = false;
            this.§function package case§.enable = false;
            dispatchEvent(new SendPromoCodeEvent(this.§""4§()));
         }
         else
         {
            this.textInputHandler();
         }
      }
      
      override public function render(param1:int, param2:int) : void
      {
         super.render(param1,param2);
         this.§+[§().restart(true);
         this.sendButton.enable = validateService.§,!4§(this.code);
         this.§;#;§.width = param1;
         this.§;#;§.height = §],§;
         this.descriptionLabel.width = param1 - 2 * ShopWindow.WINDOW_PADDING;
         this.descriptionLabel.height = §],§ - 2 * ShopWindow.WINDOW_PADDING;
         this.descriptionLabel.x = this.descriptionLabel.y = ShopWindow.WINDOW_PADDING;
         var _loc3_:int = param2 - §],§;
         this.§function package case§.width = Math.max(this.§function package case§.textField.textWidth,int(param1 * 0.66));
         this.§function package case§.x = param1 - this.§function package case§.width - this.sendButton.width - MARGIN >> 1;
         this.§function package case§.y = (_loc3_ - this.§function package case§.height >> 1) + §],§;
         this.sendButton.x = this.§function package case§.x + this.§function package case§.width + MARGIN;
         this.sendButton.y = this.§function package case§.y;
         this.§;#C§.x = int(this.§function package case§.x + this.§function package case§.width / 2) - int(this.§;#C§.width / 2);
         this.§;#C§.y = int(this.§function package case§.y + this.§function package case§.height + MARGIN);
         var _loc4_:* = this.§function package case§.height - this.§import var case§.height >> 1;
         this.§import var case§.x = this.§function package case§.x + this.§function package case§.width - _loc4_ - this.§import var case§.height;
         this.§import var case§.y = this.§function package case§.y + _loc4_ + 2;
      }
      
      override public function §"j§() : void
      {
         super.§"j§();
         this.§function package case§.addEventListener(TextEvent.TEXT_INPUT,this.textInputHandler);
         this.§function package case§.addEventListener(Event.CHANGE,this.§3$!§);
         this.§function package case§.addEventListener(KeyboardEvent.KEY_DOWN,this.§6O§);
         this.sendButton.addEventListener(MouseEvent.CLICK,this.§-!C§);
         window.addEventListener(§do const if§.CLICK,this.§super const extends§);
      }
      
      override public function destroy() : void
      {
         this.§function package case§.removeEventListener(TextEvent.TEXT_INPUT,this.textInputHandler);
         this.§function package case§.removeEventListener(Event.CHANGE,this.§3$!§);
         this.§function package case§.removeEventListener(KeyboardEvent.KEY_DOWN,this.§6O§);
         this.sendButton.removeEventListener(MouseEvent.CLICK,this.§-!C§);
         window.removeEventListener(§do const if§.CLICK,this.§super const extends§);
         super.destroy();
      }
      
      private function §""4§() : String
      {
         return this.code;
      }
      
      public function §override set in§() : void
      {
         this.§function package case§.validValue = false;
         this.§function package case§.enable = true;
         this.§import var case§.markAsInvalid();
         this.§;#C§.visible = true;
      }
      
      public function §do set if§() : void
      {
         this.§function package case§.enable = true;
         this.§import var case§.markAsValid();
      }
   }
}

