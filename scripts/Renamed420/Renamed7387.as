package Renamed420
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
   
   public class Renamed7387 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed8716;
      
      private var client:Renamed4823;
      
      private var modelId:Long;
      
      private var Renamed8717:Long;
      
      private var Renamed8718:Long;
      
      private var Renamed8719:ICodec;
      
      private var Renamed8720:ICodec;
      
      private var Renamed8721:ICodec;
      
      private var Renamed8722:ICodec;
      
      private var Renamed8723:Long;
      
      private var Renamed8724:ICodec;
      
      public function Renamed7387()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed4823(this);
         this.modelId = Long.getLong(0,300050053);
         this.Renamed8717 = Long.getLong(0,300050029);
         this.Renamed8718 = Long.getLong(0,300050030);
         this.Renamed8723 = Long.getLong(0,300050031);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed8716(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
         this.Renamed8720 = this._protocol.getCodec(new TypeCodecInfo(String,false));
         this.Renamed8721 = this._protocol.getCodec(new TypeCodecInfo(String,false));
         this.Renamed8722 = this._protocol.getCodec(new TypeCodecInfo(String,false));
         this.Renamed8724 = this._protocol.getCodec(new TypeCodecInfo(String,false));
      }
      
      protected function getInitParam() : Renamed8195
      {
         return Renamed8195(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed8717:
               this.client.Renamed7390();
               break;
            case this.Renamed8718:
               this.client.Renamed7391(this.Renamed8719.decode(param2) as Vector.<Renamed1806>,String(this.Renamed8720.decode(param2)),String(this.Renamed8721.decode(param2)),String(this.Renamed8722.decode(param2)));
               break;
            case this.Renamed8723:
               this.client.Renamed7398(String(this.Renamed8724.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

