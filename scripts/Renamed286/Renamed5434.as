package Renamed4611
{
   import Renamed136.Renamed663;
   import Renamed602.3DPositionVector;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Renamed5434 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed7250;
      
      private var client:Renamed4612;
      
      private var modelId:Long;
      
      private var Renamed6753:Long;
      
      private var Renamed6755:ICodec;
      
      private var Renamed7259:ICodec;
      
      private var Renamed6756:Long;
      
      private var Renamed7260:ICodec;
      
      private var Renamed6759:ICodec;
      
      private var Renamed6760:Long;
      
      private var Renamed6762:ICodec;
      
      private var Renamed7261:ICodec;
      
      private var Renamed6763:Long;
      
      private var Renamed7262:ICodec;
      
      private var Renamed6765:ICodec;
      
      public function Renamed5434()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed4612(this);
         this.modelId = Long.getLong(1965338956,1417730743);
         this.Renamed6753 = Long.getLong(1487412361,8128743);
         this.Renamed6756 = Long.getLong(1849471524,-639146266);
         this.Renamed6760 = Long.getLong(1134857420,-1224060835);
         this.Renamed6763 = Long.getLong(794624341,25869850);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed7250(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Renamed5435
      {
         return Renamed5435(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed6753:
               this.client.Renamed5492(3DPositionVector(this.Renamed6755.decode(param2)),Renamed663(this.Renamed7259.decode(param2)));
               break;
            case this.Renamed6756:
               this.client.Renamed5498(Renamed663(this.Renamed7260.decode(param2)),String(this.Renamed6759.decode(param2)));
               break;
            case this.Renamed6760:
               this.client.Renamed5478(String(this.Renamed6762.decode(param2)),Renamed663(this.Renamed7261.decode(param2)));
               break;
            case this.Renamed6763:
               this.client.Renamed5488(Renamed663(this.Renamed7262.decode(param2)),String(this.Renamed6765.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

