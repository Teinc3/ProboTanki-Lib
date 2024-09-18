package Renamed77
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Renamed10276 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed10265;
      
      private var client:Renamed4701;
      
      private var modelId:Long;
      
      private var Renamed10277:Long;
      
      private var Renamed10278:ICodec;
      
      private var Renamed10279:ICodec;
      
      private var Renamed10280:Long;
      
      private var Renamed10281:Long;
      
      private var Renamed10282:ICodec;
      
      public function Renamed10276()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed4701(this);
         this.modelId = Long.getLong(1691794381,-1794202080);
         this.Renamed10277 = Long.getLong(2087187664,-1594727181);
         this.Renamed10280 = Long.getLong(1056602643,1332983261);
         this.Renamed10281 = Long.getLong(1740337189,-128463099);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed10265(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Renamed78
      {
         return Renamed78(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed10277:
            case this.Renamed10280:
               break;
            case this.Renamed10281:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

