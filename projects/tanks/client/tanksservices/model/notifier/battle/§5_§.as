package projects.tanks.client.tanksservices.model.notifier.battle
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class §5_§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§true in§;
      
      private var client:§85§;
      
      private var modelId:Long;
      
      private var §@"[§:Long;
      
      private var §="X§:ICodec;
      
      private var §finally set return§:Long;
      
      private var §&#j§:ICodec;
      
      public function §5_§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §85§(this);
         this.modelId = Long.getLong(904565121,-177943041);
         this.§@"[§ = Long.getLong(1976915722,-215540987);
         this.§finally set return§ = Long.getLong(534256502,-1360731802);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §true in§(IModel(this));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§@"[§:
               break;
            case this.§finally set return§:
               this.client.setBattle(this.§&#j§.decode(param2) as Vector.<BattleNotifierData>);
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

