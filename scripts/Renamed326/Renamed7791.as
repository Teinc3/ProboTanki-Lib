package Renamed326
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Renamed7791 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed7792;
      
      private var client:Renamed4677;
      
      private var modelId:Long;
      
      private var Renamed7793:Long;
      
      private var Renamed7794:ICodec;
      
      private var Renamed7795:Long;
      
      private var Renamed7796:ICodec;
      
      private var Renamed7797:ICodec;
      
      private var Renamed7798:Long;
      
      private var Renamed7799:ICodec;
      
      private var Renamed7800:ICodec;
      
      private var Renamed7801:ICodec;
      
      private var Renamed7802:ICodec;
      
      private var Renamed7803:ICodec;
      
      private var Renamed7804:Long;
      
      private var Renamed7805:ICodec;
      
      public function Renamed7791()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed4677(this);
         this.modelId = Long.getLong(479007306,2075268288);
         this.Renamed7793 = Long.getLong(1090794095,949129477);
         this.Renamed7795 = Long.getLong(1558315722,-513756959);
         this.Renamed7798 = Long.getLong(1130188491,-1001840691);
         this.Renamed7804 = Long.getLong(1555952411,-2052736679);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed7792(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Renamed7688
      {
         return Renamed7688(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed7793:
               this.client.Renamed7690(String(this.Renamed7794.decode(param2)));
               break;
            case this.Renamed7795:
               this.client.Renamed7691(String(this.Renamed7796.decode(param2)),String(this.Renamed7797.decode(param2)));
               break;
            case this.Renamed7798:
               this.client.Renamed7692(String(this.Renamed7799.decode(param2)),Number(this.Renamed7800.decode(param2)),Number(this.Renamed7801.decode(param2)),Number(this.Renamed7802.decode(param2)),String(this.Renamed7803.decode(param2)));
               break;
            case this.Renamed7804:
               this.client.Renamed7693(String(this.Renamed7805.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

