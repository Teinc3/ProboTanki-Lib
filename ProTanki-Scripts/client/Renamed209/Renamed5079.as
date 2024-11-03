package Renamed209
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Renamed5079 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed5965;
      
      private var client:Renamed2752;
      
      private var modelId:Long;
      
      private var Renamed6161:Long;
      
      private var Renamed6162:ICodec;
      
      public function Renamed5079()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed2752(this);
         this.modelId = Long.getLong(528941690,1765829096);
         this.Renamed6161 = Long.getLong(1484172224,917467553);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed5965(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
         this.Renamed6162 = this._protocol.getCodec(new TypeCodecInfo(int,false));
      }
      
      protected function getInitParam() : Renamed6158
      {
         return Renamed6158(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed6161:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

