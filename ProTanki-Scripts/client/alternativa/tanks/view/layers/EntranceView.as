package alternativa.tanks.view.layers
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.locale.constants.TextConst;
   import alternativa.tanks.view.StandAloneCaptchaForm;
   import alternativa.tanks.view.forms.Renamed558;
   import alternativa.tanks.view.forms.ExternalRegistrationForm;
   import alternativa.tanks.view.forms.LinkExternalLoginForm;
   import alternativa.tanks.view.forms.LoginForm;
   import alternativa.tanks.view.forms.PasswordRestoreForm;
   import alternativa.tanks.view.forms.RegistrationForm;
   import alternativa.tanks.view.forms.Renamed559;
   import alternativa.tanks.view.forms.primitives.Alert;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import forms.events.AlertEvent;
   import org.robotlegs.core.IInjector;
   import projects.tanks.client.entrance.model.entrance.emailconfirm.ConfirmEmailStatus;
   import projects.tanks.clients.flash.commons.services.timeunit.ITimeUnitService;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import services.alertservice.Renamed1616;
   
   public class EntranceView extends Sprite
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var alertService:IAlertService;
      
      [Inject]
      public static var Renamed2271:ITimeUnitService;
      
      [Inject]
      public var injector:IInjector;
      
      private var alert:Alert;
      
      private var _currentView:DisplayObject;
      
      private var _rememberCallsign:String = "";
      
      private var _rememberPassword:String = "";
      
      private var _rememberVerificationPassword:String = "";
      
      private var _emailText:String = "";
      
      public function EntranceView()
      {
         super();
      }
      
      public function showInviteForm() : void
      {
         this.changeViewTo(new Renamed559());
      }
      
      public function showLoginForm(param1:String, param2:Boolean, param3:Boolean, param4:String = null) : void
      {
         var _loc5_:LoginForm;
         (_loc5_ = this.injector.instantiate(LoginForm)).callsign = param1;
         if(param4)
         {
            _loc5_.password = param4;
         }
         _loc5_.enableRegistration = param2;
         this.changeViewTo(_loc5_);
         if(param3)
         {
            _loc5_.showCaptchaSection();
         }
      }
      
      public function showAlertServerIsHalt() : void
      {
         this.removeAllForms();
         alertService.showAlert(localeService.getText(TanksLocale.TEXT_SERVER_IS_RESTARTING_LOGIN_TEXT),Vector.<String>([localeService.getText(Renamed1616.OK)]));
      }
      
      public function showAlertServerIsFrozen() : void
      {
      }
      
      public function showExternalLoginForm(param1:String, param2:String, param3:Boolean) : void
      {
         var _loc4_:LinkExternalLoginForm;
         (_loc4_ = this.injector.instantiate(LinkExternalLoginForm)).callsign = param2;
         _loc4_.socialNetworkId = param1;
         this.changeViewTo(_loc4_);
         if(param3)
         {
            _loc4_.showCaptchaSection();
         }
      }
      
      public function showExternalRegistrationForm(param1:String) : void
      {
         this.injector.mapValue(EntranceView,this);
         var _loc2_:ExternalRegistrationForm = this.injector.instantiate(ExternalRegistrationForm);
         this.injector.injectInto(_loc2_);
         this.changeViewTo(_loc2_);
         this.injector.unmap(EntranceView);
      }
      
      public function showRegistrationForm(param1:Bitmap, param2:Boolean, param3:Boolean, param4:Boolean, param5:Boolean, param6:Boolean) : void
      {
         this.injector.mapValue(EntranceView,this);
         var _loc7_:RegistrationForm = new RegistrationForm(param6,param2,param3,param1,param4,param5,this._rememberCallsign,this._rememberPassword,this._rememberVerificationPassword,this._emailText);
         this.injector.injectInto(_loc7_);
         this.changeViewTo(_loc7_);
         this.injector.unmap(EntranceView);
      }
      
      public function showChangeEmailAndPassword(param1:String) : void
      {
         var _loc2_:Renamed558 = this.injector.instantiate(Renamed558);
         _loc2_.email = param1;
         this.changeViewTo(_loc2_);
      }
      
      public function showRecoveryHashIsWrongAlert() : void
      {
      }
      
      private function onWrongChangePasswordAlertButtonPressed(param1:AlertEvent) : void
      {
      }
      
      public function showRestorePasswordForm() : void
      {
         this.changeViewTo(this.injector.instantiate(PasswordRestoreForm));
      }
      
      public function showStandAloneCaptcha() : void
      {
         this.changeViewTo(this.injector.instantiate(StandAloneCaptchaForm));
      }
      
      public function showIfengForm() : void
      {
      }
      
      public function showPartnersRegistrationForm(param1:Bitmap, param2:Boolean) : void
      {
      }
      
      public function showPartnerLoginForm(param1:Bitmap, param2:Boolean) : void
      {
      }
      
      private function changeViewTo(param1:DisplayObject) : void
      {
         var _loc2_:RegistrationForm = null;
         if(this._currentView)
         {
            _loc2_ = this._currentView as RegistrationForm;
            if(_loc2_ != null)
            {
               this._rememberCallsign = _loc2_.callsign;
               this._rememberPassword = _loc2_.password;
               this._rememberVerificationPassword = _loc2_.verificationPassword;
               this._emailText = _loc2_.emailText;
            }
            removeChild(this._currentView);
         }
         this._currentView = param1;
         addChild(this._currentView);
      }
      
      public function removeAllForms() : void
      {
         while(numChildren > 0)
         {
            removeChildAt(0);
         }
      }
      
      public function get currentView() : DisplayObject
      {
         return this._currentView;
      }
      
      public function showConfirmEmailStatusAlert(param1:ConfirmEmailStatus) : void
      {
         this.alert = new Alert();
         switch(param1)
         {
            case ConfirmEmailStatus.ERROR:
               this.alert = new Alert(Alert.ERROR_CONFIRM_EMAIL);
               break;
            case ConfirmEmailStatus.OK:
               this.alert = new Alert(Alert.ALERT_CONFIRM_EMAIL);
               break;
            case ConfirmEmailStatus.OK_EXISTS:
               this.alert = new Alert(Alert.ALERT_CONFIRM_EMAIL);
         }
         this.alert.addEventListener(AlertEvent.ALERT_BUTTON_PRESSED,this.goToLoginAfterAlertClosed);
         this.changeViewTo(this.alert);
      }
      
      public function showErrorWindow(param1:int) : void
      {
         addChild(new Alert(param1));
      }
      
      public function showBlockAlert(param1:String) : void
      {
         this.alert = new Alert();
         this.alert.addEventListener(AlertEvent.ALERT_BUTTON_PRESSED,this.goToLoginAfterAlertClosed);
         this.alert.showAlert(param1,Vector.<String>([Renamed1616.OK]));
         this.changeViewTo(this.alert);
      }
      
      private function goToLoginAfterAlertClosed(param1:AlertEvent) : void
      {
         this.alert.removeEventListener(AlertEvent.ALERT_BUTTON_PRESSED,this.goToLoginAfterAlertClosed);
         this.showLoginForm("",true,false);
      }
      
      public function showKickAlert(param1:String, param2:int, param3:int, param4:int) : void
      {
         this.alert = new Alert();
         var _loc5_:String = localeService.getText(TextConst.STRING_YOU_WERE_KICKED_LOGIN_TEXT);
         this.alert.addEventListener(AlertEvent.ALERT_BUTTON_PRESSED,this.goToLoginAfterAlertClosed);
         _loc5_ = _loc5_.replace("{0}",param1);
         _loc5_ = _loc5_.replace("{1}",Renamed2271.Renamed3953(param2,param3,param4));
         this.alert.showAlert(_loc5_,Vector.<String>([Renamed1616.OK]));
         this.changeViewTo(this.alert);
      }
   }
}

