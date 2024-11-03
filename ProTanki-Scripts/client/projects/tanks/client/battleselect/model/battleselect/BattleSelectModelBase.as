package projects.tanks.client.battleselect.model.battleselect
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class BattleSelectModelBase extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:BattleSelectModelServer;
      
      private var client:IBattleSelectModelBase;
      
      private var modelId:Long;
      
      private var _battleItemsPacketJoinSuccessId:Long;
      
      private var _selectId:Long;
      
      private var _select_itemCodec:ICodec;
      
      public function BattleSelectModelBase()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = IBattleSelectModelBase(this);
         this.modelId = Long.getLong(0,300090011);
         this._battleItemsPacketJoinSuccessId = Long.getLong(0,300090026);
         this._selectId = Long.getLong(0,300090027);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new BattleSelectModelServer(IModel(this));
         this._select_itemCodec = this._protocol.getCodec(new TypeCodecInfo(IGameObject,false));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this._battleItemsPacketJoinSuccessId:
               this.client.battleItemsPacketJoinSuccess();
               break;
            case this._selectId:
               this.client.select(String(this._select_itemCodec.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

