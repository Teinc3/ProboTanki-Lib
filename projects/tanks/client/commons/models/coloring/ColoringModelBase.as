package projects.tanks.client.commons.models.coloring
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class ColoringModelBase extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:ColoringModelServer;
      
      private var client:IColoringModelBase;
      
      private var modelId:Long;
      
      public function ColoringModelBase()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = IColoringModelBase(this);
         this.modelId = Long.getLong(947299051,-358915161);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new ColoringModelServer(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : ColoringCC
      {
         return ColoringCC(initParams[Model.object]);
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

