package §static set get§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §super catch while§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§%!%§;
      
      private var client:§default var class§;
      
      private var modelId:Long;
      
      private var §6#i§:Long;
      
      private var §null package§:ICodec;
      
      private var §;!`§:Long;
      
      private var §native class§:ICodec;
      
      public function §super catch while§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §default var class§(this);
         this.modelId = Long.getLong(0,300090004);
         this.§6#i§ = Long.getLong(0,300090011);
         this.§;!`§ = Long.getLong(0,300090012);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §%!%§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §switch package class§
      {
         return §switch package class§(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§6#i§:
               break;
            case this.§;!`§:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

