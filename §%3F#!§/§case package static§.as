package §?#!§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §case package static§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§false set package§;
      
      private var client:§if catch break§;
      
      private var modelId:Long;
      
      private var §6#i§:Long;
      
      private var §null package§:ICodec;
      
      private var §;!`§:Long;
      
      private var §native class§:ICodec;
      
      private var §break var catch§:ICodec;
      
      private var §const var break§:Long;
      
      public function §case package static§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §if catch break§(this);
         this.modelId = Long.getLong(0,300090028);
         this.§6#i§ = Long.getLong(0,300090034);
         this.§;!`§ = Long.getLong(0,300090035);
         this.§const var break§ = Long.getLong(0,300090036);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §false set package§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §dynamic const function§
      {
         return §dynamic const function§(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§6#i§:
            case this.§;!`§:
               break;
            case this.§const var break§:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

