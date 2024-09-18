package §##N§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class § "$§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§]`§;
      
      private var client:§'!y§;
      
      private var modelId:Long;
      
      public function § "$§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §'!y§(this);
         this.modelId = Long.getLong(888433053,2115284408);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §]`§(IModel(this));
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

