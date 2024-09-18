package §in var var§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §for static§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§"#x§;
      
      private var client:§<!V§;
      
      private var modelId:Long;
      
      private var §default catch while§:Long;
      
      public function §for static§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §<!V§(this);
         this.modelId = Long.getLong(0,300020028);
         this.§default catch while§ = Long.getLong(0,300020068);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §"#x§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §include set while§
      {
         return §include set while§(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§default catch while§:
               this.client.serverHalt();
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

