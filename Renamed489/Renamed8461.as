package Renamed489
{
   import Renamed602.Renamed603;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import Renamed349.Renamed3105;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class Renamed8461 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed9613;
      
      private var client:Renamed8460;
      
      private var modelId:Long;
      
      private var Renamed4864:Long;
      
      private var Renamed4866:Long;
      
      private var Renamed9614:Long;
      
      private var Renamed9615:ICodec;
      
      private var Renamed9616:ICodec;
      
      public function Renamed8461()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed8460(this);
         this.modelId = Long.getLong(2040386917,729965137);
         this.Renamed4864 = Long.getLong(1582297866,2028596660);
         this.Renamed4866 = Long.getLong(2129251848,-1338052132);
         this.Renamed9614 = Long.getLong(338478335,1466416629);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed9613(IModel(this));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed4864:
               this.client.startFire();
               break;
            case this.Renamed4866:
               this.client.Renamed4862();
               break;
            case this.Renamed9614:
               this.client.Renamed3114(Renamed603(this.Renamed9615.decode(param2)),this.Renamed9616.decode(param2) as Vector.<Renamed3105>);
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

