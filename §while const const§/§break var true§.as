package §while const const§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §break var true§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§-#"§;
      
      private var client:§"!d§;
      
      private var modelId:Long;
      
      private var §class const import§:Long;
      
      private var §dynamic var with§:ICodec;
      
      private var §<#G§:Long;
      
      private var §else const catch§:ICodec;
      
      private var §default const else§:ICodec;
      
      private var §&#E§:ICodec;
      
      private var §;"F§:ICodec;
      
      private var §!!_§:ICodec;
      
      private var §var catch final§:Long;
      
      private var §class super§:ICodec;
      
      public function §break var true§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §"!d§(this);
         this.modelId = Long.getLong(170467452,-1685189911);
         this.§class const import§ = Long.getLong(741262612,-1895966548);
         this.§<#G§ = Long.getLong(1921998262,-1791534114);
         this.§var catch final§ = Long.getLong(247034803,-90734157);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §-#"§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §^"x§
      {
         return §^"x§(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§class const import§:
            case this.§<#G§:
               break;
            case this.§var catch final§:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

