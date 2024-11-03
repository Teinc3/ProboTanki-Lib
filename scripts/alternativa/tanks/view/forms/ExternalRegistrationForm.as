package alternativa.tanks.view.forms
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.controller.events.CheckCallsignEvent;
   import alternativa.tanks.controller.events.NavigationEvent;
   import alternativa.tanks.controller.events.socialnetwork.FinishExternalRegisterEvent;
   import alternativa.tanks.help.IHelpService;
   import alternativa.tanks.locale.constants.TextConst;
   import alternativa.tanks.type.RulesType;
   import alternativa.tanks.view.bubbles.Bubble;
   import alternativa.tanks.view.bubbles.EntranceBubbleFactory;
   import alternativa.tanks.view.forms.commons.RegistrationCommonElementsSection;
   import alternativa.tanks.view.forms.freeuids.FreeUidsForm;
   import alternativa.tanks.view.forms.freeuids.FreeUidsFormEvent;
   import alternativa.tanks.view.forms.primitives.ValidationIcon;
   import alternativa.tanks.view.layers.EntranceView;
   import controls.TankWindow;
   import controls.TankWindowHeader;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import controls.base.TankInputBase;
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
   
   public class ExternalRegistrationForm extends Sprite
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var helperService:IHelpService;
      
      [Inject]
      public static var validateService:IValidateService;
      
      private static const DEFAULT_WINDOW_HEIGHT:int = 232;
      
      [Inject]
      public var entranceView:EntranceView;
      
      [Inject]
      public var injector:IInjector;
      
      private var _callsignInput:TankInputBase;
      
      private var _continueButton:DefaultButtonBase;
      
      private var _rulesButton:LabelBase;
      
      private var _goToLoginPage:DefaultButtonBase;
      
      private var infoLabel:LabelBase;
      
      private var _window:TankWindow;
      
      private var _freeUidsForm:FreeUidsForm;
      
      private var _isFreeUidsFormAlreadyShowed:Boolean;
      
      private var _margin:int = 20;
      
      private var _border:int = 25;
      
      private var _windowWidth:int = 400;
      
      private var _windowHeight:int = 250;
      
      private var _inputsLeftMargin:int = 80;
      
      private var _callsignValidated:Boolean = false;
      
      private var _callSignCheckIcon:ValidationIcon;
      
      private var _checkCallsignTimer:Timer;
      
      private const checkCallsignDelay:int = 500;
      
      private var _nameIsNotUniqueBubble:Bubble;
      
      private var _nameIsIncorrectBubble:Bubble;
      
      private var _symbolIsNotAllowedBubble:Bubble;
      
      public function ExternalRegistrationForm()
      {
         super();
      }
      
      [PostConstruct]
      public function postConstruct() : void
      {
         var _loc1_:int = this._border;
         this._window = new TankWindow(this._windowWidth,_loc1_);
         this._window.headerLang = localeService.getText(TextConst.GUI_LANG);
         this._window.header = TankWindowHeader.REGISTER;
         this._callsignInput = new TankInputBase();
         this._callSignCheckIcon = new ValidationIcon();
         this._continueButton = new DefaultButtonBase();
         this._goToLoginPage = new DefaultButtonBase();
         this.infoLabel = new LabelBase();
         this._window.addChild(this._callsignInput);
         this._window.addChild(this._continueButton);
         this._window.addChild(this._goToLoginPage);
         this._window.addChild(this.infoLabel);
         this._window.addChild(this._callSignCheckIcon);
         this.infoLabel.text = localeService.getText(TextConst.STRING_PARTNER_REGISTARTION_FORM_CHOOSE_NAME_TEXT);
         this.infoLabel.y = this._margin;
         this.infoLabel.x = this._border;
         this._inputsLeftMargin = this._border + 5 + this._callsignInput._label.width;
         this._callsignInput.x = this._border;
         this._callsignInput.y = this.infoLabel.y + this.infoLabel.height + this._margin - 5;
         this._callsignInput.width = this._windowWidth - 2 * this._border;
         this._callsignInput.maxChars = RegistrationCommonElementsSection.MAX_CHARS_CALLSIGN;
         this._callsignInput.tabIndex = 0;
         this._callsignInput.validValue = true;
         this._callSignCheckIcon.x = this._windowWidth - this._margin - this._callSignCheckIcon.width - 10;
         this._callSignCheckIcon.y = this._callsignInput.y + 7;
         this._continueButton.label = localeService.getText(TextConst.STRING_PARTNER_REGISTARTION_FORM_CONTINUE);
         this._continueButton.enable = false;
         this._continueButton.x = this._windowWidth - this._border - this._continueButton.width;
         this._continueButton.y = this._callsignInput.y + this._callsignInput.height + this._margin - 5;
         this._goToLoginPage.label = localeService.getText(TextConst.STRING_BACK_BUTTON);
         this._goToLoginPage.x = this._border;
         this._goToLoginPage.y = this._continueButton.y;
         this._rulesButton = new LabelBase();
         this._rulesButton.x = this._border;
         this._rulesButton.multiline = true;
         this._rulesButton.wordWrap = true;
         this._rulesButton.htmlText = localeService.getText(TextConst.STRING_PARTNER_REGISTARTION_FORM_AGREEMENT_NOTE_TEXT);
         this._rulesButton.width = this._windowWidth - this._rulesButton.x - this._border;
         this._rulesButton.y = this._windowHeight - this._rulesButton.height - this._border;
         this._window.addChild(this._rulesButton);
         this._checkCallsignTimer = new Timer(this.checkCallsignDelay,1);
         addChild(this._window);
         this._freeUidsForm = new FreeUidsForm();
         this._freeUidsForm.x = this._callsignInput.x;
         this._freeUidsForm.y = this._callsignInput.y + this._callsignInput.height;
         this._freeUidsForm.width = this._windowWidth - 2 * this._border;
         addChild(this._freeUidsForm);
         this.createBubbles();
         this.showYourself();
         this.setEvent();
         display.stage.focus = this._callsignInput.textField;
         this.alignYourself(null);
      }
      
      private function createBubbles() : void
      {
         var _loc1_:ILocaleService = this.injector.getInstance(ILocaleService);
         this._nameIsNotUniqueBubble = EntranceBubbleFactory.nameIsNotUniqueBubble();
         this._nameIsIncorrectBubble = EntranceBubbleFactory.nameIsIncorrectBubble();
         this._symbolIsNotAllowedBubble = EntranceBubbleFactory.symbolIsNotAllowedBubble();
      }
      
      private function setEvent() : void
      {
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemoveFromStage);
         display.stage.addEventListener(Event.RESIZE,this.alignYourself);
         this._callsignInput.addEventListener(LoginFormEvent.TEXT_CHANGED,this.onCallsignChanged);
         this._callsignInput.addEventListener(KeyboardEvent.KEY_DOWN,this.onPlayClickedKey);
         this._continueButton.addEventListener(MouseEvent.CLICK,this.onRegisterButtonClick);
         this._goToLoginPage.addEventListener(MouseEvent.CLICK,this.onGoToLoginPageClick);
         this._rulesButton.addEventListener(TextEvent.LINK,this.onRules);
         this._checkCallsignTimer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onCallsignCheckTimerComplete);
         this._freeUidsForm.addEventListener(FreeUidsFormEvent.CLICK_ITEM,this.onFreeUidsFormSelectedItem);
         this._freeUidsForm.addEventListener(FreeUidsFormEvent.FOCUS_OUT,this.onFreeUidsFormFocusOut);
         this._callsignInput.textField.addEventListener(FocusEvent.FOCUS_IN,this.onCallsignFocusIn);
      }
      
      private function removeEvent() : void
      {
         removeEventListener(Event.REMOVED_FROM_STAGE,this.onRemoveFromStage);
         display.stage.removeEventListener(Event.RESIZE,this.alignYourself);
         this._callsignInput.removeEventListener(LoginFormEvent.TEXT_CHANGED,this.onCallsignChanged);
         this._callsignInput.removeEventListener(KeyboardEvent.KEY_DOWN,this.onPlayClickedKey);
         this._continueButton.removeEventListener(MouseEvent.CLICK,this.onRegisterButtonClick);
         this._goToLoginPage.removeEventListener(MouseEvent.CLICK,this.onGoToLoginPageClick);
         this._rulesButton.removeEventListener(TextEvent.LINK,this.onRules);
         this._checkCallsignTimer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onCallsignCheckTimerComplete);
         this._freeUidsForm.removeEventListener(FreeUidsFormEvent.CLICK_ITEM,this.onFreeUidsFormSelectedItem);
         this._freeUidsForm.removeEventListener(FreeUidsFormEvent.FOCUS_OUT,this.onFreeUidsFormFocusOut);
         this._callsignInput.textField.removeEventListener(FocusEvent.FOCUS_IN,this.onCallsignFocusIn);
      }
      
      private function onRemoveFromStage(param1:Event) : void
      {
         this._checkCallsignTimer.stop();
         this._freeUidsForm.destroy();
         this.removeEvent();
      }
      
      private function onGoToLoginPageClick(param1:MouseEvent) : void
      {
         dispatchEvent(new NavigationEvent(NavigationEvent.GO_TO_REGISTRATION_FORM));
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
      
      private function togglePlayButton() : void
      {
         this._continueButton.enable = this._callsignValidated;
      }
      
      private function alertAboutSymbolIsNotAllowed() : void
      {
         this._callsignInput.validValue = false;
         this._callSignCheckIcon.markAsInvalid();
         this._callSignCheckIcon.addChild(this._symbolIsNotAllowedBubble);
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
      
      private function onPlayClickedKey(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.ENTER && this._continueButton.enable)
         {
            this.onRegisterButtonClick();
         }
      }
      
      private function onCallsignCheckTimerComplete(param1:TimerEvent) : void
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
      
      private function onRegisterButtonClick(param1:MouseEvent = null) : void
      {
         this._continueButton.enable = false;
         dispatchEvent(new FinishExternalRegisterEvent(this.callsign));
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
         this._nameIsNotUniqueBubble.visible = true;
      }
      
      private function onCallsignFocusIn(param1:FocusEvent) : void
      {
         if(this._isFreeUidsFormAlreadyShowed)
         {
            this._nameIsNotUniqueBubble.visible = false;
            this._freeUidsForm.show();
         }
      }
      
      private function showYourself() : void
      {
         var _loc1_:int = this._callsignInput.y + this._callsignInput.height;
         this._continueButton.y = _loc1_ + this._margin;
         this._goToLoginPage.y = this._continueButton.y;
         _loc1_ += this._continueButton.height + this._margin + 10;
         this._rulesButton.y = _loc1_;
         _loc1_ += this._rulesButton.height;
         this._window.height = Math.max(DEFAULT_WINDOW_HEIGHT,_loc1_ + this._margin + 12);
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
      
      private function alignYourself(param1:Event) : void
      {
         this.x = int((display.stage.stageWidth - this._windowWidth) / 2);
         this.y = int((display.stage.stageHeight - this._window.height) / 2);
      }
      
      public function get callsign() : String
      {
         return this._callsignInput.textField.text;
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
   }
}

