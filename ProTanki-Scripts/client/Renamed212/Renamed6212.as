package Renamed4829
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class Renamed6212 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed6199;
      
      private var client:Renamed4830;
      
      private var modelId:Long;
      
      private var Renamed6213:Long;
      
      private var Renamed6214:Long;
      
      private var Renamed6215:Long;
      
      private var Renamed6216:ICodec;
      
      private var Renamed6217:Long;
      
      private var Renamed6218:Long;
      
      private var Renamed6219:ICodec;
      
      private var Renamed6220:ICodec;
      
      public function Renamed6212()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed4830(this);
         this.modelId = Long.getLong(0,300020022);
         this.Renamed6213 = Long.getLong(0,300020062);
         this.Renamed6214 = Long.getLong(0,300020063);
         this.Renamed6215 = Long.getLong(0,300020064);
         this.Renamed6217 = Long.getLong(0,300020065);
         this.Renamed6218 = Long.getLong(0,300020066);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed6199(IModel(this));
         this.Renamed6216 = this._protocol.getCodec(new TypeCodecInfo(String,false));
         this.Renamed6219 = this._protocol.getCodec(new TypeCodecInfo(Boolean,false));
         this.Renamed6220 = this._protocol.getCodec(new TypeCodecInfo(String,false));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed6213:
               this.client.Renamed3579();
               break;
            case this.Renamed6214:
               this.client.Renamed3578();
               break;
            case this.Renamed6215:
               this.client.Renamed6221(String(this.Renamed6216.decode(param2)));
               break;
            case this.Renamed6217:
               this.client.Renamed6222();
               break;
            case this.Renamed6218:
               this.client.Renamed3582(Boolean(this.Renamed6219.decode(param2)),String(this.Renamed6220.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

