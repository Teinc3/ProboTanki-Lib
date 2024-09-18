package §=!+§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class §class package import§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§else for true§;
      
      private var client:§dynamic catch super§;
      
      private var modelId:Long;
      
      private var §else set if§:Long;
      
      private var §each package if§:ICodec;
      
      private var §each package false§:Long;
      
      private var §false finally§:Long;
      
      private var §use package default§:ICodec;
      
      public function §class package import§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §dynamic catch super§(this);
         this.modelId = Long.getLong(0,300070009);
         this.§else set if§ = Long.getLong(0,300070005);
         this.§each package false§ = Long.getLong(0,300070006);
         this.§false finally§ = Long.getLong(0,300070007);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §else for true§(IModel(this));
         this.§each package if§ = this._protocol.getCodec(new TypeCodecInfo(Long,false));
         this.§use package default§ = this._protocol.getCodec(new TypeCodecInfo(Long,false));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§else set if§:
            case this.§each package false§:
               break;
            case this.§false finally§:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

