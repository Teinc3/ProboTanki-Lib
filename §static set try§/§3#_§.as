package §static set try§
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.model.useremailandpassword.PasswordService;
   import controls.TankWindowInner;
   import controls.ValidationIcon;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import forms.TankWindowWithHeader;
   import platform.client.models.commons.types.ValidationStatus;
   import projects.tanks.clients.flash.commons.services.validate.IValidateService;
   import projects.tanks.clients.flash.commons.services.validate.ValidateService;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.uidcheck.UidCheckService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.gui.DialogWindow;
   import §static set for§.§[#>§;
   
   public class §3#_§ extends DialogWindow
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var §extends const extends§:UidCheckService;
      
      [Inject]
      public static var §true const native§:PasswordService;
      
      [Inject]
      public static var validateService:IValidateService;
      
      private static const §function package get§:int = 6;
      
      private static const §+!H§:int = 500;
      
      private static const §class package for§:int = 50;
      
      private static var §]!E§:Class = §while for finally§;
      
      private static var §try set with§:BitmapData = Bitmap(new §]!E§()).bitmapData;
      
      protected static const WINDOW_WIDTH:int = 335;
      
      protected static const WINDOW_MARGIN:int = 11;
      
      protected static const GAP:int = 5;
      
      protected var window:TankWindowWithHeader;
      
      private var §return break§:§[#>§;
      
      private var §super const const§:ValidationIcon;
      
      private var §0!@§:uint;
      
      private var nickname:String;
      
      private var §0!X§:Boolean;
      
      private var §var var null§:§[#>§;
      
      private var §]"a§:ValidationIcon;
      
      private var §finally package class§:uint;
      
      private var password:String;
      
      private var §case catch switch§:Boolean;
      
      private var §,#u§:DefaultButtonBase;
      
      private var closeButton:DefaultButtonBase;
      
      private var §switch catch const§:TankWindowInner;
      
      private var §package package class§:TankWindowInner;
      
      private var §8§:Boolean;
      
      public function §3#_§(param1:Boolean)
      {
         super();
         this.§8§ = param1;
         this.§try var with§();
         this.§null for if§();
         this.§?!D§();
         this.§-$ §();
         if(param1)
         {
            this.§catch package case§();
         }
         this.§const catch while§();
         this.§;!6§();
         this.window.height = this.§,#u§.y + this.§,#u§.height + WINDOW_MARGIN;
      }
      
      public function show() : void
      {
         dialogService.addDialog(this);
      }
      
      public function close() : void
      {
         dialogService.removeDialog(this);
      }
      
      public function §const override§() : Boolean
      {
         return this.§8§;
      }
      
      public function §else for final§() : String
      {
         return this.§var var null§.value;
      }
      
      private function §catch var default§(param1:DisplayObject) : int
      {
         return param1.y + param1.height + GAP;
      }
      
      private function §try var with§() : void
      {
         this.window = new TankWindowWithHeader(localeService.getImage(TanksLocale.IMAGE_HEADER_CHANGE_UID));
         this.window.width = WINDOW_WIDTH;
         addChild(this.window);
      }
      
      private function §null for if§() : void
      {
         var _loc1_:Bitmap = new Bitmap(§try set with§);
         _loc1_.x = WINDOW_MARGIN;
         this.§switch catch const§ = new TankWindowInner(0,0,TankWindowInner.GREEN);
         this.§switch catch const§.x = WINDOW_MARGIN;
         this.§switch catch const§.y = WINDOW_MARGIN;
         this.§switch catch const§.width = WINDOW_WIDTH - WINDOW_MARGIN * 2;
         this.§switch catch const§.height = _loc1_.height;
         this.§switch catch const§.addChild(_loc1_);
         this.window.addChild(this.§switch catch const§);
      }
      
      private function §?!D§() : void
      {
         this.§package package class§ = new TankWindowInner(0,0,TankWindowInner.GREEN);
         this.§package package class§.x = WINDOW_MARGIN;
         this.§package package class§.width = WINDOW_WIDTH - WINDOW_MARGIN * 2;
         var _loc1_:LabelBase = new LabelBase();
         _loc1_.wordWrap = true;
         _loc1_.multiline = true;
         _loc1_.htmlText = localeService.getText(TanksLocale.TEXT_RENAME_FORM_INSTRUCTION);
         _loc1_.size = 12;
         _loc1_.x = WINDOW_MARGIN;
         _loc1_.y = WINDOW_MARGIN;
         _loc1_.width = WINDOW_WIDTH - WINDOW_MARGIN * 4;
         this.§package package class§.addChild(_loc1_);
         this.§package package class§.height = _loc1_.height + WINDOW_MARGIN * 2;
         this.§package package class§.y = this.§catch var default§(this.§switch catch const§);
         this.window.addChild(this.§package package class§);
      }
      
      private function §-$ §() : void
      {
         this.§return break§ = this.§5!S§(localeService.getText(TanksLocale.TEXT_RENAME_FORM_NEW_UID_INPUT),this.§catch var default§(this.§package package class§));
         this.§return break§.validValue = true;
         this.§return break§.maxChars = §extends const extends§.getMaxLength();
         this.§return break§.addEventListener(Event.CHANGE,this.§get package throw§);
         this.§super const const§ = this.§static const include§(this.§return break§);
         this.window.addChild(this.§return break§);
         this.§return break§.addChild(this.§super const const§);
      }
      
      private function §catch package case§() : void
      {
         this.§var var null§ = this.§5!S§(localeService.getText(TanksLocale.TEXT_RENAME_FORM_CURRENT_PASSWORD_INPUT),this.§catch var default§(this.§return break§));
         this.§var var null§.hidden = true;
         this.§var var null§.maxChars = §class package for§;
         this.§var var null§.addEventListener(Event.CHANGE,this.§""y§);
         this.§]"a§ = this.§static const include§(this.§var var null§);
         this.window.addChild(this.§var var null§);
         this.§var var null§.addChild(this.§]"a§);
      }
      
      private function §get package throw§(param1:Event) : void
      {
         this.§,#u§.enable = false;
         var _loc2_:String = this.§return break§.value;
         if(!validateService.isValidIdentificationStringForRegistration(_loc2_))
         {
            this.§return break§.value = _loc2_.replace(ValidateService.NOT_ALLOWED_PATTERN_FOR_REGISTRATION,"");
         }
         this.§super const const§.startProgress();
         clearTimeout(this.§0!@§);
         this.§0!@§ = setTimeout(this.checkUid,§+!H§);
      }
      
      private function checkUid() : void
      {
         if(this.§8§ && this.§return break§.value == this.§var var null§.value)
         {
            this.§super const const§.markAsInvalid();
            this.§return break§.validValue = false;
            return;
         }
         if(this.§return break§.value.length == 0)
         {
            this.§super const const§.turnOff();
            this.§return break§.validValue = true;
         }
         else
         {
            this.nickname = this.§return break§.value;
            §extends const extends§.validate(this.nickname,this.§null each§);
         }
      }
      
      private function §""y§(param1:Event) : void
      {
         this.§,#u§.enable = false;
         this.§]"a§.startProgress();
         clearTimeout(this.§finally package class§);
         this.§finally package class§ = setTimeout(this.§true const package§,§+!H§);
      }
      
      private function §true const package§() : void
      {
         if(this.§8§ && this.§var var null§.value == this.§return break§.value)
         {
            this.§var var null§.validValue = false;
            this.§]"a§.markAsInvalid();
            return;
         }
         if(this.§var var null§.value.length == 0)
         {
            this.§]"a§.turnOff();
            this.§var var null§.validValue = true;
         }
         else
         {
            this.password = this.§var var null§.value;
            §true const native§.§true const package§(this.password,this.§catch class§);
         }
      }
      
      private function §5!S§(param1:String, param2:int) : §[#>§
      {
         var _loc3_:§[#>§ = new §[#>§(param1);
         _loc3_.x = WINDOW_MARGIN;
         _loc3_.y = param2;
         _loc3_.width = WINDOW_WIDTH - WINDOW_MARGIN * 2;
         return _loc3_;
      }
      
      private function §static const include§(param1:§[#>§) : ValidationIcon
      {
         var _loc2_:ValidationIcon = new ValidationIcon();
         _loc2_.turnOff();
         _loc2_.y = int((param1.height - _loc2_.height) / 2) + 2;
         _loc2_.x = param1.width - _loc2_.width - §function package get§;
         return _loc2_;
      }
      
      private function §const catch while§() : void
      {
         this.§,#u§ = new DefaultButtonBase();
         this.§,#u§.label = localeService.getText(TanksLocale.TEXT_SAVE_BUTTON_LABEL);
         this.§,#u§.x = WINDOW_WIDTH - 2 * this.§,#u§.width - 2 * WINDOW_MARGIN;
         this.§,#u§.y = this.§catch var default§(this.§8§ ? this.§var var null§ : this.§return break§);
         this.§,#u§.enable = false;
         this.§,#u§.addEventListener(MouseEvent.CLICK,this.§include var null§);
         this.window.addChild(this.§,#u§);
      }
      
      private function §;!6§() : void
      {
         this.closeButton = new DefaultButtonBase();
         this.closeButton.label = localeService.getText(TanksLocale.TEXT_CLOSE_LABEL);
         this.closeButton.x = WINDOW_WIDTH - WINDOW_MARGIN - this.closeButton.width;
         this.closeButton.y = this.§,#u§.y;
         this.closeButton.addEventListener(MouseEvent.CLICK,this.onCloseButtonClick);
         this.window.addChild(this.closeButton);
      }
      
      private function §null each§(param1:ValidationStatus) : void
      {
         this.§0!X§ = param1 == ValidationStatus.CORRECT;
         this.§return break§.validValue = this.§0!X§;
         if(this.§0!X§)
         {
            this.§super const const§.markAsValid();
         }
         else
         {
            this.§super const const§.markAsInvalid();
         }
         this.§?"7§();
      }
      
      private function §catch class§(param1:Boolean) : void
      {
         this.§case catch switch§ = param1;
         if(this.§case catch switch§)
         {
            this.§]"a§.markAsValid();
         }
         else
         {
            this.§]"a§.markAsInvalid();
         }
         this.§var var null§.validValue = this.§case catch switch§;
         this.§?"7§();
      }
      
      private function §;!D§() : void
      {
         this.§super const const§.markAsValid();
         this.§return break§.validValue = true;
         this.§?"7§();
      }
      
      private function §package set final§() : void
      {
         this.§super const const§.markAsInvalid();
         this.§return break§.validValue = false;
      }
      
      private function §?"7§() : void
      {
         if(this.§0!X§ && (this.§case catch switch§ || !this.§8§))
         {
            this.§,#u§.enable = true;
         }
      }
      
      private function §include var null§(param1:MouseEvent) : void
      {
         dispatchEvent(new § !I§(this.nickname));
      }
      
      private function onCloseButtonClick(param1:MouseEvent = null) : void
      {
         dialogService.removeDialog(this);
      }
      
      public function dispose() : void
      {
         this.§,#u§.removeEventListener(MouseEvent.CLICK,this.§include var null§);
         this.closeButton.removeEventListener(MouseEvent.CLICK,this.onCloseButtonClick);
         this.§return break§.removeEventListener(Event.CHANGE,this.§get package throw§);
         if(this.§8§)
         {
            this.§var var null§.removeEventListener(Event.CHANGE,this.§""y§);
         }
      }
      
      override protected function cancelKeyPressed() : void
      {
         this.onCloseButtonClick();
      }
   }
}

