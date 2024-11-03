package Renamed201
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
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed6004 extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:Renamed6002;
      
      private var client:Renamed4566;
      
      private var modelId:Long;
      
      private var Renamed6005:Long;
      
      private var Renamed6006:ICodec;
      
      private var Renamed6007:Long;
      
      private var Renamed6008:ICodec;
      
      private var Renamed6009:ICodec;
      
      private var Renamed6010:Long;
      
      private var Renamed6011:ICodec;
      
      private var Renamed6012:ICodec;
      
      private var Renamed6013:ICodec;
      
      public function Renamed6004()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = Renamed4566(this);
         this.modelId = Long.getLong(1634943251,-386616582);
         this.Renamed6005 = Long.getLong(702469496,1865185556);
         this.Renamed6007 = Long.getLong(577350635,-1901958395);
         this.Renamed6010 = Long.getLong(1025211026,-780453228);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Renamed6002(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
         this.Renamed6008 = this._protocol.getCodec(new TypeCodecInfo(IGameObject,false));
         this.Renamed6011 = this._protocol.getCodec(new TypeCodecInfo(IGameObject,false));
         this.Renamed6012 = this._protocol.getCodec(new TypeCodecInfo(String,false));
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this.Renamed6005:
            case this.Renamed6007:
               break;
            case this.Renamed6010:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

