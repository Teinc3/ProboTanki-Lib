package §6"N§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §]#A§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§[!"§;
      
      private var client:§null for break§;
      
      private var modelId:Long;
      
      private var §implements var override§:Long;
      
      private var §=!W§:ICodec;
      
      private var §for break§:Long;
      
      private var §dynamic var var§:ICodec;
      
      public function §]#A§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §null for break§(this);
         this.modelId = Long.getLong(1034700989,1212373553);
         this.§implements var override§ = Long.getLong(597053943,1126684268);
         this.§for break§ = Long.getLong(119287527,-1716930052);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §[!"§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §while set true§
      {
         return §while set true§(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§implements var override§:
               break;
            case this.§for break§:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

