package Renamed65
{
   import Renamed602.Renamed603;
   import Renamed468.Renamed4903;
   import Renamed468.Renamed4904;
   import Renamed468.Renamed8411;
   import Renamed468.Renamed8409;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class Renamed10212
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var Renamed4906:Long;
      
      private var Renamed4907:ICodec;
      
      private var Renamed10217:ICodec;
      
      private var Renamed10218:ICodec;
      
      private var Renamed10219:ICodec;
      
      private var Renamed4914:Long;
      
      private var Renamed4915:ICodec;
      
      private var Renamed10220:ICodec;
      
      private var Renamed10221:Long;
      
      private var Renamed10222:ICodec;
      
      private var Renamed10223:ICodec;
      
      private var Renamed10224:ICodec;
      
      private var Renamed10225:Long;
      
      private var Renamed10226:ICodec;
      
      private var Renamed10227:ICodec;
      
      private var Renamed10228:ICodec;
      
      private var Renamed10229:ICodec;
      
      private var Renamed10230:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function Renamed10212(param1:IModel)
      {
         this.Renamed4906 = Long.getLong(1277019392,-355104349);
         this.Renamed4914 = Long.getLong(357444731,388730325);
         this.Renamed10221 = Long.getLong(130637440,377170052);
         this.Renamed10225 = Long.getLong(56483500,-1445983993);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.network = Network(OSGi.getInstance().getService(Network));
      }
      
      public function Renamed3496(param1:int, param2:int, param3:int, param4:Renamed603) : void
      {
         this.network.send(new Renamed4918(param1,param2,param3,param4));
      }
      
      public function Renamed4919(param1:int, param2:int) : void
      {
         this.network.send(new Renamed4904(param1,1));
      }
      
      public function Renamed10177(param1:int, param2:int, param3:Renamed603) : void
      {
         this.network.send(new Renamed8409(param1,param2,param3));
      }
      
      public function Renamed10176(param1:int, param2:int, param3:ClientObject, param4:Renamed603, param5:Renamed603) : void
      {
         this.network.send(new Renamed8411(param1,param2,param3.id,param4,param5));
      }
   }
}

