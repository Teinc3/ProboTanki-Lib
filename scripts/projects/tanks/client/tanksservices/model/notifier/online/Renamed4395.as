package projects.tanks.client.tanksservices.model.notifier.online
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class Renamed4395 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed4396;
      
      private var client:Renamed4393;
      
      private var modelId:Long;
      
      private var Renamed4397:Long;
      
      private var Renamed4398:ICodec;
      
      public function Renamed4395()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed4393(this);
         this.modelId = Long.getLong(467887314,-1426971041);
         this.Renamed4397 = Long.getLong(1815033699,-407485089);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed4396(IModel(this));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed4397:
               this.client.setOnline(this.Renamed4398.decode(param2) as Vector.<OnlineNotifierData>);
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

