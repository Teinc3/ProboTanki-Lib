package §?"c§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class §>#p§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§else const native§;
      
      private var client:§;"9§;
      
      private var modelId:Long;
      
      private var §default const native§:Long;
      
      public function §>#p§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §;"9§(this);
         this.modelId = Long.getLong(121770418,618912707);
         this.§default const native§ = Long.getLong(335434599,-27161610);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §else const native§(IModel(this));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§default const native§:
               this.client.§^!B§();
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

