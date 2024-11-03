package Renamed334
{
   import Renamed5645.Renamed5663;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class Renamed7908
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var Renamed7909:Long;
      
      private var Renamed7910:ICodec;
      
      private var Renamed7911:ICodec;
      
      private var Renamed7912:ICodec;
      
      private var model:IModel;
      
      public function Renamed7908(param1:IModel)
      {
         this.Renamed7909 = Long.getLong(0,300020048);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this.Renamed7910 = this.protocol.getCodec(new TypeCodecInfo(String,false));
         this.Renamed7911 = this.protocol.getCodec(new TypeCodecInfo(String,false));
         this.Renamed7912 = this.protocol.getCodec(new TypeCodecInfo(Boolean,false));
      }
      
      public function login(param1:String, param2:String, param3:Boolean) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new Renamed5663(param1,param2,param3));
      }
   }
}

