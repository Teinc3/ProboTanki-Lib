package §catch var function§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §@"#§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§switch set super§;
      
      private var client:§import set case§;
      
      private var modelId:Long;
      
      public function §@"#§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §import set case§(this);
         this.modelId = Long.getLong(520601216,-983741199);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §switch set super§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §>@§
      {
         return §>@§(initParams[Model.object]);
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

