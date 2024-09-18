package projects.tanks.client.chat.models.chat.chat
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class ChatModelBase extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:ChatModelServer;
      
      private var client:IChatModelBase;
      
      private var modelId:Long;
      
      private var _cleanUsersMessagesId:Long;
      
      private var _cleanUsersMessages_uidCodec:ICodec;
      
      private var _showMessagesId:Long;
      
      private var _showMessages_messagesCodec:ICodec;
      
      private var _updateTypingSpeedAntifloodParamsId:Long;
      
      private var _updateTypingSpeedAntifloodParams_symbolCostCodec:ICodec;
      
      private var _updateTypingSpeedAntifloodParams_enterCostCodec:ICodec;
      
      public function ChatModelBase()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = IChatModelBase(this);
         this.modelId = Long.getLong(1413646454,-1397687631);
         this._cleanUsersMessagesId = Long.getLong(798714808,-1771953585);
         this._showMessagesId = Long.getLong(978360780,-904735215);
         this._updateTypingSpeedAntifloodParamsId = Long.getLong(613975441,130861697);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new ChatModelServer(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : ChatCC
      {
         return ChatCC(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this._cleanUsersMessagesId:
            case this._showMessagesId:
               break;
            case this._updateTypingSpeedAntifloodParamsId:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

