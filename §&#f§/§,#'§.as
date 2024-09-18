package §&#f§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §,#'§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§in catch set§;
      
      private var client:§use const switch§;
      
      private var modelId:Long;
      
      public function §,#'§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §use const switch§(this);
         this.modelId = Long.getLong(0,300040011);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §in catch set§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §%"S§
      {
         return §%"S§(initParams[Model.object]);
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

