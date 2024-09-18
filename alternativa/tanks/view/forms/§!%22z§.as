package alternativa.tanks.view.forms
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.controller.events.NavigationEvent;
   import alternativa.tanks.controller.events.SendNewPasswordAndEmailToChangeEvent;
   import alternativa.tanks.service.IPasswordParamsService;
   import alternativa.tanks.view.bubbles.Bubble;
   import alternativa.tanks.view.bubbles.EntranceBubbleFactory;
   import alternativa.tanks.view.forms.commons.RegistrationCommonElementsSection;
   import alternativa.tanks.view.forms.primitives.Alert;
   import alternativa.tanks.view.forms.primitives.ValidationIcon;
   import controls.TankWindow;
   import controls.TankWindowHeader;
   import controls.base.DefaultButtonBase;
   import controls.base.TankInputBase;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import forms.events.AlertEvent;
   import forms.events.LoginFormEvent;
   import projects.tanks.clients.flash.commons.services.validate.IValidateService;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import services.alertservice.§get const use§;
   
   public class §!"z§ extends Sprite
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var passwordParamsService:IPasswordParamsService;
      
      [Inject]
      public static var validateService:IValidateService;
      
      private var windowSize:Point;
      
      private var window:TankWindow;
      
      private var pass1:TankInputBase;
      
      private var pass2:TankInputBase;
      
      private var emailInput:TankInputBase;
      
      private var pass1CheckIcon:ValidationIcon;
      
      private var pass2CheckIcon:ValidationIcon;
      
      private var emailCheckIcon:ValidationIcon;
      
      private var okButton:DefaultButtonBase;
      
      private var cancelButton:DefaultButtonBase;
      
      private const windowMargin:int = 12;
      
      private const margin:int = 20;
      
      private var _inputsLeftMargin:int = 110;
      
      private var passwordIsTooEasyBubble:Bubble;
      
      private var passwordsDoNotMatchBubble:Bubble;
      
      private var §include catch false§:Bubble;
      
      private var §var set return§:Alert;
      
      private var §var const else§:Alert;
      
      private var § "m§:Boolean;
      
      public function §!"z§()
      {
         this.buttonSize = new Point(104,33);
         super();
         this.init();
      }
      
      private static function isPasswordValid(param1:String) : Boolean
      {
         return param1 == "" || param1.length >= passwordParamsService.minPasswordLength && passwordParamsService.forbiddenPasswords.indexOf(param1.toLowerCase()) == -1;
      }
      
      public function init() : void
      {
         this.§dynamic set with§();
         if(stage)
         {
            this.initEvents();
            this.alignYourself(null);
         }
         else
         {
            addEventListener(Event.ADDED_TO_STAGE,function(param1:Event):void
            {
               initEvents();
               alignYourself(null);
            });
         }
         this.§ "m§ = true;
      }
      
      private function §dynamic set with§() : void
      {
         var _loc1_:int = 0;
         this.windowSize = new Point(440,173);
         this.window = new TankWindow(this.windowSize.x,this.windowSize.y);
         this.window.headerLang = localeService.getText(TanksLocale.TEXT_GUI_LANG);
         this.window.header = TankWindowHeader.CHANGEPASSWORD;
         addChild(this.window);
         this.emailInput = new TankInputBase();
         this.emailInput.label = localeService.getText(TanksLocale.TEXT_SETTINGS_EMAIL_LABEL_TEXT);
         this.emailInput.maxChars = RegistrationCommonElementsSection.MAX_CHARS_EMAIL;
         this.pass1 = new TankInputBase();
         this.pass1.label = localeService.getText(TanksLocale.TEXT_SETTINGS_NEW_PASSWORD_LABEL_TEXT);
         this._inputsLeftMargin = this.margin + 3 + (int(Math.abs(this.emailInput._label.x)) > int(Math.abs(this.pass1._label.x)) ? int(Math.abs(this.emailInput._label.x)) : int(Math.abs(this.pass1._label.x)));
         this.pass1.hidden = true;
         this.pass1.width = 120;
         this.pass1.x = this._inputsLeftMargin;
         this.pass1.y = this.margin + 6;
         this.pass1.maxChars = passwordParamsService.maxPasswordLength;
         this.pass2 = new TankInputBase();
         this.pass2.width = 120;
         this.pass2.hidden = true;
         this.pass2.label = localeService.getText(TanksLocale.TEXT_SETTINGS_REENTER_PASSWORD_LABEL_TEXT);
         this.pass2.x = int(this.margin + 4 + this.pass1.width + 20 + this.pass2._label.width);
         this.pass2.y = this.pass1.y;
         this.pass2.maxChars = passwordParamsService.maxPasswordLength;
         this.windowSize.x = this.pass2.x + 120 + this.margin + 5;
         this.emailInput.x = this._inputsLeftMargin;
         this.emailInput.y = this.pass2.y + this.pass2.height + this.windowMargin;
         _loc1_ = int(this.windowSize.x - this.margin - this.emailInput.x - 5);
         this.emailInput.width = _loc1_;
         this.pass1CheckIcon = new ValidationIcon();
         this.pass2CheckIcon = new ValidationIcon();
         this.emailCheckIcon = new ValidationIcon();
         this.pass1CheckIcon.x = 120 - this.pass1CheckIcon.width - 10;
         this.pass1CheckIcon.y = 7;
         this.pass2CheckIcon.x = 120 - this.pass2CheckIcon.width - 10;
         this.pass2CheckIcon.y = 7;
         this.emailCheckIcon.x = _loc1_ - this.emailCheckIcon.width - 10;
         this.emailCheckIcon.y = 7;
         this.okButton = new DefaultButtonBase();
         this.okButton.label = localeService.getText(TanksLocale.TEXT_SETTINGS_BUTTON_SAVE_TEXT);
         this.okButton.x = int(this.windowSize.x - this.buttonSize.x - this.margin + 3);
         this.okButton.y = this.windowSize.y - this.buttonSize.y - this.margin - 2;
         this.okButton.enable = false;
         this.cancelButton = new DefaultButtonBase();
         this.cancelButton.label = localeService.getText(TanksLocale.TEXT_SETTINGS_BUTTON_CANCEL_TEXT);
         this.cancelButton.x = int(this.windowSize.x - this.buttonSize.x * 2 - 5 - this.margin);
         this.cancelButton.y = this.windowSize.y - this.buttonSize.y - this.margin - 2;
         addChild(this.okButton);
         addChild(this.cancelButton);
         addChild(this.emailInput);
         addChild(this.pass1);
         addChild(this.pass2);
         this.pass1.addChild(this.pass1CheckIcon);
         this.pass2.addChild(this.pass2CheckIcon);
         this.emailInput.addChild(this.emailCheckIcon);
         this.window.height = this.windowSize.y;
         this.window.width = this.windowSize.x;
         this.createBubbles();
      }
      
      private function initEvents() : void
      {
         stage.addEventListener(Event.RESIZE,this.alignYourself);
         this.pass1.addEventListener(LoginFormEvent.TEXT_CHANGED,this.updatePasswordBlock);
         this.pass1.addEventListener(FocusEvent.FOCUS_OUT,this.updatePasswordBlock);
         this.pass2.addEventListener(LoginFormEvent.TEXT_CHANGED,this.updatePasswordBlock);
         this.pass2.addEventListener(FocusEvent.FOCUS_OUT,this.updatePasswordBlock);
         this.emailInput.addEventListener(FocusEvent.FOCUS_OUT,this.updatePasswordBlock);
         this.emailInput.addEventListener(LoginFormEvent.TEXT_CHANGED,this.§default set static§);
         this.okButton.addEventListener(MouseEvent.CLICK,this.onOkClick);
         this.cancelButton.addEventListener(MouseEvent.CLICK,this.onCancelClick);
      }
      
      public function get password() : String
      {
         if(this.pass2.validValue && this.pass1.value == this.pass2.value)
         {
            return this.pass1.value;
         }
         return null;
      }
      
      public function get email() : String
      {
         if(this.emailInput.validValue)
         {
            return this.emailInput.value;
         }
         return null;
      }
      
      public function set email(param1:String) : void
      {
         this.emailInput.value = param1;
         this.updatePasswordBlock(null);
      }
      
      private function alignYourself(param1:Event) : void
      {
         if(stage)
         {
            this.x = int((stage.stageWidth - this.windowSize.x) / 2);
            this.y = int((stage.stageHeight - this.windowSize.y) / 2);
         }
      }
      
      private function updatePasswordBlock(param1:Event) : void
      {
         this.pass1.validValue = isPasswordValid(this.pass1.value);
         this.pass1CheckIcon.markAsInvalid();
         var _loc2_:Boolean = true;
         this.pass2.validValue = this.pass2.value == "" || this.pass1.value == this.pass2.value;
         this.pass2CheckIcon.markAsInvalid();
         if(this.pass1.value == "")
         {
            this.pass1CheckIcon.turnOff();
            _loc2_ = false;
         }
         else if(this.pass1.validValue)
         {
            this.pass1CheckIcon.markAsValid();
            _loc2_ = false;
         }
         if(this.pass2.value == "")
         {
            this.pass2CheckIcon.turnOff();
         }
         else if(this.pass2.validValue)
         {
            this.pass2CheckIcon.markAsValid();
         }
         if(_loc2_)
         {
            this.pass1CheckIcon.addChild(this.passwordIsTooEasyBubble);
         }
         else
         {
            this.passwordIsTooEasyBubble.hide();
         }
         var _loc3_:* = !(_loc2_ || this.pass2.validValue);
         if(_loc3_)
         {
            this.pass2CheckIcon.addChild(this.passwordsDoNotMatchBubble);
         }
         else
         {
            this.passwordsDoNotMatchBubble.hide();
         }
         var _loc4_:Boolean = validateService.isEmailValid(this.emailInput.value);
         if(_loc4_)
         {
            this.emailInput.validValue = true;
            if(this.emailInput.value == "")
            {
               this.emailCheckIcon.turnOff();
            }
            else
            {
               this.emailCheckIcon.markAsValid();
            }
         }
         else
         {
            this.emailInput.validValue = false;
            this.emailCheckIcon.markAsInvalid();
         }
         var _loc5_:Boolean = !(_loc2_ || _loc3_) && !_loc4_;
         if(_loc5_)
         {
            this.emailCheckIcon.addChild(this.§include catch false§);
         }
         else
         {
            this.§include catch false§.hide();
         }
         this.okButton.enable = this.pass1.value != "" && this.pass1.validValue && this.pass2.value != "" && this.pass2.validValue && this.emailInput.value != "" && this.emailInput.validValue;
      }
      
      private function removeEvents() : void
      {
         stage.removeEventListener(Event.RESIZE,this.alignYourself);
         this.pass1.removeEventListener(LoginFormEvent.TEXT_CHANGED,this.updatePasswordBlock);
         this.pass1.removeEventListener(FocusEvent.FOCUS_OUT,this.updatePasswordBlock);
         this.pass2.removeEventListener(LoginFormEvent.TEXT_CHANGED,this.updatePasswordBlock);
         this.pass2.removeEventListener(FocusEvent.FOCUS_OUT,this.updatePasswordBlock);
         this.emailInput.removeEventListener(FocusEvent.FOCUS_OUT,this.updatePasswordBlock);
         this.emailInput.removeEventListener(LoginFormEvent.TEXT_CHANGED,this.updatePasswordBlock);
         this.okButton.removeEventListener(MouseEvent.CLICK,this.onOkClick);
         this.cancelButton.removeEventListener(MouseEvent.CLICK,this.onCancelClick);
      }
      
      private function createBubbles() : void
      {
         this.passwordIsTooEasyBubble = EntranceBubbleFactory.passwordIsTooEasyBubble();
         this.passwordsDoNotMatchBubble = EntranceBubbleFactory.passwordsDoNotMatchBubble();
         this.§include catch false§ = EntranceBubbleFactory.emailInvalidBubble();
      }
      
      private function onOkClick(param1:MouseEvent) : void
      {
         dispatchEvent(new SendNewPasswordAndEmailToChangeEvent(this.password,this.email));
      }
      
      private function onCancelClick(param1:MouseEvent) : void
      {
         this.§with set package§();
      }
      
      private function §with set package§() : void
      {
         dispatchEvent(new NavigationEvent(NavigationEvent.GO_TO_LOGIN_FORM));
      }
      
      private function isPasswordForbidden(param1:String) : Boolean
      {
         return passwordParamsService.forbiddenPasswords.indexOf(param1.toLowerCase()) != -1;
      }
      
      private function §default set static§(param1:Event) : void
      {
         this.updatePasswordBlock(null);
      }
      
      public function §>!h§() : void
      {
         if(this.§ "m§)
         {
            this.removeEvents();
            this.§ "m§ = false;
         }
      }
      
      public function §dynamic const do§(param1:Boolean, param2:String) : void
      {
         if(param1)
         {
            this.§var set return§ = new Alert();
            this.§var set return§.showAlert(param2,Vector.<String>([§get const use§.OK]));
            if(parent)
            {
               parent.addChild(this.§var set return§);
            }
            this.§var set return§.addEventListener(AlertEvent.ALERT_BUTTON_PRESSED,this.§get set break§);
         }
         else
         {
            this.§var const else§ = new Alert();
            this.§var const else§.showAlert(param2,Vector.<String>([§get const use§.OK]));
            if(parent)
            {
               parent.addChild(this.§var const else§);
            }
            this.§var const else§.addEventListener(AlertEvent.ALERT_BUTTON_PRESSED,this.§super const use§);
         }
      }
      
      private function §super const use§(param1:AlertEvent) : void
      {
         this.§var const else§.parent.removeChild(this.§var const else§);
         this.§with set package§();
      }
      
      private function §get set break§(param1:AlertEvent) : void
      {
         this.§var set return§.parent.removeChild(this.§var set return§);
         this.§with set package§();
      }
   }
}

