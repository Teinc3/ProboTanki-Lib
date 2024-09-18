package Renamed4745
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Renamed4961 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed5671;
      
      private var client:Renamed4746;
      
      private var modelId:Long;
      
      private var Renamed5672:Long;
      
      private var Renamed5673:ICodec;
      
      private var Renamed5674:Long;
      
      private var Renamed5675:ICodec;
      
      private var Renamed5676:ICodec;
      
      private var Renamed5677:Long;
      
      public function Renamed4961()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed4746(this);
         this.modelId = Long.getLong(0,300090028);
         this.Renamed5672 = Long.getLong(0,300090034);
         this.Renamed5674 = Long.getLong(0,300090035);
         this.Renamed5677 = Long.getLong(0,300090036);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed5671(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Renamed5678
      {
         return Renamed5678(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed5672:
            case this.Renamed5674:
               break;
            case this.Renamed5677:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

