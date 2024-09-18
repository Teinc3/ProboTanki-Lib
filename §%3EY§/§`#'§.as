package §>Y§
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
   
   public class §`#'§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§"!x§;
      
      private var client:§native true§;
      
      private var modelId:Long;
      
      private var §function var switch§:Long;
      
      private var §!!E§:ICodec;
      
      private var §package const dynamic§:Long;
      
      private var §0#Z§:Long;
      
      private var §1m§:ICodec;
      
      private var §5!M§:ICodec;
      
      public function §`#'§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §native true§(this);
         this.modelId = Long.getLong(0,300090003);
         this.§function var switch§ = Long.getLong(0,300090008);
         this.§package const dynamic§ = Long.getLong(0,300090009);
         this.§0#Z§ = Long.getLong(0,300090010);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §"!x§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : § "0§
      {
         return § "0§(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§function var switch§:
               this.client.addUser(BattleInfoUser(this.§!!E§.decode(param2)));
               break;
            case this.§package const dynamic§:
               this.client.§default var do§();
               break;
            case this.§0#Z§:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

