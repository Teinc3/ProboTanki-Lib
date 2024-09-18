package §-Q§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §false const switch§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§8"b§;
      
      private var client:§,!P§;
      
      private var modelId:Long;
      
      public function §false const switch§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §,!P§(this);
         this.modelId = Long.getLong(2117558336,-406639565);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §8"b§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §do set package§
      {
         return §do set package§(initParams[Model.object]);
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

