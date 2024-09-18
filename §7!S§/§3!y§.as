package §7!S§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.client.models.commons.types.ValidationStatus;
   
   public class §3!y§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§]"C§;
      
      private var client:§#!d§;
      
      private var modelId:Long;
      
      private var §false extends§:Long;
      
      private var §'#2§:ICodec;
      
      public function §3!y§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §#!d§(this);
         this.modelId = Long.getLong(1543089237,611543143);
         this.§false extends§ = Long.getLong(317069682,-1647554367);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §]"C§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §'J§
      {
         return §'J§(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§false extends§:
               this.client.validateResult(ValidationStatus(this.§'#2§.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

