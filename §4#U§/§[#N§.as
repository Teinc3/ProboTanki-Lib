package §4#U§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §[#N§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§[#1§;
      
      private var client:§5[§;
      
      private var modelId:Long;
      
      private var §for set false§:Long;
      
      private var §implements import§:ICodec;
      
      private var §7#O§:Long;
      
      private var §3#<§:Long;
      
      private var §finally if§:Long;
      
      private var §true const false§:Long;
      
      public function §[#N§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §5[§(this);
         this.modelId = Long.getLong(0,300050070);
         this.§for set false§ = Long.getLong(0,300050057);
         this.§7#O§ = Long.getLong(0,300050058);
         this.§3#<§ = Long.getLong(0,300050059);
         this.§finally if§ = Long.getLong(0,300050060);
         this.§true const false§ = Long.getLong(0,300050061);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §[#1§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §<"+§
      {
         return §<"+§(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§for set false§:
               this.client.activateMessage(String(this.§implements import§.decode(param2)));
               break;
            case this.§7#O§:
               this.client.emailAlreadyUsed();
               break;
            case this.§3#<§:
               this.client.incorrectEmail();
               break;
            case this.§finally if§:
               this.client.passwordChanged();
               break;
            case this.§true const false§:
               this.client.updatePasswordError();
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

