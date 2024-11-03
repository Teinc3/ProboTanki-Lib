package Renamed91
{
   import Renamed602.3DPositionVector;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import Renamed389.Renamed4903;
   import Renamed389.Renamed4904;
   import Renamed389.Renamed8411;
   import Renamed389.Renamed8409;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class Renamed10442
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var Renamed4906:Long;
      
      private var Renamed4907:ICodec;
      
      private var Renamed10218:ICodec;
      
      private var Renamed10446:ICodec;
      
      private var Renamed10447:ICodec;
      
      private var Renamed10448:ICodec;
      
      private var Renamed4914:Long;
      
      private var Renamed4915:ICodec;
      
      private var Renamed10221:Long;
      
      private var Renamed10222:ICodec;
      
      private var Renamed10223:ICodec;
      
      private var Renamed10449:ICodec;
      
      private var Renamed10225:Long;
      
      private var Renamed10226:ICodec;
      
      private var Renamed10228:ICodec;
      
      private var Renamed10227:ICodec;
      
      private var Renamed10229:ICodec;
      
      private var Renamed10450:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function Renamed10442(param1:IModel)
      {
         this.Renamed4906 = Long.getLong(1356868511,460931703);
         this.Renamed4914 = Long.getLong(1432853658,-446317051);
         this.Renamed10221 = Long.getLong(1659660949,-434756778);
         this.Renamed10225 = Long.getLong(1733814889,1388397267);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.network = Network(OSGi.getInstance().getService(Network));
      }
      
      public function Renamed3496(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         this.network.send(new Renamed4918(param1,param2,param3,param4,param5));
      }
      
      public function Renamed4919(param1:int) : void
      {
         this.network.send(new Renamed4904(param1));
      }
      
      public function Renamed10177(param1:int, param2:int, param3:Vector.<3DPositionVector>) : void
      {
         this.network.send(new Renamed8409(param1,param2,param3));
      }
      
      public function Renamed10176(param1:int, param2:ClientObject, param3:int, param4:3DPositionVector, param5:Vector.<3DPositionVector>) : void
      {
         this.network.send(new Renamed8411(param1,param2.id,param3,param4,param5));
      }
   }
}

