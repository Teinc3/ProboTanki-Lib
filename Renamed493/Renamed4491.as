package Renamed4489
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
   
   public class Renamed4491 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed9645;
      
      private var client:Renamed4490;
      
      private var modelId:Long;
      
      private var Renamed4874:Long;
      
      private var Renamed4875:ICodec;
      
      private var Renamed4876:Long;
      
      private var Renamed4877:ICodec;
      
      public function Renamed4491()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed4490(this);
         this.modelId = Long.getLong(1696580544,685225790);
         this.Renamed4874 = Long.getLong(1466630272,-1977249165);
         this.Renamed4876 = Long.getLong(1779101803,-1074606030);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed9645(IModel(this));
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

