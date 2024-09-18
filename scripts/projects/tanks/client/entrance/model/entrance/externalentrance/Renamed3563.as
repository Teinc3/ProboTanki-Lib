package projects.tanks.client.entrance.model.entrance.externalentrance
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Renamed3563 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed4296;
      
      private var client:Renamed3562;
      
      private var modelId:Long;
      
      private var Renamed4306:Long;
      
      private var Renamed4307:Long;
      
      private var Renamed4308:Long;
      
      private var Renamed4309:Long;
      
      public function Renamed3563()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed3562(this);
         this.modelId = Long.getLong(0,300020013);
         this.Renamed4306 = Long.getLong(0,300020030);
         this.Renamed4307 = Long.getLong(0,300020031);
         this.Renamed4308 = Long.getLong(0,300020032);
         this.Renamed4309 = Long.getLong(0,300020033);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed4296(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Renamed4290
      {
         return Renamed4290(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed4306:
               this.client.linkAlreadyExists();
               break;
            case this.Renamed4307:
               this.client.validationFailed();
               break;
            case this.Renamed4308:
               this.client.validationSuccess();
               break;
            case this.Renamed4309:
               this.client.wrongPassword();
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

