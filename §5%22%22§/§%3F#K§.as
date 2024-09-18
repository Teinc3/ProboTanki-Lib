package §5""§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §?#K§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§&i§;
      
      private var client:§return package for§;
      
      private var modelId:Long;
      
      private var §"T§:Long;
      
      private var §[#T§:ICodec;
      
      private var §<#I§:ICodec;
      
      private var § #H§:Long;
      
      private var §'T§:ICodec;
      
      private var §default catch for§:ICodec;
      
      private var §>!j§:ICodec;
      
      private var §true const in§:Long;
      
      private var §override continue§:ICodec;
      
      private var §true const break§:ICodec;
      
      private var §!#r§:Long;
      
      private var §catch static§:ICodec;
      
      private var §@!V§:ICodec;
      
      public function §?#K§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §return package for§(this);
         this.modelId = Long.getLong(1012996430,-1521107309);
         this.§"T§ = Long.getLong(316505180,-455455939);
         this.§ #H§ = Long.getLong(2051659052,-1157285002);
         this.§true const in§ = Long.getLong(1221726371,2088665273);
         this.§!#r§ = Long.getLong(266349932,2077700618);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §&i§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §"#_§
      {
         return §"#_§(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§"T§:
            case this.§ #H§:
            case this.§true const in§:
               break;
            case this.§!#r§:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

