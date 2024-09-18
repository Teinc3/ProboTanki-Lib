package §,#K§
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §^4§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§with var continue§;
      
      private var client:§null for static§;
      
      private var modelId:Long;
      
      private var §]!Z§:Long;
      
      private var §function set const§:Long;
      
      private var §%"%§:ICodec;
      
      public function §^4§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §null for static§(this);
         this.modelId = Long.getLong(1160724760,1672827267);
         this.§]!Z§ = Long.getLong(2066506492,2070048447);
         this.§function set const§ = Long.getLong(1641742013,1294163764);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §with var continue§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
         this.§%"%§ = this._protocol.getCodec(new TypeCodecInfo(int,false));
      }
      
      protected function getInitParam() : §while catch import§
      {
         return §while catch import§(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§]!Z§:
               break;
            case this.§function set const§:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

