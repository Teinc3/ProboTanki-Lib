package Renamed298
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class Renamed4447 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed7442;
      
      private var client:Renamed4448;
      
      private var modelId:Long;
      
      private var Renamed7443:Long;
      
      private var Renamed7444:ICodec;
      
      private var Renamed7445:Long;
      
      private var Renamed7446:Long;
      
      private var Renamed7447:ICodec;
      
      public function Renamed4447()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed4448(this);
         this.modelId = Long.getLong(0,300070009);
         this.Renamed7443 = Long.getLong(0,300070005);
         this.Renamed7445 = Long.getLong(0,300070006);
         this.Renamed7446 = Long.getLong(0,300070007);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed7442(IModel(this));
         this.Renamed7444 = this._protocol.getCodec(new TypeCodecInfo(Long,false));
         this.Renamed7447 = this._protocol.getCodec(new TypeCodecInfo(Long,false));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed7443:
            case this.Renamed7445:
               break;
            case this.Renamed7446:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

