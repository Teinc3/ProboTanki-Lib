package Renamed4619
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class Renamed5379 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed5380;
      
      private var client:Renamed4620;
      
      private var modelId:Long;
      
      private var Renamed5381:Long;
      
      private var Renamed5382:ICodec;
      
      private var Renamed5383:Long;
      
      private var Renamed5384:ICodec;
      
      private var Renamed5385:Long;
      
      public function Renamed5379()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed4620(this);
         this.modelId = Long.getLong(1286074115,-176946994);
         this.Renamed5381 = Long.getLong(343596326,-230405373);
         this.Renamed5383 = Long.getLong(208555485,-6667003);
         this.Renamed5385 = Long.getLong(154981282,1951339013);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed5380(IModel(this));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed5381:
               break;
            case this.Renamed5383:
               this.client.Renamed5386(int(this.Renamed5384.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

