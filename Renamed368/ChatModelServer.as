package Renamed368
{
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
   import Renamed448.Renamed4253;
   
   public class ChatModelServer
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var _sendMessageId:Long;
      
      private var Renamed8244:ICodec;
      
      private var Renamed8245:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function ChatModelServer(param1:IModel)
      {
         this._sendMessageId = Long.getLong(339805286,174227780);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.network = Network(OSGi.getInstance().getService(Network));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this.Renamed8244 = this.protocol.getCodec(new TypeCodecInfo(String,false));
         this.Renamed8245 = this.protocol.getCodec(new TypeCodecInfo(Boolean,false));
      }
      
      public function sendMessage(param1:String, param2:Boolean) : void
      {
         this.network.send(new Renamed4253(param1,param2));
      }
   }
}

