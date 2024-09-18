package §>!X§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §case catch catch§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§@^§;
      
      private var client:§continue package with§;
      
      private var modelId:Long;
      
      public function §case catch catch§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §continue package with§(this);
         this.modelId = Long.getLong(1907120794,-320511521);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §@^§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §in each§
      {
         return §in each§(initParams[Model.object]);
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

