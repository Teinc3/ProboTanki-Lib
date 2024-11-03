package Renamed4611
{
   import Renamed7249.Renamed6767;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class Renamed7250
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var Renamed6768:Long;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function Renamed7250(param1:IModel)
      {
         this.Renamed6768 = Long.getLong(896493825,-1828539754);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.network = Network(OSGi.getInstance().getService(Network));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
      }
      
      public function Renamed5507(param1:Tank) : void
      {
         this.network.send(new Renamed6767());
      }
   }
}

