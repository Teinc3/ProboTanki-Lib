package alternativa.tanks.servermodels.captcha
{
   import §2!8§.§]"9§;
   import projects.tanks.client.entrance.model.entrance.captcha.§'"p§;
   import projects.tanks.client.entrance.model.entrance.captcha.§3#n§;
   import projects.tanks.client.entrance.model.entrance.captcha.CaptchaLocation;
   
   public class ServerCaptchaModel extends §3#n§ implements §'"p§, IServerCaptcha
   {
      private var clientFacade:§]"9§;
      
      private var §+!#§:Vector.<CaptchaLocation>;
      
      public function ServerCaptchaModel()
      {
         super();
      }
      
      public function showCaptcha(param1:CaptchaLocation, param2:Vector.<int>) : void
      {
         this.clientFacade.§5#C§(param1,param2);
      }
      
      public function captchaCorrect(param1:CaptchaLocation) : void
      {
         this.clientFacade.§false var return§(param1);
      }
      
      public function captchaFailed(param1:CaptchaLocation, param2:Vector.<int>) : void
      {
         this.clientFacade.§!#!§(param1,param2);
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
         this.§+!#§ = getInitParam().§if final§;
      }
      
      public function bindFacade(param1:§]"9§) : void
      {
         this.clientFacade = param1;
         param1.§""Q§(this.§+!#§);
      }
      
      public function unbindFacade() : void
      {
         this.clientFacade = null;
      }
   }
}

