package Renamed94
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Renamed3152 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed10458;
      
      private var client:Renamed95;
      
      private var modelId:Long;
      
      private var Renamed10480:Long;
      
      private var Renamed10481:ICodec;
      
      private var Renamed4922:Long;
      
      private var Renamed4923:ICodec;
      
      private var Renamed4924:ICodec;
      
      private var Renamed10482:ICodec;
      
      private var Renamed10483:ICodec;
      
      private var Renamed10484:ICodec;
      
      private var Renamed10485:Long;
      
      private var Renamed10486:ICodec;
      
      public function Renamed3152()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed95(this);
         this.modelId = Long.getLong(170467452,-1685189911);
         this.Renamed10480 = Long.getLong(741262612,-1895966548);
         this.Renamed4922 = Long.getLong(1921998262,-1791534114);
         this.Renamed10485 = Long.getLong(247034803,-90734157);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed10458(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Renamed96
      {
         return Renamed96(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed10480:
            case this.Renamed4922:
               break;
            case this.Renamed10485:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

