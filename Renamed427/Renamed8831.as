package Renamed427
{
   import Renamed4426.Renamed6695;
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
   
   public class Renamed8830
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var Renamed4871:Long;
      
      private var Renamed4872:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function Renamed8830(param1:IModel)
      {
         this.Renamed4871 = Long.getLong(1806777076,-998770075);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.network = Network(OSGi.getInstance().getService(Network));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this.Renamed4872 = this.protocol.getCodec(new TypeCodecInfo(Long,false));
      }
      
      public function remove(param1:String) : void
      {
         this.network.send(new Renamed6695(param1));
      }
   }
}

