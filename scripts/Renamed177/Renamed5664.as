package Renamed4743
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   import projects.tanks.client.battleselect.model.info.BattleInfoUser;
   
   public class Renamed5664 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed5649;
      
      private var client:Renamed4744;
      
      private var modelId:Long;
      
      private var Renamed5665:Long;
      
      private var Renamed5666:ICodec;
      
      private var Renamed5667:Long;
      
      private var Renamed5668:Long;
      
      private var Renamed5669:ICodec;
      
      private var Renamed5670:ICodec;
      
      public function Renamed5664()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed4744(this);
         this.modelId = Long.getLong(0,300090003);
         this.Renamed5665 = Long.getLong(0,300090008);
         this.Renamed5667 = Long.getLong(0,300090009);
         this.Renamed5668 = Long.getLong(0,300090010);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed5649(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Renamed5643
      {
         return Renamed5643(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed5665:
               this.client.addUser(BattleInfoUser(this.Renamed5666.decode(param2)));
               break;
            case this.Renamed5667:
               this.client.Renamed5661();
               break;
            case this.Renamed5668:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

