package Renamed346
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
   
   public class Renamed7700 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed8051;
      
      private var client:Renamed4835;
      
      private var modelId:Long;
      
      private var Renamed8054:Long;
      
      private var Renamed8055:ICodec;
      
      private var Renamed8056:Long;
      
      private var Renamed8057:Long;
      
      public function Renamed7700()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed4835(this);
         this.modelId = Long.getLong(0,300020016);
         this.Renamed8054 = Long.getLong(0,300020047);
         this.Renamed8056 = Long.getLong(0,300020048);
         this.Renamed8057 = Long.getLong(0,300020049);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed8051(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
         this.Renamed8055 = this._protocol.getCodec(new TypeCodecInfo(String,false));
      }
      
      protected function getInitParam() : Renamed7710
      {
         return Renamed7710(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed8054:
               this.client.Renamed3577(String(this.Renamed8055.decode(param2)));
               break;
            case this.Renamed8056:
               this.client.Renamed7701();
               break;
            case this.Renamed8057:
               this.client.Renamed3575();
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

