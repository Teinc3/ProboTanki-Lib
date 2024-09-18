package Renamed368
{
   import Renamed136.Renamed663;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class ChatModelBase extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:ChatModelServer;
      
      private var client:IChatModelBase;
      
      private var modelId:Long;
      
      private var Renamed8229:Long;
      
      private var Renamed8230:ICodec;
      
      private var Renamed8231:ICodec;
      
      private var Renamed8232:ICodec;
      
      private var Renamed8233:Long;
      
      private var Renamed8234:ICodec;
      
      private var Renamed8235:ICodec;
      
      private var Renamed8236:Long;
      
      private var Renamed8237:ICodec;
      
      private var Renamed8238:Long;
      
      private var Renamed8239:ICodec;
      
      private var Renamed8240:ICodec;
      
      private var Renamed8241:ICodec;
      
      private var Renamed8242:Long;
      
      private var Renamed8243:ICodec;
      
      public function ChatModelBase()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = IChatModelBase(this);
         this.modelId = Long.getLong(1896886505,1439133662);
         this.Renamed8229 = Long.getLong(646043180,-1436998681);
         this.Renamed8233 = Long.getLong(1034571197,-1592026199);
         this.Renamed8236 = Long.getLong(378844051,-1452201622);
         this.Renamed8238 = Long.getLong(939004753,1106765308);
         this.Renamed8242 = Long.getLong(750015069,1108412070);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new ChatModelServer(IModel(this));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed8229:
               this.client.addMessage(String(this.Renamed8230.decode(param2)),String(this.Renamed8231.decode(param2)),Renamed663(this.Renamed8232.decode(param2)));
               break;
            case this.Renamed8233:
               this.client.Renamed2579(String(this.Renamed8234.decode(param2)),String(this.Renamed8235.decode(param2)));
               break;
            case this.Renamed8236:
               this.client.Renamed2580(String(this.Renamed8237.decode(param2)));
               break;
            case this.Renamed8238:
               this.client.Renamed2577(String(this.Renamed8239.decode(param2)),String(this.Renamed8240.decode(param2)),Renamed663(this.Renamed8241.decode(param2)));
               break;
            case this.Renamed8242:
               this.client.Renamed2584(String(this.Renamed8243.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

