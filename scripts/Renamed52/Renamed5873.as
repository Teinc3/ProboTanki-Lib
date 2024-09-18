package Renamed52
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class Renamed5873 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed10016;
      
      private var client:Renamed53;
      
      private var modelId:Long;
      
      private var Renamed6166:Long;
      
      private var Renamed6167:ICodec;
      
      private var Renamed6168:Long;
      
      private var Renamed6169:ICodec;
      
      private var Renamed6170:ICodec;
      
      private var Renamed6171:Long;
      
      private var Renamed6172:ICodec;
      
      private var Renamed6173:ICodec;
      
      private var Renamed10017:ICodec;
      
      public function Renamed5873()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed53(this);
         this.modelId = Long.getLong(254322684,-956504003);
         this.Renamed6166 = Long.getLong(1180507715,64759943);
         this.Renamed6168 = Long.getLong(547115248,565846485);
         this.Renamed6171 = Long.getLong(547115248,577422584);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed10016(IModel(this));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
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

