package §do static§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §[!H§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§@#s§;
      
      private var client:§native const try§;
      
      private var modelId:Long;
      
      public function §[!H§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §native const try§(this);
         this.modelId = Long.getLong(113911774,-312236140);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §@#s§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §0!1§
      {
         return §0!1§(initParams[Model.object]);
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

