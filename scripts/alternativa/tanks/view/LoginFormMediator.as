package alternativa.tanks.view
{
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.tanks.controller.events.AuthorizationFailedEvent;
   import alternativa.tanks.controller.events.CaptchaAnswerIsIncorrectEvent;
   import alternativa.tanks.controller.events.CaptchaUpdatedEvent;
   import alternativa.tanks.controller.events.GetNewCaptchaEvent;
   import alternativa.tanks.controller.events.LoginButtonPressed;
   import alternativa.tanks.controller.events.LoginEvent;
   import alternativa.tanks.controller.events.NavigationEvent;
   import alternativa.tanks.controller.events.socialnetwork.StartExternalEntranceEvent;
   import alternativa.tanks.view.events.RefreshCaptchaClickedEvent;
   import alternativa.tanks.view.forms.LoginForm;
   import org.robotlegs.core.IInjector;
   import org.robotlegs.mvcs.Mediator;
   import projects.tanks.client.entrance.model.entrance.captcha.CaptchaLocation;
   
   public class LoginFormMediator extends Mediator
   {
      [Inject]
      public static var clientLog:IClientLog;
      
      private static const GA_CATEGORY:String = "entrance";
      
      [Inject]
      public var view:LoginForm;
      
      [Inject]
      public var injector:IInjector;
      
      public function LoginFormMediator()
      {
         super();
      }
      
      override public function onRegister() : void
      {
         this.injector.injectInto(this.view);
         addViewListener(RefreshCaptchaClickedEvent.CLICKED,this.onRefreshCaptchaClicked,RefreshCaptchaClickedEvent);
         addViewListener(LoginButtonPressed.EVENT_TYPE,this.onLoginClicked,LoginButtonPressed);
         addViewListener(NavigationEvent.GO_TO_REGISTRATION_FORM,dispatch,NavigationEvent);
         addViewListener(NavigationEvent.GO_TO_RESTORE_PASSWORD_FORM,dispatch,NavigationEvent);
         addViewListener(StartExternalEntranceEvent.START_LOGIN,this.dispatchStartExternalLogin,StartExternalEntranceEvent);
         addContextListener(AuthorizationFailedEvent.PASSWORD_AUTHORIZATION_FAILED,this.onPasswordAuthorizationFailed,AuthorizationFailedEvent);
         addContextListener(CaptchaUpdatedEvent.LOGIN_FORM_CAPTCHA_UPDATED,this.onCaptchaUpdated,CaptchaUpdatedEvent);
         addContextListener(CaptchaAnswerIsIncorrectEvent.EVENT_TYPE,this.onCaptchaFailed);
      }
      
      private function onCaptchaFailed(param1:CaptchaAnswerIsIncorrectEvent) : void
      {
         this.view.captchaFailed();
      }
      
      private function onRefreshCaptchaClicked(param1:RefreshCaptchaClickedEvent) : void
      {
         dispatch(new GetNewCaptchaEvent(CaptchaLocation.LOGIN_FORM));
      }
      
      private function onLoginClicked(param1:LoginButtonPressed) : void
      {
         dispatch(new LoginEvent(LoginEvent.CHECK_CAPTCHA_AND_LOGIN,this.view.callsign,this.view.password,this.view.rememberMe,this.view.captchaAnswer));
      }
      
      private function dispatchStartExternalLogin(param1:StartExternalEntranceEvent) : void
      {
         dispatch(param1);
      }
      
      private function onCaptchaUpdated(param1:CaptchaUpdatedEvent) : void
      {
         this.view.showCaptchaSection();
         this.view.captchaImage = param1.image;
      }
      
      private function onPasswordAuthorizationFailed(param1:AuthorizationFailedEvent) : void
      {
         this.view.alertAboutWrongPassword();
      }
   }
}

