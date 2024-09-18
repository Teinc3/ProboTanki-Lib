package §class const var§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class §while const finally§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§5T§;
      
      private var client:§?#L§;
      
      private var modelId:Long;
      
      private var §0!6§:Long;
      
      private var §implements var true§:ICodec;
      
      public function §while const finally§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §?#L§(this);
         this.modelId = Long.getLong(432617209,-1426923357);
         this.§0!6§ = Long.getLong(1322262736,-1419663103);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §5T§(IModel(this));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§0!6§:
               this.client.§@#5§(this.§implements var true§.decode(param2) as Vector.<§6z§>);
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

