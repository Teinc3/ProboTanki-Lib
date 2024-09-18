package projects.tanks.client.panel.model.socialnetwork
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Renamed2276 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed4377;
      
      private var client:Renamed2275;
      
      private var modelId:Long;
      
      private var Renamed4306:Long;
      
      private var Renamed4378:ICodec;
      
      private var Renamed4379:Long;
      
      private var Renamed4380:ICodec;
      
      private var Renamed4381:Long;
      
      private var Renamed4382:ICodec;
      
      private var Renamed4307:Long;
      
      public function Renamed2276()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed2275(this);
         this.modelId = Long.getLong(0,300050062);
         this.Renamed4306 = Long.getLong(0,300050044);
         this.Renamed4379 = Long.getLong(0,300050045);
         this.Renamed4381 = Long.getLong(0,300050046);
         this.Renamed4307 = Long.getLong(0,300050047);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed4377(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : SocialNetworkPanelCC
      {
         return SocialNetworkPanelCC(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed4306:
               this.client.linkAlreadyExists(String(this.Renamed4378.decode(param2)));
               break;
            case this.Renamed4379:
               this.client.linkCreated(String(this.Renamed4380.decode(param2)));
               break;
            case this.Renamed4381:
               this.client.unlinkSuccess(String(this.Renamed4382.decode(param2)));
               break;
            case this.Renamed4307:
               this.client.validationFailed();
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

