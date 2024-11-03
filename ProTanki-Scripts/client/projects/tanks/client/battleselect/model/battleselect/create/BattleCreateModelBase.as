package projects.tanks.client.battleselect.model.battleselect.create
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class BattleCreateModelBase extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:BattleCreateModelServer;
      
      private var client:IBattleCreateModelBase;
      
      private var modelId:Long;
      
      private var _createFailedBattleCreateDisabledId:Long;
      
      private var _createFailedServerIsHaltingId:Long;
      
      private var _createFailedTooManyBattlesFromYouId:Long;
      
      private var _createFailedYouAreBannedId:Long;
      
      private var _setFilteredBattleNameId:Long;
      
      private var _setFilteredBattleName_nameCodec:ICodec;
      
      public function BattleCreateModelBase()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = IBattleCreateModelBase(this);
         this.modelId = Long.getLong(0,300090002);
         this._createFailedBattleCreateDisabledId = Long.getLong(0,300090002);
         this._createFailedServerIsHaltingId = Long.getLong(0,300090003);
         this._createFailedTooManyBattlesFromYouId = Long.getLong(0,300090004);
         this._createFailedYouAreBannedId = Long.getLong(0,300090005);
         this._setFilteredBattleNameId = Long.getLong(0,300090006);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new BattleCreateModelServer(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : BattleCreateCC
      {
         return BattleCreateCC(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this._createFailedBattleCreateDisabledId:
               this.client.createFailedBattleCreateDisabled();
               break;
            case this._createFailedServerIsHaltingId:
               this.client.createFailedServerIsHalting();
               break;
            case this._createFailedTooManyBattlesFromYouId:
               this.client.createFailedTooManyBattlesFromYou();
               break;
            case this._createFailedYouAreBannedId:
               this.client.createFailedYouAreBanned();
               break;
            case this._setFilteredBattleNameId:
               this.client.setFilteredBattleName(String(this._setFilteredBattleName_nameCodec.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

