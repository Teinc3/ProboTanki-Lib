package §<#&§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §?#W§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§catch package import§;
      
      private var client:§%!q§;
      
      private var modelId:Long;
      
      public function §?#W§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §%!q§(this);
         this.modelId = Long.getLong(1337638668,-1951387531);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §catch package import§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §7B§
      {
         return §7B§(initParams[Model.object]);
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

