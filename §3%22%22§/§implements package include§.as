package §3""§
{
   import alternativa.tanks.servermodels.captcha.ServerCaptchaModel;
   import alternativa.types.Long;
   import §if try§.§return package if§;
   import projects.tanks.client.entrance.model.entrance.captcha.§try package try§;
   
   public class §implements package include§ extends §return package if§
   {
      private var §include each§:ServerCaptchaModel;
      
      public var modelId:int;
      
      public function §implements package include§()
      {
         super();
         this.modelId = 6;
         this.§include each§ = ServerCaptchaModel(modelRegistry.getModel(Long.getLong(0,300020005)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case §3"K§.§7!#§:
               this.showCaptcha(param1);
               break;
            case §3"K§.§set continue§:
               this.captchaFailed(param1);
               break;
            case §3"K§.§;#b§:
               this.captchaCorrect(param1);
               break;
            case §3"K§.§;!K§:
               this.§`#%§(param1);
         }
      }
      
      private function §`#%§(param1:Object) : void
      {
         this.§include each§.putInitParams(new §try package try§(param1.initParams));
         this.§include each§.objectLoaded();
      }
      
      private function showCaptcha(param1:Object) : void
      {
         this.§include each§.showCaptcha(param1.captchaLocation,param1.captchaData);
      }
      
      private function captchaFailed(param1:Object) : void
      {
         this.§include each§.captchaFailed(param1.captchaLocation,param1.newCaptcha);
      }
      
      private function captchaCorrect(param1:Object) : void
      {
         this.§include each§.captchaCorrect(param1.captchaLocation);
      }
   }
}

