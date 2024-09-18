package §5+§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class §include set switch§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§7i§;
      
      private var client:§`!O§;
      
      private var modelId:Long;
      
      public function §include set switch§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §`!O§(this);
         this.modelId = Long.getLong(759725658,1071543601);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §7i§(IModel(this));
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

