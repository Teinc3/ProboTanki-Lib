package §for package case§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §include for static§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§#"7§;
      
      private var client:§5!^§;
      
      private var modelId:Long;
      
      private var §function use§:Long;
      
      private var §for catch null§:ICodec;
      
      private var §break package break§:Long;
      
      public function §include for static§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §5!^§(this);
         this.modelId = Long.getLong(484417400,-1976122270);
         this.§function use§ = Long.getLong(1625272162,1958733747);
         this.§break package break§ = Long.getLong(432115653,1756131906);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §#"7§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §get var use§
      {
         return §get var use§(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§function use§:
               this.client.§true catch const§(String(this.§for catch null§.decode(param2)));
               break;
            case this.§break package break§:
               this.client.§get const null§();
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

