package projects.tanks.client.panel.model.garage.rankupsupplybonus
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class RankUpSupplyBonusModelBase extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:RankUpSupplyBonusModelServer;
      
      private var client:IRankUpSupplyBonusModelBase;
      
      private var modelId:Long;
      
      private var _showRankUpSupplyBonusAlertsId:Long;
      
      private var _showRankUpSupplyBonusAlerts_bonusesCodec:ICodec;
      
      public function RankUpSupplyBonusModelBase()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = IRankUpSupplyBonusModelBase(this);
         this.modelId = Long.getLong(0,300050085);
         this._showRankUpSupplyBonusAlertsId = Long.getLong(0,300050051);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new RankUpSupplyBonusModelServer(IModel(this));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this._showRankUpSupplyBonusAlertsId:
               this.client.showRankUpSupplyBonusAlerts(this._showRankUpSupplyBonusAlerts_bonusesCodec.decode(param2) as Vector.<RankUpSupplyBonusInfo>);
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

