package Renamed4624
{
   import Renamed262.Renamed5800;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class Renamed5796
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var Renamed5801:Long;
      
      private var model:IModel;
      
      public function Renamed5796(param1:IModel)
      {
         this.Renamed5801 = Long.getLong(332422444,557729256);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
      }
      
      public function Renamed5802() : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new Renamed5800());
      }
   }
}

