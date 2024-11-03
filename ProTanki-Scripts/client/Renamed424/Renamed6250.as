package Renamed424
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Renamed6250 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed8747;
      
      private var client:Renamed4747;
      
      private var modelId:Long;
      
      private var Renamed5672:Long;
      
      private var Renamed5673:ICodec;
      
      private var Renamed5674:Long;
      
      private var Renamed5675:ICodec;
      
      public function Renamed6250()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed4747(this);
         this.modelId = Long.getLong(0,300090004);
         this.Renamed5672 = Long.getLong(0,300090011);
         this.Renamed5674 = Long.getLong(0,300090012);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed8747(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Renamed8748
      {
         return Renamed8748(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed5672:
               break;
            case this.Renamed5674:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

