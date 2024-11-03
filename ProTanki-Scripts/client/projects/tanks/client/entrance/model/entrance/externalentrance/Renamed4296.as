package projects.tanks.client.entrance.model.entrance.externalentrance
{
   import Renamed4292.Renamed4293;
   import Renamed4292.Renamed4294;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import Renamed352.Renamed4295;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class Renamed4296
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var Renamed4297:Long;
      
      private var Renamed4298:ICodec;
      
      private var Renamed4299:ICodec;
      
      private var Renamed4300:Long;
      
      private var Renamed4301:ICodec;
      
      private var Renamed4302:ICodec;
      
      private var Renamed4303:Long;
      
      private var Renamed4304:ICodec;
      
      private var Renamed4305:ICodec;
      
      private var model:IModel;
      
      public function Renamed4296(param1:IModel)
      {
         this.Renamed4297 = Long.getLong(0,300020027);
         this.Renamed4300 = Long.getLong(0,300020028);
         this.Renamed4303 = Long.getLong(0,300020029);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this.Renamed4298 = this.protocol.getCodec(new TypeCodecInfo(String,false));
         this.Renamed4299 = this.protocol.getCodec(new TypeCodecInfo(String,false));
         this.Renamed4301 = this.protocol.getCodec(new TypeCodecInfo(String,false));
         this.Renamed4302 = this.protocol.getCodec(new TypeCodecInfo(String,true));
         this.Renamed4304 = this.protocol.getCodec(new TypeCodecInfo(Boolean,false));
         this.Renamed4305 = this.protocol.getCodec(new TypeCodecInfo(String,false));
      }
      
      public function Renamed3565(param1:String, param2:String) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new Renamed4294(param1,param2));
      }
      
      public function Renamed3567(param1:String, param2:String) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new Renamed4295(param1));
      }
      
      public function Renamed3566(param1:Boolean, param2:String) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new Renamed4293(param1));
      }
   }
}

