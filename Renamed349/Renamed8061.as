package Renamed349
{
   import Renamed602.Renamed603;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import projects.tanks.client.battlefield.models.tankparts.weapons.common.Renamed667;
   import scpacker.networking.Network;
   import Renamed458.Renamed8059;
   import Renamed458.Renamed8060;
   
   public class Renamed8061
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var Renamed8062:Long;
      
      private var Renamed8063:ICodec;
      
      private var Renamed8064:ICodec;
      
      private var Renamed8065:Long;
      
      private var Renamed8066:ICodec;
      
      private var Renamed8067:ICodec;
      
      private var Renamed8068:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function Renamed8061(param1:IModel)
      {
         this.Renamed8062 = Long.getLong(854040669,-100146847);
         this.Renamed8065 = Long.getLong(2115177320,1289626411);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.network = Network(OSGi.getInstance().getService(Network));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
      }
      
      public function Renamed3459(param1:int, param2:Renamed603) : void
      {
         this.network.send(new Renamed8060(param1,param2));
      }
      
      public function Renamed3458(param1:int, param2:Renamed603, param3:Vector.<Renamed667>) : void
      {
         this.network.send(new Renamed8059(param1,param2,param3));
      }
   }
}

