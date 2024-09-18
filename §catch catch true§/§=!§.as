package §catch catch true§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §=!§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§super for for§;
      
      private var client:§super const default§;
      
      private var modelId:Long;
      
      public function §=!§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §super const default§(this);
         this.modelId = Long.getLong(1099120188,-904226430);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §super for for§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §implements const with§
      {
         return §implements const with§(initParams[Model.object]);
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

