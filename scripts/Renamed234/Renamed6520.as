package Renamed4586
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Float;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class Renamed6520 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed6516;
      
      private var client:Renamed4587;
      
      private var modelId:Long;
      
      private var Renamed5797:Long;
      
      private var Renamed6521:ICodec;
      
      private var Renamed6522:ICodec;
      
      public function Renamed6520()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed4587(this);
         this.modelId = Long.getLong(747925004,799189270);
         this.Renamed5797 = Long.getLong(826158396,-1985123151);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed6516(IModel(this));
         this.Renamed6521 = this._protocol.getCodec(new TypeCodecInfo(int,false));
         this.Renamed6522 = this._protocol.getCodec(new TypeCodecInfo(Float,false));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed5797:
               this.client.Renamed3830(int(this.Renamed6521.decode(param2)),Number(this.Renamed6522.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

