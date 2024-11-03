package projects.tanks.client.users.model.friends
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Renamed4412 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed4413;
      
      private var client:Renamed4414;
      
      private var modelId:Long;
      
      private var Renamed4415:Long;
      
      private var Renamed4416:ICodec;
      
      private var Renamed4417:Long;
      
      private var Renamed4418:ICodec;
      
      private var Renamed4419:ICodec;
      
      private var Renamed4420:Long;
      
      private var Renamed4421:ICodec;
      
      private var Renamed4422:Long;
      
      private var Renamed4423:Long;
      
      public function Renamed4412()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed4414(this);
         this.modelId = Long.getLong(1693173045,628784534);
         this.Renamed4415 = Long.getLong(311681954,1684738000);
         this.Renamed4417 = Long.getLong(348947857,-1693710961);
         this.Renamed4420 = Long.getLong(444676649,1880663147);
         this.Renamed4422 = Long.getLong(52539073,-1927628742);
         this.Renamed4423 = Long.getLong(1823444363,-1655593141);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed4413(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Renamed4424
      {
         return Renamed4424(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed4415:
            case this.Renamed4417:
            case this.Renamed4420:
            case this.Renamed4422:
               break;
            case this.Renamed4423:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

