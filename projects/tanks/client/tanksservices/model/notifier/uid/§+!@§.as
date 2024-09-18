package projects.tanks.client.tanksservices.model.notifier.uid
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §+!@§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§?X§;
      
      private var client:§<!o§;
      
      private var modelId:Long;
      
      private var §class if§:Long;
      
      private var §^#M§:ICodec;
      
      public function §+!@§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §<!o§(this);
         this.modelId = Long.getLong(990863444,376077627);
         this.§class if§ = Long.getLong(290132373,74250398);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §?X§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : UidNotifierData
      {
         return UidNotifierData(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§class if§:
               this.client.setUid(this.§^#M§.decode(param2) as Vector.<UidNotifierData>);
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

