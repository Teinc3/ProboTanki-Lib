package Renamed349
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class Renamed8069 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed8061;
      
      private var client:Renamed4665;
      
      private var modelId:Long;
      
      private var Renamed6166:Long;
      
      private var Renamed6167:ICodec;
      
      private var Renamed8070:ICodec;
      
      private var Renamed8071:ICodec;
      
      public function Renamed8069()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed4665(this);
         this.modelId = Long.getLong(486222912,-663069007);
         this.Renamed6166 = Long.getLong(1666638426,-1858765435);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed8061(IModel(this));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed6166:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

