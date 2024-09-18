package projects.tanks.client.battleservice.model.statistics
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Renamed4236 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed4237;
      
      private var client:Renamed4214;
      
      private var modelId:Long;
      
      private var Renamed4238:Long;
      
      private var Renamed4239:ICodec;
      
      private var Renamed4240:Long;
      
      private var Renamed4241:Long;
      
      private var Renamed4242:ICodec;
      
      private var Renamed4243:ICodec;
      
      private var Renamed4192:Long;
      
      private var Renamed4244:ICodec;
      
      private var Renamed4245:ICodec;
      
      private var Renamed4246:ICodec;
      
      private var Renamed4193:Long;
      
      private var Renamed4247:ICodec;
      
      private var Renamed4248:ICodec;
      
      private var Renamed4249:Long;
      
      private var Renamed4250:Long;
      
      private var Renamed4251:ICodec;
      
      private var Renamed4252:ICodec;
      
      public function Renamed4236()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed4214(this);
         this.modelId = Long.getLong(485575169,-17734339);
         this.Renamed4238 = Long.getLong(2027633487,-2104416877);
         this.Renamed4240 = Long.getLong(1618593100,700634933);
         this.Renamed4241 = Long.getLong(794588440,-1349024015);
         this.Renamed4192 = Long.getLong(1570125867,640719657);
         this.Renamed4193 = Long.getLong(2027560760,1768125684);
         this.Renamed4249 = Long.getLong(1312331174,-81511448);
         this.Renamed4250 = Long.getLong(844922966,157499169);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed4237(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Renamed4220
      {
         return Renamed4220(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed4238:
               this.client.Renamed4215(int(this.Renamed4239.decode(param2)));
               break;
            case this.Renamed4240:
               this.client.Renamed4216();
               break;
            case this.Renamed4241:
               break;
            case this.Renamed4192:
               this.client.roundFinish(Boolean(this.Renamed4244.decode(param2)),this.Renamed4245.decode(param2) as Vector.<Renamed4209>,int(this.Renamed4246.decode(param2)));
               break;
            case this.Renamed4193:
               this.client.roundStart(int(this.Renamed4247.decode(param2)),Boolean(this.Renamed4248.decode(param2)));
               break;
            case this.Renamed4249:
               this.client.Renamed4218();
               break;
            case this.Renamed4250:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

