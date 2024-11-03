package projects.tanks.client.tanksservices.model.notifier.uid
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Renamed4409 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed4407;
      
      private var client:Renamed4405;
      
      private var modelId:Long;
      
      private var Renamed4410:Long;
      
      private var Renamed4411:ICodec;
      
      public function Renamed4409()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed4405(this);
         this.modelId = Long.getLong(990863444,376077627);
         this.Renamed4410 = Long.getLong(290132373,74250398);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed4407(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : UidNotifierData
      {
         return UidNotifierData(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed4410:
               this.client.setUid(this.Renamed4411.decode(param2) as Vector.<UidNotifierData>);
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

