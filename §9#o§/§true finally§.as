package §9#o§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §true finally§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§throw catch package§;
      
      private var client:§+!l§;
      
      private var modelId:Long;
      
      public function §true finally§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §+!l§(this);
         this.modelId = Long.getLong(179431987,214974876);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §throw catch package§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §switch const native§
      {
         return §switch const native§(initParams[Model.object]);
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

