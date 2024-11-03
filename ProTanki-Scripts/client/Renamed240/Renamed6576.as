package Renamed4281
{
   import alternativa.tanks.servermodels.captcha.ServerCaptchaModel;
   import alternativa.types.Long;
   import Renamed385.Renamed4886;
   import projects.tanks.client.entrance.model.entrance.captcha.Renamed4279;
   
   public class Renamed6576 extends Renamed4886
   {
      private var Renamed6577:ServerCaptchaModel;
      
      public var modelId:int;
      
      public function Renamed6576()
      {
         super();
         this.modelId = 6;
         this.Renamed6577 = ServerCaptchaModel(modelRegistry.getModel(Long.getLong(0,300020005)));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed6569.Renamed6571:
               this.showCaptcha(param1);
               break;
            case Renamed6569.Renamed6573:
               this.captchaFailed(param1);
               break;
            case Renamed6569.Renamed6572:
               this.captchaCorrect(param1);
               break;
            case Renamed6569.Renamed5161:
               this.Renamed5162(param1);
         }
      }
      
      private function Renamed5162(param1:Object) : void
      {
         this.Renamed6577.putInitParams(new Renamed4279(param1.initParams));
         this.Renamed6577.objectLoaded();
      }
      
      private function showCaptcha(param1:Object) : void
      {
         this.Renamed6577.showCaptcha(param1.captchaLocation,param1.captchaData);
      }
      
      private function captchaFailed(param1:Object) : void
      {
         this.Renamed6577.captchaFailed(param1.captchaLocation,param1.newCaptcha);
      }
      
      private function captchaCorrect(param1:Object) : void
      {
         this.Renamed6577.captchaCorrect(param1.captchaLocation);
      }
   }
}

