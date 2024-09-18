package projects.tanks.client.battleselect.model.item
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class BattleItemModelBase extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:BattleItemModelServer;
      
      private var client:IBattleItemModelBase;
      
      private var modelId:Long;
      
      private var _madePrivateId:Long;
      
      private var _updateNameId:Long;
      
      private var _updateName_newNameCodec:ICodec;
      
      private var _updateSuspiciousId:Long;
      
      private var _updateSuspicious_suspiciousCodec:ICodec;
      
      public function BattleItemModelBase()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = IBattleItemModelBase(this);
         this.modelId = Long.getLong(0,300090008);
         this._madePrivateId = Long.getLong(0,300090021);
         this._updateNameId = Long.getLong(0,300090022);
         this._updateSuspiciousId = Long.getLong(0,300090023);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new BattleItemModelServer(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : BattleItemCC
      {
         return BattleItemCC(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this._madePrivateId:
               this.client.madePrivate();
               break;
            case this._updateNameId:
               this.client.updateName(String(this._updateName_newNameCodec.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

