package §@$ §
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §%#O§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§each var§;
      
      private var client:§?#4§;
      
      private var modelId:Long;
      
      public function §%#O§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §?#4§(this);
         this.modelId = Long.getLong(1092696378,-225264163);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §each var§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §for var finally§
      {
         return §for var finally§(initParams[Model.object]);
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

