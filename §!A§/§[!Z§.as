package §!A§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §[!Z§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§final extends§;
      
      private var client:§@"8§;
      
      private var modelId:Long;
      
      private var §const for var§:Long;
      
      private var §case set finally§:ICodec;
      
      public function §[!Z§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §@"8§(this);
         this.modelId = Long.getLong(118876660,-1267889929);
         this.§const for var§ = Long.getLong(2126351838,-2114277847);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §final extends§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : §#"+§
      {
         return §#"+§(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§const for var§:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

