package projects.tanks.client.entrance.model.entrance.externalentrance
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §static for case§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§include set native§;
      
      private var client:§native catch while§;
      
      private var modelId:Long;
      
      private var §>#z§:Long;
      
      private var §#!r§:Long;
      
      private var §5"9§:Long;
      
      private var §break for each§:Long;
      
      public function §static for case§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §native catch while§(this);
         this.modelId = Long.getLong(0,300020013);
         this.§>#z§ = Long.getLong(0,300020030);
         this.§#!r§ = Long.getLong(0,300020031);
         this.§5"9§ = Long.getLong(0,300020032);
         this.§break for each§ = Long.getLong(0,300020033);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §include set native§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §<"G§
      {
         return §<"G§(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§>#z§:
               this.client.linkAlreadyExists();
               break;
            case this.§#!r§:
               this.client.validationFailed();
               break;
            case this.§5"9§:
               this.client.validationSuccess();
               break;
            case this.§break for each§:
               this.client.wrongPassword();
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

