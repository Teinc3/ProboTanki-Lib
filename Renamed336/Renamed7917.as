package Renamed336
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class Renamed2089 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed7915;
      
      private var client:Renamed2088;
      
      private var modelId:Long;
      
      private var Renamed7916:Long;
      
      public function Renamed2089()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed2088(this);
         this.modelId = Long.getLong(0,300050023);
         this.Renamed7916 = Long.getLong(0,300050021);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed7915(IModel(this));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed7916:
               this.client.onUsersLoaded();
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

