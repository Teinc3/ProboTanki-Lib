package Renamed65
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Renamed10211 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed10212;
      
      private var client:Renamed67;
      
      private var modelId:Long;
      
      private var Renamed4922:Long;
      
      private var Renamed4923:ICodec;
      
      private var Renamed10213:ICodec;
      
      private var Renamed10214:ICodec;
      
      private var Renamed10215:ICodec;
      
      private var Renamed4927:Long;
      
      private var Renamed4928:ICodec;
      
      private var Renamed10216:ICodec;
      
      public function Renamed10211()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed67(this);
         this.modelId = Long.getLong(1952266263,-1912192267);
         this.Renamed4922 = Long.getLong(823399156,351343872);
         this.Renamed4927 = Long.getLong(1289133603,-862527368);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed10212(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Renamed66
      {
         return Renamed66(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed4922:
               break;
            case this.Renamed4927:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

