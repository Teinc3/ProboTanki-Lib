package §break const override§
{
   import §1#c§.§-"c§;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §8"z§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§2"§;
      
      private var client:§use set false§;
      
      private var modelId:Long;
      
      public function §8"z§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §use set false§(this);
         this.modelId = Long.getLong(1635158664,1411719504);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §2"§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §-"c§
      {
         return §-"c§(initParams[Model.object]);
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

