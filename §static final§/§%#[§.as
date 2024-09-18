package §static final§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §%#[§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§&!G§;
      
      private var client:§4!y§;
      
      private var modelId:Long;
      
      private var §while set dynamic§:Long;
      
      private var §override set override§:Long;
      
      private var §%D§:ICodec;
      
      private var §case package false§:ICodec;
      
      private var §9%§:ICodec;
      
      private var §?o§:ICodec;
      
      private var §"S§:Long;
      
      private var §extends set static§:ICodec;
      
      public function §%#[§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §4!y§(this);
         this.modelId = Long.getLong(0,300050053);
         this.§while set dynamic§ = Long.getLong(0,300050029);
         this.§override set override§ = Long.getLong(0,300050030);
         this.§"S§ = Long.getLong(0,300050031);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §&!G§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
         this.§case package false§ = this._protocol.getCodec(new TypeCodecInfo(String,false));
         this.§9%§ = this._protocol.getCodec(new TypeCodecInfo(String,false));
         this.§?o§ = this._protocol.getCodec(new TypeCodecInfo(String,false));
         this.§extends set static§ = this._protocol.getCodec(new TypeCodecInfo(String,false));
      }
      
      protected function getInitParam() : §,"o§
      {
         return §,"o§(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§while set dynamic§:
               this.client.§`m§();
               break;
            case this.§override set override§:
               this.client.§finally package static§(this.§%D§.decode(param2) as Vector.<§continue package do§>,String(this.§case package false§.decode(param2)),String(this.§9%§.decode(param2)),String(this.§?o§.decode(param2)));
               break;
            case this.§"S§:
               this.client.§`"r§(String(this.§extends set static§.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

