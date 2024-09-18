package §%@§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §+"&§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§if var default§;
      
      private var client:§`#`§;
      
      private var modelId:Long;
      
      public function §+"&§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §`#`§(this);
         this.modelId = Long.getLong(0,300090019);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §if var default§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §,#5§
      {
         return §,#5§(initParams[Model.object]);
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

