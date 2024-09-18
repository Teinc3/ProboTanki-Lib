package platform.client.core.general.socialnetwork.models.socialnetworkparameters
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class SocialNetworkParametersModelBase extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:SocialNetworkParametersModelServer;
      
      private var client:ISocialNetworkParametersModelBase;
      
      private var modelId:Long;
      
      public function SocialNetworkParametersModelBase()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = ISocialNetworkParametersModelBase(this);
         this.modelId = Long.getLong(1480731399,760833293);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new SocialNetworkParametersModelServer(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
         _loc1_.registerModelConstructorCodec(this.modelId,this._protocol.getCodec(new TypeCodecInfo(SocialNetworkParametersCC,false)));
      }
      
      protected function getInitParam() : SocialNetworkParametersCC
      {
         return SocialNetworkParametersCC(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         if(Boolean(0))
         {
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

