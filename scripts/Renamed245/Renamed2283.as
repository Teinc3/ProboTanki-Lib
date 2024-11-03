package Renamed245
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Renamed2283 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed6633;
      
      private var client:Renamed2282;
      
      private var modelId:Long;
      
      private var Renamed6640:Long;
      
      private var Renamed6641:ICodec;
      
      private var Renamed6642:Long;
      
      private var Renamed6643:Long;
      
      private var Renamed6644:Long;
      
      private var Renamed6645:Long;
      
      public function Renamed2283()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed2282(this);
         this.modelId = Long.getLong(0,300050070);
         this.Renamed6640 = Long.getLong(0,300050057);
         this.Renamed6642 = Long.getLong(0,300050058);
         this.Renamed6643 = Long.getLong(0,300050059);
         this.Renamed6644 = Long.getLong(0,300050060);
         this.Renamed6645 = Long.getLong(0,300050061);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed6633(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Renamed6624
      {
         return Renamed6624(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed6640:
               this.client.activateMessage(String(this.Renamed6641.decode(param2)));
               break;
            case this.Renamed6642:
               this.client.emailAlreadyUsed();
               break;
            case this.Renamed6643:
               this.client.incorrectEmail();
               break;
            case this.Renamed6644:
               this.client.passwordChanged();
               break;
            case this.Renamed6645:
               this.client.updatePasswordError();
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

