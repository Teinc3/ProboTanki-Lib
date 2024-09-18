package Renamed4624
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class Renamed5795 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed5796;
      
      private var client:Renamed4625;
      
      private var modelId:Long;
      
      private var Renamed5797:Long;
      
      public function Renamed5795()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed4625(this);
         this.modelId = Long.getLong(121770418,618912707);
         this.Renamed5797 = Long.getLong(335434599,-27161610);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed5796(IModel(this));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed5797:
               this.client.Renamed3830();
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

