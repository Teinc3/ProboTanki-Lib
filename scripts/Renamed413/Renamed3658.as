package Renamed413
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class Renamed3658 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed8648;
      
      private var client:Renamed3659;
      
      private var modelId:Long;
      
      private var Renamed8649:Long;
      
      private var Renamed8650:Long;
      
      public function Renamed3658()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed3659(this);
         this.modelId = Long.getLong(1044301282,-2025301046);
         this.Renamed8649 = Long.getLong(182699568,659372466);
         this.Renamed8650 = Long.getLong(182698837,-1030515090);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed8648(IModel(this));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed8649:
               this.client.Renamed3662();
               break;
            case this.Renamed8650:
               this.client.Renamed3665();
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

