package Renamed4586
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import Renamed345.Renamed5800;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class Renamed6516
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var Renamed5801:Long;
      
      private var Renamed6517:ICodec;
      
      private var Renamed6518:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function Renamed6516(param1:IModel)
      {
         this.Renamed5801 = Long.getLong(829170552,1724953279);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.network = Network(OSGi.getInstance().getService(Network));
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this.Renamed6517 = this.protocol.getCodec(new TypeCodecInfo(int,false));
         this.Renamed6518 = this.protocol.getCodec(new TypeCodecInfo(int,false));
      }
      
      public function Renamed5802(param1:int, param2:int) : void
      {
         this.network.send(new Renamed5800(param1,param2));
      }
   }
}

