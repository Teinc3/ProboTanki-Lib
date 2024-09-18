package Renamed82
{
   import Renamed602.3DPositionVector;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import Renamed400.Renamed8533;
   import Renamed400.Renamed8543;
   import Renamed400.Renamed8548;
   import Renamed400.Renamed8552;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class Renamed10326
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var Renamed10327:Long;
      
      private var Renamed10332:ICodec;
      
      private var Renamed10328:Long;
      
      private var Renamed10333:ICodec;
      
      private var Renamed10334:ICodec;
      
      private var Renamed10335:ICodec;
      
      private var Renamed10336:ICodec;
      
      private var Renamed10337:Long;
      
      private var Renamed10338:ICodec;
      
      private var Renamed10339:Long;
      
      private var Renamed10340:ICodec;
      
      private var Renamed10341:ICodec;
      
      private var Renamed10342:ICodec;
      
      private var Renamed10343:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function Renamed10326(param1:IModel)
      {
         this.Renamed10327 = Long.getLong(315477850,74416950);
         this.Renamed10328 = Long.getLong(724350021,-1874612855);
         this.Renamed10337 = Long.getLong(2132283949,89958307);
         this.Renamed10339 = Long.getLong(315880994,956762724);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.network = Network(OSGi.getInstance().getService(Network));
      }
      
      public function Renamed7205(param1:int) : void
      {
         this.network.send(new Renamed8543(param1));
      }
      
      public function Renamed1554(param1:int, param2:ClientObject, param3:int, param4:3DPositionVector) : void
      {
         this.network.send(new Renamed8533(param1,param2.id,param3,param4));
      }
      
      public function Renamed9823(param1:int) : void
      {
         this.network.send(new Renamed8552(param1));
      }
      
      public function Renamed9824(param1:int, param2:int, param3:3DPositionVector, param4:3DPositionVector) : void
      {
         this.network.send(new Renamed8548(param1,param2,param3,param4));
      }
   }
}

