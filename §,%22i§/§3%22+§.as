package §,"i§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §3"+§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§get for include§;
      
      private var client:§static var get§;
      
      private var modelId:Long;
      
      public function §3"+§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §static var get§(this);
         this.modelId = Long.getLong(1190039526,-1224288945);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §get for include§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §7!j§
      {
         return §7!j§(initParams[Model.object]);
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

