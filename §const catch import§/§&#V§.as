package §const catch import§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class §&#V§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§final set while§;
      
      private var client:§var if§;
      
      private var modelId:Long;
      
      private var §break for each§:Long;
      
      public function §&#V§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §var if§(this);
         this.modelId = Long.getLong(0,300020020);
         this.§break for each§ = Long.getLong(0,300020049);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §final set while§(IModel(this));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§break for each§:
               this.client.wrongPassword();
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

