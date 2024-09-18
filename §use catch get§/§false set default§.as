package §use catch get§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §false set default§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§1#i§;
      
      private var client:§extends const in§;
      
      private var modelId:Long;
      
      public function §false set default§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §extends const in§(this);
         this.modelId = Long.getLong(551471937,-1281432907);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §1#i§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §false each§
      {
         return §false each§(initParams[Model.object]);
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

