package Renamed4808
{
   import Renamed284.Renamed5549;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class Renamed5524
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var Renamed5550:Long;
      
      private var model:IModel;
      
      public function Renamed5524(param1:IModel)
      {
         this.Renamed5550 = Long.getLong(398629213,-361250798);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
      }
      
      public function Renamed5551() : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new Renamed5549());
      }
   }
}

