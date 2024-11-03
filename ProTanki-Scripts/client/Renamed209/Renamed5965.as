package Renamed209
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   import Renamed459.Renamed6156;
   
   public class Renamed5965
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var Renamed6157:Long;
      
      private var model:IModel;
      
      public function Renamed5965(param1:IModel)
      {
         this.Renamed6157 = Long.getLong(420120869,-795771890);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
      }
      
      public function Renamed5979() : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new Renamed6156());
      }
   }
}

