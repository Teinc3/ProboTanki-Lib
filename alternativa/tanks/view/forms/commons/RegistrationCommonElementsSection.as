package alternativa.tanks.view.forms.commons
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.controller.events.CheckCallsignEvent;
   import alternativa.tanks.controller.events.CheckEmailEvent;
   import alternativa.tanks.locale.constants.TextConst;
   import alternativa.tanks.service.IPasswordParamsService;
   import alternativa.tanks.type.RulesType;
   import alternativa.tanks.view.bubbles.Bubble;
   import alternativa.tanks.view.bubbles.EntranceBubbleFactory;
   import alternativa.tanks.view.events.AntiAddictionInfoUpdatedEvent;
   import alternativa.tanks.view.events.RefreshCaptchaClickedEvent;
   import alternativa.tanks.view.events.RegistrationFormEvent;
   import alternativa.tanks.view.forms.ViewText;
   import alternativa.tanks.view.forms.freeuids.FreeUidsForm;
   import alternativa.tanks.view.forms.freeuids.FreeUidsFormEvent;
   import alternativa.tanks.view.forms.primitives.ValidationIcon;
   import alternativa.tanks.view.layers.EntranceView;
   import alternativa.tanks.view.registration.CaptchaSection;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import controls.base.TankCheckBoxBase;
   import controls.base.TankInputBase;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import flash.events.TimerEvent;
   import flash.ui.Keyboard;
   import flash.utils.Timer;
   import forms.events.LoginFormEvent;
   import org.robotlegs.core.IInjector;
   import projects.tanks.clients.flash.commons.services.validate.IValidateService;
   import projects.tanks.clients.flash.commons.services.validate.ValidateService;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class RegistrationCommonElementsSection extends Sprite
   {
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var passwordParamsService:IPasswordParamsService;
      
      [Inject]
      public static var validateService:IValidateService;
      
      public static const MAX_CHARS_CALLSIGN:int = 20;
      
      public static const MAX_CHARS_EMAIL:int = 100;
      
      [Inject]
      public var injector:IInjector;
      
      [Inject]
      public var entranceView:EntranceView;
      
      private const CHECK_CALLSIGN_DELAY:int = 500;
      
      public var _continueButton:DefaultButtonBase;
      
      private var _callsignInput:TankInputBase;
      
      private var _callSignCheckIcon:ValidationIcon;
      
      private var _callsignValidated:Boolean;
      
      private var _checkCallsignTimer:Timer;
      
      private var _emailInput:TankInputBase;
      
      private var _registrationThroughEmail:Boolean;
      
      private var _emailCheckIcon:ValidationIcon;
      
      private var _emailValidated:Boolean;
      
      private var _checkEmailTimer:Timer;
      
      private var _pass1:TankInputBase;
      
      private var _pass2:TankInputBase;
      
      private var _pass1CheckIcon:ValidationIcon;
      
      private var _pass2CheckIcon:ValidationIcon;
      
      private var _checkRemember:TankCheckBoxBase;
      
      private var _antiAddictionEnabled:Boolean;
      
      private var _antiAddictionSection:AntiAddictionSection;
      
      private var _freeUidsForm:FreeUidsForm;
      
      private var _isFreeUidsFormAlreadyShowed:Boolean;
      
      private var _margin:int = 20;
      
      private var _border:int = 25;
      
      private var _windowWidth:int = 380;
      
      private var _windowHeight:int = 250;
      
      private var _inputsLeftMargin:int = 80;
      
      private var _captchaSection:CaptchaSection;
      
      private var _rulesButton:LabelBase;
      
      private var _nameIsNotUniqueBubble:Bubble;
      
      private var _nameIsIncorrectBubble:Bubble;
      
      private var _symbolIsNotAllowedBubble:Bubble;
      
      private var _emailIsBusyBubble:Bubble;
      
      private var _emailIsInvalidBubble:Bubble;
      
      private var _emailDomainIsForbidden:Bubble;
      
      private var _passwordIsTooEasyBubble:Bubble;
      
      private var _passwordsDoNotMatchBubble:Bubble;
      
      public function RegistrationCommonElementsSection()
      {
         super();
      }
      
      private static function isPasswordForbidden(param1:String) : Boolean
      {
         return param1.length < passwordParamsService.minPasswordLength || passwordParamsService.forbiddenPasswords.indexOf(param1.toLowerCase()) != -1;
      }
      
      [PostConstruct]
      public function postConstruct() : void
      {
         this._captchaSection = this.injector.instantiate(CaptchaSection);
         this._callsignInput = new TankInputBase();
         this._emailInput = new TankInputBase();
         this._callSignCheckIcon = new ValidationIcon();
         this._emailCheckIcon = new ValidationIcon();
         this._pass1 = new TankInputBase();
         this._pass2 = new TankInputBase();
         this._pass1CheckIcon = new ValidationIcon();
         this._pass2CheckIcon = new ValidationIcon();
         this._continueButton = new DefaultButtonBase();
         this._checkRemember = new TankCheckBoxBase();
         addChild(this._captchaSection);
         addChild(this._emailInput);
         addChild(this._callsignInput);
         addChild(this._pass1);
         addChild(this._pass2);
         addChild(this._continueButton);
         addChild(this._pass2CheckIcon);
         addChild(this._pass1CheckIcon);
         addChild(this._checkRemember);
         addChild(this._emailCheckIcon);
         addChild(this._callSignCheckIcon);
         this._callsignInput.label = localeService.getText(TextConst.REGISTER_FORM_CALLSIGN_INPUT_LABEL_TEXT);
         this._pass1.label = localeService.getText(TextConst.REGISTER_FORM_PASSWORD_INPUT_LABEL_TEXT);
         this._pass2.label = localeService.getText(TextConst.REGISTER_FORM_REPEAT_PASSWORD_INPUT_LABEL_TEXT);
         this._callsignInput.maxChars = MAX_CHARS_CALLSIGN;
         this._callsignInput.validValue = true;
         this._emailInput.label = "E-mail:";
         this._emailInput.maxChars = MAX_CHARS_EMAIL;
         this._pass1.maxChars = passwordParamsService.maxPasswordLength;
         this._pass1.hidden = true;
         this._pass1.validValue = true;
         this._pass2.maxChars = passwordParamsService.maxPasswordLength;
         this._pass2.hidden = true;
         this._pass2.validValue = true;
         this._checkRemember.§ !w§ = true;
         this._checkRemember.label = localeService.getText(TextConst.REGISTER_FORM_REMEMBER_ME_CHECKBOX_LABEL_TEXT);
         this._continueButton.label = localeService.getText(TanksLocale.TEXT_REGISTER_FORM_CONTINUE);
         this._continueButton.enable = false;
         this._rulesButton = new LabelBase();
         this._rulesButton.multiline = true;
         this._rulesButton.wordWrap = true;
         this._rulesButton.htmlText = localeService.getText(TextConst.REGISTER_FORM_AGREEMENT_NOTE_TEXT);
         addChild(this._rulesButton);
         this._antiAddictionSection = new AntiAddictionSection();
         addChild(this._antiAddictionSection);
         this._antiAddictionSection.visible = false;
         this._captchaSection.visible = false;
         this._checkCallsignTimer = new Timer(this.CHECK_CALLSIGN_DELAY,1);
         this._checkEmailTimer = new Timer(this.CHECK_CALLSIGN_DELAY,1);
         this.createBubbles();
         this.createFreeUidsForm();
         this.updatePositionAndVisibleElements();
      }
      
      private function createBubbles() : void
      {
         this._nameIsNotUniqueBubble = EntranceBubbleFactory.nameIsNotUniqueBubble();
         this._nameIsIncorrectBubble = EntranceBubbleFactory.nameIsIncorrectBubble();
         this._symbolIsNotAllowedBubble = EntranceBubbleFactory.symbolIsNotAllowedBubble();
         this._emailIsBusyBubble = EntranceBubbleFactory.emailIsBusy();
         this._emailIsInvalidBubble = EntranceBubbleFactory.emailIsInvalidBubble();
         this._emailDomainIsForbidden = EntranceBubbleFactory.emailDomainIsForbidden();
         this._passwordIsTooEasyBubble = EntranceBubbleFactory.passwordIsTooEasyBubble();
         this._passwordsDoNotMatchBubble = EntranceBubbleFactory.passwordsDoNotMatchBubble();
      }
      
      private function createFreeUidsForm() : void
      {
         this._freeUidsForm = new FreeUidsForm();
         addChild(this._freeUidsForm);
      }
      
      private function updatePositionAndVisibleElements() : void
      {
         this._inputsLeftMargin = this._border + 5 + Math.max(this._callsignInput._label.width,this._pass1._label.width,this._pass2._label.width);
         this._callsignInput.x = this._inputsLeftMargin;
         this._callsignInput.y = this._margin;
         this._callsignInput.width = this._windowWidth - this._inputsLeftMargin - this._border;
         this._freeUidsForm.x = this._callsignInput.x;
         this._freeUidsForm.y = this._callsignInput.y + this._callsignInput.height;
         this._freeUidsForm.width = this._windowWidth - this._inputsLeftMargin - this._border;
         this._callSignCheckIcon.x = this._windowWidth - this._margin - this._callSignCheckIcon.width - 10;
         this._callSignCheckIcon.y = this._callsignInput.y + 7;
         this._emailInput.x = this._inputsLeftMargin;
         this._emailInput.y = this._callsignInput.y + this._callsignInput.height + this._margin - 10;
         this._emailInput.width = this._windowWidth - this._inputsLeftMargin - this._border;
         this._emailCheckIcon.x = this._windowWidth - this._margin - this._emailCheckIcon.width - 10;
         this._emailCheckIcon.y = this._emailInput.y + 7;
         this._pass1.visible = !this._registrationThroughEmail;
         this._pass2.visible = !this._registrationThroughEmail;
         this._pass1CheckIcon.visible = !this._registrationThroughEmail;
         this._pass2CheckIcon.visible = !this._registrationThroughEmail;
         this._checkRemember.visible = !this._registrationThroughEmail;
         this._emailInput.visible = this._registrationThroughEmail;
         this._pass1.x = this._inputsLeftMargin;
         this._pass1.y = this._callsignInput.y + this._callsignInput.height + this._margin - 10;
         this._pass1.width = this._windowWidth - this._inputsLeftMargin - this._border;
         this._pass1CheckIcon.x = this._windowWidth - this._margin - 30;
         this._pass1CheckIcon.y = this._pass1.y + 7;
         this._pass2.x = this._inputsLeftMargin;
         this._pass2.y = this._pass1.y + this._pass1.height + this._margin - 10;
         this._pass2.width = this._windowWidth - this._inputsLeftMargin - this._border;
         this._pass2CheckIcon.x = this._windowWidth - this._margin - 30;
         this._pass2CheckIcon.y = this._pass2.y + 7;
         this._checkRemember.y = this._pass2.y + this._pass2.height + this._margin;
         this._checkRemember.x = this._pass2.x;
         this._continueButton.x = this._windowWidth - this._border - this._continueButton.width;
         this._continueButton.y = this._checkRemember.y;
         this._captchaSection.width = this._windowWidth - this._inputsLeftMargin - this._border;
         this._rulesButton.x = this._border;
         this._rulesButton.y = this._windowHeight - this._rulesButton.height - this._border;
         this._rulesButton.width = this._windowWidth - this._rulesButton.x - this._border;
      }
      
      private function setEvents() : void
      {
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemoveFromStage);
         this._freeUidsForm.addEventListener(FreeUidsFormEvent.CLICK_ITEM,this.onFreeUidsFormSelectedItem);
         this._freeUidsForm.addEventListener(FreeUidsFormEvent.FOCUS_OUT,this.onFreeUidsFormFocusOut);
         this._callsignInput.textField.addEventListener(FocusEvent.FOCUS_IN,this.onCallsignFocusIn);
         this._callsignInput.addEventListener(LoginFormEvent.TEXT_CHANGED,this.onCallsignChanged);
         this._continueButton.addEventListener(MouseEvent.CLICK,this.onContinueButtonClick);
         this._rulesButton.addEventListener(TextEvent.LINK,this.onRules);
         this._captchaSection.captchaAnswer.addEventListener(KeyboardEvent.KEY_DOWN,this.onPlayClickedKey);
         this._captchaSection.refreshButton.addEventListener(MouseEvent.CLICK,this.onRefreshCaptcha);
         this._checkCallsignTimer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onCallsignCheckTimerComplete);
         this._checkEmailTimer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onEmailCheckTimerComplete);
         if(this._antiAddictionEnabled)
         {
            this._antiAddictionSection.addEventListener(AntiAddictionInfoUpdatedEvent.EVENT,this.onAntiAddictionUpdated);
         }
         if(this._registrationThroughEmail)
         {
            this._emailInput.addEventListener(LoginFormEvent.TEXT_CHANGED,this.onEmailChanged);
            this._emailInput.addEventListener(KeyboardEvent.KEY_DOWN,this.onPlayClickedKey);
         }
         else
         {
            this._pass1.addEventListener(LoginFormEvent.TEXT_CHANGED,this.onPasswordChanged);
            this._pass2.addEventListener(LoginFormEvent.TEXT_CHANGED,this.onPasswordChanged);
            this._pass2.addEventListener(KeyboardEvent.KEY_DOWN,this.onPlayClickedKey);
         }
      }
      
      private function onRemoveFromStage(param1:Event) : void
      {
         removeEventListener(Event.REMOVED_FROM_STAGE,this.onRemoveFromStage);
         this._freeUidsForm.destroy();
         this.removeEvents();
      }
      
      private function removeEvents() : void
      {
         this._freeUidsForm.removeEventListener(FreeUidsFormEvent.FOCUS_OUT,this.onFreeUidsFormFocusOut);
         this._freeUidsForm.removeEventListener(FreeUidsFormEvent.CLICK_ITEM,this.onFreeUidsFormSelectedItem);
         this._callsignInput.textField.removeEventListener(FocusEvent.FOCUS_IN,this.onCallsignFocusIn);
         this._callsignInput.removeEventListener(LoginFormEvent.TEXT_CHANGED,this.onCallsignChanged);
         this._continueButton.removeEventListener(MouseEvent.CLICK,this.onContinueButtonClick);
         this._rulesButton.removeEventListener(TextEvent.LINK,this.onRules);
         this._captchaSection.captchaAnswer.removeEventListener(KeyboardEvent.KEY_DOWN,this.onPlayClickedKey);
         this._captchaSection.refreshButton.removeEventListener(MouseEvent.CLICK,this.onRefreshCaptcha);
         this._checkCallsignTimer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onCallsignCheckTimerComplete);
         this._checkEmailTimer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onEmailCheckTimerComplete);
         if(this._antiAddictionEnabled)
         {
            this._antiAddictionSection.removeEventListener(AntiAddictionInfoUpdatedEvent.EVENT,this.onAntiAddictionUpdated);
         }
         if(this._registrationThroughEmail)
         {
            this._emailInput.removeEventListener(LoginFormEvent.TEXT_CHANGED,this.onEmailChanged);
            this._emailInput.removeEventListener(KeyboardEvent.KEY_DOWN,this.onPlayClickedKey);
         }
         else
         {
            this._pass1.removeEventListener(LoginFormEvent.TEXT_CHANGED,this.onPasswordChanged);
            this._pass2.removeEventListener(LoginFormEvent.TEXT_CHANGED,this.onPasswordChanged);
            this._pass2.removeEventListener(KeyboardEvent.KEY_DOWN,this.onPlayClickedKey);
         }
      }
      
      public function get callsign() : String
      {
         return this._callsignInput.textField.text;
      }
      
      public function get emailText() : String
      {
         return this._emailInput.textField.text;
      }
      
      public function get password() : String
      {
         return this._pass1.textField.text;
      }
      
      public function get verificationPassword() : String
      {
         return this._pass2.textField.text;
      }
      
      public function set password(param1:String) : void
      {
         this._pass1.textField.text = param1;
         if(param1.length != 0)
         {
            this.onPasswordChanged();
         }
      }
      
      public function set verificationPassword(param1:String) : void
      {
         this._pass2.textField.text = param1;
         if(param1.length != 0)
         {
            this.onPasswordChanged();
         }
      }
      
      public function get rememberMe() : Boolean
      {
         return this._checkRemember.§ !w§;
      }
      
      public function set callsign(param1:String) : void
      {
         this._callsignInput.value = param1;
         display.stage.focus = this._callsignInput.textField;
         if(param1.length != 0)
         {
            this.onCallsignChanged();
            this._callsignInput.textField.setSelection(param1.length,param1.length);
         }
      }
      
      public function set emailText(param1:String) : void
      {
         this._emailInput.value = param1;
         if(param1.length != 0)
         {
            this.onEmailChanged();
         }
      }
      
      public function get realName() : String
      {
         return this._antiAddictionSection != null ? this._antiAddictionSection.realName.textField.text : "";
      }
      
      public function get idNumber() : String
      {
         return this._antiAddictionSection != null ? this._antiAddictionSection.idNumber.textField.text : "";
      }
      
      public function set idNumber(param1:String) : void
      {
         if(this._antiAddictionSection != null)
         {
            this._antiAddictionSection.idNumber.textField.text = param1;
         }
      }
      
      public function set realName(param1:String) : void
      {
         if(this._antiAddictionSection != null)
         {
            this._antiAddictionSection.realName.textField.text = param1;
         }
      }
      
      public function get captchaAnswer() : String
      {
         return this._captchaSection.captchaAnswer.value;
      }
      
      public function set captcha(param1:Bitmap) : void
      {
         this._captchaSection.captcha = param1;
      }
      
      private function onContinueButtonClick(param1:MouseEvent = null) : void
      {
         this._continueButton.enable = false;
         this.removeEvents();
         dispatchEvent(new RegistrationFormEvent());
      }
      
      private function onRefreshCaptcha(param1:MouseEvent) : void
      {
         dispatchEvent(new RefreshCaptchaClickedEvent());
      }
      
      private function onPlayClickedKey(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.ENTER && this._continueButton.enable)
         {
            this.onContinueButtonClick();
         }
      }
      
      public function alertAboutFreeUid() : void
      {
         this._symbolIsNotAllowedBubble.hide();
         this._callsignInput.validValue = true;
         this._callsignValidated = true;
         this._callSignCheckIcon.markAsValid();
         this.togglePlayButton();
      }
      
      public function alertAboutBusyUid(param1:Vector.<String>) : void
      {
         this._symbolIsNotAllowedBubble.hide();
         this._callsignInput.validValue = false;
         this._callSignCheckIcon.markAsInvalid();
         this._callSignCheckIcon.addChild(this._nameIsNotUniqueBubble);
         this._nameIsNotUniqueBubble.visible = true;
         if(param1.length != 0)
         {
            this._isFreeUidsFormAlreadyShowed = true;
            this._nameIsNotUniqueBubble.visible = false;
            this._pass1._label.visible = false;
            this._pass2._label.visible = false;
            this._freeUidsForm.create(param1);
         }
         this.togglePlayButton();
      }
      
      public function alertAboutIncorrectUid() : void
      {
         this._symbolIsNotAllowedBubble.hide();
         this._callsignInput.validValue = false;
         this._callSignCheckIcon.markAsInvalid();
         this._callSignCheckIcon.addChild(this._nameIsIncorrectBubble);
         this.togglePlayButton();
      }
      
      public function alertAboutEmailIsFree() : void
      {
         this._emailInput.validValue = true;
         this._emailValidated = true;
         this._emailCheckIcon.markAsValid();
         this.togglePlayButton();
      }
      
      public function alertAboutEmailIsBusy() : void
      {
         this._emailInput.validValue = false;
         this._emailCheckIcon.markAsInvalid();
         this._emailCheckIcon.addChild(this._emailIsBusyBubble);
         this.togglePlayButton();
      }
      
      public function alertAboutEmailIsInvalid() : void
      {
         this._emailInput.validValue = false;
         this._emailCheckIcon.markAsInvalid();
         this._emailCheckIcon.addChild(this._emailIsInvalidBubble);
         this.togglePlayButton();
      }
      
      public function alertAboutEmailDomainIsForbidden() : void
      {
         this._emailInput.validValue = false;
         this._emailCheckIcon.markAsInvalid();
         this._emailCheckIcon.addChild(this._emailDomainIsForbidden);
         this.togglePlayButton();
      }
      
      public function alertAboutIncorrectPassword() : void
      {
         this._pass1.validValue = false;
         this._pass1CheckIcon.markAsInvalid();
         this._pass1CheckIcon.addChild(this._passwordIsTooEasyBubble);
         this.togglePlayButton();
      }
      
      public function showCommonElements(param1:Boolean, param2:Boolean, param3:Boolean = false) : void
      {
         this._registrationThroughEmail = param3;
         this.updatePositionAndVisibleElements();
         this.updateTabIndex();
         var _loc4_:int = (param3 ? this._emailInput.y + this._emailInput.height : this._pass2.y + this._pass2.height) + this._margin;
         if(!param3)
         {
            this._pass1CheckIcon.turnOff();
            this._pass2CheckIcon.turnOff();
         }
         this._antiAddictionEnabled = param2;
         if(param2)
         {
            this._antiAddictionSection.visible = true;
            this._antiAddictionSection.y = _loc4_;
            this._antiAddictionSection.x = 15;
            _loc4_ += this._antiAddictionSection.height + this._margin;
         }
         if(param1)
         {
            this._captchaSection.visible = true;
            this._captchaSection.x = this._inputsLeftMargin;
            this._captchaSection.y = _loc4_;
            _loc4_ += this._captchaSection.height + this._margin;
         }
         this._checkRemember.y = _loc4_;
         this._continueButton.y = this._checkRemember.y;
         _loc4_ += this._checkRemember.height;
         _loc4_ = _loc4_ += this._checkRemember.height + (this._margin - 5);
         this._rulesButton.y = _loc4_;
         _loc4_ += this._rulesButton.height;
         this._windowHeight = _loc4_;
         this.setEvents();
      }
      
      private function updateTabIndex() : void
      {
         if(this._registrationThroughEmail)
         {
            this._callsignInput.tabIndex = 0;
            this._emailInput.tabIndex = 1;
         }
         else
         {
            this._callsignInput.tabIndex = 0;
            this._pass1.tabIndex = 1;
            this._pass2.tabIndex = 2;
         }
      }
      
      override public function get height() : Number
      {
         return this._windowHeight;
      }
      
      private function onFreeUidsFormSelectedItem(param1:FreeUidsFormEvent) : void
      {
         this.callsign = param1.uid;
         this.hideFreeUidsForm();
      }
      
      private function onFreeUidsFormFocusOut(param1:FreeUidsFormEvent) : void
      {
         this.hideFreeUidsForm();
      }
      
      private function hideFreeUidsForm() : void
      {
         this._freeUidsForm.hide();
         this._pass1._label.visible = true;
         this._pass2._label.visible = true;
         this._nameIsNotUniqueBubble.visible = true;
      }
      
      private function onCallsignFocusIn(param1:FocusEvent) : void
      {
         if(this._isFreeUidsFormAlreadyShowed)
         {
            this._pass1._label.visible = false;
            this._pass2._label.visible = false;
            this._nameIsNotUniqueBubble.visible = false;
            this._freeUidsForm.show();
         }
      }
      
      private function onCallsignChanged(param1:LoginFormEvent = null) : void
      {
         this._callsignValidated = false;
         this._callsignInput.validValue = true;
         this._nameIsIncorrectBubble.hide();
         this._nameIsNotUniqueBubble.hide();
         this._symbolIsNotAllowedBubble.hide();
         this._callSignCheckIcon.turnOff();
         this._isFreeUidsFormAlreadyShowed = false;
         this.hideFreeUidsForm();
         this._checkCallsignTimer.reset();
         this._checkCallsignTimer.start();
         if(!validateService.isValidIdentificationStringForRegistration(this._callsignInput.value))
         {
            this._callsignInput.value = this._callsignInput.value.replace(ValidateService.NOT_ALLOWED_PATTERN_FOR_REGISTRATION,"");
            this.alertAboutSymbolIsNotAllowed();
         }
         this.togglePlayButton();
      }
      
      private function alertAboutSymbolIsNotAllowed() : void
      {
         this._callsignInput.validValue = false;
         this._callSignCheckIcon.markAsInvalid();
         this._callSignCheckIcon.addChild(this._symbolIsNotAllowedBubble);
      }
      
      private function onEmailChanged(param1:LoginFormEvent = null) : void
      {
         this._emailValidated = false;
         this._emailInput.validValue = true;
         this._emailIsInvalidBubble.hide();
         this._emailDomainIsForbidden.hide();
         this._emailIsBusyBubble.hide();
         this._emailCheckIcon.turnOff();
         this._checkEmailTimer.reset();
         this._checkEmailTimer.start();
         this.togglePlayButton();
      }
      
      private function onPasswordChanged(param1:LoginFormEvent = null) : void
      {
         this._passwordIsTooEasyBubble.hide();
         this._pass1.validValue = true;
         this._pass1CheckIcon.markAsValid();
         if(isPasswordForbidden(this._pass1.textField.text) && this._pass1.textField.text.length != 0)
         {
            this._pass1CheckIcon.markAsInvalid();
            this._pass1.validValue = false;
            if(!this._nameIsIncorrectBubble.parent && !this._nameIsNotUniqueBubble.parent)
            {
               this._pass1CheckIcon.addChild(this._passwordIsTooEasyBubble);
            }
         }
         if(this._pass1.textField.text.length == 0)
         {
            this._pass1CheckIcon.turnOff();
         }
         this._pass2.validValue = true;
         this._pass2CheckIcon.markAsValid();
         this._passwordsDoNotMatchBubble.hide();
         if(this._pass1.textField.text != this._pass2.textField.text && this._pass2.textField.text.length != 0)
         {
            this._pass2CheckIcon.markAsInvalid();
            this._pass2.validValue = false;
            if(!this._nameIsIncorrectBubble.parent && !this._nameIsNotUniqueBubble.parent)
            {
               if(!this._passwordIsTooEasyBubble.parent)
               {
                  this._pass2CheckIcon.addChild(this._passwordsDoNotMatchBubble);
               }
            }
         }
         if(this._pass2.textField.text.length == 0)
         {
            this._pass2CheckIcon.turnOff();
         }
         this.togglePlayButton();
      }
      
      private function togglePlayButton() : void
      {
         var _loc1_:Boolean = false;
         if(this._registrationThroughEmail)
         {
            this._continueButton.enable = this._callsignValidated && this._emailValidated;
         }
         else
         {
            this._continueButton.enable = this._callsignValidated && this._pass1.textField.text == this._pass2.textField.text && !isPasswordForbidden(this._pass1.textField.text);
         }
         if(this._antiAddictionEnabled)
         {
            _loc1_ = this._antiAddictionSection.isIdValid() && this._antiAddictionSection.isRealNameValid();
            this._continueButton.enable = this._continueButton.enable && _loc1_;
         }
      }
      
      private function onRules(param1:TextEvent) : void
      {
         var _loc2_:ViewText = new ViewText();
         this.entranceView.addChild(_loc2_);
         switch(param1.text)
         {
            case RulesType.RULES:
               _loc2_.text = localeService.getText(TextConst.STRING_GAME_RULES);
               break;
            case RulesType.EULA:
               _loc2_.text = localeService.getText(TextConst.STRING_GAME_TERMS);
               break;
            case RulesType.PRIVACY_POLICY:
               _loc2_.text = localeService.getText(TextConst.STRING_GAME_PRIVACY_POLICY);
         }
      }
      
      private function onCallsignCheckTimerComplete(param1:TimerEvent = null) : void
      {
         if(validateService.isUidValid(this._callsignInput.value))
         {
            this._callSignCheckIcon.startProgress();
            dispatchEvent(new CheckCallsignEvent(this.callsign));
         }
         else
         {
            this._callsignInput.validValue = true;
            this._symbolIsNotAllowedBubble.hide();
            this._callSignCheckIcon.turnOff();
            if(this._callsignInput.value.length != 0)
            {
               this.alertAboutIncorrectUid();
            }
         }
      }
      
      private function onEmailCheckTimerComplete(param1:TimerEvent) : void
      {
         if(validateService.isEmailValid(this._emailInput.value))
         {
            this._emailCheckIcon.startProgress();
            dispatchEvent(new CheckEmailEvent(this.emailText));
         }
         else
         {
            this._emailInput.validValue = true;
            this._emailCheckIcon.turnOff();
            if(this._emailInput.value.length != 0)
            {
               this.alertAboutEmailIsInvalid();
            }
         }
      }
      
      private function onAntiAddictionUpdated(param1:AntiAddictionInfoUpdatedEvent) : void
      {
         this.togglePlayButton();
      }
      
      public function captchaFailed() : void
      {
         this.setEvents();
         this.togglePlayButton();
         this._captchaSection.captchaAnswer.clear();
      }
   }
}

