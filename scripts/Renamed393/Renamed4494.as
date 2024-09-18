package Renamed393
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   import projects.tanks.client.users.model.friends.container.UserContainerCC;
   
   public class Renamed4494 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed8456;
      
      private var client:Renamed4495;
      
      private var modelId:Long;
      
      private var Renamed4874:Long;
      
      private var Renamed4875:ICodec;
      
      private var Renamed4876:Long;
      
      private var Renamed4877:ICodec;
      
      public function Renamed4494()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed4495(this);
         this.modelId = Long.getLong(1552139010,1361964288);
         this.Renamed4874 = Long.getLong(1433634624,1589914165);
         this.Renamed4876 = Long.getLong(1493000398,-12480436);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed8456(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : UserContainerCC
      {
         return UserContainerCC(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed4874:
               break;
            case this.Renamed4876:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

