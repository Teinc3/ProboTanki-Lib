package Renamed82
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Renamed9818 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed10326;
      
      private var client:Renamed83;
      
      private var modelId:Long;
      
      private var Renamed10327:Long;
      
      private var Renamed10328:Long;
      
      private var Renamed10329:ICodec;
      
      private var Renamed10330:ICodec;
      
      private var Renamed10331:Long;
      
      public function Renamed9818()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed83(this);
         this.modelId = Long.getLong(1645686167,1474428435);
         this.Renamed10327 = Long.getLong(1426613749,-669664322);
         this.Renamed10328 = Long.getLong(387341675,1817286639);
         this.Renamed10331 = Long.getLong(877312902,1109359872);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed10326(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Renamed84
      {
         return Renamed84(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed10327:
            case this.Renamed10328:
               break;
            case this.Renamed10331:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

