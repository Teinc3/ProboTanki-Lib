package projects.tanks.client.garage.models.item.object3ds
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Object3DSModelBase extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Object3DSModelServer;
      
      private var client:IObject3DSModelBase;
      
      private var modelId:Long;
      
      public function Object3DSModelBase()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = IObject3DSModelBase(this);
         this.modelId = Long.getLong(1497301838,-1092921347);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Object3DSModelServer(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Object3DSCC
      {
         return Object3DSCC(initParams[Model.object]);
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

