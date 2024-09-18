package §package var while§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class §override for break§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§function const throw§;
      
      private var client:§<#r§;
      
      private var modelId:Long;
      
      public function §override for break§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §<#r§(this);
         this.modelId = Long.getLong(882584998,678334280);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §function const throw§(IModel(this));
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

