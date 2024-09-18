package Renamed194
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class Renamed5927 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed5926;
      
      private var client:Renamed4564;
      
      private var modelId:Long;
      
      private var Renamed5928:Long;
      
      private var Renamed5929:ICodec;
      
      public function Renamed5927()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed4564(this);
         this.modelId = Long.getLong(756280393,-1366394900);
         this.Renamed5928 = Long.getLong(371898920,859714904);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed5926(IModel(this));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed5928:
               this.client.Renamed5925(this.Renamed5929.decode(param2) as Vector.<Renamed5920>);
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

