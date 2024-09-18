package §class package throw§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class §with catch package§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§&U§;
      
      private var client:§do for return§;
      
      private var modelId:Long;
      
      public function §with catch package§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §do for return§(this);
         this.modelId = Long.getLong(815932807,-684891581);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §&U§(IModel(this));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         if(Boolean(0))
         {
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

