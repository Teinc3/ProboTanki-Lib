package Renamed149
{
   import Renamed4312.Renamed5066;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.type.IGameObject;
   import scpacker.networking.Network;
   
   public class Renamed5058
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var Renamed5067:Long;
      
      private var Renamed5068:ICodec;
      
      private var Renamed5069:ICodec;
      
      private var Renamed3435:ICodec;
      
      private var Renamed5070:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function Renamed5058(param1:IModel)
      {
         this.Renamed5067 = Long.getLong(169296918,-2003348677);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.network = Network(OSGi.getInstance().getService(Network));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this.Renamed5068 = this.protocol.getCodec(new TypeCodecInfo(String,false));
         this.Renamed5069 = this.protocol.getCodec(new TypeCodecInfo(IGameObject,false));
         this.Renamed3435 = this.protocol.getCodec(new TypeCodecInfo(String,false));
         this.Renamed5070 = this.protocol.getCodec(new TypeCodecInfo(int,false));
      }
      
      public function Renamed5071(param1:String, param2:IGameObject, param3:String, param4:int) : void
      {
         this.network.send(new Renamed5066(param1,param2.name,param3,param4));
      }
   }
}

