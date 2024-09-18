package projects.tanks.client.tanksservices.model.notifier.rank
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class §extends set default§ extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:§["E§;
      
      private var client:§set var include§;
      
      private var modelId:Long;
      
      private var §if var native§:Long;
      
      private var §continue break§:ICodec;
      
      public function §extends set default§()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = §set var include§(this);
         this.modelId = Long.getLong(60229216,350352129);
         this.§if var native§ = Long.getLong(1290751540,-2034560678);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new §["E§(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : RankNotifierData
      {
         return RankNotifierData(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.§if var native§:
               this.client.setRank(this.§continue break§.decode(param2) as Vector.<RankNotifierData>);
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

