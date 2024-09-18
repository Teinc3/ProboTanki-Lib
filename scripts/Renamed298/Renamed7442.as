package Renamed298
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import Renamed377.Renamed7448;
   import Renamed377.Renamed7449;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class Renamed7442
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var Renamed7450:Long;
      
      private var Renamed7451:ICodec;
      
      private var Renamed7452:Long;
      
      private var Renamed7453:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function Renamed7442(param1:IModel)
      {
         this.Renamed7450 = Long.getLong(0,300070003);
         this.Renamed7452 = Long.getLong(0,300070004);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.network = Network(OSGi.getInstance().getService(Network));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this.Renamed7451 = this.protocol.getCodec(new TypeCodecInfo(String,false));
         this.Renamed7453 = this.protocol.getCodec(new TypeCodecInfo(Long,false));
      }
      
      public function activateLink(param1:String) : void
      {
         this.network.send(new Renamed7448(param1));
      }
      
      public function isAlive(param1:String) : void
      {
         this.network.send(new Renamed7449(param1));
      }
   }
}

