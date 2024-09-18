package §`C§
{
   import alternativa.tanks.controller.events.CaptchaUpdatedEvent;
   import alternativa.tanks.servermodels.captcha.CaptchaParser;
   import alternativa.tanks.service.IEntranceServerFacade;
   import alternativa.tanks.service.§each const each§;
   import flash.display.Bitmap;
   import flash.utils.Dictionary;
   import org.robotlegs.mvcs.Actor;
   import projects.tanks.client.entrance.model.entrance.captcha.CaptchaLocation;
   
   public class §finally with§ extends Actor implements §each const each§
   {
      [Inject]
      public var serverFacade:IEntranceServerFacade;
      
      private var §0#s§:Dictionary;
      
      private var §const package dynamic§:Dictionary;
      
      public function §finally with§()
      {
         this.§0#s§ = new Dictionary();
         this.§const package dynamic§ = new Dictionary();
         super();
      }
      
      public function §3"7§(param1:CaptchaLocation, param2:String, param3:Function) : void
      {
         this.§0#s§[param1] = param3;
         this.serverFacade.checkCaptcha(param2,param1);
      }
      
      public function §catch const function§(param1:CaptchaLocation) : void
      {
         this.§0#s§[param1].apply();
      }
      
      public function §default package native§(param1:Vector.<int>, param2:CaptchaLocation) : void
      {
         this.§const package dynamic§[param2] = true;
         CaptchaParser.parse(param1,this.§get set true§,param2);
      }
      
      private function §get set true§(param1:Bitmap, param2:CaptchaLocation) : void
      {
         switch(param2)
         {
            case CaptchaLocation.CLIENT_STARTUP:
               dispatch(new CaptchaUpdatedEvent(CaptchaUpdatedEvent.STAND_ALONE_CAPTCHA_UPDATED,param1));
               break;
            case CaptchaLocation.LOGIN_FORM:
               dispatch(new CaptchaUpdatedEvent(CaptchaUpdatedEvent.LOGIN_FORM_CAPTCHA_UPDATED,param1));
               break;
            case CaptchaLocation.REGISTER_FORM:
               dispatch(new CaptchaUpdatedEvent(CaptchaUpdatedEvent.REGISTRATION_FORM_CAPTCHA_UPDATED,param1));
               break;
            case CaptchaLocation.RESTORE_PASSWORD_FORM:
               dispatch(new CaptchaUpdatedEvent(CaptchaUpdatedEvent.RESTORE_PASSWORD_FORM_CAPTCHA_UPDATED,param1));
         }
      }
      
      public function get loginCaptchaEnabled() : Boolean
      {
         return Boolean(this.§const package dynamic§[CaptchaLocation.LOGIN_FORM]);
      }
   }
}

