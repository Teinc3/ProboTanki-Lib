package Renamed398
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Renamed8508 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed8505;
      
      private var client:Renamed4840;
      
      private var modelId:Long;
      
      private var Renamed8509:Long;
      
      public function Renamed8508()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed4840(this);
         this.modelId = Long.getLong(0,300020028);
         this.Renamed8509 = Long.getLong(0,300020068);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed8505(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Renamed8510
      {
         return Renamed8510(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed8509:
               this.client.serverHalt();
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

