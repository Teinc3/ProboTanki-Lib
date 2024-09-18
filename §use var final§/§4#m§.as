package §use var final§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §4#m§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§break for include§;
      
      private var client:§set const final§;
      
      private var modelId:Long;
      
      private var §<#G§:Long;
      
      private var §else const catch§:ICodec;
      
      private var §var for true§:ICodec;
      
      private var §?9§:ICodec;
      
      private var §4#S§:ICodec;
      
      private var §default package§:Long;
      
      private var §1#H§:ICodec;
      
      public function §4#m§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §set const final§(this);
         this.modelId = Long.getLong(592429654,1339096271);
         this.§<#G§ = Long.getLong(1979897371,-1124194266);
         this.§default package§ = Long.getLong(1470645133,813558546);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §break for include§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §implements each§
      {
         return §implements each§(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§<#G§:
               break;
            case this.§default package§:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

