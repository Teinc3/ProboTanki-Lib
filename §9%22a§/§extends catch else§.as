package §9"a§
{
   import § !g§.§class for case§;
   import §;"?§.§#">§;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §extends catch else§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§,D§;
      
      private var client:§null var package§;
      
      private var modelId:Long;
      
      private var §"T§:Long;
      
      private var §<#I§:ICodec;
      
      private var §1!§:ICodec;
      
      private var § #H§:Long;
      
      private var §super set use§:ICodec;
      
      private var §>!j§:ICodec;
      
      private var §true const in§:Long;
      
      private var §true const break§:ICodec;
      
      private var §implements for else§:ICodec;
      
      private var §!#r§:Long;
      
      private var §while var in§:ICodec;
      
      private var §@!V§:ICodec;
      
      public function §extends catch else§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §null var package§(this);
         this.modelId = Long.getLong(1965338956,1417730743);
         this.§"T§ = Long.getLong(1487412361,8128743);
         this.§ #H§ = Long.getLong(1849471524,-639146266);
         this.§true const in§ = Long.getLong(1134857420,-1224060835);
         this.§!#r§ = Long.getLong(794624341,25869850);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §,D§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §extends package continue§
      {
         return §extends package continue§(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§"T§:
               this.client.§static catch var§(§#">§(this.§<#I§.decode(param2)),§class for case§(this.§1!§.decode(param2)));
               break;
            case this.§ #H§:
               this.client.§!"f§(§class for case§(this.§super set use§.decode(param2)),String(this.§>!j§.decode(param2)));
               break;
            case this.§true const in§:
               this.client.§`!9§(String(this.§true const break§.decode(param2)),§class for case§(this.§implements for else§.decode(param2)));
               break;
            case this.§!#r§:
               this.client.§try const do§(§class for case§(this.§while var in§.decode(param2)),String(this.§@!V§.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

