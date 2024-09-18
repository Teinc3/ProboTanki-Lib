package §'!@§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class §null catch do§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§if for dynamic§;
      
      private var client:§break set import§;
      
      private var modelId:Long;
      
      private var §const package default§:Long;
      
      private var §null set extends§:ICodec;
      
      public function §null catch do§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §break set import§(this);
         this.modelId = Long.getLong(756280393,-1366394900);
         this.§const package default§ = Long.getLong(371898920,859714904);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §if for dynamic§(IModel(this));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§const package default§:
               this.client.§," §(this.§null set extends§.decode(param2) as Vector.<§,!;§>);
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

