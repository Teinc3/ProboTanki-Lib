package §["U§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §var package each§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§case package in§;
      
      private var client:§throw const with§;
      
      private var modelId:Long;
      
      public function §var package each§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §throw const with§(this);
         this.modelId = Long.getLong(253893127,1551357191);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §case package in§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §class const dynamic§
      {
         return §class const dynamic§(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         if(Boolean(0))
         {
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

