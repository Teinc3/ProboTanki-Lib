package projects.tanks.client.panel.model.premiumaccount.alert
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §native package finally§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§use catch var§;
      
      private var client:§3"l§;
      
      private var modelId:Long;
      
      private var §4!`§:Long;
      
      private var §switch package get§:ICodec;
      
      public function §native package finally§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §3"l§(this);
         this.modelId = Long.getLong(287111968,-1381886380);
         this.§4!`§ = Long.getLong(167154466,288991176);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §use catch var§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
         this.§switch package get§ = this._protocol.getCodec(new TypeCodecInfo(Boolean,false));
      }
      
      protected function getInitParam() : PremiumAccountAlertCC
      {
         return PremiumAccountAlertCC(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§4!`§:
               this.client.showWelcomeAlert(Boolean(this.§switch package get§.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

