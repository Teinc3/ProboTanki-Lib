package projects.tanks.client.garage.models.item.present
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class PresentItemModelBase extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:PresentItemModelServer;
      
      private var client:IPresentItemModelBase;
      
      private var modelId:Long;
      
      public function PresentItemModelBase()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = IPresentItemModelBase(this);
         this.modelId = Long.getLong(253893103,1551357114);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new PresentItemModelServer(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : PresentItemCC
      {
         return PresentItemCC(initParams[Model.object]);
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

