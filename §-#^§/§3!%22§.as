package §-#^§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §3!"§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§@#q§;
      
      private var client:§,e§;
      
      private var modelId:Long;
      
      public function §3!"§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §,e§(this);
         this.modelId = Long.getLong(196518382,153197781);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §@#q§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §false catch true§
      {
         return §false catch true§(initParams[Model.object]);
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

