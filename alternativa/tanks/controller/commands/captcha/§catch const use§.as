package alternativa.tanks.controller.commands.captcha
{
   import alternativa.tanks.controller.events.CheckCaptchaAnswerEvent;
   import alternativa.tanks.service.§each const each§;
   import org.robotlegs.mvcs.Command;
   
   public class §catch const use§ extends Command
   {
      [Inject]
      public var captchaService:§each const each§;
      
      [Inject]
      public var event:CheckCaptchaAnswerEvent;
      
      public function §catch const use§()
      {
         super();
      }
      
      override public function execute() : void
      {
         commandMap.detain(this);
         this.captchaService.§3"7§(this.event.location,this.event.captchaAnswer,this.§switch package if§);
      }
      
      private function §switch package if§() : void
      {
         commandMap.release(this);
         dispatch(this.event.onSuccessEvent);
      }
   }
}

