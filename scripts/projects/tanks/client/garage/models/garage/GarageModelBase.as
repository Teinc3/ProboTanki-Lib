package projects.tanks.client.garage.models.garage
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.client.fp10.core.type.IGameObject;
   
   public class GarageModelBase extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:GarageModelServer;
      
      private var client:IGarageModelBase;
      
      private var modelId:Long;
      
      private var _initDepotId:Long;
      
      private var _initDepot_itemsOnDepotCodec:ICodec;
      
      private var _initMarketId:Long;
      
      private var _initMarket_itemsOnMarketCodec:ICodec;
      
      private var _initMountedId:Long;
      
      private var _initMounted_mountedItemsCodec:ICodec;
      
      private var _reloadGarageId:Long;
      
      private var _reloadGarage_messageCodec:ICodec;
      
      private var _reloadGarage_totalCrystalsCodec:ICodec;
      
      private var _selectId:Long;
      
      private var _select_itemToSelectCodec:ICodec;
      
      private var _selectFirstItemInDepotId:Long;
      
      public function GarageModelBase()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = IGarageModelBase(this);
         this.modelId = Long.getLong(0,300040010);
         this._initDepotId = Long.getLong(0,300040005);
         this._initMarketId = Long.getLong(0,300040006);
         this._initMountedId = Long.getLong(0,300040007);
         this._reloadGarageId = Long.getLong(0,300040008);
         this._selectId = Long.getLong(0,300040009);
         this._selectFirstItemInDepotId = Long.getLong(0,300040010);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new GarageModelServer(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : GarageModelCC
      {
         return GarageModelCC(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this._initDepotId:
               this.client.initDepot(this._initDepot_itemsOnDepotCodec.decode(param2) as Vector.<IGameObject>);
               break;
            case this._initMarketId:
               this.client.initMarket(this._initMarket_itemsOnMarketCodec.decode(param2) as Vector.<IGameObject>);
               break;
            case this._initMountedId:
               this.client.initMounted(this._initMounted_mountedItemsCodec.decode(param2) as Vector.<IGameObject>);
               break;
            case this._reloadGarageId:
               this.client.reloadGarage(String(this._reloadGarage_messageCodec.decode(param2)),int(this._reloadGarage_totalCrystalsCodec.decode(param2)));
               break;
            case this._selectId:
               this.client.select(IGameObject(this._select_itemToSelectCodec.decode(param2)));
               break;
            case this._selectFirstItemInDepotId:
               this.client.selectFirstItemInDepot();
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

