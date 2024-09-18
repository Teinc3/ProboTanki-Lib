package projects.tanks.client.garage.models.item.category
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class ItemCategoryModelBase extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:ItemCategoryModelServer;
      
      private var client:IItemCategoryModelBase;
      
      private var modelId:Long;
      
      public function ItemCategoryModelBase()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = IItemCategoryModelBase(this);
         this.modelId = Long.getLong(492245786,-1837686060);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new ItemCategoryModelServer(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : ItemCategoryCC
      {
         return ItemCategoryCC(initParams[Model.object]);
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

