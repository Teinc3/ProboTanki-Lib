package Renamed4800
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class Renamed6045 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed6042;
      
      private var client:Renamed4801;
      
      private var modelId:Long;
      
      private var Renamed6046:Long;
      
      private var Renamed6047:ICodec;
      
      private var Renamed6048:ICodec;
      
      private var Renamed6049:ICodec;
      
      public function Renamed6045()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed4801(this);
         this.modelId = Long.getLong(1118509469,-35521391);
         this.Renamed6046 = Long.getLong(523922434,-1392224255);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed6042(IModel(this));
         this.Renamed6047 = this._protocol.getCodec(new TypeCodecInfo(int,false));
         this.Renamed6048 = this._protocol.getCodec(new TypeCodecInfo(int,false));
         this.Renamed6049 = this._protocol.getCodec(new TypeCodecInfo(int,false));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed6046:
               this.client.Renamed6044(int(this.Renamed6047.decode(param2)),int(this.Renamed6048.decode(param2)),int(this.Renamed6049.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

