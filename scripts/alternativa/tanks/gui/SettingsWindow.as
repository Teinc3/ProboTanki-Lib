package alternativa.tanks.gui
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.help.IHelpService;
   import alternativa.tanks.locale.constants.TextConst;
   import alternativa.tanks.service.socialnetwork.ISocialNetworkPanelService;
   import alternativa.tanks.service.socialnetwork.SocialNetworkServiceEvent;
   import assets.icons.InputCheckIcon;
   import controls.DefaultIconButton;
   import controls.FBButton;
   import controls.Slider;
   import controls.TankWindow;
   import controls.TankWindowHeader;
   import controls.TankWindowInner;
   import controls.VKButton;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import controls.base.TankCheckBoxBase;
   import controls.base.TankInputBase;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.AntiAliasType;
   import forms.events.SliderEvent;
   import forms.registration.CallsignIconStates;
   import forms.registration.bubbles.EmailInvalidBubble;
   import forms.registration.bubbles.PasswordIsTooEasyBubble;
   import forms.registration.bubbles.PasswordsDoNotMatchBubble;
   import projects.tanks.clients.flash.commons.models.gpu.GPUCapabilities;
   import projects.tanks.clients.flash.commons.services.validate.IValidateService;
   
   public class SettingsWindow extends Sprite
   {
      public static var localeService:ILocaleService = OSGi.getInstance().getService(ILocaleService) as ILocaleService;
      
      public static var helperService:IHelpService = OSGi.getInstance().getService(IHelpService) as IHelpService;
      
      public static var socialNetworkService:ISocialNetworkPanelService = OSGi.getInstance().getService(ISocialNetworkPanelService) as ISocialNetworkPanelService;
      
      public static var validateService:IValidateService = OSGi.getInstance().getService(IValidateService) as IValidateService;
      
      public static const forbiddenPasswords:Array = ["1234567890","123456789","12345678","1234567","123456","12345","1234","0123","01234","012345","0123456","01234567","012345678","0123456789","9876","98765","987654","9876543","98765432","987654321","9876543210","8765","87654","876543","8765432","87654321","876543210","7654","76543","765432","7654321","76543210","6543","65432","654321","6543210","5432","54321","543210","4321","43210","3210","1111","2222","3333","4444","5555","6666","7777","8888","9999","0000","11111","22222","33333","44444","55555","66666","77777","88888","99999","00000","111111","222222","333333","444444","555555","666666","777777","888888","999999","000000","1111111","2222222","3333333","4444444","5555555","6666666","7777777","8888888","9999999","0000000","11111111","22222222","33333333","44444444","55555555","66666666","77777777","88888888","99999999","00000000","111111111","222222222","333333333","444444444","555555555","666666666","777777777","888888888","999999999","000000000","abcd","Jack","1234","snoopy","suzy","spike","1012","1234","pepper ","shelby","12345 ","54321 ","pass ","wolf","john","qqqq","aaaa","ZZZz","asdf","zxcv","asdf","zxcv","asdfgh","zxcvbn","1111","!!!!","4321","$#@!","1234","!@#$","12345","!@#$%","123456","!@#$%^","abcd","ABCD","qwerty1","QWERTY!","1q2w3e4r","1q2w3e","q1w2e3","q1w2e3r4","qweasd","QWEASD","asdzxc","ASDZXC","qweqwe","QWEQWE","asdasd","ASDASD","zxczxc","qwaszx","elite","ELITE","1qwerty","!QWERTY","black","blue","green","grey","yellow","orange","brown","support","Support","Topgun","topgun","help","Lame","hack","hunter","ranger","lamer","Lamer","hacker","Hacker","hack","summer","spring","autumn","winter","sunday","monday","tuesday","wednesda","thursday","friday","saturday","january","february","march","april","june","july","august","september","october","november","december","cool","lucky","korn ","fuck","Honda","mustang","pentium","mouse","stan","soccer","password","diablo","zoom","joker","nofear","unix","home","apache","holly","q3rulez","pass123","magnum","mother","father","lisa","janet","helen","chocolate","Matrix","Gold","dollar","pussy","eminem","personal","zippo","jennifer","pepsi","clock","time","good","super","friend","angel","qwer","qwert","qwerty","homer","angle","johan","love","test","1q2w3e4r5t6y","31337","loll","gggg"];
      
      private static const buttonSize:Point = new Point(104,33);
      
      private static const FIRST_COLUMN_X:int = 21;
      
      private static const SECOND_COLUMN_X:int = 109;
      
      private static const THIRD_COLUMN_X:int = 381;
      
      private static const WINDOW_WIDTH:int = 750;
      
      private static const PERFORMANCE_GRID_COLUMN_WIDTH:int = 180;
      
      private static const INPUT_WIDTH:int = 200;
      
      private static const windowMargin:int = 12;
      
      private static const margin:int = 8;
      
      private static const HELPER_GROUP_KEY:String = "ChangeHelpers";
      
      private static const VKONTAKTE:String = "vkontakte";
      
      private static const FACEBOOK:String = "facebook";
      
      private var pass1:TankInputBase;
      
      private var pass2:TankInputBase;
      
      public var emailInput:TankInputBase;
      
      private var realNameInput:TankInputBase;
      
      private var idNumberInput:TankInputBase;
      
      private var volumeLevel:Slider;
      
      private const PASSWORD_IS_TOO_EASY:int = 3;
      
      private const PASSWORDS_DO_NOT_MATCH:int = 4;
      
      private const ERROR_EMAIL_INVALID:int = 5;
      
      private var pass1CheckIcon:InputCheckIcon;
      
      private var pass2CheckIcon:InputCheckIcon;
      
      private var emailCheckIcon:InputCheckIcon;
      
      private var passwordIsTooEasyBubble:PasswordIsTooEasyBubble;
      
      private var passwordsDoNotMatchBubble:PasswordsDoNotMatchBubble;
      
      private var errorEmailInvalodBubble:EmailInvalidBubble;
      
      private var _bgSound:TankCheckBoxBase;
      
      private var cbShowFPS:TankCheckBoxBase;
      
      private var cbShowSkyBox:TankCheckBoxBase;
      
      private var cbAdaptiveFPS:TankCheckBoxBase;
      
      private var cbShowChat:TankCheckBoxBase;
      
      private var _inverseBackDriving:TankCheckBoxBase;
      
      private var cbFog:TankCheckBoxBase;
      
      private var cbTankShadow:TankCheckBoxBase;
      
      private var cbDynamicShadows:TankCheckBoxBase;
      
      private var cbSoftParticles:TankCheckBoxBase;
      
      private var cbDust:TankCheckBoxBase;
      
      private var cbSSAO:TankCheckBoxBase;
      
      private var cbAntialiasing:TankCheckBoxBase;
      
      private var cbDynamicLighting:TankCheckBoxBase;
      
      private var cbMipMapping:TankCheckBoxBase;
      
      private var cbAlternateCamera:TankCheckBoxBase;
      
      private var cbGraphicsAutoQuality:TankCheckBoxBase;
      
      private var cbMouseControl:TankCheckBoxBase;
      
      private var _receiveBattleInvite:TankCheckBoxBase;
      
      private var soundInner:TankWindowInner;
      
      private var performanceInner:TankWindowInner;
      
      private var accountInner:TankWindowInner;
      
      private var controlInner:TankWindowInner;
      
      private var windowSize:Point;
      
      private var okButton:DefaultButtonBase;
      
      private var changePasswordButton:DefaultButtonBase;
      
      private var snButton:DefaultIconButton;
      
      private var snHasLinkLabel:LabelBase;
      
      public var isPasswordChangeDisabled:Boolean = false;
      
      public var initialRealName:String;
      
      public var initialIDNumber:String;
      
      private var currentSN:String;
      
      public function SettingsWindow(param1:String, param2:Boolean, param3:Boolean, param4:String, param5:String)
      {
         super();
         this.initialRealName = param4;
         this.initialIDNumber = param5;
         this.isPasswordChangeDisabled = param2;
         this.windowSize = new Point(WINDOW_WIDTH,0);
         var _loc6_:TankWindow;
         (_loc6_ = new TankWindow(this.windowSize.x,this.windowSize.y)).headerLang = localeService.getText(TextConst.GUI_LANG);
         _loc6_.header = TankWindowHeader.SETTINGS;
         addChild(_loc6_);
         this.soundInner = new TankWindowInner(0,0,TankWindowInner.TRANSPARENT);
         addChild(this.soundInner);
         this.soundInner.x = windowMargin;
         this.soundInner.y = windowMargin;
         this.soundInner.width = this.windowSize.x - windowMargin * 2;
         this.performanceInner = new TankWindowInner(0,0,TankWindowInner.TRANSPARENT);
         addChild(this.performanceInner);
         this.performanceInner.x = windowMargin;
         this.performanceInner.width = this.windowSize.x - windowMargin * 2;
         this.accountInner = new TankWindowInner(0,0,TankWindowInner.TRANSPARENT);
         addChild(this.accountInner);
         this.accountInner.x = windowMargin;
         this.accountInner.width = this.windowSize.x - windowMargin * 2;
         this.controlInner = new TankWindowInner(0,0,TankWindowInner.TRANSPARENT);
         addChild(this.controlInner);
         this.controlInner.x = windowMargin;
         this.controlInner.width = this.windowSize.x - windowMargin * 2;
         this.createSoundPanel(localeService);
         this.createPerformancePanel(localeService);
         var _loc7_:Boolean = this.createAccountPanel(localeService,param1,param3,param5,param4);
         this.createControlPanel(localeService);
         this.okButton = new DefaultButtonBase();
         addChild(this.okButton);
         this.okButton.label = localeService.getText(TextConst.SETTINGS_BUTTON_SAVE_TEXT);
         this.okButton.x = this.windowSize.x - buttonSize.x * 2 - 1 - margin;
         this.okButton.y = this.windowSize.y + margin;
         this.windowSize.y = this.okButton.y + this.okButton.height;
         this.okButton.addEventListener(MouseEvent.CLICK,this.onOkClick);
         var _loc8_:DefaultButtonBase = new DefaultButtonBase();
         addChild(_loc8_);
         _loc8_.label = localeService.getText(TextConst.SETTINGS_BUTTON_CANCEL_TEXT);
         _loc8_.x = this.windowSize.x - buttonSize.x - margin + 5;
         _loc8_.y = this.okButton.y;
         _loc8_.addEventListener(MouseEvent.CLICK,this.onCancelClick);
         this._receiveBattleInvite = this.createCheckBox(localeService.getText(TextConst.SHOW_NOTIFICATIONS_LABEL),THIRD_COLUMN_X,this._inverseBackDriving.y);
         this.windowSize.y += windowMargin;
         _loc6_.height = this.windowSize.y;
         if(this.emailInput != null)
         {
            this.updatePasswordBlock(null);
         }
      }
      
      private static function setCheckBoxState(param1:TankCheckBoxBase, param2:Boolean) : void
      {
         if(param1 != null)
         {
            param1.Renamed1878 = param2;
         }
      }
      
      private static function getCheckBoxState(param1:TankCheckBoxBase) : Boolean
      {
         return param1 != null && param1.Renamed1878;
      }
      
      private static function restoreInput(param1:FocusEvent) : void
      {
         var _loc2_:TankInputBase = param1.currentTarget as TankInputBase;
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
      
      private function createSoundPanel(param1:ILocaleService) : void
      {
         this._bgSound = this.createCheckBox(param1.getText(TextConst.SETTINGS_BACKGROUND_SOUND_CHECKBOX_LABEL_TEXT),0,this.soundInner.y + margin);
         this._bgSound.x = this.windowSize.x - windowMargin - this._bgSound.width - margin;
         var _loc2_:LabelBase = new LabelBase();
         addChild(_loc2_);
         _loc2_.text = param1.getText(TextConst.SETTINGS_SOUND_VOLUME_LABEL_TEXT);
         _loc2_.x = SECOND_COLUMN_X - margin - _loc2_.textWidth;
         this.volumeLevel = new Slider();
         addChild(this.volumeLevel);
         this.volumeLevel.maxValue = 100;
         this.volumeLevel.minValue = 0;
         this.volumeLevel.tickInterval = 5;
         this.volumeLevel.x = SECOND_COLUMN_X;
         this.volumeLevel.y = this.soundInner.y + margin;
         this.volumeLevel.width = this.windowSize.x - windowMargin - margin - SECOND_COLUMN_X - this._bgSound.width - margin;
         this.volumeLevel.addEventListener(SliderEvent.CHANGE_VALUE,this.onChangeVolume);
         this.soundInner.height = margin * 2 + this.volumeLevel.height;
         this.windowSize.y = this.soundInner.y + this.soundInner.height;
         _loc2_.y = this.soundInner.y + Math.round((this.soundInner.height - _loc2_.textHeight) * 0.5) - 2;
      }
      
      private function createPerformancePanel(param1:ILocaleService) : void
      {
         var _loc2_:int = 0;
         var _loc3_:LabelBase = this.createPanelLabel(param1.getText(TextConst.SETTINGS_PERFORMANCE_HEADER_LABEL_TEXT),windowMargin,this.windowSize.y + windowMargin);
         this.windowSize.y = _loc3_.y + _loc3_.textHeight;
         this.performanceInner.y = this.windowSize.y + 5;
         this.cbShowFPS = this.createCheckBox(param1.getText(TextConst.SETTINGS_SHOW_FPS_CHECKBOX_LABEL_TEXT));
         this.cbAdaptiveFPS = this.createCheckBox(param1.getText(TextConst.SETTINGS_ENABLE_ADAPTIVE_FPS_CHECKBOX_LABEL_TEXT));
         this.cbShowSkyBox = this.createCheckBox(param1.getText(TextConst.SETTINGS_SHOW_SKYBOX_CHECKBOX_LABEL_TEXT));
         this.cbShowChat = this.createCheckBox(param1.getText(TextConst.STRING_SETTINGS_SHOW_CHAT_CHECKBOX_LABEL_TEXT));
         this.cbMipMapping = this.createCheckBox(param1.getText(TextConst.SETTINGS_MIPMAPPING_LABEL_TEXT));
         var _loc4_:GridLayout = new GridLayout(FIRST_COLUMN_X,this.performanceInner.y + margin + 1,PERFORMANCE_GRID_COLUMN_WIDTH,this.cbShowFPS.height + margin);
         if(GPUCapabilities.gpuEnabled && !GPUCapabilities.constrained)
         {
            this.cbFog = this.createCheckBox(param1.getText(TextConst.STRING_SETTINGS_FOG_LABEL_TEXT));
            this.cbTankShadow = this.createCheckBox(param1.getText(TextConst.STRING_SETTINGS_SHADOWS_LABEL_TEXT));
            this.cbDynamicShadows = this.createCheckBox(param1.getText(TextConst.STRING_SETTINGS_DYNAMIC_SHADOWS_LABEL_TEXT));
            this.cbSoftParticles = this.createCheckBox(param1.getText(TextConst.STRING_SETTINGS_SOFT_PARTICLES_LABEL_TEXT));
            this.cbDust = this.createCheckBox(param1.getText(TextConst.STRING_SETTINGS_DUST_LABEL_TEXT));
            this.cbSSAO = this.createCheckBox(param1.getText(TextConst.STRING_SETTINGS_SSAO));
            this.cbAntialiasing = this.createCheckBox(param1.getText(TextConst.STRING_SETTINGS_ANTIALIASING));
            this.cbDynamicLighting = this.createCheckBox(param1.getText(TextConst.STRING_SETTINGS_DYNAMIC_LIGHTING));
            this.cbSoftParticles.addEventListener(MouseEvent.CLICK,this.onSoftParticlesClick);
            this.createGraphicsAutoQualityCheckBox(param1);
            _loc2_ = this.layoutPerformanceFull(_loc4_);
         }
         else
         {
            _loc2_ = this.layoutPerformanceConstrained(_loc4_);
         }
         this.performanceInner.height = _loc2_ - this.performanceInner.y + margin + 1;
         this.windowSize.y = this.performanceInner.y + this.performanceInner.height;
      }
      
      private function onSoftParticlesClick(param1:MouseEvent) : void
      {
         this.checkDustAvailable();
      }
      
      private function checkDustAvailable() : void
      {
         this.cbDust.visible = Boolean(this.cbSoftParticles) && !this.cbGraphicsAutoQuality.Renamed1878 && this.cbSoftParticles.Renamed1878;
      }
      
      private function createGraphicsAutoQualityCheckBox(param1:ILocaleService) : void
      {
         this.cbGraphicsAutoQuality = this.createCheckBox(param1.getText(TextConst.STRING_SETTINGS_GRAPHICS_AUTO_QUALITY));
         this.cbGraphicsAutoQuality.addEventListener(MouseEvent.CLICK,this.onGraphicsAutQualityClick);
      }
      
      private function onGraphicsAutQualityClick(param1:MouseEvent) : void
      {
         var _loc2_:* = !this.cbGraphicsAutoQuality.Renamed1878;
         this.cbFog.visible = _loc2_;
         this.cbTankShadow.visible = _loc2_;
         this.cbDynamicShadows.visible = _loc2_;
         this.cbSoftParticles.visible = _loc2_;
         this.cbSSAO.visible = _loc2_;
         this.cbDynamicLighting.visible = _loc2_;
         this.cbAntialiasing.visible = _loc2_;
         this.checkDustAvailable();
      }
      
      private function layoutPerformanceFull(param1:GridLayout) : int
      {
         return param1.layout([[this.cbShowFPS,this.cbAdaptiveFPS,this.cbShowSkyBox,this.cbShowChat],[this.cbMipMapping],[this.cbGraphicsAutoQuality],[this.cbDynamicShadows,this.cbFog,this.cbSoftParticles,this.cbAntialiasing],[this.cbSSAO,this.cbTankShadow,this.cbDust,this.cbDynamicLighting]]);
      }
      
      private function layoutPerformanceConstrained(param1:GridLayout) : int
      {
         return param1.layout([[this.cbShowFPS,this.cbAdaptiveFPS,this.cbShowSkyBox,this.cbShowChat],[this.cbMipMapping]]);
      }
      
      private function createPanelLabel(param1:String, param2:int, param3:int) : LabelBase
      {
         var _loc4_:LabelBase;
         (_loc4_ = new LabelBase()).antiAliasType = AntiAliasType.ADVANCED;
         _loc4_.sharpness = -100;
         _loc4_.thickness = 50;
         _loc4_.text = param1;
         _loc4_.textColor = 16777215;
         _loc4_.x = param2;
         _loc4_.y = param3;
         addChild(_loc4_);
         return _loc4_;
      }
      
      private function createAccountPanel(param1:ILocaleService, param2:String, param3:Boolean, param4:String, param5:String) : Boolean
      {
         var _loc6_:TankWindowInner = null;
         var _loc7_:LabelBase = null;
         var _loc8_:LabelBase = null;
         var _loc9_:LabelBase = null;
         var _loc10_:Boolean = false;
         var _loc11_:* = !_loc10_;
         var _loc12_:LabelBase;
         (_loc12_ = this.createPanelLabel(param1.getText(TextConst.SETTINGS_ACCOUNT_HEADER_LABEL_TEXT),windowMargin,this.windowSize.y + windowMargin)).visible = _loc11_;
         if(_loc11_)
         {
            this.windowSize.y = _loc12_.y + _loc12_.textHeight;
         }
         this.accountInner.y = this.windowSize.y + 5;
         this.accountInner.visible = _loc11_;
         if(!this.isPasswordChangeDisabled)
         {
            this.pass1 = new TankInputBase();
            this.pass1.hidden = true;
            addChild(this.pass1);
            this.pass1.width = INPUT_WIDTH;
            this.pass1.label = param1.getText(TextConst.SETTINGS_NEW_PASSWORD_LABEL_TEXT);
            this.pass1.x = SECOND_COLUMN_X;
            this.pass1.y = this.accountInner.y + margin;
            this.pass1.maxChars = 32;
            this.pass1.validValue = true;
            this.pass1.visible = _loc11_;
            this.pass2 = new TankInputBase();
            addChild(this.pass2);
            this.pass2.hidden = true;
            this.pass2.width = INPUT_WIDTH;
            this.pass2.x = this.windowSize.x - margin - this.pass2.width - 2;
            this.pass2.label = param1.getText(TextConst.SETTINGS_REENTER_PASSWORD_LABEL_TEXT);
            this.pass2.y = this.pass1.y;
            this.pass2.maxChars = 32;
            this.pass2.validValue = true;
            this.pass2.visible = _loc11_;
            this.emailInput = new TankInputBase();
            addChild(this.emailInput);
            this.emailInput.value = param2;
            this.emailInput.label = param1.getText(TextConst.SETTINGS_EMAIL_LABEL_TEXT);
            this.emailInput.x = SECOND_COLUMN_X;
            this.emailInput.y = this.pass2.y + this.pass2.height + windowMargin;
            this.emailInput.validValue = true;
            this.emailInput.visible = _loc11_;
            this.emailInput.width = this.windowSize.x - windowMargin - margin - this.emailInput.x;
            this.pass1CheckIcon = new InputCheckIcon();
            this.pass2CheckIcon = new InputCheckIcon();
            this.emailCheckIcon = new InputCheckIcon();
            this.pass1CheckIcon.x = SECOND_COLUMN_X + INPUT_WIDTH + this.pass1CheckIcon.width - 50;
            this.pass1CheckIcon.y = this.pass1.y + 7;
            this.pass1CheckIcon.visible = _loc11_;
            this.pass1State = CallsignIconStates.CALLSIGN_ICON_STATE_OFF;
            this.pass2CheckIcon.x = this.windowSize.x - margin - this.pass2CheckIcon.width - 20;
            this.pass2CheckIcon.y = this.pass2.y + 7;
            this.pass2CheckIcon.visible = _loc11_;
            this.pass2State = CallsignIconStates.CALLSIGN_ICON_STATE_OFF;
            this.emailCheckIcon.x = this.windowSize.x - margin - this.emailCheckIcon.width - 20;
            this.emailCheckIcon.y = this.emailInput.y + 7;
            this.emailCheckIcon.visible = _loc11_;
            this.emailState = CallsignIconStates.CALLSIGN_ICON_STATE_OFF;
            addChild(this.pass1CheckIcon);
            addChild(this.pass2CheckIcon);
            addChild(this.emailCheckIcon);
            this.initEvents();
            this.creatteBubbles();
            this.emailInput.visible = _loc11_;
            this.accountInner.height = margin * 2 + this.pass1.height + buttonSize.y + windowMargin - 1;
         }
         else
         {
            this.changePasswordButton = new DefaultButtonBase();
            this.changePasswordButton.width = 210;
            this.accountInner.height = buttonSize.y * 2;
            addChild(this.changePasswordButton);
            this.changePasswordButton.label = param1.getText(TextConst.SETTINGS_BUTTON_CHANGE_PASSWORD_TEXT);
            this.changePasswordButton.x = (this.windowSize.x - this.changePasswordButton.width) / 2;
            this.changePasswordButton.y = this.accountInner.y + (this.accountInner.height - this.changePasswordButton.height) / 2;
            this.changePasswordButton.addEventListener(MouseEvent.CLICK,this.onChangePasswordClick);
            this.changePasswordButton.visible = _loc11_;
         }
         this.createSNPanel();
         this.windowSize.y = this.accountInner.y + this.accountInner.height;
         if(param3)
         {
            _loc6_ = new TankWindowInner(0,0,TankWindowInner.TRANSPARENT);
            addChild(_loc6_);
            _loc6_.x = windowMargin;
            _loc6_.width = this.windowSize.x - windowMargin * 2;
            (_loc7_ = new LabelBase()).antiAliasType = AntiAliasType.ADVANCED;
            _loc7_.sharpness = -100;
            _loc7_.thickness = 100;
            _loc7_.text = "防沉迷验证登记";
            _loc7_.textColor = 0;
            addChild(_loc7_);
            _loc7_.x = windowMargin;
            _loc7_.y = this.windowSize.y + windowMargin;
            this.windowSize.y = _loc7_.y + _loc7_.textHeight;
            _loc6_.y = this.windowSize.y + 5;
            _loc8_ = new LabelBase();
            addChild(_loc8_);
            _loc8_.text = "您的真实姓名:";
            _loc8_.x = SECOND_COLUMN_X - margin - _loc8_.textWidth;
            this.realNameInput = new TankInputBase();
            addChild(this.realNameInput);
            this.realNameInput.width = _loc6_.width - margin * 4 - _loc8_.width;
            this.realNameInput.x = SECOND_COLUMN_X;
            this.realNameInput.y = _loc6_.y + margin;
            _loc8_.y = this.realNameInput.y + Math.round((this.realNameInput.height - _loc8_.textHeight) * 0.5) - 2;
            _loc9_ = new LabelBase();
            addChild(_loc9_);
            _loc9_.text = "身份证号码:";
            _loc9_.x = SECOND_COLUMN_X - _loc9_.width - 5;
            _loc9_.y = this.realNameInput.y + this.realNameInput.height + windowMargin + 6;
            this.idNumberInput = new TankInputBase();
            addChild(this.idNumberInput);
            this.idNumberInput.textField.text = param2;
            this.idNumberInput.x = this.realNameInput.x;
            this.idNumberInput.y = this.realNameInput.y + this.realNameInput.height + windowMargin;
            this.idNumberInput.width = _loc6_.width - margin * 4 - _loc8_.width;
            _loc6_.height = margin * 4 + 2 * this.realNameInput.height;
            this.windowSize.y = _loc6_.y + _loc6_.height;
            this.idNumberInput.textField.text = param4 != null && param4 != "null" ? param4 : "";
            this.realNameInput.textField.text = param5 != null && param5 != "null" ? param5 : "";
            this.idNumberInput.addEventListener(FocusEvent.FOCUS_OUT,this.validateAddictionID);
            this.idNumberInput.addEventListener(FocusEvent.FOCUS_IN,restoreInput);
            this.realNameInput.addEventListener(FocusEvent.FOCUS_OUT,this.validateRealName);
            this.realNameInput.addEventListener(FocusEvent.FOCUS_IN,restoreInput);
         }
         return _loc11_;
      }
      
      private function createSNPanel() : void
      {
         this.currentSN = VKONTAKTE;
         var _loc1_:Boolean = socialNetworkService.Renamed1879(this.currentSN);
         var _loc2_:Sprite = new Sprite();
         this.snHasLinkLabel = new LabelBase();
         this.snHasLinkLabel.text = _loc1_ ? localeService.getText(TextConst.STRING_SETTINGS_UNLINK_ACCOUNT) : localeService.getText(TextConst.STRING_SETTINGS_LINK_ACCOUNT);
         _loc2_.addChild(this.snHasLinkLabel);
         this.snButton = this.currentSN == VKONTAKTE ? new VKButton() : new FBButton();
         this.snButton.width = 102;
         this.snButton.x = this.snHasLinkLabel.x + this.snHasLinkLabel.width + 5;
         this.snHasLinkLabel.y = this.snButton.y + 7;
         _loc2_.addChild(this.snButton);
         addChild(_loc2_);
         _loc2_.x = (this.windowSize.x - _loc2_.width) / 2;
         this.accountInner.height = this.accountInner.height + margin + this.snButton.height;
         _loc2_.y = this.accountInner.y + this.accountInner.height - _loc2_.height - margin;
         socialNetworkService.addEventListener(SocialNetworkServiceEvent.UNLINK_SUCCESS,this.onUnlinkSuccess);
         socialNetworkService.addEventListener(SocialNetworkServiceEvent.LINK_SUCCESS,this.onLinkSuccess);
         this.snButton.addEventListener(MouseEvent.CLICK,_loc1_ ? this.onSNUnLinkClick : this.onSNCreateLinkClick);
      }
      
      private function onLinkSuccess(param1:SocialNetworkServiceEvent) : void
      {
         this.snHasLinkLabel.text = localeService.getText(TextConst.STRING_SETTINGS_UNLINK_ACCOUNT);
         this.snButton.x = this.snHasLinkLabel.x + this.snHasLinkLabel.width + 5;
         this.snButton.removeEventListener(MouseEvent.CLICK,this.onSNCreateLinkClick);
         this.snButton.addEventListener(MouseEvent.CLICK,this.onSNUnLinkClick);
      }
      
      private function onUnlinkSuccess(param1:SocialNetworkServiceEvent) : void
      {
         this.snHasLinkLabel.text = localeService.getText(TextConst.STRING_SETTINGS_LINK_ACCOUNT);
         this.snButton.x = this.snHasLinkLabel.x + this.snHasLinkLabel.width + 5;
         this.snButton.removeEventListener(MouseEvent.CLICK,this.onSNUnLinkClick);
         this.snButton.addEventListener(MouseEvent.CLICK,this.onSNCreateLinkClick);
      }
      
      private function onSNUnLinkClick(param1:MouseEvent) : void
      {
         socialNetworkService.Renamed1880(this.currentSN);
      }
      
      private function onSNCreateLinkClick(param1:MouseEvent) : void
      {
         socialNetworkService.Renamed1881(this.currentSN);
      }
      
      private function createControlPanel(param1:ILocaleService) : void
      {
         var _loc2_:LabelBase = this.createPanelLabel(param1.getText(TextConst.SETTINGS_CONTROL_HEADER_LABEL_TEXT),windowMargin,this.windowSize.y + windowMargin);
         _loc2_.visible = false;
         this.windowSize.y = _loc2_.y + _loc2_.textHeight;
         this.controlInner.y = this.windowSize.y + 5;
         this._inverseBackDriving = this.createCheckBox(param1.getText(TextConst.SETTINGS_INVERSE_TURN_CONTROL_CHECKBOX_LABEL_TEXT),FIRST_COLUMN_X,this.controlInner.y + margin + 1);
         this.cbAlternateCamera = this.createCheckBox(param1.getText(TextConst.SETTINGS_ALTERNATE_CAMERA_LABEL_TEXT),FIRST_COLUMN_X,this._inverseBackDriving.y + this._inverseBackDriving.height + margin);
         this.cbMouseControl = this.createCheckBox(param1.getText(TextConst.STRING_SETTINGS_MOUSE_CONTROL_CHECKBOX),THIRD_COLUMN_X,this.cbAlternateCamera.y);
         this.controlInner.height = margin * 3 + 2 * this.cbShowFPS.height + 1;
         this.windowSize.y = this.controlInner.y + this.controlInner.height;
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
         this.emailInput.addEventListener(FocusEvent.FOCUS_IN,this.updatePasswordBlock);
         this.emailInput.addEventListener(Event.CHANGE,this.updatePasswordBlock);
      }
      
      private function updatePasswordBlock(param1:Event) : void
      {
         var _loc2_:Boolean = false;
         if(_loc2_ || this.isPasswordChangeDisabled)
         {
            return;
         }
         this.pass1.validValue = isPasswordValid(this.pass1.value);
         this.pass1State = CallsignIconStates.CALLSIGN_ICON_STATE_INVALID;
         var _loc3_:Boolean = true;
         this.pass2.validValue = this.pass2.value == "" || this.pass1.value == this.pass2.value;
         this.pass2State = CallsignIconStates.CALLSIGN_ICON_STATE_INVALID;
         if(this.pass1.value == "")
         {
            this.pass1State = CallsignIconStates.CALLSIGN_ICON_STATE_OFF;
            _loc3_ = false;
         }
         else if(this.pass1.validValue)
         {
            this.pass1State = CallsignIconStates.CALLSIGN_ICON_STATE_VALID;
            _loc3_ = false;
         }
         if(this.pass2.value == "")
         {
            this.pass2State = CallsignIconStates.CALLSIGN_ICON_STATE_OFF;
         }
         else if(this.pass2.validValue)
         {
            this.pass2State = CallsignIconStates.CALLSIGN_ICON_STATE_VALID;
         }
         var _loc4_:* = !(_loc3_ || this.pass2.validValue);
         if(_loc3_)
         {
            helperService.showHelper(HELPER_GROUP_KEY,this.PASSWORD_IS_TOO_EASY,true);
         }
         else
         {
            helperService.hideHelper(HELPER_GROUP_KEY,this.PASSWORD_IS_TOO_EASY);
         }
         if(_loc4_)
         {
            helperService.showHelper(HELPER_GROUP_KEY,this.PASSWORDS_DO_NOT_MATCH,true);
         }
         else
         {
            helperService.hideHelper(HELPER_GROUP_KEY,this.PASSWORDS_DO_NOT_MATCH);
         }
         var _loc5_:Boolean = true;
         if(this.emailInput.value.length > 0)
         {
            _loc5_ = validateService.isEmailValid(this.emailInput.value);
         }
         var _loc6_:Boolean = !(_loc3_ || _loc4_) && !_loc5_;
         if(_loc6_)
         {
            helperService.showHelper(HELPER_GROUP_KEY,this.ERROR_EMAIL_INVALID,true);
         }
         else
         {
            helperService.hideHelper(HELPER_GROUP_KEY,this.ERROR_EMAIL_INVALID);
         }
         if(_loc5_)
         {
            this.emailInput.validValue = true;
            this.emailState = this.emailInput.value == "" ? int(CallsignIconStates.CALLSIGN_ICON_STATE_OFF) : int(CallsignIconStates.CALLSIGN_ICON_STATE_VALID);
         }
         else
         {
            this.emailInput.validValue = false;
            this.emailState = CallsignIconStates.CALLSIGN_ICON_STATE_INVALID;
         }
         this.okButton.enable = this.pass1.value == this.pass2.value && this.pass1.validValue && this.pass2.validValue && _loc5_;
      }
      
      public function get bgSound() : Boolean
      {
         return this._bgSound.Renamed1878;
      }
      
      public function set bgSound(param1:Boolean) : void
      {
         this._bgSound.Renamed1878 = param1;
      }
      
      public function get showFPS() : Boolean
      {
         return this.cbShowFPS.Renamed1878;
      }
      
      public function set showFPS(param1:Boolean) : void
      {
         this.cbShowFPS.Renamed1878 = param1;
      }
      
      public function get receiveBattleInvite() : Boolean
      {
         return this._receiveBattleInvite.Renamed1878;
      }
      
      public function set receiveBattleInvite(param1:Boolean) : void
      {
         this._receiveBattleInvite.Renamed1878 = param1;
      }
      
      public function get showSkyBox() : Boolean
      {
         return this.cbShowSkyBox.Renamed1878;
      }
      
      public function set showSkyBox(param1:Boolean) : void
      {
         this.cbShowSkyBox.Renamed1878 = param1;
      }
      
      public function get showChat() : Boolean
      {
         return this.cbShowChat.Renamed1878;
      }
      
      public function set showChat(param1:Boolean) : void
      {
         this.cbShowChat.Renamed1878 = param1;
      }
      
      public function get inverseBackDriving() : Boolean
      {
         return this._inverseBackDriving.Renamed1878;
      }
      
      public function set inverseBackDriving(param1:Boolean) : void
      {
         this._inverseBackDriving.Renamed1878 = param1;
      }
      
      public function get enableMipMapping() : Boolean
      {
         return getCheckBoxState(this.cbMipMapping);
      }
      
      public function set enableMipMapping(param1:Boolean) : void
      {
         setCheckBoxState(this.cbMipMapping,param1);
      }
      
      public function get alternateCamera() : Boolean
      {
         return this.cbAlternateCamera.Renamed1878;
      }
      
      public function set alternateCamera(param1:Boolean) : void
      {
         this.cbAlternateCamera.Renamed1878 = param1;
      }
      
      public function get shadowsEnabled() : Boolean
      {
         return getCheckBoxState(this.cbTankShadow);
      }
      
      public function set shadowsEnabled(param1:Boolean) : void
      {
         setCheckBoxState(this.cbTankShadow,param1);
      }
      
      public function get softParticlesEnabled() : Boolean
      {
         return getCheckBoxState(this.cbSoftParticles);
      }
      
      public function set softParticlesEnabled(param1:Boolean) : void
      {
         setCheckBoxState(this.cbSoftParticles,param1);
      }
      
      public function get dustEnabled() : Boolean
      {
         return getCheckBoxState(this.cbDust);
      }
      
      public function set dustEnabled(param1:Boolean) : void
      {
         setCheckBoxState(this.cbDust,param1);
         if(this.cbDust)
         {
            this.checkDustAvailable();
         }
      }
      
      public function get ssaoEnabled() : Boolean
      {
         return getCheckBoxState(this.cbSSAO);
      }
      
      public function set ssaoEnabled(param1:Boolean) : void
      {
         setCheckBoxState(this.cbSSAO,param1);
      }
      
      public function get fogEnabled() : Boolean
      {
         return getCheckBoxState(this.cbFog);
      }
      
      public function set fogEnabled(param1:Boolean) : void
      {
         setCheckBoxState(this.cbFog,param1);
      }
      
      public function get dynamicShadowsEnabled() : Boolean
      {
         return getCheckBoxState(this.cbDynamicShadows);
      }
      
      public function set dynamicShadowsEnabled(param1:Boolean) : void
      {
         setCheckBoxState(this.cbDynamicShadows,param1);
      }
      
      public function get graphicsAutoQuality() : Boolean
      {
         return getCheckBoxState(this.cbGraphicsAutoQuality);
      }
      
      public function get antialiasingEnabled() : Boolean
      {
         return getCheckBoxState(this.cbAntialiasing);
      }
      
      public function set antialiasingEnabled(param1:Boolean) : void
      {
         setCheckBoxState(this.cbAntialiasing,param1);
      }
      
      public function get dynamicLightingEnabled() : Boolean
      {
         return getCheckBoxState(this.cbDynamicLighting);
      }
      
      public function set dynamicLightingEnabled(param1:Boolean) : void
      {
         setCheckBoxState(this.cbDynamicLighting,param1);
      }
      
      private function validateRealName(param1:FocusEvent) : void
      {
         var _loc2_:RegExp = null;
         if(this.realNameInput != null)
         {
            _loc2_ = /^[一-龥]+$/;
            this.realNameInput.validValue = Boolean(this.realNameInput.textField.text.match(_loc2_)) || trimString(this.realNameInput.textField.text).length == 0;
         }
      }
      
      private function validateAddictionID(param1:FocusEvent) : void
      {
         var _loc2_:RegExp = null;
         if(this.idNumberInput != null)
         {
            _loc2_ = /^\d{17}[0-9xX]$/;
            this.idNumberInput.validValue = Boolean(this.idNumberInput.textField.text.match(_loc2_)) || trimString(this.idNumberInput.textField.text).length == 0;
         }
      }
      
      private function onChangePasswordClick(param1:MouseEvent) : void
      {
         this.changePasswordButton.enable = false;
         dispatchEvent(new SettingsWindowEvent(SettingsWindowEvent.CHANGE_PASSWORD));
      }
      
      private function onChangeVolume(param1:SliderEvent) : void
      {
         dispatchEvent(new SettingsWindowEvent(SettingsWindowEvent.CHANGE_VOLUME));
      }
      
      private function onCancelClick(param1:MouseEvent) : void
      {
         helperService.hideAllHelpers();
         dispatchEvent(new SettingsWindowEvent(SettingsWindowEvent.CANCEL_SETTINGS));
      }
      
      private function onOkClick(param1:MouseEvent) : void
      {
         dispatchEvent(new SettingsWindowEvent(SettingsWindowEvent.ACCEPT_SETTINGS));
      }
      
      public function get password() : String
      {
         var _loc1_:String = "";
         if(!this.isPasswordChangeDisabled)
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
         if(this.isPasswordChangeDisabled)
         {
            return "";
         }
         return this.emailInput.textField.text;
      }
      
      public function get emailNoticeValue() : Boolean
      {
         return false;
      }
      
      public function get volume() : Number
      {
         return this.volumeLevel.value / 100;
      }
      
      public function set volume(param1:Number) : void
      {
         this.volumeLevel.value = param1 * 100;
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
      
      private function createCheckBox(param1:String, param2:int = 0, param3:int = 0) : TankCheckBoxBase
      {
         var _loc4_:TankCheckBoxBase;
         (_loc4_ = new TankCheckBoxBase()).x = param2;
         _loc4_.y = param3;
         _loc4_.label = param1;
         addChild(_loc4_);
         return _loc4_;
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
      
      private function creatteBubbles() : void
      {
         this.passwordIsTooEasyBubble = new PasswordIsTooEasyBubble();
         this.passwordsDoNotMatchBubble = new PasswordsDoNotMatchBubble();
         this.errorEmailInvalodBubble = new EmailInvalidBubble();
         this.alignHelpers();
         helperService.registerHelper(HELPER_GROUP_KEY,this.PASSWORD_IS_TOO_EASY,this.passwordIsTooEasyBubble,false);
         helperService.registerHelper(HELPER_GROUP_KEY,this.PASSWORDS_DO_NOT_MATCH,this.passwordsDoNotMatchBubble,false);
         helperService.registerHelper(HELPER_GROUP_KEY,this.ERROR_EMAIL_INVALID,this.errorEmailInvalodBubble,false);
      }
      
      public function alignHelpers() : void
      {
         if(this.passwordIsTooEasyBubble != null)
         {
            this.passwordIsTooEasyBubble.targetPoint = new Point(this.pass1CheckIcon.x + this.pass1CheckIcon.width / 2 + x,this.pass1CheckIcon.y + this.pass1CheckIcon.height / 2 + y);
            this.passwordsDoNotMatchBubble.targetPoint = new Point(this.pass2CheckIcon.x + this.pass2CheckIcon.width / 2 + x,this.pass2CheckIcon.y + this.pass2CheckIcon.height / 2 + y);
            this.errorEmailInvalodBubble.targetPoint = new Point(this.emailCheckIcon.x + this.emailCheckIcon.width / 2 + x,this.emailCheckIcon.y + this.emailCheckIcon.height / 2 + y);
         }
      }
      
      public function dispose() : void
      {
         helperService.unregisterHelper(HELPER_GROUP_KEY,this.PASSWORD_IS_TOO_EASY);
         helperService.unregisterHelper(HELPER_GROUP_KEY,this.PASSWORDS_DO_NOT_MATCH);
         helperService.unregisterHelper(HELPER_GROUP_KEY,this.ERROR_EMAIL_INVALID);
      }
      
      public function get adaptiveFPS() : Boolean
      {
         return this.cbAdaptiveFPS.Renamed1878;
      }
      
      public function set adaptiveFPS(param1:Boolean) : void
      {
         this.cbAdaptiveFPS.Renamed1878 = param1;
      }
      
      public function set graphicsAutoQuality(param1:Boolean) : void
      {
         setCheckBoxState(this.cbGraphicsAutoQuality,param1);
         if(this.cbGraphicsAutoQuality != null)
         {
            this.onGraphicsAutQualityClick(null);
         }
      }
      
      public function set mouseControl(param1:Boolean) : void
      {
         this.cbMouseControl.Renamed1878 = param1;
      }
      
      public function get mouseControl() : Boolean
      {
         return this.cbMouseControl.Renamed1878;
      }
      
      public function set showMouseControl(param1:Boolean) : void
      {
         this.cbMouseControl.visible = param1;
      }
      
      public function get showMouseControl() : Boolean
      {
         return this.cbMouseControl.visible;
      }
   }
}

import flash.display.DisplayObject;

class GridLayout
{
   private var topX:int;
   
   private var topY:int;
   
   private var columnWidth:int;
   
   private var rowHeight:int;
   
   public function GridLayout(param1:int, param2:int, param3:int, param4:int)
   {
      super();
      this.topX = param1;
      this.topY = param2;
      this.columnWidth = param3;
      this.rowHeight = param4;
   }
   
   public function layout(param1:Array) : int
   {
      var _loc2_:int = 0;
      var _loc3_:Array = null;
      var _loc4_:int = 0;
      var _loc5_:DisplayObject = null;
      var _loc6_:int = 0;
      while(_loc6_ < param1.length)
      {
         _loc3_ = param1[_loc6_];
         _loc4_ = 0;
         while(_loc4_ < _loc3_.length)
         {
            if(_loc3_[_loc4_] != null)
            {
               (_loc5_ = _loc3_[_loc4_]).x = this.topX + _loc4_ * this.columnWidth;
               _loc5_.y = this.topY + _loc6_ * this.rowHeight;
               _loc2_ = _loc5_.y + _loc5_.height;
            }
            _loc4_++;
         }
         _loc6_++;
      }
      return _loc2_;
   }
}

