package Renamed4533
{
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
   import Renamed425.Renamed6153;
   
   public class Renamed6150
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var Renamed6154:Long;
      
      private var Renamed6155:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function Renamed6150(param1:IModel)
      {
         this.Renamed6154 = Long.getLong(2095583187,-547646417);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.network = Network(OSGi.getInstance().getService(Network));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this.Renamed6155 = this.protocol.getCodec(new TypeCodecInfo(Boolean,false));
      }
      
      public function enable(param1:Boolean) : void
      {
         this.network.send(new Renamed6153(param1));
      }
   }
}

