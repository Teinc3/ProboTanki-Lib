package Renamed91
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Renamed10170 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed10442;
      
      private var client:Renamed93;
      
      private var modelId:Long;
      
      private var Renamed4922:Long;
      
      private var Renamed4923:ICodec;
      
      private var Renamed10443:ICodec;
      
      private var Renamed10444:ICodec;
      
      private var Renamed10445:ICodec;
      
      private var Renamed4927:Long;
      
      private var Renamed4928:ICodec;
      
      public function Renamed10170()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed93(this);
         this.modelId = Long.getLong(592429654,1339096271);
         this.Renamed4922 = Long.getLong(1979897371,-1124194266);
         this.Renamed4927 = Long.getLong(1470645133,813558546);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed10442(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Renamed92
      {
         return Renamed92(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed4922:
               break;
            case this.Renamed4927:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

