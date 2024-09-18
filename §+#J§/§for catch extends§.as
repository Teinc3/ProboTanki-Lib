package §+#J§
{
   import § !g§.§class for case§;
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
   
   public class §for catch extends§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§get finally§;
      
      private var client:§;#y§;
      
      private var modelId:Long;
      
      private var §7#e§:Long;
      
      private var §3"[§:ICodec;
      
      private var §native const include§:ICodec;
      
      private var §case const if§:Long;
      
      private var §finally null§:ICodec;
      
      private var §final for finally§:ICodec;
      
      private var §break set throw§:Long;
      
      private var §import continue§:ICodec;
      
      private var §const package native§:ICodec;
      
      private var §final const super§:Long;
      
      private var §package var continue§:ICodec;
      
      private var §4!F§:ICodec;
      
      private var §var catch class§:Long;
      
      private var §super package if§:ICodec;
      
      private var §if catch else§:ICodec;
      
      private var §override const catch§:ICodec;
      
      private var §+"D§:Long;
      
      private var §default catch do§:ICodec;
      
      public function §for catch extends§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §;#y§(this);
         this.modelId = Long.getLong(183455729,-2099733819);
         this.§7#e§ = Long.getLong(1367071399,-1702461867);
         this.§case const if§ = Long.getLong(1479921566,-1347191967);
         this.§break set throw§ = Long.getLong(1581597391,-963196943);
         this.§final const super§ = Long.getLong(1345957775,1774893408);
         this.§var catch class§ = Long.getLong(386945968,-373481329);
         this.§+"D§ = Long.getLong(184857581,1110813993);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §get finally§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §4#R§
      {
         return §4#R§(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§7#e§:
               this.client.§throw set get§(§class for case§(this.§3"[§.decode(param2)),int(this.§native const include§.decode(param2)));
               break;
            case this.§case const if§:
               this.client.§var const native§(§%q§(this.§finally null§.decode(param2)),§class for case§(this.§final for finally§.decode(param2)));
               break;
            case this.§break set throw§:
               this.client.§4"c§(this.§import continue§.decode(param2) as Vector.<§%q§>,§class for case§(this.§const package native§.decode(param2)));
               break;
            case this.§final const super§:
               this.client.§-!Z§(this.§package var continue§.decode(param2) as Vector.<§%q§>,this.§4!F§.decode(param2) as Vector.<§%q§>);
               break;
            case this.§var catch class§:
               this.client.userConnect(String(this.§super package if§.decode(param2)),this.§if catch else§.decode(param2) as Vector.<§in for for§>,§class for case§(this.§override const catch§.decode(param2)));
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

