package §var for get§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §throw set var§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§-#3§;
      
      private var client:§in var static§;
      
      private var modelId:Long;
      
      public function §throw set var§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §in var static§(this);
         this.modelId = Long.getLong(0,300090023);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §-#3§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §class for with§
      {
         return §class for with§(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         var _loc3_:* = param1;
         var _loc4_:int = 0;
         switch(0)
         {
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

