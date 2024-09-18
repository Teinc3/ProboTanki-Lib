package Renamed148
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Renamed2744 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed3021;
      
      private var client:Renamed2743;
      
      private var modelId:Long;
      
      private var Renamed5011:Long;
      
      private var Renamed5012:Long;
      
      private var Renamed5013:Long;
      
      private var Renamed5014:ICodec;
      
      private var Renamed5015:ICodec;
      
      private var Renamed5016:ICodec;
      
      private var Renamed5017:Long;
      
      private var Renamed5018:ICodec;
      
      private var Renamed5019:Long;
      
      private var Renamed5020:ICodec;
      
      private var Renamed5021:ICodec;
      
      private var Renamed5022:Long;
      
      private var Renamed5023:ICodec;
      
      private var Renamed5024:Long;
      
      private var Renamed5025:ICodec;
      
      private var Renamed5026:Long;
      
      private var Renamed5027:ICodec;
      
      public function Renamed2744()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed2743(this);
         this.modelId = Long.getLong(500772743,-1275562344);
         this.Renamed5011 = Long.getLong(1132148565,-1228176022);
         this.Renamed5012 = Long.getLong(1500025148,-1072265992);
         this.Renamed5013 = Long.getLong(815803475,677498549);
         this.Renamed5017 = Long.getLong(815803475,677432898);
         this.Renamed5019 = Long.getLong(1121481378,274069336);
         this.Renamed5022 = Long.getLong(1056545941,1597681057);
         this.Renamed5024 = Long.getLong(1235006804,1616331544);
         this.Renamed5026 = Long.getLong(696094159,-894234735);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed3021(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         var _loc3_:* = param1;
         switch(0)
         {
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

