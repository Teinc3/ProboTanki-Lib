package projects.tanks.client.garage.models.item.view
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class ItemViewCategoryModelBase extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:ItemViewCategoryModelServer;
      
      private var client:IItemViewCategoryModelBase;
      
      private var modelId:Long;
      
      public function ItemViewCategoryModelBase()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = IItemViewCategoryModelBase(this);
         this.modelId = Long.getLong(1424296501,-807048170);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new ItemViewCategoryModelServer(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : ItemViewCategoryCC
      {
         return ItemViewCategoryCC(initParams[Model.object]);
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

