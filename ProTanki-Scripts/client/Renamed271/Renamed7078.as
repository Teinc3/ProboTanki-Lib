package Renamed4741
{
   import Renamed136.Renamed663;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   import projects.tanks.client.battleselect.model.info.BattleInfoUser;
   
   public class Renamed7078 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed7079;
      
      private var client:Renamed4742;
      
      private var modelId:Long;
      
      private var Renamed5665:Long;
      
      private var Renamed5666:ICodec;
      
      private var Renamed7080:ICodec;
      
      private var Renamed5667:Long;
      
      private var Renamed5677:Long;
      
      private var Renamed7081:Long;
      
      private var Renamed7082:ICodec;
      
      private var Renamed7083:ICodec;
      
      private var Renamed7084:Long;
      
      private var Renamed7085:ICodec;
      
      private var Renamed7086:ICodec;
      
      public function Renamed7078()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed4742(this);
         this.modelId = Long.getLong(0,300090027);
         this.Renamed5665 = Long.getLong(0,300090029);
         this.Renamed5667 = Long.getLong(0,300090030);
         this.Renamed5677 = Long.getLong(0,300090031);
         this.Renamed7081 = Long.getLong(0,300090032);
         this.Renamed7084 = Long.getLong(0,300090033);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed7079(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Renamed7087
      {
         return Renamed7087(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed5665:
               this.client.addUser(BattleInfoUser(this.Renamed5666.decode(param2)),Renamed663(this.Renamed7080.decode(param2)));
               break;
            case this.Renamed5667:
               this.client.Renamed5661();
               break;
            case this.Renamed5677:
               this.client.swapTeams();
               break;
            case this.Renamed7081:
               this.client.updateTeamScore(Renamed663(this.Renamed7082.decode(param2)),int(this.Renamed7083.decode(param2)));
               break;
            case this.Renamed7084:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

