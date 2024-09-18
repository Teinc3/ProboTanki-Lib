package Renamed207
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Renamed6145 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed6144;
      
      private var client:Renamed4572;
      
      private var modelId:Long;
      
      private var Renamed6146:Long;
      
      private var Renamed6147:Long;
      
      private var Renamed6148:ICodec;
      
      public function Renamed6145()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed4572(this);
         this.modelId = Long.getLong(1160724760,1672827267);
         this.Renamed6146 = Long.getLong(2066506492,2070048447);
         this.Renamed6147 = Long.getLong(1641742013,1294163764);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed6144(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
         this.Renamed6148 = this._protocol.getCodec(new TypeCodecInfo(int,false));
      }
      
      protected function getInitParam() : Renamed6142
      {
         return Renamed6142(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed6146:
               break;
            case this.Renamed6147:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

