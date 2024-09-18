package Renamed455
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class Renamed3554 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed9098;
      
      private var client:Renamed3553;
      
      private var modelId:Long;
      
      private var Renamed9103:Long;
      
      private var Renamed9104:Long;
      
      private var Renamed9105:Long;
      
      private var Renamed9106:ICodec;
      
      public function Renamed3554()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed3553(this);
         this.modelId = Long.getLong(0,300020019);
         this.Renamed9103 = Long.getLong(0,300020045);
         this.Renamed9104 = Long.getLong(0,300020046);
         this.Renamed9105 = Long.getLong(0,300020047);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed9098(IModel(this));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed9103:
            case this.Renamed9104:
               break;
            case this.Renamed9105:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

