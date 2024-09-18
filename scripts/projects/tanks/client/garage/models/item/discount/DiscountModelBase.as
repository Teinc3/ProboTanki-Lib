package projects.tanks.client.garage.models.item.discount
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class DiscountModelBase extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:DiscountModelServer;
      
      private var client:IDiscountModelBase;
      
      private var modelId:Long;
      
      public function DiscountModelBase()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = IDiscountModelBase(this);
         this.modelId = Long.getLong(687238537,2002147897);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new DiscountModelServer(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : DiscountCC
      {
         return DiscountCC(initParams[Model.object]);
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

