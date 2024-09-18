package Renamed4741
{
   import Renamed136.Renamed663;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import Renamed311.Renamed5648;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class Renamed7079
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var Renamed5650:Long;
      
      private var Renamed7090:ICodec;
      
      private var model:IModel;
      
      public function Renamed7079(param1:IModel)
      {
         this.Renamed5650 = Long.getLong(0,300090028);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
      }
      
      public function Renamed3612(param1:Renamed663) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new Renamed5648(param1));
      }
   }
}

