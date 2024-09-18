package §class const implements§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class §use catch function§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§function package import§;
      
      private var client:§finally set with§;
      
      private var modelId:Long;
      
      private var §set for true§:Long;
      
      private var §break package while§:ICodec;
      
      public function §use catch function§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §finally set with§(this);
         this.modelId = Long.getLong(0,300070017);
         this.§set for true§ = Long.getLong(0,300070015);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §function package import§(IModel(this));
         this.§break package while§ = this._protocol.getCodec(new TypeCodecInfo(int,false));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§set for true§:
               this.client.§'"5§(int(this.§break package while§.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

