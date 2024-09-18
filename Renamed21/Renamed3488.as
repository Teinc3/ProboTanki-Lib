package Renamed21
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class Renamed3488 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed6163;
      
      private var client:Renamed22;
      
      private var modelId:Long;
      
      private var Renamed6164:Long;
      
      private var Renamed6165:ICodec;
      
      private var Renamed6166:Long;
      
      private var Renamed6167:ICodec;
      
      private var Renamed6168:Long;
      
      private var Renamed6169:ICodec;
      
      private var Renamed6170:ICodec;
      
      private var Renamed6171:Long;
      
      private var Renamed6172:ICodec;
      
      private var Renamed6173:ICodec;
      
      private var Renamed6174:ICodec;
      
      private var Renamed6175:ICodec;
      
      private var Renamed6176:ICodec;
      
      public function Renamed3488()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed22(this);
         this.modelId = Long.getLong(505740619,208573179);
         this.Renamed6164 = Long.getLong(1314377165,-137514211);
         this.Renamed6166 = Long.getLong(1283643622,1059974789);
         this.Renamed6168 = Long.getLong(954743485,-2074939053);
         this.Renamed6171 = Long.getLong(954743485,-2063362954);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed6163(IModel(this));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed6164:
            case this.Renamed6166:
            case this.Renamed6168:
               break;
            case this.Renamed6171:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

