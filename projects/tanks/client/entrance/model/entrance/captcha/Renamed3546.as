package projects.tanks.client.entrance.model.entrance.captcha
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Renamed3546 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed4270;
      
      private var client:Renamed3545;
      
      private var modelId:Long;
      
      private var Renamed4271:Long;
      
      private var Renamed4272:ICodec;
      
      private var Renamed4273:Long;
      
      private var Renamed4274:ICodec;
      
      private var Renamed4275:ICodec;
      
      private var Renamed4276:Long;
      
      private var Renamed4277:ICodec;
      
      private var Renamed4278:ICodec;
      
      public function Renamed3546()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed3545(this);
         this.modelId = Long.getLong(0,300020005);
         this.Renamed4271 = Long.getLong(0,300020004);
         this.Renamed4273 = Long.getLong(0,300020005);
         this.Renamed4276 = Long.getLong(0,300020006);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed4270(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Renamed4279
      {
         return Renamed4279(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed4271:
               this.client.captchaCorrect(CaptchaLocation(this.Renamed4272.decode(param2)));
               break;
            case this.Renamed4273:
               this.client.captchaFailed(CaptchaLocation(this.Renamed4274.decode(param2)),this.Renamed4275.decode(param2) as Vector.<int>);
               break;
            case this.Renamed4276:
               this.client.showCaptcha(CaptchaLocation(this.Renamed4277.decode(param2)),this.Renamed4278.decode(param2) as Vector.<int>);
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

