package projects.tanks.client.tanksservices.model.notifier.premium
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class PremiumNotifierModelBase extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:PremiumNotifierModelServer;
      
      private var client:IPremiumNotifierModelBase;
      
      private var modelId:Long;
      
      private var _setPremiumTimeLeftId:Long;
      
      private var _setPremiumTimeLeft_premiumTimeLeftCodec:ICodec;
      
      private var _updateTimeLeftId:Long;
      
      private var _updateTimeLeft_leftTimeInSecondsCodec:ICodec;
      
      public function PremiumNotifierModelBase()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = IPremiumNotifierModelBase(this);
         this.modelId = Long.getLong(302389563,-1379937773);
         this._setPremiumTimeLeftId = Long.getLong(177962403,-1405245077);
         this._updateTimeLeftId = Long.getLong(1172025171,225736801);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new PremiumNotifierModelServer(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : PremiumNotifierCC
      {
         return PremiumNotifierCC(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this._setPremiumTimeLeftId:
               break;
            case this._updateTimeLeftId:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

