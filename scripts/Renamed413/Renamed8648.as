package Renamed413
{
   import Renamed284.Renamed7233;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class Renamed8648
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var Renamed8651:Long;
      
      private var model:IModel;
      
      public function Renamed8648(param1:IModel)
      {
         this.Renamed8651 = Long.getLong(1329711040,812051806);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
      }
      
      public function Renamed3664() : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new Renamed7233());
      }
   }
}

