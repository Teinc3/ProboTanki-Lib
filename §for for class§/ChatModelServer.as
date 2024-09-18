package §for for class§
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
   import §use catch dynamic§.§set const false§;
   
   public class ChatModelServer
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var _sendMessageId:Long;
      
      private var §throw for implements§:ICodec;
      
      private var §finally set continue§:ICodec;
      
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
         this.§throw for implements§ = this.protocol.getCodec(new TypeCodecInfo(String,false));
         this.§finally set continue§ = this.protocol.getCodec(new TypeCodecInfo(Boolean,false));
      }
      
      public function sendMessage(param1:String, param2:Boolean) : void
      {
         this.network.send(new §set const false§(param1,param2));
      }
   }
}

