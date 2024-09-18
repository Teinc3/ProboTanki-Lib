package projects.tanks.client.battleselect.model.battleselect.create
{
   import Renamed268.Renamed4169;
   import Renamed268.Renamed4170;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import projects.tanks.client.battleservice.Renamed1579;
   import scpacker.networking.Network;
   
   public class BattleCreateModelServer
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var _checkBattleNameForForbiddenWordsId:Long;
      
      private var _checkBattleNameForForbiddenWords_battleNameCodec:ICodec;
      
      private var _createBattleId:Long;
      
      private var _createBattle_paramsCodec:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function BattleCreateModelServer(param1:IModel)
      {
         this._checkBattleNameForForbiddenWordsId = Long.getLong(0,300090000);
         this._createBattleId = Long.getLong(0,300090001);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.network = Network(OSGi.getInstance().getService(Network));
      }
      
      public function checkBattleNameForForbiddenWords(param1:String) : void
      {
         this.network.send(new Renamed4170(param1));
      }
      
      public function createBattle(param1:Renamed1579) : void
      {
         this.network.send(new Renamed4169(param1));
      }
   }
}

