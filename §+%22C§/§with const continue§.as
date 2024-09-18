package §+"C§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class §with const continue§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§<"4§;
      
      private var client:§79§;
      
      private var modelId:Long;
      
      private var §["<§:Long;
      
      private var §switch const break§:ICodec;
      
      private var §-#v§:ICodec;
      
      private var §use set default§:ICodec;
      
      public function §with const continue§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §79§(this);
         this.modelId = Long.getLong(1118509469,-35521391);
         this.§["<§ = Long.getLong(523922434,-1392224255);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §<"4§(IModel(this));
         this.§switch const break§ = this._protocol.getCodec(new TypeCodecInfo(int,false));
         this.§-#v§ = this._protocol.getCodec(new TypeCodecInfo(int,false));
         this.§use set default§ = this._protocol.getCodec(new TypeCodecInfo(int,false));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§["<§:
               this.client.§continue for final§(int(this.§switch const break§.decode(param2)),int(this.§-#v§.decode(param2)),int(this.§use set default§.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

