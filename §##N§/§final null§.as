package §##N§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class §final null§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§class var continue§;
      
      private var client:§%"]§;
      
      private var modelId:Long;
      
      public function §final null§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §%"]§(this);
         this.modelId = Long.getLong(1891481944,-1293130596);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §class var continue§(IModel(this));
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

