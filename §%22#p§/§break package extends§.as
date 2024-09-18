package §"#p§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §break package extends§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§const use§;
      
      private var client:§set for override§;
      
      private var modelId:Long;
      
      private var §case for if§:Long;
      
      private var §-!q§:ICodec;
      
      private var §?!k§:ICodec;
      
      private var §##Y§:ICodec;
      
      private var §`=§:ICodec;
      
      public function §break package extends§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §set for override§(this);
         this.modelId = Long.getLong(0,300050019);
         this.§case for if§ = Long.getLong(0,300050018);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §const use§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §each for else§
      {
         return §each for else§(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§case for if§:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

