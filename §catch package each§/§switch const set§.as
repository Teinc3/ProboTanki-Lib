package §catch package each§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class §switch const set§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§return catch extends§;
      
      private var client:§final const extends§;
      
      private var modelId:Long;
      
      public function §switch const set§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §final const extends§(this);
         this.modelId = Long.getLong(1948776499,1322947449);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §return catch extends§(IModel(this));
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

