package Renamed331
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class Renamed7830 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed7828;
      
      private var client:Renamed4815;
      
      private var modelId:Long;
      
      private var Renamed7831:Long;
      
      private var Renamed7832:ICodec;
      
      public function Renamed7830()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed4815(this);
         this.modelId = Long.getLong(432617209,-1426923357);
         this.Renamed7831 = Long.getLong(1322262736,-1419663103);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed7828(IModel(this));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed7831:
               this.client.Renamed7826(this.Renamed7832.decode(param2) as Vector.<Renamed1906>);
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

