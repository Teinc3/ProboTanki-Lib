package Renamed489
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
   import Renamed452.Renamed9076;
   import Renamed452.Renamed9077;
   import Renamed452.Renamed4846;
   import Renamed452.Renamed4847;
   
   public class Renamed9613
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var Renamed4864:Long;
      
      private var Renamed9617:ICodec;
      
      private var Renamed4866:Long;
      
      private var Renamed9618:ICodec;
      
      private var Renamed9614:Long;
      
      private var Renamed9619:ICodec;
      
      private var Renamed9615:ICodec;
      
      private var Renamed9616:ICodec;
      
      private var Renamed9620:Long;
      
      private var Renamed9621:ICodec;
      
      private var Renamed9622:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function Renamed9613(param1:IModel)
      {
         this.Renamed4864 = Long.getLong(1600977732,-1971270444);
         this.Renamed4866 = Long.getLong(779639549,-508617372);
         this.Renamed9614 = Long.getLong(1983735305,-731019411);
         this.Renamed9620 = Long.getLong(116946402,65284411);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this.network = Network(OSGi.getInstance().getService(Network));
      }
      
      public function startFire(param1:int) : void
      {
         this.network.send(new Renamed4847(param1));
      }
      
      public function Renamed4862(param1:int) : void
      {
         this.network.send(new Renamed4846(param1));
      }
      
      public function Renamed3114(param1:int, param2:Renamed603, param3:Vector.<Renamed667>) : void
      {
         this.network.send(new Renamed9076(param1,param2,param3));
      }
      
      public function Renamed8465(param1:int, param2:Renamed603) : void
      {
         this.network.send(new Renamed9077(param1,param2));
      }
   }
}

