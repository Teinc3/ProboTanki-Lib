package §static import§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class §<#8§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§4$!§;
      
      private var client:§true var package§;
      
      private var modelId:Long;
      
      private var §native var switch§:Long;
      
      private var §if var in§:Long;
      
      private var §finally catch null§:ICodec;
      
      private var §9#m§:ICodec;
      
      public function §<#8§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §true var package§(this);
         this.modelId = Long.getLong(841189855,-1268110049);
         this.§native var switch§ = Long.getLong(1282635693,192675762);
         this.§if var in§ = Long.getLong(2064863564,657165826);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §4$!§(IModel(this));
         this.§finally catch null§ = this._protocol.getCodec(new TypeCodecInfo(String,false));
         this.§9#m§ = this._protocol.getCodec(new TypeCodecInfo(String,false));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§native var switch§:
               this.client.§1"U§();
               break;
            case this.§if var in§:
               this.client.§break for else§(String(this.§finally catch null§.decode(param2)),String(this.§9#m§.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

