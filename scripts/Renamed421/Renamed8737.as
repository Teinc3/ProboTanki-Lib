package Renamed421
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class Renamed8731 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed8732;
      
      private var client:Renamed4786;
      
      private var modelId:Long;
      
      private var Renamed8733:Long;
      
      private var Renamed8734:Long;
      
      private var Renamed8735:ICodec;
      
      private var Renamed8736:ICodec;
      
      public function Renamed8731()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed4786(this);
         this.modelId = Long.getLong(841189855,-1268110049);
         this.Renamed8733 = Long.getLong(1282635693,192675762);
         this.Renamed8734 = Long.getLong(2064863564,657165826);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed8732(IModel(this));
         this.Renamed8735 = this._protocol.getCodec(new TypeCodecInfo(String,false));
         this.Renamed8736 = this._protocol.getCodec(new TypeCodecInfo(String,false));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed8733:
               this.client.Renamed5600();
               break;
            case this.Renamed8734:
               this.client.Renamed5602(String(this.Renamed8735.decode(param2)),String(this.Renamed8736.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

