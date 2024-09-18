package projects.tanks.client.garage.models.item.kit
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §3!p§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§dynamic else§;
      
      private var client:§7"V§;
      
      private var modelId:Long;
      
      public function §3!p§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §7"V§(this);
         this.modelId = Long.getLong(1215266592,-1320571870);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §dynamic else§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §9k§
      {
         return §9k§(initParams[Model.object]);
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

