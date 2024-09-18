package projects.tanks.client.chat.models.chat.chat
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   import Renamed442.Renamed4253;
   
   public class ChatModelServer
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var _sendMessageId:Long;
      
      private var _sendMessage_targetUserNameCodec:ICodec;
      
      private var _sendMessage_addressModeCodec:ICodec;
      
      private var _sendMessage_channelCodec:ICodec;
      
      private var _sendMessage_textCodec:ICodec;
      
      private var model:IModel;
      
      public function ChatModelServer(param1:IModel)
      {
         this._sendMessageId = Long.getLong(727072716,-952919953);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      }
      
      public function sendMessage(param1:String, param2:String) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new Renamed4253(param1,param2));
      }
   }
}

