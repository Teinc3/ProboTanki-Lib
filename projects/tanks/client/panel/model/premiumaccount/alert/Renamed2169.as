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
   
   public class Renamed2169 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed4368;
      
      private var client:Renamed2168;
      
      private var modelId:Long;
      
      private var Renamed4369:Long;
      
      private var Renamed4370:ICodec;
      
      public function Renamed2169()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed2168(this);
         this.modelId = Long.getLong(287111968,-1381886380);
         this.Renamed4369 = Long.getLong(167154466,288991176);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed4368(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
         this.Renamed4370 = this._protocol.getCodec(new TypeCodecInfo(Boolean,false));
      }
      
      protected function getInitParam() : PremiumAccountAlertCC
      {
         return PremiumAccountAlertCC(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed4369:
               this.client.showWelcomeAlert(Boolean(this.Renamed4370.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

