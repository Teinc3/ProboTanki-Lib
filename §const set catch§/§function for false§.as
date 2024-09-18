package §const set catch§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §function for false§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§>!=§;
      
      private var client:§try implements§;
      
      private var modelId:Long;
      
      public function §function for false§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §try implements§(this);
         this.modelId = Long.getLong(407046073,1894066655);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §>!=§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §7!!§
      {
         return §7!!§(initParams[Model.object]);
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

