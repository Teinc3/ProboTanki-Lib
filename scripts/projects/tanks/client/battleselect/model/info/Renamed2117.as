package projects.tanks.client.battleselect.model.info
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Renamed2117 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed4186;
      
      private var client:Renamed2116;
      
      private var modelId:Long;
      
      private var Renamed4188:Long;
      
      private var Renamed4189:Long;
      
      private var Renamed4190:Long;
      
      private var Renamed4191:ICodec;
      
      private var Renamed4192:Long;
      
      private var Renamed4193:Long;
      
      private var _updateNameId:Long;
      
      private var Renamed4194:ICodec;
      
      private var Renamed4195:Long;
      
      private var Renamed4196:ICodec;
      
      private var Renamed4197:ICodec;
      
      public function Renamed2117()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed2116(this);
         this.modelId = Long.getLong(0,300090007);
         this.Renamed4188 = Long.getLong(0,300090014);
         this.Renamed4189 = Long.getLong(0,300090015);
         this.Renamed4190 = Long.getLong(0,300090016);
         this.Renamed4192 = Long.getLong(0,300090017);
         this.Renamed4193 = Long.getLong(0,300090018);
         this._updateNameId = Long.getLong(0,300090019);
         this.Renamed4195 = Long.getLong(0,300090020);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed4186(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Renamed2118
      {
         return Renamed2118(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed4188:
               this.client.battleStop();
               break;
            case this.Renamed4189:
               this.client.Renamed2123();
               break;
            case this.Renamed4190:
               break;
            case this.Renamed4192:
               this.client.roundFinish();
               break;
            case this.Renamed4193:
               this.client.roundStart();
               break;
            case this._updateNameId:
               this.client.updateName(String(this.Renamed4194.decode(param2)));
               break;
            case this.Renamed4195:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

