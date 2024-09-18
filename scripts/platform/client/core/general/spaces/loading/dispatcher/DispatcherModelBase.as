package platform.client.core.general.spaces.loading.dispatcher
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.core.general.spaces.loading.dispatcher.types.ObjectsData;
   import platform.client.core.general.spaces.loading.dispatcher.types.ObjectsDependencies;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class DispatcherModelBase extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:DispatcherModelServer;
      
      private var client:IDispatcherModelBase;
      
      private var modelId:Long;
      
      private var _loadDependenciesId:Long;
      
      private var _loadDependencies_dependenciesCodec:ICodec;
      
      private var _loadObjectsDataId:Long;
      
      private var _loadObjectsData_objectsDataCodec:ICodec;
      
      private var _unloadObjectsId:Long;
      
      private var _unloadObjects_objectsCodec:ICodec;
      
      public function DispatcherModelBase()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = IDispatcherModelBase(this);
         this.modelId = Long.getLong(191355032,163351191);
         this._loadDependenciesId = Long.getLong(748816660,1488436371);
         this._loadObjectsDataId = Long.getLong(1779039460,1862164506);
         this._unloadObjectsId = Long.getLong(2104499555,54326167);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new DispatcherModelServer(IModel(this));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this._loadDependenciesId:
               this.client.loadDependencies(ObjectsDependencies(this._loadDependencies_dependenciesCodec.decode(param2)));
               break;
            case this._loadObjectsDataId:
               this.client.loadObjectsData(ObjectsData(this._loadObjectsData_objectsDataCodec.decode(param2)));
               break;
            case this._unloadObjectsId:
               this.client.unloadObjects(this._unloadObjects_objectsCodec.decode(param2) as Vector.<IGameObject>);
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

