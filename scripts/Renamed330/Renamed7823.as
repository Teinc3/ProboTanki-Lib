package Renamed330
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class Renamed7823 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed7822;
      
      private var client:Renamed4477;
      
      private var modelId:Long;
      
      private var Renamed7824:Long;
      
      private var Renamed7825:ICodec;
      
      public function Renamed7823()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed4477(this);
         this.modelId = Long.getLong(0,300070017);
         this.Renamed7824 = Long.getLong(0,300070015);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed7822(IModel(this));
         this.Renamed7825 = this._protocol.getCodec(new TypeCodecInfo(int,false));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed7824:
               this.client.Renamed7821(int(this.Renamed7825.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

