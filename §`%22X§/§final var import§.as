package §`"X§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §final var import§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§6!e§;
      
      private var client:§function const import§;
      
      private var modelId:Long;
      
      public function §final var import§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §function const import§(this);
         this.modelId = Long.getLong(1742678945,1383804656);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §6!e§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §4"e§
      {
         return §4"e§(initParams[Model.object]);
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

