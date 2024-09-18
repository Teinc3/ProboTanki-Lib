package alternativa.tanks.servermodels.captcha
{
   import §2!8§.§]"9§;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.entrance.model.entrance.captcha.CaptchaLocation;
   
   public class §9J§ implements IServerCaptcha
   {
      private var object:IGameObject;
      
      private var impl:Vector.<IServerCaptcha>;
      
      public function §9J§(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<IServerCaptcha>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function bindFacade(param1:§]"9§) : void
      {
         var i:int = 0;
         var m:IServerCaptcha = null;
         var captchaFacade:§]"9§ = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.bindFacade(captchaFacade);
               i++;
            }
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function unbindFacade() : void
      {
         var i:int = 0;
         var m:IServerCaptcha = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.unbindFacade();
               i++;
            }
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function checkCaptcha(param1:String, param2:CaptchaLocation) : void
      {
         var i:int = 0;
         var m:IServerCaptcha = null;
         var answer:String = param1;
         var location:CaptchaLocation = param2;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.checkCaptcha(answer,location);
               i++;
            }
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function getNewCaptcha(param1:CaptchaLocation) : void
      {
         var i:int = 0;
         var m:IServerCaptcha = null;
         var location:CaptchaLocation = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.getNewCaptcha(location);
               i++;
            }
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

