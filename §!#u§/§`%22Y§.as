package §!#u§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §`"Y§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§default set switch§;
      
      private var client:§while package super§;
      
      private var modelId:Long;
      
      private var §implements var override§:Long;
      
      private var §=!W§:ICodec;
      
      private var §for break§:Long;
      
      private var §dynamic var var§:ICodec;
      
      public function §`"Y§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §while package super§(this);
         this.modelId = Long.getLong(2120141642,699496177);
         this.§implements var override§ = Long.getLong(1609604139,228512172);
         this.§for break§ = Long.getLong(1853038031,-1082989884);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §default set switch§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §7"=§
      {
         return §7"=§(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§implements var override§:
               break;
            case this.§for break§:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

