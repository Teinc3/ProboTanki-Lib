package Renamed426
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
   import Renamed422.Renamed8740;
   
   public class Renamed4787 extends DialogWindow
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var Renamed4795:UidCheckService;
      
      [Inject]
      public static var Renamed2181:PasswordService;
      
      [Inject]
      public static var validateService:IValidateService;
      
      private static const Renamed7490:int = 6;
      
      private static const Renamed4989:int = 500;
      
      private static const Renamed8791:int = 50;
      
      private static var Renamed8792:Class = Renamed8793;
      
      private static var Renamed8794:BitmapData = Bitmap(new Renamed8792()).bitmapData;
      
      protected static const WINDOW_WIDTH:int = 335;
      
      protected static const WINDOW_MARGIN:int = 11;
      
      protected static const GAP:int = 5;
      
      protected var window:TankWindowWithHeader;
      
      private var Renamed8795:Renamed8740;
      
      private var Renamed8796:ValidationIcon;
      
      private var Renamed8797:uint;
      
      private var nickname:String;
      
      private var Renamed8798:Boolean;
      
      private var Renamed8799:Renamed8740;
      
      private var Renamed8800:ValidationIcon;
      
      private var Renamed8801:uint;
      
      private var password:String;
      
      private var Renamed8802:Boolean;
      
      private var Renamed8803:DefaultButtonBase;
      
      private var closeButton:DefaultButtonBase;
      
      private var Renamed8804:TankWindowInner;
      
      private var Renamed8805:TankWindowInner;
      
      private var Renamed8806:Boolean;
      
      public function Renamed4787(param1:Boolean)
      {
         super();
         this.Renamed8806 = param1;
         this.Renamed8807();
         this.Renamed8808();
         this.Renamed8809();
         this.Renamed8810();
         if(param1)
         {
            this.Renamed8811();
         }
         this.Renamed8812();
         this.Renamed1915();
         this.window.height = this.Renamed8803.y + this.Renamed8803.height + WINDOW_MARGIN;
      }
      
      public function show() : void
      {
         dialogService.addDialog(this);
      }
      
      public function close() : void
      {
         dialogService.removeDialog(this);
      }
      
      public function Renamed8813() : Boolean
      {
         return this.Renamed8806;
      }
      
      public function Renamed8814() : String
      {
         return this.Renamed8799.value;
      }
      
      private function Renamed8815(param1:DisplayObject) : int
      {
         return param1.y + param1.height + GAP;
      }
      
      private function Renamed8807() : void
      {
         this.window = new TankWindowWithHeader(localeService.getImage(TanksLocale.IMAGE_HEADER_CHANGE_UID));
         this.window.width = WINDOW_WIDTH;
         addChild(this.window);
      }
      
      private function Renamed8808() : void
      {
         var _loc1_:Bitmap = new Bitmap(Renamed8794);
         _loc1_.x = WINDOW_MARGIN;
         this.Renamed8804 = new TankWindowInner(0,0,TankWindowInner.GREEN);
         this.Renamed8804.x = WINDOW_MARGIN;
         this.Renamed8804.y = WINDOW_MARGIN;
         this.Renamed8804.width = WINDOW_WIDTH - WINDOW_MARGIN * 2;
         this.Renamed8804.height = _loc1_.height;
         this.Renamed8804.addChild(_loc1_);
         this.window.addChild(this.Renamed8804);
      }
      
      private function Renamed8809() : void
      {
         this.Renamed8805 = new TankWindowInner(0,0,TankWindowInner.GREEN);
         this.Renamed8805.x = WINDOW_MARGIN;
         this.Renamed8805.width = WINDOW_WIDTH - WINDOW_MARGIN * 2;
         var _loc1_:LabelBase = new LabelBase();
         _loc1_.wordWrap = true;
         _loc1_.multiline = true;
         _loc1_.htmlText = localeService.getText(TanksLocale.TEXT_RENAME_FORM_INSTRUCTION);
         _loc1_.size = 12;
         _loc1_.x = WINDOW_MARGIN;
         _loc1_.y = WINDOW_MARGIN;
         _loc1_.width = WINDOW_WIDTH - WINDOW_MARGIN * 4;
         this.Renamed8805.addChild(_loc1_);
         this.Renamed8805.height = _loc1_.height + WINDOW_MARGIN * 2;
         this.Renamed8805.y = this.Renamed8815(this.Renamed8804);
         this.window.addChild(this.Renamed8805);
      }
      
      private function Renamed8810() : void
      {
         this.Renamed8795 = this.Renamed8816(localeService.getText(TanksLocale.TEXT_RENAME_FORM_NEW_UID_INPUT),this.Renamed8815(this.Renamed8805));
         this.Renamed8795.validValue = true;
         this.Renamed8795.maxChars = Renamed4795.getMaxLength();
         this.Renamed8795.addEventListener(Event.CHANGE,this.Renamed8817);
         this.Renamed8796 = this.Renamed8818(this.Renamed8795);
         this.window.addChild(this.Renamed8795);
         this.Renamed8795.addChild(this.Renamed8796);
      }
      
      private function Renamed8811() : void
      {
         this.Renamed8799 = this.Renamed8816(localeService.getText(TanksLocale.TEXT_RENAME_FORM_CURRENT_PASSWORD_INPUT),this.Renamed8815(this.Renamed8795));
         this.Renamed8799.hidden = true;
         this.Renamed8799.maxChars = Renamed8791;
         this.Renamed8799.addEventListener(Event.CHANGE,this.Renamed8819);
         this.Renamed8800 = this.Renamed8818(this.Renamed8799);
         this.window.addChild(this.Renamed8799);
         this.Renamed8799.addChild(this.Renamed8800);
      }
      
      private function Renamed8817(param1:Event) : void
      {
         this.Renamed8803.enable = false;
         var _loc2_:String = this.Renamed8795.value;
         if(!validateService.isValidIdentificationStringForRegistration(_loc2_))
         {
            this.Renamed8795.value = _loc2_.replace(ValidateService.NOT_ALLOWED_PATTERN_FOR_REGISTRATION,"");
         }
         this.Renamed8796.startProgress();
         clearTimeout(this.Renamed8797);
         this.Renamed8797 = setTimeout(this.checkUid,Renamed4989);
      }
      
      private function checkUid() : void
      {
         if(this.Renamed8806 && this.Renamed8795.value == this.Renamed8799.value)
         {
            this.Renamed8796.markAsInvalid();
            this.Renamed8795.validValue = false;
            return;
         }
         if(this.Renamed8795.value.length == 0)
         {
            this.Renamed8796.turnOff();
            this.Renamed8795.validValue = true;
         }
         else
         {
            this.nickname = this.Renamed8795.value;
            Renamed4795.validate(this.nickname,this.Renamed8820);
         }
      }
      
      private function Renamed8819(param1:Event) : void
      {
         this.Renamed8803.enable = false;
         this.Renamed8800.startProgress();
         clearTimeout(this.Renamed8801);
         this.Renamed8801 = setTimeout(this.Renamed2198,Renamed4989);
      }
      
      private function Renamed2198() : void
      {
         if(this.Renamed8806 && this.Renamed8799.value == this.Renamed8795.value)
         {
            this.Renamed8799.validValue = false;
            this.Renamed8800.markAsInvalid();
            return;
         }
         if(this.Renamed8799.value.length == 0)
         {
            this.Renamed8800.turnOff();
            this.Renamed8799.validValue = true;
         }
         else
         {
            this.password = this.Renamed8799.value;
            Renamed2181.Renamed2198(this.password,this.Renamed8821);
         }
      }
      
      private function Renamed8816(param1:String, param2:int) : Renamed8740
      {
         var _loc3_:Renamed8740 = new Renamed8740(param1);
         _loc3_.x = WINDOW_MARGIN;
         _loc3_.y = param2;
         _loc3_.width = WINDOW_WIDTH - WINDOW_MARGIN * 2;
         return _loc3_;
      }
      
      private function Renamed8818(param1:Renamed8740) : ValidationIcon
      {
         var _loc2_:ValidationIcon = new ValidationIcon();
         _loc2_.turnOff();
         _loc2_.y = int((param1.height - _loc2_.height) / 2) + 2;
         _loc2_.x = param1.width - _loc2_.width - Renamed7490;
         return _loc2_;
      }
      
      private function Renamed8812() : void
      {
         this.Renamed8803 = new DefaultButtonBase();
         this.Renamed8803.label = localeService.getText(TanksLocale.TEXT_SAVE_BUTTON_LABEL);
         this.Renamed8803.x = WINDOW_WIDTH - 2 * this.Renamed8803.width - 2 * WINDOW_MARGIN;
         this.Renamed8803.y = this.Renamed8815(this.Renamed8806 ? this.Renamed8799 : this.Renamed8795);
         this.Renamed8803.enable = false;
         this.Renamed8803.addEventListener(MouseEvent.CLICK,this.Renamed8822);
         this.window.addChild(this.Renamed8803);
      }
      
      private function Renamed1915() : void
      {
         this.closeButton = new DefaultButtonBase();
         this.closeButton.label = localeService.getText(TanksLocale.TEXT_CLOSE_LABEL);
         this.closeButton.x = WINDOW_WIDTH - WINDOW_MARGIN - this.closeButton.width;
         this.closeButton.y = this.Renamed8803.y;
         this.closeButton.addEventListener(MouseEvent.CLICK,this.onCloseButtonClick);
         this.window.addChild(this.closeButton);
      }
      
      private function Renamed8820(param1:ValidationStatus) : void
      {
         this.Renamed8798 = param1 == ValidationStatus.CORRECT;
         this.Renamed8795.validValue = this.Renamed8798;
         if(this.Renamed8798)
         {
            this.Renamed8796.markAsValid();
         }
         else
         {
            this.Renamed8796.markAsInvalid();
         }
         this.Renamed8823();
      }
      
      private function Renamed8821(param1:Boolean) : void
      {
         this.Renamed8802 = param1;
         if(this.Renamed8802)
         {
            this.Renamed8800.markAsValid();
         }
         else
         {
            this.Renamed8800.markAsInvalid();
         }
         this.Renamed8799.validValue = this.Renamed8802;
         this.Renamed8823();
      }
      
      private function Renamed8824() : void
      {
         this.Renamed8796.markAsValid();
         this.Renamed8795.validValue = true;
         this.Renamed8823();
      }
      
      private function Renamed8825() : void
      {
         this.Renamed8796.markAsInvalid();
         this.Renamed8795.validValue = false;
      }
      
      private function Renamed8823() : void
      {
         if(this.Renamed8798 && (this.Renamed8802 || !this.Renamed8806))
         {
            this.Renamed8803.enable = true;
         }
      }
      
      private function Renamed8822(param1:MouseEvent) : void
      {
         dispatchEvent(new Renamed8788(this.nickname));
      }
      
      private function onCloseButtonClick(param1:MouseEvent = null) : void
      {
         dialogService.removeDialog(this);
      }
      
      public function dispose() : void
      {
         this.Renamed8803.removeEventListener(MouseEvent.CLICK,this.Renamed8822);
         this.closeButton.removeEventListener(MouseEvent.CLICK,this.onCloseButtonClick);
         this.Renamed8795.removeEventListener(Event.CHANGE,this.Renamed8817);
         if(this.Renamed8806)
         {
            this.Renamed8799.removeEventListener(Event.CHANGE,this.Renamed8819);
         }
      }
      
      override protected function cancelKeyPressed() : void
      {
         this.onCloseButtonClick();
      }
   }
}

