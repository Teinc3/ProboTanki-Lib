package §extends var default§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §dynamic var finally§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§8#Y§;
      
      private var client:§true catch function§;
      
      private var modelId:Long;
      
      public function §dynamic var finally§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §true catch function§(this);
         this.modelId = Long.getLong(2087671478,1672369054);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §8#Y§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §do package do§
      {
         return §do package do§(initParams[Model.object]);
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

