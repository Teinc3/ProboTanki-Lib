package §4#s§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class §5E§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§case const catch§;
      
      private var client:§""2§;
      
      private var modelId:Long;
      
      public function §5E§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §""2§(this);
         this.modelId = Long.getLong(1750173911,1168019295);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §case const catch§(IModel(this));
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

