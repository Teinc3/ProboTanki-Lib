package §try const package§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §include var continue§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§case const false§;
      
      private var client:§each var import§;
      
      private var modelId:Long;
      
      public function §include var continue§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §each var import§(this);
         this.modelId = Long.getLong(1486543535,-1939817925);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §case const false§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §""b§
      {
         return §""b§(initParams[Model.object]);
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

