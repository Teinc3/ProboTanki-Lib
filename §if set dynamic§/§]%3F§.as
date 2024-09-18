package §if set dynamic§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   import projects.tanks.client.battleservice.model.statistics.§%q§;
   import projects.tanks.client.battleservice.model.statistics.§in for for§;
   
   public class §]?§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§true for else§;
      
      private var client:§import set native§;
      
      private var modelId:Long;
      
      private var §case const if§:Long;
      
      private var §import catch if§:ICodec;
      
      private var §break set throw§:Long;
      
      private var §extends package final§:ICodec;
      
      private var §var catch class§:Long;
      
      private var §super package if§:ICodec;
      
      private var §if catch else§:ICodec;
      
      private var §+"D§:Long;
      
      private var §default catch do§:ICodec;
      
      public function §]?§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §import set native§(this);
         this.modelId = Long.getLong(575618390,177970779);
         this.§case const if§ = Long.getLong(965223943,535616065);
         this.§break set throw§ = Long.getLong(2010192701,-2134483217);
         this.§var catch class§ = Long.getLong(825794462,-1556026223);
         this.§+"D§ = Long.getLong(329840042,1301345271);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §true for else§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §static var function§
      {
         return §static var function§(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§case const if§:
               this.client.§var const native§(§%q§(this.§import catch if§.decode(param2)));
               break;
            case this.§break set throw§:
               this.client.§4"c§(this.§extends package final§.decode(param2) as Vector.<§%q§>);
               break;
            case this.§var catch class§:
               this.client.userConnect(String(this.§super package if§.decode(param2)),this.§if catch else§.decode(param2) as Vector.<§in for for§>);
               break;
            case this.§+"D§:
               this.client.§dynamic var native§(String(this.§default catch do§.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

