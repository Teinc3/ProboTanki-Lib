package alternativa.tanks.servermodels.captcha
{
   import Renamed236.Renamed2178;
   import projects.tanks.client.entrance.model.entrance.captcha.Renamed3545;
   import projects.tanks.client.entrance.model.entrance.captcha.Renamed3546;
   import projects.tanks.client.entrance.model.entrance.captcha.CaptchaLocation;
   
   public class ServerCaptchaModel extends Renamed3546 implements Renamed3545, IServerCaptcha
   {
      private var clientFacade:Renamed2178;
      
      private var Renamed3547:Vector.<CaptchaLocation>;
      
      public function ServerCaptchaModel()
      {
         super();
      }
      
      public function showCaptcha(param1:CaptchaLocation, param2:Vector.<int>) : void
      {
         this.clientFacade.Renamed2210(param1,param2);
      }
      
      public function captchaCorrect(param1:CaptchaLocation) : void
      {
         this.clientFacade.Renamed2214(param1);
      }
      
      public function captchaFailed(param1:CaptchaLocation, param2:Vector.<int>) : void
      {
         this.clientFacade.Renamed2216(param1,param2);
      }
      
      public function checkCaptcha(param1:String, param2:CaptchaLocation) : void
      {
         server.checkCaptcha(param2,param1);
      }
      
      public function getNewCaptcha(param1:CaptchaLocation) : void
      {
         server.getNewCaptcha(param1);
      }
      
      public function objectLoaded() : void
      {
         this.Renamed3547 = getInitParam().Renamed3548;
      }
      
      public function bindFacade(param1:Renamed2178) : void
      {
         this.clientFacade = param1;
         param1.Renamed2213(this.Renamed3547);
      }
      
      public function unbindFacade() : void
      {
         this.clientFacade = null;
      }
   }
}

