package §>u§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §[Q§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§extends catch static§;
      
      private var client:§var for var§;
      
      private var modelId:Long;
      
      public function §[Q§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §var for var§(this);
         this.modelId = Long.getLong(1129811198,-16275595);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §extends catch static§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §>"M§
      {
         return §>"M§(initParams[Model.object]);
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

