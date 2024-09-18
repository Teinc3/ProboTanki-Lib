package projects.tanks.client.tanksservices.model.notifier.battle
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class Renamed4386 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed4387;
      
      private var client:Renamed4388;
      
      private var modelId:Long;
      
      private var Renamed4389:Long;
      
      private var Renamed4390:ICodec;
      
      private var Renamed4391:Long;
      
      private var Renamed4392:ICodec;
      
      public function Renamed4386()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed4388(this);
         this.modelId = Long.getLong(904565121,-177943041);
         this.Renamed4389 = Long.getLong(1976915722,-215540987);
         this.Renamed4391 = Long.getLong(534256502,-1360731802);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed4387(IModel(this));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed4389:
               break;
            case this.Renamed4391:
               this.client.setBattle(this.Renamed4392.decode(param2) as Vector.<BattleNotifierData>);
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

