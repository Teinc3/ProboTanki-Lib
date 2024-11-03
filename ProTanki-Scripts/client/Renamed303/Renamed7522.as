package Renamed303
{
   import Renamed1959.Renamed1961;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.gui.icons.Renamed1939;
   import alternativa.tanks.gui.settings.SettingsWindow;
   import alternativa.tanks.help.IHelpService;
   import alternativa.tanks.service.IExternalEntranceService;
   import alternativa.tanks.service.socialnetwork.ISocialNetworkPanelService;
   import alternativa.tanks.service.socialnetwork.SocialNetworkServiceEvent;
   import alternativa.tanks.view.events.RefreshCaptchaClickedEvent;
   import alternativa.tanks.view.registration.CaptchaSection;
   import assets.icons.InputCheckIcon;
   import controls.DefaultIconButton;
   import controls.FBButton;
   import controls.TankWindowInner;
   import controls.VKButton;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import controls.base.TankInput;
   import controls.containers.Renamed1982;
   import controls.containers.Renamed2259;
   import controls.Renamed3955;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.system.Capabilities;
   import flash.text.AntiAliasType;
   import forms.events.LoginFormEvent;
   import forms.registration.CallsignIconStates;
   import forms.registration.bubbles.EmailInvalidBubble;
   import forms.registration.bubbles.PasswordIsTooEasyBubble;
   import forms.registration.bubbles.PasswordsDoNotMatchBubble;
   import platform.clients.fp10.libraries.alternativapartners.service.IPartnerService;
   import projects.tanks.clients.flash.commons.services.validate.IValidateService;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.Renamed3761;
   
   public class Renamed1962 extends Renamed1961
   {
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var partnersService:IPartnerService;
      
      [Inject]
      public static var socialNetworkService:ISocialNetworkPanelService;
      
      [Inject]
      public static var Renamed3564:IExternalEntranceService;
      
      [Inject]
      public static var validateService:IValidateService;
      
      [Inject]
      public static var helperService:IHelpService;
      
      private static const HELPER_GROUP_KEY:String = "ChangeHelpers";
      
      private static const PASSWORD_IS_TOO_EASY:int = 3;
      
      private static const PASSWORDS_DO_NOT_MATCH:int = 4;
      
      private static const ERROR_EMAIL_INVALID:int = 5;
      
      private static const Renamed7490:int = 7;
      
      private static const INPUT_HEIGHT:int = 30;
      
      private static const forbiddenPasswords:Array = ["1234567890","123456789","12345678","1234567","123456","12345","1234","0123","01234","012345","0123456","01234567","012345678","0123456789","9876","98765","987654","9876543","98765432","987654321","9876543210","8765","87654","876543","8765432","87654321","876543210","7654","76543","765432","7654321","76543210","6543","65432","654321","6543210","5432","54321","543210","4321","43210","3210","1111","2222","3333","4444","5555","6666","7777","8888","9999","0000","11111","22222","33333","44444","55555","66666","77777","88888","99999","00000","111111","222222","333333","444444","555555","666666","777777","888888","999999","000000","1111111","2222222","3333333","4444444","5555555","6666666","7777777","8888888","9999999","0000000","11111111","22222222","33333333","44444444","55555555","66666666","77777777","88888888","99999999","00000000","111111111","222222222","333333333","444444444","555555555","666666666","777777777","888888888","999999999","000000000","abcd","Jack","1234","snoopy","suzy","spike","1012","1234","pepper ","shelby","12345 ","54321 ","pass ","wolf","john","qqqq","aaaa","ZZZz","asdf","zxcv","asdf","zxcv","asdfgh","zxcvbn","1111","!!!!","4321","$#@!","1234","!@#$","12345","!@#$%","123456","!@#$%^","abcd","ABCD","qwerty1","QWERTY!","1q2w3e4r","1q2w3e","q1w2e3","q1w2e3r4","qweasd","QWEASD","asdzxc","ASDZXC","qweqwe","QWEQWE","asdasd","ASDASD","zxczxc","qwaszx","elite","ELITE","1qwerty","!QWERTY","black","blue","green","grey","yellow","orange","brown","support","Support","Topgun","topgun","help","Lame","hack","hunter","ranger","lamer","Lamer","hacker","Hacker","hack","summer","spring","autumn","winter","sunday","monday","tuesday","wednesda","thursday","friday","saturday","january","february","march","april","june","july","august","september","october","november","december","cool","lucky","korn ","fuck","Honda","mustang","pentium","mouse","stan","soccer","password","diablo","zoom","joker","nofear","unix","home","apache","holly","q3rulez","pass123","magnum","mother","father","lisa","janet","helen","chocolate","Matrix","Gold","dollar","pussy","eminem","personal","zippo","jennifer","pepsi","clock","time","good","super","friend","angel","qwer","qwert","qwerty","homer","angle","johan","love","test","1q2w3e4r5t6y","31337","loll","gggg"];
      
      private static const VKONTAKTE:String = "vkontakte";
      
      private static const FACEBOOK:String = "facebook";
      
      private static const Renamed3786:String = "google";
      
      private var pass1:TankInput;
      
      private var pass2:TankInput;
      
      private var emailInput:TankInput;
      
      private var realNameInput:TankInput;
      
      private var idNumberInput:TankInput;
      
      private var Renamed7491:DefaultButtonBase;
      
      private var pass1CheckIcon:InputCheckIcon;
      
      private var pass2CheckIcon:InputCheckIcon;
      
      private var emailCheckIcon:InputCheckIcon;
      
      private var passwordIsTooEasyBubble:PasswordIsTooEasyBubble;
      
      private var passwordsDoNotMatchBubble:PasswordsDoNotMatchBubble;
      
      private var errorEmailInvalodBubble:EmailInvalidBubble;
      
      private var Renamed7492:DefaultButtonBase;
      
      private var Renamed7493:Boolean;
      
      private var snButton:DefaultIconButton;
      
      private var snHasLinkLabel:LabelBase;
      
      private var Renamed3932:DefaultButtonBase;
      
      private var Renamed3933:DefaultButtonBase;
      
      private var Renamed3934:DefaultButtonBase;
      
      public var emailConfirmed:Boolean = false;
      
      public var initialRealName:String;
      
      public var initialIDNumber:String;
      
      private var Renamed7494:DefaultButtonBase;
      
      private var currentSN:String;
      
      private var Renamed7495:TankInput;
      
      private var Renamed7496:LabelBase;
      
      private var Renamed7497:InputCheckIcon;
      
      private var changePasswordButton:DefaultButtonBase;
      
      private var captchaSection:CaptchaSection;
      
      public function Renamed1962(param1:String, param2:Boolean, param3:Boolean, param4:String, param5:String)
      {
         super();
         this.initialRealName = param4;
         this.initialIDNumber = param5;
         this.emailConfirmed = param2;
         var _loc6_:Renamed2259 = new Renamed2259();
         _loc6_.Renamed1987(MARGIN);
         _loc6_.y = 3 * MARGIN + INPUT_HEIGHT;
         if(!partnersService.isRunningInsidePartnerEnvironment())
         {
            if(param2)
            {
               _loc6_.addItem(this.Renamed7498());
            }
            else
            {
               _loc6_.addItem(this.Renamed7499(param1));
               this.initEvents();
               this.createBubbles();
            }
         }
         if(Boolean(socialNetworkService.Renamed3785(FACEBOOK)) || Boolean(socialNetworkService.Renamed3785(VKONTAKTE)))
         {
            _loc6_.addItem(this.createSNPanel());
         }
         if(param3)
         {
            _loc6_.addItem(this.Renamed7500(param1,param5,param4));
         }
         addChildAt(_loc6_,0);
      }
      
      private static function restoreInput(param1:Event) : void
      {
         var _loc2_:TankInput = param1.currentTarget as TankInput;
         _loc2_.validValue = true;
      }
      
      private static function isPasswordValid(param1:String) : Boolean
      {
         return param1 == "" || param1.length >= 4 && forbiddenPasswords.indexOf(param1.toLowerCase()) == -1;
      }
      
      private static function trimString(param1:String) : String
      {
         if(param1)
         {
            return param1.replace(/^\s+|\s+$/g,"");
         }
         return param1;
      }
      
      private function Renamed7500(param1:String, param2:String, param3:String) : DisplayObject
      {
         var _loc4_:Renamed2259 = null;
         var _loc8_:LabelBase = null;
         _loc4_ = new Renamed2259();
         _loc4_.Renamed1987(Renamed5304);
         var _loc5_:TankWindowInner = new TankWindowInner(SettingsWindow.Renamed1967,0,TankWindowInner.TRANSPARENT);
         var _loc6_:LabelBase;
         (_loc6_ = new LabelBase()).antiAliasType = AntiAliasType.ADVANCED;
         _loc6_.sharpness = -100;
         _loc6_.thickness = 100;
         _loc6_.text = "防沉迷验证登记";
         _loc5_.addChild(_loc6_);
         _loc4_.addItem(_loc6_);
         var _loc7_:LabelBase = new LabelBase();
         _loc5_.addChild(_loc7_);
         _loc7_.text = "您的真实姓名:";
         _loc7_.x = MARGIN;
         this.realNameInput = new TankInput();
         _loc5_.addChild(this.realNameInput);
         this.realNameInput.width = _loc5_.width - MARGIN * 3 - _loc7_.textWidth - 4;
         this.realNameInput.x = _loc7_.x + _loc7_.width + MARGIN;
         this.realNameInput.y = _loc5_.y + MARGIN;
         _loc7_.y = this.realNameInput.y + Math.round((this.realNameInput.height - _loc7_.textHeight) * 0.5) - 2;
         _loc8_ = new LabelBase();
         _loc5_.addChild(_loc8_);
         _loc8_.text = "身份证号码:";
         _loc8_.x = MARGIN;
         _loc8_.y = this.realNameInput.y + this.realNameInput.height + MARGIN + 6;
         this.idNumberInput = new TankInput();
         _loc5_.addChild(this.idNumberInput);
         this.idNumberInput.textField.text = param1;
         this.idNumberInput.x = this.realNameInput.x;
         this.idNumberInput.y = this.realNameInput.y + this.realNameInput.height + MARGIN;
         this.idNumberInput.width = this.realNameInput.width;
         this.idNumberInput.textField.text = param2 != null && param2 != "null" ? param2 : "";
         this.realNameInput.textField.text = param3 != null && param3 != "null" ? param3 : "";
         this.idNumberInput.addEventListener(LoginFormEvent.TEXT_CHANGED,this.validateAddictionID);
         this.realNameInput.addEventListener(LoginFormEvent.TEXT_CHANGED,this.validateRealName);
         this.Renamed7494 = new DefaultButtonBase();
         this.Renamed7494.label = localeService.getText(TanksLocale.TEXT_SETTINGS_BUTTON_SAVE_TEXT);
         this.Renamed7494.addEventListener(MouseEvent.CLICK,this.Renamed7501);
         _loc5_.height = MARGIN * 4 + 2 * this.realNameInput.height + this.Renamed7494.height;
         this.Renamed7494.x = SettingsWindow.Renamed1967 - MARGIN - this.Renamed7494.width;
         this.Renamed7494.y = 3 * MARGIN + 2 * this.realNameInput.height;
         _loc5_.addChild(this.Renamed7494);
         _loc4_.addItem(_loc5_);
         return _loc4_;
      }
      
      private function Renamed7498() : TankWindowInner
      {
         var _loc1_:TankWindowInner = new TankWindowInner(SettingsWindow.Renamed1967,2 * MARGIN + INPUT_HEIGHT,TankWindowInner.TRANSPARENT);
         this.Renamed7492 = new DefaultButtonBase();
         this.Renamed7492.width = 210;
         this.Renamed7492.label = localeService.getText(TanksLocale.TEXT_SETTINGS_BUTTON_CHANGE_PASSWORD_TEXT);
         this.Renamed7492.x = (SettingsWindow.Renamed1967 - this.Renamed7492.width) / 2;
         this.Renamed7492.y = MARGIN;
         this.Renamed7492.addEventListener(MouseEvent.CLICK,this.Renamed7502);
         _loc1_.addChild(this.Renamed7492);
         this.Renamed7503(_loc1_);
         return _loc1_;
      }
      
      private function Renamed7499(param1:String) : TankWindowInner
      {
         var _loc2_:TankWindowInner = new TankWindowInner(SettingsWindow.Renamed1967,INPUT_HEIGHT * 3 + 4 * MARGIN,TankWindowInner.TRANSPARENT);
         var _loc3_:Renamed1982 = new Renamed1982();
         _loc3_.Renamed1987(MARGIN);
         _loc3_.x = _loc3_.y = MARGIN;
         this.Renamed7496 = this.createLabel(localeService.getText(TanksLocale.TEXT_CURRENT_PASSWORD));
         var _loc4_:LabelBase = this.createLabel(localeService.getText(TanksLocale.TEXT_SETTINGS_NEW_PASSWORD_LABEL_TEXT));
         var _loc5_:LabelBase = this.createLabel(localeService.getText(TanksLocale.TEXT_SETTINGS_REENTER_PASSWORD_LABEL_TEXT));
         var _loc6_:int = (SettingsWindow.Renamed1967 - this.Renamed7496.width - _loc4_.width - _loc5_.width - 7 * MARGIN) / 3 + 1;
         this.Renamed7495 = new TankInput();
         this.Renamed7495.hidden = true;
         this.Renamed7495.width = _loc6_;
         this.Renamed7495.maxChars = 20;
         this.Renamed7495.validValue = true;
         this.pass1 = new TankInput();
         this.pass1.hidden = true;
         this.pass1.width = _loc6_;
         this.pass1.maxChars = 20;
         this.pass1.validValue = true;
         this.Renamed7495.height = this.pass1.height;
         this.pass2 = new TankInput();
         this.pass2.hidden = true;
         this.pass2.width = _loc6_;
         this.pass2.maxChars = 20;
         this.pass2.validValue = true;
         if(localeService.language == Renamed3761.Renamed4529)
         {
            this.pass1.x = -8;
            this.pass2.x = -10;
            if(this.Renamed7504())
            {
               --this.Renamed7495.x;
               this.pass1.x -= 6;
               this.pass2.x -= 10;
            }
         }
         _loc3_.addItem(this.Renamed7496);
         _loc3_.addItem(this.Renamed7495);
         _loc3_.addItem(_loc4_);
         _loc3_.addItem(this.pass1);
         _loc3_.addItem(_loc5_);
         _loc3_.addItem(this.pass2);
         _loc3_.height = INPUT_HEIGHT;
         _loc2_.addChild(_loc3_);
         this.changePasswordButton = new DefaultButtonBase();
         this.changePasswordButton.label = localeService.getText(TanksLocale.TEXT_SETTINGS_CHANGE_PASSWORD_BUTTON);
         this.changePasswordButton.addEventListener(MouseEvent.CLICK,this.Renamed7505);
         this.changePasswordButton.x = SettingsWindow.Renamed1967 - MARGIN - this.changePasswordButton.width;
         this.changePasswordButton.y = 2 * MARGIN + INPUT_HEIGHT;
         _loc2_.addChild(this.changePasswordButton);
         this.Renamed7497 = new InputCheckIcon();
         this.Renamed7497.x = this.Renamed7495.x + _loc6_ - this.Renamed7497.width / 2 - Renamed7490;
         this.Renamed7497.y = this.Renamed7495.y + MARGIN + Renamed7490;
         this.Renamed7497.visible = false;
         this.Renamed7497.gotoAndStop(CallsignIconStates.CALLSIGN_ICON_STATE_INVALID);
         this.pass1CheckIcon = new InputCheckIcon();
         this.pass2CheckIcon = new InputCheckIcon();
         this.pass1CheckIcon.x = this.pass1.x + _loc6_ - this.pass1CheckIcon.width / 2 - Renamed7490;
         this.pass1CheckIcon.y = this.pass1.y + MARGIN + Renamed7490;
         this.pass1State = CallsignIconStates.CALLSIGN_ICON_STATE_OFF;
         this.pass2CheckIcon.x = this.pass2.x + _loc6_ - this.pass2CheckIcon.width / 2 - Renamed7490;
         this.pass2CheckIcon.y = this.pass2.y + MARGIN + Renamed7490;
         this.pass2State = CallsignIconStates.CALLSIGN_ICON_STATE_OFF;
         _loc2_.addChild(this.Renamed7497);
         _loc2_.addChild(this.pass1CheckIcon);
         _loc2_.addChild(this.pass2CheckIcon);
         var _loc7_:DisplayObject;
         (_loc7_ = this.Renamed7506(param1)).height = INPUT_HEIGHT;
         _loc7_.x = MARGIN;
         _loc7_.y = _loc3_.height + this.changePasswordButton.height + 3 * MARGIN;
         _loc2_.addChild(_loc7_);
         this.emailCheckIcon = new InputCheckIcon();
         this.emailCheckIcon.x = this.emailInput.x + this.emailInput.width - this.emailCheckIcon.width / 2 - Renamed7490;
         this.emailCheckIcon.y = _loc7_.y + Renamed7490;
         this.emailState = CallsignIconStates.CALLSIGN_ICON_STATE_OFF;
         _loc2_.addChild(this.emailCheckIcon);
         this.Renamed7503(_loc2_);
         return _loc2_;
      }
      
      private function Renamed7503(param1:TankWindowInner) : void
      {
         var Renamed3693:TankWindowInner = param1;
         var Renamed7507:TankWindowInner = Renamed3693;
         this.captchaSection = new CaptchaSection();
         this.captchaSection.Renamed3954();
         this.captchaSection.refreshButton.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
            dispatchEvent(new RefreshCaptchaClickedEvent());
         });
         this.captchaSection.x = (Renamed7507.width - this.captchaSection.width) / 2;
         this.captchaSection.y = MARGIN + Renamed7507.height;
         this.captchaSection.visible = true;
         Renamed7507.height += this.captchaSection.height + 2 * MARGIN;
         Renamed7507.addChild(this.captchaSection);
         dispatchEvent(new RefreshCaptchaClickedEvent());
      }
      
      public function Renamed2212(param1:Bitmap) : void
      {
         if(this.captchaSection)
         {
            this.captchaSection.captcha = param1;
         }
      }
      
      public function Renamed1576() : String
      {
         if(this.captchaSection)
         {
            return this.captchaSection.captchaAnswer.value;
         }
         return "";
      }
      
      private function Renamed7504() : Boolean
      {
         var _loc1_:String = Capabilities.os;
         return _loc1_.indexOf("Windows") >= 0 || _loc1_.indexOf("Mac") >= 0;
      }
      
      private function Renamed7506(param1:String) : DisplayObject
      {
         var _loc2_:Renamed1982 = new Renamed1982();
         _loc2_.Renamed1987(MARGIN);
         var _loc3_:LabelBase = this.createLabel(localeService.getText(TanksLocale.TEXT_SETTINGS_EMAIL_LABEL_TEXT));
         this.Renamed7491 = new DefaultButtonBase();
         this.Renamed7491.label = localeService.getText(TanksLocale.TEXT_SETTINGS_LINK_EMAIL_BUTTON);
         this.Renamed7491.addEventListener(MouseEvent.CLICK,this.Renamed7508);
         this.emailInput = new TankInput();
         this.emailInput.value = param1;
         this.emailInput.validValue = true;
         this.emailInput.width = SettingsWindow.Renamed1967 - 4 * MARGIN - _loc3_.width - this.Renamed7491.width;
         if(localeService.language == Renamed3761.Renamed4529)
         {
            this.emailInput.width += 3;
            if(this.Renamed7504())
            {
               this.emailInput.width -= 4;
            }
         }
         _loc2_.addItem(_loc3_);
         _loc2_.addItem(this.emailInput);
         _loc2_.addItem(this.Renamed7491);
         return _loc2_;
      }
      
      private function createLabel(param1:String) : LabelBase
      {
         var _loc2_:LabelBase = new LabelBase();
         _loc2_.text = param1;
         _loc2_.y = Math.round((INPUT_HEIGHT - _loc2_.textHeight) * 0.5) - 2;
         return _loc2_;
      }
      
      private function Renamed7501(param1:MouseEvent) : void
      {
         if(this.realName != "" && this.idNumber != "")
         {
            dispatchEvent(new Renamed2179(Renamed2179.Renamed2192));
         }
      }
      
      private function Renamed7508(param1:MouseEvent) : void
      {
         if(!this.emailConfirmed && this.email != null)
         {
            dispatchEvent(new Renamed2179(Renamed2179.SET_EMAIL));
         }
      }
      
      private function Renamed7505(param1:MouseEvent = null) : void
      {
         if(this.emailConfirmed || !this.Renamed7495.visible || this.Renamed2199() == "" && this.password == "")
         {
            dispatchEvent(new Renamed2179(Renamed2179.CHANGE_PASSWORD));
         }
         else
         {
            dispatchEvent(new Renamed2179(Renamed2179.Renamed2190));
         }
      }
      
      override public function show() : void
      {
         display.stage.addEventListener(Event.RESIZE,this.Renamed7509);
         this.Renamed7509();
         this.showHelpers();
      }
      
      override public function hide() : void
      {
         this.Renamed7510();
         display.stage.removeEventListener(Event.RESIZE,this.Renamed7509);
      }
      
      private function Renamed7510() : void
      {
         helperService.hideHelper(HELPER_GROUP_KEY,PASSWORD_IS_TOO_EASY);
         helperService.hideHelper(HELPER_GROUP_KEY,PASSWORDS_DO_NOT_MATCH);
         helperService.hideHelper(HELPER_GROUP_KEY,ERROR_EMAIL_INVALID);
      }
      
      private function showHelpers() : void
      {
         if(this.emailInput != null)
         {
            this.Renamed7511();
         }
         if(!this.emailConfirmed && this.pass1 != null)
         {
            this.updatePasswordBlock();
         }
      }
      
      private function Renamed7511(param1:Event = null) : void
      {
         if(Boolean(partnersService.isRunningInsidePartnerEnvironment()) || this.emailConfirmed)
         {
            return;
         }
         var _loc2_:Boolean = true;
         if(this.emailInput.value.length > 0)
         {
            _loc2_ = Boolean(validateService.isEmailValid(this.emailInput.value));
         }
         if(!_loc2_)
         {
            helperService.showHelper(HELPER_GROUP_KEY,ERROR_EMAIL_INVALID,true);
         }
         else
         {
            helperService.hideHelper(HELPER_GROUP_KEY,ERROR_EMAIL_INVALID);
         }
         if(_loc2_)
         {
            this.emailInput.validValue = true;
            this.emailState = this.emailInput.value == "" ? int(CallsignIconStates.CALLSIGN_ICON_STATE_OFF) : int(CallsignIconStates.CALLSIGN_ICON_STATE_VALID);
         }
         else
         {
            this.emailInput.validValue = false;
            this.emailState = CallsignIconStates.CALLSIGN_ICON_STATE_INVALID;
         }
         this.Renamed7491.enable = _loc2_;
      }
      
      private function updatePasswordBlock(param1:Event = null) : void
      {
         if(Boolean(partnersService.isRunningInsidePartnerEnvironment()) || this.emailConfirmed)
         {
            return;
         }
         this.pass1.validValue = isPasswordValid(this.pass1.value);
         this.pass1State = CallsignIconStates.CALLSIGN_ICON_STATE_INVALID;
         var _loc2_:Boolean = true;
         this.pass2.validValue = this.pass2.value == "" || this.pass1.value == this.pass2.value;
         this.pass2State = CallsignIconStates.CALLSIGN_ICON_STATE_INVALID;
         if(this.pass1.value == "")
         {
            this.pass1State = CallsignIconStates.CALLSIGN_ICON_STATE_OFF;
            _loc2_ = false;
         }
         else if(this.pass1.validValue)
         {
            this.pass1State = CallsignIconStates.CALLSIGN_ICON_STATE_VALID;
            _loc2_ = false;
         }
         if(this.pass2.value == "")
         {
            this.pass2State = CallsignIconStates.CALLSIGN_ICON_STATE_OFF;
         }
         else if(this.pass2.validValue)
         {
            this.pass2State = CallsignIconStates.CALLSIGN_ICON_STATE_VALID;
         }
         var _loc3_:* = !(_loc2_ || this.pass2.validValue);
         if(_loc2_)
         {
            helperService.showHelper(HELPER_GROUP_KEY,PASSWORD_IS_TOO_EASY,true);
         }
         else
         {
            helperService.hideHelper(HELPER_GROUP_KEY,PASSWORD_IS_TOO_EASY);
         }
         if(_loc3_)
         {
            helperService.showHelper(HELPER_GROUP_KEY,PASSWORDS_DO_NOT_MATCH,true);
         }
         else
         {
            helperService.hideHelper(HELPER_GROUP_KEY,PASSWORDS_DO_NOT_MATCH);
         }
         this.changePasswordButton.enable = this.pass1.value == this.pass2.value && this.pass1.validValue && this.pass2.validValue;
      }
      
      private function createSNPanel() : TankWindowInner
      {
         var _loc5_:Bitmap = null;
         var _loc6_:Bitmap = null;
         var _loc7_:Bitmap = null;
         var _loc1_:LabelBase = null;
         var _loc2_:Boolean = false;
         var _loc3_:TankWindowInner = new TankWindowInner(SettingsWindow.Renamed1967,0,TankWindowInner.TRANSPARENT);
         this.Renamed7493 = this.Renamed7512().length > 1;
         var _loc4_:Sprite = new Sprite();
         if(this.Renamed7493)
         {
            _loc1_ = new LabelBase();
            _loc1_.text = localeService.getText(TanksLocale.TEXT_SETTINGS_ACCOUNT_ACCESS);
            _loc1_.y = 5;
            _loc4_.addChild(_loc1_);
            _loc5_ = Renamed1939.Renamed1947();
            _loc6_ = Renamed1939.Renamed1948();
            _loc7_ = Renamed1939.Renamed1949();
            this.Renamed3932 = new DefaultButtonBase();
            this.Renamed3933 = new DefaultButtonBase();
            this.Renamed3934 = new DefaultButtonBase();
            if(Renamed3564.Renamed3602)
            {
               _loc5_.y = _loc1_.y + _loc1_.height + MARGIN;
               _loc4_.addChild(_loc5_);
               this.Renamed3932.label = this.Renamed7513(VKONTAKTE);
               this.Renamed3932.width = 120;
               this.Renamed3932.y = _loc1_.y + _loc1_.height + MARGIN;
               this.Renamed3932.x = _loc5_.x + _loc5_.width + MARGIN;
               _loc4_.addChild(this.Renamed3932);
            }
            if(Renamed3564.Renamed3603)
            {
               _loc6_.x = this.Renamed3932.x + this.Renamed3932.width + 5 * MARGIN;
               _loc6_.y = _loc1_.y + _loc1_.height + MARGIN;
               _loc4_.addChild(_loc6_);
               this.Renamed3933.label = this.Renamed7513(FACEBOOK);
               this.Renamed3933.width = 120;
               this.Renamed3933.y = _loc1_.y + _loc1_.height + MARGIN;
               this.Renamed3933.x = _loc6_.x + _loc6_.width + MARGIN;
               _loc4_.addChild(this.Renamed3933);
            }
            if(Renamed3564.Renamed3604)
            {
               if(this.Renamed3933.x == 0)
               {
                  _loc7_.x = this.Renamed3932.x + this.Renamed3932.width + 5 * MARGIN;
                  _loc7_.y = _loc1_.y + _loc1_.height + MARGIN;
               }
               else
               {
                  _loc7_.x = this.Renamed3933.x + this.Renamed3933.width + 5 * MARGIN;
                  _loc7_.y = _loc1_.y + _loc1_.height + MARGIN;
               }
               _loc4_.addChild(_loc7_);
               this.Renamed3934.label = this.Renamed7513(Renamed3786);
               this.Renamed3934.width = 120;
               this.Renamed3934.y = _loc1_.y + _loc1_.height + MARGIN;
               this.Renamed3934.x = _loc7_.x + _loc7_.width + MARGIN;
               _loc4_.addChild(this.Renamed3934);
            }
            _loc1_.x = (_loc4_.width - _loc1_.width) / 2;
            this.Renamed3932.addEventListener(MouseEvent.CLICK,this.Renamed7514);
            this.Renamed3933.addEventListener(MouseEvent.CLICK,this.Renamed7515);
            this.Renamed3934.addEventListener(MouseEvent.CLICK,this.Renamed7516);
         }
         else
         {
            this.currentSN = this.Renamed7512()[0];
            _loc2_ = Boolean(socialNetworkService.Renamed1879(this.currentSN));
            this.snHasLinkLabel = new LabelBase();
            this.snHasLinkLabel.text = _loc2_ ? localeService.getText(TanksLocale.TEXT_SETTINGS_UNLINK_ACCOUNT) : localeService.getText(TanksLocale.TEXT_SETTINGS_LINK_ACCOUNT);
            _loc4_.addChild(this.snHasLinkLabel);
            this.snButton = this.Renamed7517(this.currentSN);
            this.snButton.width = 102;
            this.snButton.x = this.snHasLinkLabel.x + this.snHasLinkLabel.width + 5;
            this.snHasLinkLabel.y = this.snButton.y + 7;
            _loc4_.addChild(this.snButton);
            _loc4_.y = MARGIN;
            this.snButton.addEventListener(MouseEvent.CLICK,this.Renamed7518);
         }
         _loc4_.x = (SettingsWindow.Renamed1967 - _loc4_.width) / 2;
         _loc3_.height = _loc4_.height + 2 * MARGIN;
         _loc3_.addChild(_loc4_);
         socialNetworkService.addEventListener(SocialNetworkServiceEvent.UNLINK_SUCCESS,this.onUnlinkSuccess);
         socialNetworkService.addEventListener(SocialNetworkServiceEvent.LINK_SUCCESS,this.onLinkSuccess);
         return _loc3_;
      }
      
      private function Renamed7513(param1:String) : String
      {
         return !!socialNetworkService.Renamed1879(param1) ? localeService.getText(TanksLocale.TEXT_SETTINGS_UNLINK) : localeService.getText(TanksLocale.TEXT_SETTINGS_LINK);
      }
      
      private function Renamed7512() : Array
      {
         var _loc1_:Array = [];
         if(Renamed3564.Renamed3602)
         {
            _loc1_.push(VKONTAKTE);
         }
         if(Renamed3564.Renamed3603)
         {
            _loc1_.push(FACEBOOK);
         }
         if(Renamed3564.Renamed3604)
         {
            _loc1_.push(Renamed3786);
         }
         return _loc1_;
      }
      
      private function Renamed7517(param1:String) : DefaultIconButton
      {
         if(param1 == VKONTAKTE)
         {
            return new VKButton();
         }
         if(param1 == FACEBOOK)
         {
            return new FBButton();
         }
         if(param1 == Renamed3786)
         {
            return new Renamed3955();
         }
         return null;
      }
      
      private function onLinkSuccess(param1:SocialNetworkServiceEvent) : void
      {
         if(this.Renamed7493)
         {
            this.Renamed7519(param1.socialNetworkId,true);
         }
         else
         {
            this.snHasLinkLabel.text = localeService.getText(TanksLocale.TEXT_SETTINGS_UNLINK_ACCOUNT);
            this.snButton.x = this.snHasLinkLabel.x + this.snHasLinkLabel.width + 5;
         }
      }
      
      private function onUnlinkSuccess(param1:SocialNetworkServiceEvent) : void
      {
         if(this.Renamed7493)
         {
            this.Renamed7519(param1.socialNetworkId,false);
         }
         else
         {
            this.snHasLinkLabel.text = localeService.getText(TanksLocale.TEXT_SETTINGS_LINK_ACCOUNT);
            this.snButton.x = this.snHasLinkLabel.x + this.snHasLinkLabel.width + 5;
         }
      }
      
      private function Renamed7519(param1:String, param2:Boolean) : void
      {
         if(param1 == VKONTAKTE)
         {
            this.Renamed3932.label = localeService.getText(param2 ? TanksLocale.TEXT_SETTINGS_UNLINK : TanksLocale.TEXT_SETTINGS_LINK);
         }
         else if(param1 == Renamed3786)
         {
            this.Renamed3934.label = localeService.getText(param2 ? TanksLocale.TEXT_SETTINGS_UNLINK : TanksLocale.TEXT_SETTINGS_LINK);
         }
         else
         {
            this.Renamed3933.label = localeService.getText(param2 ? TanksLocale.TEXT_SETTINGS_UNLINK : TanksLocale.TEXT_SETTINGS_LINK);
         }
      }
      
      private function Renamed7518(param1:MouseEvent) : void
      {
         this.Renamed7520(this.currentSN);
      }
      
      private function Renamed7514(param1:MouseEvent) : void
      {
         this.Renamed7520(VKONTAKTE);
      }
      
      private function Renamed7515(param1:MouseEvent) : void
      {
         this.Renamed7520(FACEBOOK);
      }
      
      private function Renamed7516(param1:MouseEvent) : void
      {
         this.Renamed7520(Renamed3786);
      }
      
      private function Renamed7520(param1:String) : void
      {
         if(socialNetworkService.Renamed1879(param1))
         {
            socialNetworkService.Renamed1880(param1);
         }
         else
         {
            socialNetworkService.Renamed1881(param1);
         }
      }
      
      private function initEvents() : void
      {
         this.pass1.addEventListener(FocusEvent.FOCUS_IN,restoreInput);
         this.pass2.addEventListener(FocusEvent.FOCUS_IN,restoreInput);
         this.emailInput.addEventListener(FocusEvent.FOCUS_IN,restoreInput);
         this.pass1.addEventListener(Event.CHANGE,this.updatePasswordBlock);
         this.pass1.addEventListener(FocusEvent.FOCUS_IN,this.updatePasswordBlock);
         this.pass2.addEventListener(Event.CHANGE,this.updatePasswordBlock);
         this.pass2.addEventListener(FocusEvent.FOCUS_IN,this.updatePasswordBlock);
         this.emailInput.addEventListener(FocusEvent.FOCUS_IN,this.Renamed7511);
         this.emailInput.addEventListener(Event.CHANGE,this.Renamed7511);
         this.Renamed7495.addEventListener(FocusEvent.FOCUS_IN,this.Renamed7521);
         this.Renamed7495.addEventListener(Event.CHANGE,this.Renamed7521);
      }
      
      private function validateRealName(param1:LoginFormEvent) : void
      {
         var _loc2_:String = null;
         if(this.realNameInput != null)
         {
            _loc2_ = trimString(this.realNameInput.textField.text);
            this.realNameInput.validValue = Boolean(validateService.isChinaNameValid(_loc2_)) || _loc2_.length == 0;
         }
      }
      
      private function validateAddictionID(param1:LoginFormEvent) : void
      {
         var _loc2_:String = null;
         if(this.idNumberInput != null)
         {
            _loc2_ = this.idNumberInput.textField.text;
            this.idNumberInput.validValue = Boolean(validateService.isChinaCardIdValid(_loc2_)) || _loc2_.length == 0;
         }
      }
      
      private function Renamed7502(param1:MouseEvent) : void
      {
         dispatchEvent(new Renamed2179(Renamed2179.Renamed2188));
      }
      
      public function Renamed2215() : void
      {
         this.Renamed7492.enable = false;
         if(this.captchaSection)
         {
            this.captchaSection.setEnabled(false);
         }
      }
      
      private function Renamed7521(param1:Event) : void
      {
         this.Renamed7497.visible = false;
         this.Renamed7495.validValue = true;
      }
      
      public function Renamed2203() : void
      {
         this.Renamed7495.validValue = false;
         this.Renamed7497.visible = true;
      }
      
      public function Renamed2209() : void
      {
         if(this.Renamed7496 != null)
         {
            this.Renamed7495.visible = false;
            this.Renamed7496.visible = false;
         }
      }
      
      public function set pass1State(param1:int) : void
      {
         if(param1 == CallsignIconStates.CALLSIGN_ICON_STATE_OFF)
         {
            this.pass1CheckIcon.visible = false;
         }
         else
         {
            this.pass1CheckIcon.visible = true;
            this.pass1CheckIcon.gotoAndStop(param1);
         }
      }
      
      public function set pass2State(param1:int) : void
      {
         if(param1 == CallsignIconStates.CALLSIGN_ICON_STATE_OFF)
         {
            this.pass2CheckIcon.visible = false;
         }
         else
         {
            this.pass2CheckIcon.visible = true;
            this.pass2CheckIcon.gotoAndStop(param1);
         }
      }
      
      public function set emailState(param1:int) : void
      {
         if(param1 == CallsignIconStates.CALLSIGN_ICON_STATE_OFF)
         {
            this.emailCheckIcon.visible = false;
         }
         else
         {
            this.emailCheckIcon.visible = true;
            this.emailCheckIcon.gotoAndStop(param1);
         }
      }
      
      private function createBubbles() : void
      {
         this.passwordIsTooEasyBubble = new PasswordIsTooEasyBubble();
         this.passwordsDoNotMatchBubble = new PasswordsDoNotMatchBubble();
         this.errorEmailInvalodBubble = new EmailInvalidBubble();
         helperService.registerHelper(HELPER_GROUP_KEY,PASSWORD_IS_TOO_EASY,this.passwordIsTooEasyBubble,false);
         helperService.registerHelper(HELPER_GROUP_KEY,PASSWORDS_DO_NOT_MATCH,this.passwordsDoNotMatchBubble,false);
         helperService.registerHelper(HELPER_GROUP_KEY,ERROR_EMAIL_INVALID,this.errorEmailInvalodBubble,false);
      }
      
      private function Renamed7509(param1:Event = null) : void
      {
         var _loc2_:int = 0;
         if(parent != null)
         {
            _loc2_ = INPUT_HEIGHT + 3 * MARGIN;
            if(this.passwordIsTooEasyBubble != null)
            {
               this.passwordIsTooEasyBubble.targetPoint = new Point(this.pass1CheckIcon.x + this.pass1CheckIcon.width / 2 + this.x + parent.x,_loc2_ + this.pass1CheckIcon.y + this.pass1CheckIcon.height / 2 + this.y + parent.y);
            }
            if(this.passwordsDoNotMatchBubble != null)
            {
               this.passwordsDoNotMatchBubble.targetPoint = new Point(this.pass2CheckIcon.x + this.pass2CheckIcon.width / 2 + this.x + parent.x,_loc2_ + this.pass2CheckIcon.y + this.pass2CheckIcon.height / 2 + this.y + parent.y);
            }
            if(this.errorEmailInvalodBubble != null)
            {
               this.errorEmailInvalodBubble.targetPoint = new Point(this.emailCheckIcon.x + this.emailCheckIcon.width / 2 + this.x + parent.x,_loc2_ + this.emailCheckIcon.y + this.emailCheckIcon.height / 2 + this.y + parent.y);
            }
         }
      }
      
      public function get password() : String
      {
         var _loc1_:String = "";
         if(!this.emailConfirmed)
         {
            if(this.pass1.textField.text)
            {
               if(this.pass1.textField.text == this.pass2.textField.text)
               {
                  _loc1_ = this.pass1.textField.text;
               }
            }
         }
         return _loc1_;
      }
      
      public function get email() : String
      {
         if(this.emailConfirmed)
         {
            return "";
         }
         if(this.emailInput.textField.text.indexOf("*") != -1)
         {
            return null;
         }
         return this.emailInput.textField.text;
      }
      
      public function get realName() : String
      {
         if(this.realNameInput != null && this.realNameInput.textField.text != null && trimString(this.realNameInput.textField.text).length > 0)
         {
            return this.realNameInput.textField.text;
         }
         return "";
      }
      
      public function get idNumber() : String
      {
         if(this.idNumberInput != null && this.idNumberInput.textField.text != null && trimString(this.idNumberInput.textField.text).length > 0)
         {
            return this.idNumberInput.textField.text;
         }
         return "";
      }
      
      public function Renamed2199() : String
      {
         return this.Renamed7495 != null ? this.Renamed7495.value : "";
      }
      
      override public function destroy() : void
      {
         if(!this.emailConfirmed)
         {
            this.changePasswordButton.removeEventListener(MouseEvent.CLICK,this.Renamed7505);
            this.Renamed7491.removeEventListener(MouseEvent.CLICK,this.Renamed7508);
            this.pass1.removeEventListener(FocusEvent.FOCUS_IN,restoreInput);
            this.pass2.removeEventListener(FocusEvent.FOCUS_IN,restoreInput);
            this.emailInput.removeEventListener(FocusEvent.FOCUS_IN,restoreInput);
            this.pass1.removeEventListener(Event.CHANGE,this.updatePasswordBlock);
            this.pass1.removeEventListener(FocusEvent.FOCUS_IN,this.updatePasswordBlock);
            this.pass2.removeEventListener(Event.CHANGE,this.updatePasswordBlock);
            this.pass2.removeEventListener(FocusEvent.FOCUS_IN,this.updatePasswordBlock);
            this.emailInput.removeEventListener(FocusEvent.FOCUS_IN,this.Renamed7511);
            this.emailInput.removeEventListener(Event.CHANGE,this.Renamed7511);
            this.Renamed7495.removeEventListener(FocusEvent.FOCUS_IN,this.Renamed7521);
            this.Renamed7495.removeEventListener(Event.CHANGE,this.Renamed7521);
         }
         if(this.Renamed7494)
         {
            this.Renamed7494.removeEventListener(MouseEvent.CLICK,this.Renamed7501);
         }
         helperService.unregisterHelper(HELPER_GROUP_KEY,PASSWORD_IS_TOO_EASY);
         helperService.unregisterHelper(HELPER_GROUP_KEY,PASSWORDS_DO_NOT_MATCH);
         helperService.unregisterHelper(HELPER_GROUP_KEY,ERROR_EMAIL_INVALID);
         if(!this.emailConfirmed)
         {
            this.Renamed7495.removeEventListener(FocusEvent.FOCUS_IN,this.Renamed7521);
            this.Renamed7495.removeEventListener(Event.CHANGE,this.Renamed7521);
         }
         super.destroy();
      }
   }
}

