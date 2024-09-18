package Renamed4808
{
   import Renamed225.Renamed5522;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class Renamed5523 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed5524;
      
      private var client:Renamed4809;
      
      private var modelId:Long;
      
      private var Renamed5525:Long;
      
      private var Renamed5526:ICodec;
      
      private var Renamed5527:ICodec;
      
      private var Renamed5528:Long;
      
      private var Renamed5529:ICodec;
      
      private var Renamed5530:Long;
      
      private var Renamed5531:ICodec;
      
      private var Renamed5532:ICodec;
      
      private var Renamed5533:Long;
      
      private var Renamed5534:ICodec;
      
      public function Renamed5523()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed4809(this);
         this.modelId = Long.getLong(1726782619,1524609945);
         this.Renamed5525 = Long.getLong(205404481,2036669945);
         this.Renamed5528 = Long.getLong(1555095151,929348553);
         this.Renamed5530 = Long.getLong(1017385554,-1412933910);
         this.Renamed5533 = Long.getLong(1483129213,1398282388);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed5524(IModel(this));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed5525:
               this.client.Renamed5535(this.Renamed5526.decode(param2) as Vector.<Renamed5536>,Renamed5522(this.Renamed5527.decode(param2)));
               break;
            case this.Renamed5528:
               this.client.Renamed5537(Renamed5522(this.Renamed5529.decode(param2)));
               break;
            case this.Renamed5530:
               this.client.skipDailyQuest(Long(this.Renamed5531.decode(param2)),Renamed5536(this.Renamed5532.decode(param2)));
               break;
            case this.Renamed5533:
               this.client.Renamed5538(Long(this.Renamed5534.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

