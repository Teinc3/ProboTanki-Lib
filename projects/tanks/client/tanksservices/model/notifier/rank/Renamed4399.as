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
   
   public class Renamed4399 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed4400;
      
      private var client:Renamed4401;
      
      private var modelId:Long;
      
      private var Renamed4402:Long;
      
      private var Renamed4403:ICodec;
      
      public function Renamed4399()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed4401(this);
         this.modelId = Long.getLong(60229216,350352129);
         this.Renamed4402 = Long.getLong(1290751540,-2034560678);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed4400(IModel(this));
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
            case this.Renamed4402:
               this.client.setRank(this.Renamed4403.decode(param2) as Vector.<RankNotifierData>);
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

