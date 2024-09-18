package §^"!§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   import projects.tanks.client.users.model.friends.container.UserContainerCC;
   
   public class §%#W§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§super set null§;
      
      private var client:§#!?§;
      
      private var modelId:Long;
      
      private var §#"c§:Long;
      
      private var §7! §:ICodec;
      
      private var §continue set catch§:Long;
      
      private var § !2§:ICodec;
      
      public function §%#W§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §#!?§(this);
         this.modelId = Long.getLong(1696580544,685225790);
         this.§#"c§ = Long.getLong(1466630272,-1977249165);
         this.§continue set catch§ = Long.getLong(1779101803,-1074606030);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §super set null§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : UserContainerCC
      {
         return UserContainerCC(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§#"c§:
               break;
            case this.§continue set catch§:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

