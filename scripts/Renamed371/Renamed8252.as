package Renamed371
{
   import Renamed205.Renamed6083;
   import Renamed205.Renamed6089;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class Renamed8246
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var Renamed8247:Long;
      
      private var Renamed8248:Long;
      
      private var Renamed8249:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function Renamed8246(param1:IModel)
      {
         this.Renamed8247 = Long.getLong(808822004,973348892);
         this.Renamed8248 = Long.getLong(1592012491,843943942);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.network = Network(OSGi.getInstance().getService(Network));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this.Renamed8249 = this.protocol.getCodec(new TypeCodecInfo(String,false));
      }
      
      public function Renamed8250() : void
      {
         this.network.send(new Renamed6083());
      }
      
      public function Renamed8251(param1:String) : void
      {
         this.network.send(new Renamed6089(param1));
      }
   }
}

