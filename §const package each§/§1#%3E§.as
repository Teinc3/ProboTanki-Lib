package §const package each§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class §1#>§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§`#A§;
      
      private var client:§,#§;
      
      private var modelId:Long;
      
      private var §package var case§:Long;
      
      public function §1#>§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §,#§(this);
         this.modelId = Long.getLong(0,300050023);
         this.§package var case§ = Long.getLong(0,300050021);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §`#A§(IModel(this));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§package var case§:
               this.client.onUsersLoaded();
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

