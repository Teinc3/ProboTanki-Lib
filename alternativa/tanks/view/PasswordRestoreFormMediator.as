package alternativa.tanks.view
{
   import alternativa.tanks.controller.events.CaptchaAnswerIsIncorrectEvent;
   import alternativa.tanks.controller.events.CaptchaUpdatedEvent;
   import alternativa.tanks.controller.events.CheckCaptchaAnswerEvent;
   import alternativa.tanks.controller.events.GetNewCaptchaEvent;
   import alternativa.tanks.controller.events.NavigationEvent;
   import alternativa.tanks.controller.events.PasswordRestoreCaptchaEvent;
   import alternativa.tanks.controller.events.PasswordRestoreResultEvent;
   import alternativa.tanks.view.events.RefreshCaptchaClickedEvent;
   import alternativa.tanks.view.events.SendRestoreEmailMessageEvent;
   import alternativa.tanks.view.forms.PasswordRestoreForm;
   import org.robotlegs.mvcs.Mediator;
   import projects.tanks.client.entrance.model.entrance.captcha.CaptchaLocation;
   
   public class PasswordRestoreFormMediator extends Mediator
   {
      [Inject]
      public var view:PasswordRestoreForm;
      
      public function PasswordRestoreFormMediator()
      {
         super();
      }
      
      override public function onRegister() : void
      {
         addViewListener(PasswordRestoreCaptchaEvent.CAPTCHA,this.§!]§,PasswordRestoreCaptchaEvent);
         addViewListener(NavigationEvent.GO_TO_LOGIN_FORM,dispatch,NavigationEvent);
         addViewListener(RefreshCaptchaClickedEvent.CLICKED,this.onRefreshCaptchaClicked,RefreshCaptchaClickedEvent);
         addContextListener(PasswordRestoreResultEvent.EMAIL_DOES_NOT_EXISTS,this.onEmailDoesNotExists,PasswordRestoreResultEvent);
         addContextListener(PasswordRestoreResultEvent.RESTORE_MESSAGE_HAVE_BEEN_SENT,this.onMessageHaveBeenSent,PasswordRestoreResultEvent);
         addContextListener(CaptchaUpdatedEvent.RESTORE_PASSWORD_FORM_CAPTCHA_UPDATED,this.onCaptchaUpdated,CaptchaUpdatedEvent);
         addContextListener(CaptchaAnswerIsIncorrectEvent.EVENT_TYPE,this.onCaptchaFailed);
      }
      
      private function §!]§(param1:PasswordRestoreCaptchaEvent) : void
      {
         var _loc2_:SendRestoreEmailMessageEvent = new SendRestoreEmailMessageEvent(param1.getEmail());
         dispatch(new CheckCaptchaAnswerEvent(param1.§#"b§(),CaptchaLocation.RESTORE_PASSWORD_FORM,_loc2_));
      }
      
      private function onMessageHaveBeenSent(param1:PasswordRestoreResultEvent) : void
      {
         this.view.statusOkRestoreEmail();
      }
      
      private function onEmailDoesNotExists(param1:PasswordRestoreResultEvent) : void
      {
         this.view.statusMailNotFoundRestoreEmail();
      }
      
      private function onCaptchaFailed(param1:CaptchaAnswerIsIncorrectEvent) : void
      {
         this.view.captchaFailed();
      }
      
      private function onRefreshCaptchaClicked(param1:RefreshCaptchaClickedEvent) : void
      {
         dispatch(new GetNewCaptchaEvent(CaptchaLocation.RESTORE_PASSWORD_FORM));
      }
      
      private function onCaptchaUpdated(param1:CaptchaUpdatedEvent) : void
      {
         this.view.captchaImage = param1.image;
      }
   }
}

