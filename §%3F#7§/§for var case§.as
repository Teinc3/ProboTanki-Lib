package §?#7§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class §for var case§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§ !B§;
      
      private var client:§3@§;
      
      private var modelId:Long;
      
      private var §const set if§:Long;
      
      public function §for var case§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §3@§(this);
         this.modelId = Long.getLong(1012007416,-1351622809);
         this.§const set if§ = Long.getLong(1585320728,11519581);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new § !B§(IModel(this));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§const set if§:
               this.client.showAlert();
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

