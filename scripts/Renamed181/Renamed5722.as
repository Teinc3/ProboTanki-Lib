package Renamed2170
{
   import Renamed4312.Renamed5560;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class Renamed5722
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var Renamed5723:Long;
      
      private var model:IModel;
      
      public function Renamed5722(param1:IModel)
      {
         this.Renamed5723 = Long.getLong(914895541,882746119);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
      }
      
      public function Renamed2174() : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new Renamed5560());
      }
   }
}

