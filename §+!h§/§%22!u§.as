package §+!h§
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
   import platform.client.fp10.core.type.IGameObject;
   
   public class §"!u§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§#"4§;
      
      private var client:§import var get§;
      
      private var modelId:Long;
      
      private var § !W§:Long;
      
      private var §import try§:ICodec;
      
      private var §]!2§:Long;
      
      private var §#;§:ICodec;
      
      private var §!!M§:ICodec;
      
      private var §false var for§:Long;
      
      private var §3!J§:ICodec;
      
      private var §default super§:ICodec;
      
      private var §for for include§:ICodec;
      
      public function §"!u§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §import var get§(this);
         this.modelId = Long.getLong(1634943251,-386616582);
         this.§ !W§ = Long.getLong(702469496,1865185556);
         this.§]!2§ = Long.getLong(577350635,-1901958395);
         this.§false var for§ = Long.getLong(1025211026,-780453228);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §#"4§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
         this.§#;§ = this._protocol.getCodec(new TypeCodecInfo(IGameObject,false));
         this.§3!J§ = this._protocol.getCodec(new TypeCodecInfo(IGameObject,false));
         this.§default super§ = this._protocol.getCodec(new TypeCodecInfo(String,false));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§ !W§:
            case this.§]!2§:
               break;
            case this.§false var for§:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

