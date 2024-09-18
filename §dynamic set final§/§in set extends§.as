package §dynamic set final§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §in set extends§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§else var throw§;
      
      private var client:§;#,§;
      
      private var modelId:Long;
      
      public function §in set extends§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §;#,§(this);
         this.modelId = Long.getLong(1545673170,1705258317);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §else var throw§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §5#'§
      {
         return §5#'§(initParams[Model.object]);
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

