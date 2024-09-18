package alternativa.tanks.controller.commands.captcha
{
   import alternativa.tanks.controller.events.CheckCaptchaAnswerEvent;
   import alternativa.tanks.service.Renamed554;
   import org.robotlegs.mvcs.Command;
   
   public class Renamed551 extends Command
   {
      [Inject]
      public var captchaService:Renamed554;
      
      [Inject]
      public var event:CheckCaptchaAnswerEvent;
      
      public function Renamed551()
      {
         super();
      }
      
      override public function execute() : void
      {
         commandMap.detain(this);
         this.captchaService.Renamed1573(this.event.location,this.event.captchaAnswer,this.Renamed1574);
      }
      
      private function Renamed1574() : void
      {
         commandMap.release(this);
         dispatch(this.event.onSuccessEvent);
      }
   }
}

