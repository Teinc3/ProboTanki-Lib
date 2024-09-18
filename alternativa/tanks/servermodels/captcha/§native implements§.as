package alternativa.tanks.servermodels.captcha
{
   import §2!8§.§]"9§;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.entrance.model.entrance.captcha.CaptchaLocation;
   
   public class §native implements§ implements IServerCaptcha
   {
      private var object:IGameObject;
      
      private var impl:IServerCaptcha;
      
      public function §native implements§(param1:IGameObject, param2:IServerCaptcha)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function bindFacade(param1:§]"9§) : void
      {
         var captchaFacade:§]"9§ = param1;
         try
         {
            Model.object = this.object;
            this.impl.bindFacade(captchaFacade);
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function unbindFacade() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.unbindFacade();
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function checkCaptcha(param1:String, param2:CaptchaLocation) : void
      {
         var answer:String = param1;
         var location:CaptchaLocation = param2;
         try
         {
            Model.object = this.object;
            this.impl.checkCaptcha(answer,location);
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function getNewCaptcha(param1:CaptchaLocation) : void
      {
         var location:CaptchaLocation = param1;
         try
         {
            Model.object = this.object;
            this.impl.getNewCaptcha(location);
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

