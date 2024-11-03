package Renamed257
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class Renamed5314 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed6796;
      
      private var client:Renamed4597;
      
      private var modelId:Long;
      
      public function Renamed5314()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed4597(this);
         this.modelId = Long.getLong(759725658,1071543601);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed6796(IModel(this));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         if(Boolean(0))
         {
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

