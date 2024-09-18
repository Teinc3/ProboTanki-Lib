package §final var static§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §9P§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§each catch var§;
      
      private var client:§'r§;
      
      private var modelId:Long;
      
      private var §<#G§:Long;
      
      private var §else const catch§:ICodec;
      
      private var §,!F§:ICodec;
      
      private var §"#n§:ICodec;
      
      private var §"!'§:ICodec;
      
      private var §default package§:Long;
      
      private var §1#H§:ICodec;
      
      private var §continue const case§:ICodec;
      
      public function §9P§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §'r§(this);
         this.modelId = Long.getLong(1952266263,-1912192267);
         this.§<#G§ = Long.getLong(823399156,351343872);
         this.§default package§ = Long.getLong(1289133603,-862527368);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §each catch var§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §"#;§
      {
         return §"#;§(initParams[Model.object]);
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

