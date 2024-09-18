package alternativa.tanks.servermodels.captcha
{
   import §2!8§.§]"9§;
   import projects.tanks.client.entrance.model.entrance.captcha.CaptchaLocation;
   
   public interface IServerCaptcha
   {
      function bindFacade(param1:§]"9§) : void;
      
      function unbindFacade() : void;
      
      function checkCaptcha(param1:String, param2:CaptchaLocation) : void;
      
      function getNewCaptcha(param1:CaptchaLocation) : void;
   }
}

