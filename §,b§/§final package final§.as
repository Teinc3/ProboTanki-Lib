package §,b§
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
   
   public class §final package final§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§ !i§;
      
      private var client:§switch catch extends§;
      
      private var modelId:Long;
      
      private var §final catch extends§:Long;
      
      private var §8!6§:ICodec;
      
      public function §final package final§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §switch catch extends§(this);
         this.modelId = Long.getLong(528941690,1765829096);
         this.§final catch extends§ = Long.getLong(1484172224,917467553);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new § !i§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
         this.§8!6§ = this._protocol.getCodec(new TypeCodecInfo(int,false));
      }
      
      protected function getInitParam() : §;"`§
      {
         return §;"`§(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§final catch extends§:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

