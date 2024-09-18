package Renamed9
{
   import Renamed267.Renamed4902;
   import Renamed267.Renamed4903;
   import Renamed267.Renamed4904;
   import Renamed602.Renamed603;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class Renamed4905
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var Renamed4906:Long;
      
      private var Renamed4907:ICodec;
      
      private var Renamed4908:ICodec;
      
      private var Renamed4909:ICodec;
      
      private var Renamed4910:ICodec;
      
      private var Renamed4911:ICodec;
      
      private var Renamed4912:ICodec;
      
      private var Renamed4913:ICodec;
      
      private var Renamed4914:Long;
      
      private var Renamed4915:ICodec;
      
      private var Renamed4916:Long;
      
      private var Renamed4917:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function Renamed4905(param1:IModel)
      {
         this.Renamed4906 = Long.getLong(448278927,-679337769);
         this.Renamed4914 = Long.getLong(1791455660,457007003);
         this.Renamed4916 = Long.getLong(747256245,1216344676);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.network = Network(OSGi.getInstance().getService(Network));
      }
      
      public function Renamed3496(param1:int, param2:Renamed603, param3:Vector.<String>, param4:Vector.<Renamed603>, param5:Vector.<int>, param6:Vector.<Renamed603>, param7:Vector.<Renamed603>) : void
      {
         this.network.send(new Renamed4918(param1,param2,param3,param4,param5,param6,param7));
      }
      
      public function Renamed4919(param1:int) : void
      {
         this.network.send(new Renamed4904(param1));
      }
      
      public function Renamed4920(param1:int) : void
      {
         this.network.send(new Renamed4902(param1));
      }
   }
}

