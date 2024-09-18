package §include package while§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §do var import§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§,!W§;
      
      private var client:§4!C§;
      
      private var modelId:Long;
      
      private var §final catch finally§:Long;
      
      private var §else for set§:ICodec;
      
      private var §<##§:ICodec;
      
      private var §'y§:Long;
      
      private var §0"f§:Long;
      
      private var §throw package for§:ICodec;
      
      public function §do var import§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §4!C§(this);
         this.modelId = Long.getLong(1691794381,-1794202080);
         this.§final catch finally§ = Long.getLong(2087187664,-1594727181);
         this.§'y§ = Long.getLong(1056602643,1332983261);
         this.§0"f§ = Long.getLong(1740337189,-128463099);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §,!W§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §5!V§
      {
         return §5!V§(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§final catch finally§:
            case this.§'y§:
               break;
            case this.§0"f§:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

