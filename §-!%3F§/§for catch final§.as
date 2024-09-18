package §-!?§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class §for catch final§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§dynamic for const§;
      
      private var client:§for for true§;
      
      private var modelId:Long;
      
      private var §switch for throw§:Long;
      
      private var §+z§:Long;
      
      private var §return set throw§:Long;
      
      private var §#"$§:ICodec;
      
      private var §in package super§:Long;
      
      private var §["r§:Long;
      
      private var §implements package const§:ICodec;
      
      private var §package set return§:ICodec;
      
      public function §for catch final§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §for for true§(this);
         this.modelId = Long.getLong(0,300020022);
         this.§switch for throw§ = Long.getLong(0,300020062);
         this.§+z§ = Long.getLong(0,300020063);
         this.§return set throw§ = Long.getLong(0,300020064);
         this.§in package super§ = Long.getLong(0,300020065);
         this.§["r§ = Long.getLong(0,300020066);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §dynamic for const§(IModel(this));
         this.§#"$§ = this._protocol.getCodec(new TypeCodecInfo(String,false));
         this.§implements package const§ = this._protocol.getCodec(new TypeCodecInfo(Boolean,false));
         this.§package set return§ = this._protocol.getCodec(new TypeCodecInfo(String,false));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§switch for throw§:
               this.client.§package var native§();
               break;
            case this.§+z§:
               this.client.§case var in§();
               break;
            case this.§return set throw§:
               this.client.§import catch get§(String(this.§#"$§.decode(param2)));
               break;
            case this.§in package super§:
               this.client.§4"l§();
               break;
            case this.§["r§:
               this.client.§dynamic const do§(Boolean(this.§implements package const§.decode(param2)),String(this.§package set return§.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

