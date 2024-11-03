package Renamed334
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class Renamed3551 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed7908;
      
      private var client:Renamed3552;
      
      private var modelId:Long;
      
      private var Renamed4309:Long;
      
      public function Renamed3551()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed3552(this);
         this.modelId = Long.getLong(0,300020020);
         this.Renamed4309 = Long.getLong(0,300020049);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed7908(IModel(this));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed4309:
               this.client.wrongPassword();
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

