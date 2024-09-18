package Renamed9
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Renamed4921 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed4905;
      
      private var client:Renamed11;
      
      private var modelId:Long;
      
      private var Renamed4922:Long;
      
      private var Renamed4923:ICodec;
      
      private var Renamed4924:ICodec;
      
      private var Renamed4925:ICodec;
      
      private var Renamed4926:ICodec;
      
      private var Renamed4927:Long;
      
      private var Renamed4928:ICodec;
      
      private var Renamed4929:Long;
      
      private var Renamed4930:ICodec;
      
      public function Renamed4921()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed11(this);
         this.modelId = Long.getLong(387277533,1853292335);
         this.Renamed4922 = Long.getLong(87545380,-265767482);
         this.Renamed4927 = Long.getLong(289812713,334160242);
         this.Renamed4929 = Long.getLong(498560719,475399825);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed4905(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Renamed10
      {
         return Renamed10(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed4922:
            case this.Renamed4927:
               break;
            case this.Renamed4929:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

