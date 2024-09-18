package Renamed412
{
   import Renamed4312.Renamed5559;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import scpacker.networking.Network;
   
   public class Renamed8645
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var Renamed8646:Long;
      
      private var model:IModel;
      
      public function Renamed8645(param1:IModel)
      {
         this.Renamed8646 = Long.getLong(1031114541,134796764);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
      }
      
      public function fit() : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new Renamed5559(Model.object.name));
      }
   }
}

