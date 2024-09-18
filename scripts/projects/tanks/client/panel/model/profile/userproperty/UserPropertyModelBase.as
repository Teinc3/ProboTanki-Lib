package projects.tanks.client.panel.model.profile.userproperty
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class UserPropertyModelBase extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:UserPropertyModelServer;
      
      private var client:IUserPropertyModelBase;
      
      private var modelId:Long;
      
      private var _changeCrystalId:Long;
      
      private var _changeCrystal_changeByCodec:ICodec;
      
      private var _updateRankId:Long;
      
      private var _updateRank_rankCodec:ICodec;
      
      private var _updateRank_scoreCodec:ICodec;
      
      private var _updateRank_currentRankScoreCodec:ICodec;
      
      private var _updateRank_nextRankScoreCodec:ICodec;
      
      private var _updateRank_bonusCrystalsCodec:ICodec;
      
      private var _updateScoreId:Long;
      
      private var _updateScore_scoreCodec:ICodec;
      
      public function UserPropertyModelBase()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = IUserPropertyModelBase(this);
         this.modelId = Long.getLong(0,300050083);
         this._changeCrystalId = Long.getLong(0,300050077);
         this._updateRankId = Long.getLong(0,300050078);
         this._updateScoreId = Long.getLong(0,300050079);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new UserPropertyModelServer(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : UserPropertyCC
      {
         return UserPropertyCC(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this._changeCrystalId:
               this.client.changeCrystal(int(this._changeCrystal_changeByCodec.decode(param2)));
               break;
            case this._updateRankId:
               this.client.updateRank(int(this._updateRank_rankCodec.decode(param2)),int(this._updateRank_scoreCodec.decode(param2)),int(this._updateRank_currentRankScoreCodec.decode(param2)),int(this._updateRank_nextRankScoreCodec.decode(param2)),int(this._updateRank_bonusCrystalsCodec.decode(param2)));
               break;
            case this._updateScoreId:
               this.client.updateScore(int(this._updateScore_scoreCodec.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

