package Renamed272
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class Renamed3541 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed7092;
      
      private var client:Renamed3542;
      
      private var modelId:Long;
      
      private var Renamed7094:Long;
      
      private var Renamed7095:ICodec;
      
      private var Renamed7096:Long;
      
      private var Renamed7097:ICodec;
      
      private var Renamed7098:ICodec;
      
      private var Renamed7099:ICodec;
      
      private var Renamed7100:ICodec;
      
      public function Renamed3541()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed3542(this);
         this.modelId = Long.getLong(0,300020004);
         this.Renamed7094 = Long.getLong(0,300020000);
         this.Renamed7096 = Long.getLong(0,300020001);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed7092(IModel(this));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed7094:
               this.client.youAreBlocked(String(this.Renamed7095.decode(param2)));
               break;
            case this.Renamed7096:
               this.client.youWereKicked(String(this.Renamed7097.decode(param2)),int(this.Renamed7098.decode(param2)),int(this.Renamed7099.decode(param2)),int(this.Renamed7100.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

