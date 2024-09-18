package Renamed336
{
   import Renamed4426.Renamed5938;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class Renamed7915
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var Renamed7918:Long;
      
      private var model:IModel;
      
      public function Renamed7915(param1:IModel)
      {
         this.Renamed7918 = Long.getLong(0,300050020);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
      }
      
      public function show() : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new Renamed5938());
      }
   }
}

