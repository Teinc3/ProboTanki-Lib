package Renamed4743
{
   import Renamed136.Renamed663;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import Renamed311.Renamed5648;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class Renamed5649
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var Renamed5650:Long;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function Renamed5649(param1:IModel)
      {
         this.Renamed5650 = Long.getLong(0,300090007);
         super();
         this.model = param1;
         this.network = Network(OSGi.getInstance().getService(Network));
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
      }
      
      public function Renamed3612() : void
      {
         this.network.send(new Renamed5648(Renamed663.NONE));
      }
   }
}

