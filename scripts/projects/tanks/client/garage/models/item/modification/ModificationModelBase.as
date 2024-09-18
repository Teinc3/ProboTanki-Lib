package projects.tanks.client.garage.models.item.modification
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class ModificationModelBase extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:ModificationModelServer;
      
      private var client:IModificationModelBase;
      
      private var modelId:Long;
      
      public function ModificationModelBase()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = IModificationModelBase(this);
         this.modelId = Long.getLong(580825858,-1941731225);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new ModificationModelServer(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : ModificationCC
      {
         return ModificationCC(initParams[Model.object]);
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

