package Renamed31
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Renamed6812 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed6809;
      
      private var client:Renamed32;
      
      private var modelId:Long;
      
      private var Renamed4864:Long;
      
      private var Renamed4865:ICodec;
      
      private var Renamed4866:Long;
      
      private var Renamed4867:ICodec;
      
      public function Renamed6812()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed32(this);
         this.modelId = Long.getLong(1034700989,1212373553);
         this.Renamed4864 = Long.getLong(597053943,1126684268);
         this.Renamed4866 = Long.getLong(119287527,-1716930052);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed6809(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Renamed33
      {
         return Renamed33(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed4864:
               break;
            case this.Renamed4866:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

