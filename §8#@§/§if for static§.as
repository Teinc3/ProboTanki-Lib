package §8#@§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §if for static§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§;#$§;
      
      private var client:§0""§;
      
      private var modelId:Long;
      
      public function §if for static§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §0""§(this);
         this.modelId = Long.getLong(253811659,1003298843);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §;#$§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §final const continue§
      {
         return §final const continue§(initParams[Model.object]);
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

