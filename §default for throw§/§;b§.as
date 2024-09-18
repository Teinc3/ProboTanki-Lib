package §default for throw§
{
   import §2"X§.§[q§;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §;b§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§-K§;
      
      private var client:§8n§;
      
      private var modelId:Long;
      
      public function §;b§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §8n§(this);
         this.modelId = Long.getLong(1519945329,-715940911);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §-K§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §[q§
      {
         return §[q§(initParams[Model.object]);
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

