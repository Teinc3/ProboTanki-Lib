package §dynamic use§
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
   
   public class §dynamic const for§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§;I§;
      
      private var client:§>#M§;
      
      private var modelId:Long;
      
      private var §try package each§:Long;
      
      private var §'Z§:ICodec;
      
      private var §'i§:Long;
      
      private var §1!r§:Long;
      
      public function §dynamic const for§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §>#M§(this);
         this.modelId = Long.getLong(0,300020016);
         this.§try package each§ = Long.getLong(0,300020047);
         this.§'i§ = Long.getLong(0,300020048);
         this.§1!r§ = Long.getLong(0,300020049);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §;I§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
         this.§'Z§ = this._protocol.getCodec(new TypeCodecInfo(String,false));
      }
      
      protected function getInitParam() : §var set import§
      {
         return §var set import§(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§try package each§:
               this.client.§=#"§(String(this.§'Z§.decode(param2)));
               break;
            case this.§'i§:
               this.client.§for catch switch§();
               break;
            case this.§1!r§:
               this.client.§3"_§();
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

