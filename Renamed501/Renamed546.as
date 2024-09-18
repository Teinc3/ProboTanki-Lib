package Renamed501
{
   import alternativa.tanks.controller.events.CaptchaUpdatedEvent;
   import alternativa.tanks.servermodels.captcha.CaptchaParser;
   import alternativa.tanks.service.IEntranceServerFacade;
   import alternativa.tanks.service.Renamed554;
   import flash.display.Bitmap;
   import flash.utils.Dictionary;
   import org.robotlegs.mvcs.Actor;
   import projects.tanks.client.entrance.model.entrance.captcha.CaptchaLocation;
   
   public class Renamed546 extends Actor implements Renamed554
   {
      [Inject]
      public var serverFacade:IEntranceServerFacade;
      
      private var Renamed9866:Dictionary;
      
      private var Renamed9867:Dictionary;
      
      public function Renamed546()
      {
         this.Renamed9866 = new Dictionary();
         this.Renamed9867 = new Dictionary();
         super();
      }
      
      public function Renamed1573(param1:CaptchaLocation, param2:String, param3:Function) : void
      {
         this.Renamed9866[param1] = param3;
         this.serverFacade.checkCaptcha(param2,param1);
      }
      
      public function Renamed3605(param1:CaptchaLocation) : void
      {
         this.Renamed9866[param1].apply();
      }
      
      public function Renamed3606(param1:Vector.<int>, param2:CaptchaLocation) : void
      {
         this.Renamed9867[param2] = true;
         CaptchaParser.parse(param1,this.Renamed2211,param2);
      }
      
      private function Renamed2211(param1:Bitmap, param2:CaptchaLocation) : void
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
         return Boolean(this.Renamed9867[CaptchaLocation.LOGIN_FORM]);
      }
   }
}

