package §"!4§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §for const case§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§do const catch§;
      
      private var client:§"s§;
      
      private var modelId:Long;
      
      public function §for const case§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §"s§(this);
         this.modelId = Long.getLong(1500686585,-1760437566);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §do const catch§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §!!j§
      {
         return §!!j§(initParams[Model.object]);
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

