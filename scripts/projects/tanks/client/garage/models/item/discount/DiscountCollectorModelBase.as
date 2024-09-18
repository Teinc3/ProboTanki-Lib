package projects.tanks.client.garage.models.item.discount
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class DiscountCollectorModelBase extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:DiscountCollectorModelServer;
      
      private var client:IDiscountCollectorModelBase;
      
      private var modelId:Long;
      
      public function DiscountCollectorModelBase()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = IDiscountCollectorModelBase(this);
         this.modelId = Long.getLong(1896140971,-1323660734);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new DiscountCollectorModelServer(IModel(this));
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

