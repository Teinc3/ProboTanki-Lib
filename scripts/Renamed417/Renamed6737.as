package Renamed417
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class Renamed6737 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed8667;
      
      private var client:Renamed4479;
      
      private var modelId:Long;
      
      private var Renamed7918:Long;
      
      private var Renamed8669:ICodec;
      
      public function Renamed6737()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed4479(this);
         this.modelId = Long.getLong(2058573415,-746879275);
         this.Renamed7918 = Long.getLong(888592950,-646476035);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed8667(IModel(this));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed7918:
               this.client.show(String(this.Renamed8669.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

