package § "u§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §7"R§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§!#Z§;
      
      private var client:§static set class§;
      
      private var modelId:Long;
      
      private var §<#G§:Long;
      
      private var §else const catch§:ICodec;
      
      private var §default const else§:ICodec;
      
      private var §9#B§:ICodec;
      
      private var §null var null§:ICodec;
      
      private var §default package§:Long;
      
      private var §1#H§:ICodec;
      
      private var §const package extends§:Long;
      
      private var §3#w§:ICodec;
      
      public function §7"R§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §static set class§(this);
         this.modelId = Long.getLong(387277533,1853292335);
         this.§<#G§ = Long.getLong(87545380,-265767482);
         this.§default package§ = Long.getLong(289812713,334160242);
         this.§const package extends§ = Long.getLong(498560719,475399825);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §!#Z§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §in package try§
      {
         return §in package try§(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§<#G§:
            case this.§default package§:
               break;
            case this.§const package extends§:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

