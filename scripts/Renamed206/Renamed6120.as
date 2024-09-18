package Renamed206
{
   import Renamed136.Renamed663;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Renamed6120 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed6121;
      
      private var client:Renamed4573;
      
      private var modelId:Long;
      
      private var Renamed6122:Long;
      
      private var Renamed6123:ICodec;
      
      private var Renamed6124:Long;
      
      private var Renamed6125:ICodec;
      
      private var Renamed6126:Long;
      
      private var Renamed6127:ICodec;
      
      private var Renamed6128:ICodec;
      
      private var Renamed6129:ICodec;
      
      private var Renamed6130:Long;
      
      private var Renamed6131:ICodec;
      
      private var Renamed6132:ICodec;
      
      private var Renamed6133:Long;
      
      private var Renamed6134:Long;
      
      private var Renamed6135:ICodec;
      
      private var Renamed6136:ICodec;
      
      private var Renamed6137:Long;
      
      private var Renamed6138:ICodec;
      
      private var Renamed6139:ICodec;
      
      public function Renamed6120()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed4573(this);
         this.modelId = Long.getLong(375259874,-2064506790);
         this.Renamed6122 = Long.getLong(113336798,-635616124);
         this.Renamed6124 = Long.getLong(113336798,-648481992);
         this.Renamed6126 = Long.getLong(1656540814,-150441162);
         this.Renamed6130 = Long.getLong(93222359,396117780);
         this.Renamed6133 = Long.getLong(1109525934,-1995327689);
         this.Renamed6134 = Long.getLong(1209531510,1444573534);
         this.Renamed6137 = Long.getLong(1944648201,859419652);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed6121(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Renamed6110
      {
         return Renamed6110(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed6122:
               this.client.Renamed6095(Renamed663(this.Renamed6123.decode(param2)));
               break;
            case this.Renamed6124:
               this.client.Renamed6096(Renamed663(this.Renamed6125.decode(param2)));
               break;
            case this.Renamed6126:
               this.client.Renamed6097(int(this.Renamed6127.decode(param2)),Number(this.Renamed6128.decode(param2)),Number(this.Renamed6129.decode(param2)));
               break;
            case this.Renamed6130:
               this.client.Renamed6098(int(this.Renamed6131.decode(param2)),Renamed5125(this.Renamed6132.decode(param2)));
               break;
            case this.Renamed6133:
               this.client.Renamed6099();
               break;
            case this.Renamed6134:
               this.client.Renamed6100(int(this.Renamed6135.decode(param2)),String(this.Renamed6136.decode(param2)));
               break;
            case this.Renamed6137:
               this.client.Renamed6101(int(this.Renamed6138.decode(param2)),String(this.Renamed6139.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

