package §1"z§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Float;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class §[v§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§%"b§;
      
      private var client:§'!p§;
      
      private var modelId:Long;
      
      private var §default const native§:Long;
      
      private var §finally const try§:ICodec;
      
      private var §5!§:ICodec;
      
      public function §[v§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §'!p§(this);
         this.modelId = Long.getLong(747925004,799189270);
         this.§default const native§ = Long.getLong(826158396,-1985123151);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §%"b§(IModel(this));
         this.§finally const try§ = this._protocol.getCodec(new TypeCodecInfo(int,false));
         this.§5!§ = this._protocol.getCodec(new TypeCodecInfo(Float,false));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§default const native§:
               this.client.§^!B§(int(this.§finally const try§.decode(param2)),Number(this.§5!§.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

