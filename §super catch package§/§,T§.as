package §super catch package§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class §,T§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§;"b§;
      
      private var client:§super const false§;
      
      private var modelId:Long;
      
      public function §,T§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §super const false§(this);
         this.modelId = Long.getLong(1396750689,-217255698);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §;"b§(IModel(this));
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

