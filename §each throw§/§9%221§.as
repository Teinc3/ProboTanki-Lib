package §each throw§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class §9"1§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§!#z§;
      
      private var client:§finally return§;
      
      private var modelId:Long;
      
      private var §^!S§:Long;
      
      private var §implements package set§:ICodec;
      
      private var §4"X§:ICodec;
      
      private var §const var in§:ICodec;
      
      public function §9"1§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §finally return§(this);
         this.modelId = Long.getLong(486222912,-663069007);
         this.§^!S§ = Long.getLong(1666638426,-1858765435);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §!#z§(IModel(this));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§^!S§:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

