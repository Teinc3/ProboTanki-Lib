package projects.tanks.client.panel.model.battleinvite
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Renamed2085 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed4323;
      
      private var client:Renamed2084;
      
      private var modelId:Long;
      
      private var Renamed4324:Long;
      
      private var Renamed4325:ICodec;
      
      private var Renamed4326:Long;
      
      private var Renamed4327:ICodec;
      
      private var Renamed4328:ICodec;
      
      private var Renamed4329:Long;
      
      private var Renamed4330:ICodec;
      
      private var Renamed4331:Long;
      
      private var Renamed4332:ICodec;
      
      private var Renamed4333:Long;
      
      private var Renamed4334:ICodec;
      
      private var Renamed4335:Long;
      
      private var Renamed4336:ICodec;
      
      private var Renamed4337:Long;
      
      private var Renamed4338:ICodec;
      
      private var Renamed4339:Long;
      
      private var Renamed4340:ICodec;
      
      public function Renamed2085()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed2084(this);
         this.modelId = Long.getLong(0,300050004);
         this.Renamed4324 = Long.getLong(0,300050009);
         this.Renamed4326 = Long.getLong(0,300050010);
         this.Renamed4329 = Long.getLong(0,300050011);
         this.Renamed4331 = Long.getLong(0,300050012);
         this.Renamed4333 = Long.getLong(0,300050013);
         this.Renamed4335 = Long.getLong(0,300050014);
         this.Renamed4337 = Long.getLong(0,300050015);
         this.Renamed4339 = Long.getLong(0,300050016);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed4323(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Renamed4321
      {
         return Renamed4321(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed4324:
            case this.Renamed4326:
            case this.Renamed4329:
            case this.Renamed4331:
            case this.Renamed4333:
            case this.Renamed4335:
            case this.Renamed4337:
               break;
            case this.Renamed4339:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

