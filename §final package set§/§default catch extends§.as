package §final package set§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §default catch extends§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§each var catch§;
      
      private var client:§]!o§;
      
      private var modelId:Long;
      
      public function §default catch extends§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §]!o§(this);
         this.modelId = Long.getLong(923418047,-17313881);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §each var catch§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §`"B§
      {
         return §`"B§(initParams[Model.object]);
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

