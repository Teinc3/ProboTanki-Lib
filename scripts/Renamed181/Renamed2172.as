package Renamed2170
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class Renamed2172 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed5722;
      
      private var client:Renamed2171;
      
      private var modelId:Long;
      
      private var Renamed5724:Long;
      
      public function Renamed2172()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed2171(this);
         this.modelId = Long.getLong(1012007416,-1351622809);
         this.Renamed5724 = Long.getLong(1585320728,11519581);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed5722(IModel(this));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed5724:
               this.client.showAlert();
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

