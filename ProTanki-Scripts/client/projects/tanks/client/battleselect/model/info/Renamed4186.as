package projects.tanks.client.battleselect.model.info
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import Renamed311.Renamed4185;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class Renamed4186
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var Renamed4187:Long;
      
      private var model:IModel;
      
      public function Renamed4186(param1:IModel)
      {
         this.Renamed4187 = Long.getLong(0,300090013);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
      }
      
      public function Renamed2122() : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new Renamed4185());
      }
   }
}

