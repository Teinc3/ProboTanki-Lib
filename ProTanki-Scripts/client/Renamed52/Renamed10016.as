package Renamed52
{
   import Renamed602.3DPositionVector;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import Renamed316.Renamed7668;
   import Renamed316.Renamed7673;
   import Renamed316.Renamed7677;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class Renamed10016
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var Renamed10018:Long;
      
      private var Renamed10019:ICodec;
      
      private var Renamed10020:Long;
      
      private var Renamed10021:ICodec;
      
      private var Renamed10022:ICodec;
      
      private var Renamed10023:Long;
      
      private var Renamed10024:ICodec;
      
      private var Renamed10025:ICodec;
      
      private var Renamed10026:ICodec;
      
      private var Renamed10027:ICodec;
      
      private var Renamed10028:ICodec;
      
      private var Renamed10029:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function Renamed10016(param1:IModel)
      {
         this.Renamed10018 = Long.getLong(304771021,-505618508);
         this.Renamed10020 = Long.getLong(119662358,318565694);
         this.Renamed10023 = Long.getLong(193816297,2141719739);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.network = Network(OSGi.getInstance().getService(Network));
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
      }
      
      public function Renamed5875(param1:int) : void
      {
         this.network.send(new Renamed7677(param1));
      }
      
      public function Renamed5876(param1:int, param2:3DPositionVector) : void
      {
         this.network.send(new Renamed7668(param1,param2));
      }
      
      public function Renamed5877(param1:int, param2:3DPositionVector, param3:ClientObject, param4:int, param5:3DPositionVector, param6:3DPositionVector) : void
      {
         this.network.send(new Renamed7673(param1,param2,param3 == null ? null : param3.id,param4,param5,param6));
      }
   }
}

