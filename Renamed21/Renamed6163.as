package Renamed21
{
   import Renamed602.Renamed603;
   import Renamed304.Renamed4903;
   import Renamed304.Renamed6177;
   import Renamed304.Renamed6178;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class Renamed6163
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var Renamed4906:Long;
      
      private var Renamed4907:ICodec;
      
      private var Renamed6179:Long;
      
      private var Renamed6180:ICodec;
      
      private var Renamed6181:ICodec;
      
      private var Renamed6182:Long;
      
      private var Renamed6183:ICodec;
      
      private var Renamed6184:ICodec;
      
      private var Renamed6185:ICodec;
      
      private var Renamed6186:ICodec;
      
      private var Renamed6187:ICodec;
      
      private var Renamed6188:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function Renamed6163(param1:IModel)
      {
         this.Renamed4906 = Long.getLong(158866586,759986797);
         this.Renamed6179 = Long.getLong(1766359006,1664614075);
         this.Renamed6182 = Long.getLong(1692205066,-158539970);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.network = Network(OSGi.getInstance().getService(Network));
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
      }
      
      public function Renamed3496(param1:int) : void
      {
         this.network.send(new Renamed4918(param1));
      }
      
      public function Renamed3497(param1:int, param2:Renamed603) : void
      {
         this.network.send(new Renamed6177(param1,param2));
      }
      
      public function Renamed3498(param1:int, param2:ClientObject, param3:int, param4:Renamed603, param5:Renamed603, param6:Renamed603) : void
      {
         this.network.send(new Renamed6178(param1,param2.id,param3,param4,param5,param6));
      }
   }
}

