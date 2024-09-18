package §;q§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §else catch for§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§switch for true§;
      
      private var client:§override const null§;
      
      private var modelId:Long;
      
      public function §else catch for§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §override const null§(this);
         this.modelId = Long.getLong(1366230363,-857495328);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §switch for true§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §,#1§
      {
         return §,#1§(initParams[Model.object]);
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

