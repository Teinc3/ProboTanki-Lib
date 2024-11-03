package alternativa.tanks.servermodels.captcha
{
   import Renamed236.Renamed2178;
   import projects.tanks.client.entrance.model.entrance.captcha.CaptchaLocation;
   
   public interface IServerCaptcha
   {
      function bindFacade(param1:Renamed2178) : void;
      
      function unbindFacade() : void;
      
      function checkCaptcha(param1:String, param2:CaptchaLocation) : void;
      
      function getNewCaptcha(param1:CaptchaLocation) : void;
   }
}

