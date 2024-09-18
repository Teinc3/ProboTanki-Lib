package alternativa.tanks.controller.commands.captcha
{
   import alternativa.tanks.controller.events.CheckCaptchaAnswerEvent;
   import alternativa.tanks.controller.events.LoginEvent;
   import alternativa.tanks.service.§each const each§;
   import org.robotlegs.mvcs.Command;
   import projects.tanks.client.entrance.model.entrance.captcha.CaptchaLocation;
   
   public class CheckLoginFormCaptchaCommand extends Command
   {
      [Inject]
      public var captchaService:§each const each§;
      
      [Inject]
      public var event:LoginEvent;
      
      public function CheckLoginFormCaptchaCommand()
      {
         super();
      }
      
      override public function execute() : void
      {
         var _loc1_:LoginEvent = new LoginEvent(LoginEvent.LOGIN_AFTER_CAPTCHA_CHECKED,this.event.callsign,this.event.password,this.event.rememberMe,this.event.captchaAnswer);
         if(this.captchaService.loginCaptchaEnabled)
         {
            dispatch(new CheckCaptchaAnswerEvent(this.event.captchaAnswer,CaptchaLocation.LOGIN_FORM,_loc1_));
         }
         else
         {
            dispatch(_loc1_);
         }
      }
   }
}

