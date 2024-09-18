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
   
   public class §3#n§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§]G§;
      
      private var client:§'"p§;
      
      private var modelId:Long;
      
      private var §implements catch false§:Long;
      
      private var §throw catch dynamic§:ICodec;
      
      private var §&#e§:Long;
      
      private var §class const do§:ICodec;
      
      private var §;'§:ICodec;
      
      private var §default var else§:Long;
      
      private var §>=§:ICodec;
      
      private var §^!y§:ICodec;
      
      public function §3#n§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §'"p§(this);
         this.modelId = Long.getLong(0,300020005);
         this.§implements catch false§ = Long.getLong(0,300020004);
         this.§&#e§ = Long.getLong(0,300020005);
         this.§default var else§ = Long.getLong(0,300020006);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §]G§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §try package try§
      {
         return §try package try§(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§implements catch false§:
               this.client.captchaCorrect(CaptchaLocation(this.§throw catch dynamic§.decode(param2)));
               break;
            case this.§&#e§:
               this.client.captchaFailed(CaptchaLocation(this.§class const do§.decode(param2)),this.§;'§.decode(param2) as Vector.<int>);
               break;
            case this.§default var else§:
               this.client.showCaptcha(CaptchaLocation(this.§>=§.decode(param2)),this.§^!y§.decode(param2) as Vector.<int>);
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

