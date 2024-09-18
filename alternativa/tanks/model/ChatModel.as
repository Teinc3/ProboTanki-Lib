package alternativa.tanks.model
{
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.LobbyChat;
   import alternativa.tanks.tracker.ITrackerService;
   import alternativa.tanks.utils.Antiflood;
   import alternativa.tanks.utils.LinksInterceptor;
   import flash.display.DisplayObjectContainer;
   import flash.events.TextEvent;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import forms.events.ChatFormEvent;
   import projects.tanks.client.chat.models.chat.chat.ChatModelBase;
   import projects.tanks.client.chat.models.chat.chat.IChatModelBase;
   import projects.tanks.client.chat.types.ChatMessage;
   import projects.tanks.client.chat.types.UserStatus;
   import projects.tanks.client.users.services.chatmoderator.ChatModeratorLevel;
   import projects.tanks.clients.flash.commons.services.battlelinkactivator.IBattleLinkActivatorService;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   
   public class ChatModel extends ChatModelBase implements IChatModelBase
   {
      [Inject]
      public static var trackerService:ITrackerService;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var userPropertyService:IUserPropertiesService;
      
      [Inject]
      public static var battleLinkActivatorService:IBattleLinkActivatorService;
      
      [Inject]
      public static var clientLog:IClientLog;
      
      private static const LOG_CHANNEL_NAME:String = "chat";
      
      private var layer:DisplayObjectContainer;
      
      public var chatPanel:LobbyChat;
      
      private var selfName:String;
      
      private var showLinks:Boolean;
      
      private var linksInterceptor:LinksInterceptor;
      
      private var htmlFlag:Boolean = false;
      
      private var sharpLinks:Array;
      
      private var isAdmin:Boolean;
      
      private var antiFloodEnabled:Boolean;
      
      private var tracker:ChatSettingsTracker;
      
      private var chatModeratorLevel:ChatModeratorLevel;
      
      public function ChatModel()
      {
         super();
         this.layer = display.contentUILayer;
      }
      
      public function objectLoaded() : void
      {
         this.selfName = getInitParam().selfName;
         this.showLinks = getInitParam().showLinks;
         this.isAdmin = getInitParam().admin;
         this.antiFloodEnabled = getInitParam().antifloodEnabled;
         this.chatModeratorLevel = getInitParam().chatModeratorLevel;
         this.linksInterceptor = new LinksInterceptor(getInitParam().linksWhiteList);
         this.chatPanel = new LobbyChat();
         this.chatPanel.selfName = this.selfName;
         this.chatPanel.typingAntifloodEnabled = getInitParam().typingSpeedAntifloodEnabled;
         if(this.antiFloodEnabled)
         {
            Antiflood.init(getInitParam().linksWhiteList,getInitParam().minChar,getInitParam().minWord,getInitParam().bufferSize);
         }
         this.tracker = new ChatSettingsTracker(this.chatPanel);
         this.showPanel();
         trackerService.trackEvent(LOG_CHANNEL_NAME,"ChatStart","");
         this.prepareSharpLink();
      }
      
      public function objectUnloaded() : void
      {
         this.chatPanel.hide();
         this.hidePanel();
      }
      
      private function onSendChatMessage(param1:ChatFormEvent) : void
      {
         var _loc2_:UserStatus = null;
         var _loc3_:String = this.chatPanel.inputText.replace(/\s{2,}/g," ");
         if(!this.antiFloodEnabled || this.isAdmin || Antiflood.isNotFlood(_loc3_))
         {
            server.sendMessage(param1.nameTo,_loc3_);
            if(this.antiFloodEnabled)
            {
               Antiflood.getMessageKeys(_loc3_,true);
            }
            this.chatPanel.lastMessageTime = new Date().getTime();
         }
         else
         {
            _loc2_ = new UserStatus(this.chatModeratorLevel,"",userPropertyService.rank,this.selfName,userPropertyService.userId);
            this.chatPanel.addMessage(_loc2_,null,_loc3_);
            clientLog.log(LOG_CHANNEL_NAME,"onSendChatMessage : antiFlood : %1",_loc3_);
         }
      }
      
      public function showMessages(param1:Vector.<ChatMessage>) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:* = null;
         var _loc4_:ChatMessage = null;
         var _loc5_:RegExp = /(<)(.*?)(>)/gi;
         var _loc6_:RegExp = /#battle\|(.*?)\|([0-9a-f]{16})/gi;
         var _loc7_:int = 0;
         this.htmlFlag = false;
         var _loc8_:int = 0;
         while(_loc8_ < param1.length)
         {
            _loc4_ = param1[_loc8_];
            if(_loc4_.warning)
            {
               _loc3_ = "<font color=\"#f4e000\">" + _loc4_.text + "</font>";
            }
            else
            {
               _loc3_ = _loc4_.text;
               if(this.antiFloodEnabled)
               {
                  Antiflood.getMessageKeys(_loc3_,true);
               }
               clientLog.log(LOG_CHANNEL_NAME,"showMessages : %1",_loc4_.text);
            }
            _loc2_ = _loc4_.system;
            this.htmlFlag = false;
            _loc7_ = int(_loc3_.search(_loc5_));
            if(_loc7_ > -1)
            {
               if(!_loc2_)
               {
                  _loc3_ = _loc3_.replace(_loc5_,"&lt;$2&gt;");
               }
               this.htmlFlag = true;
            }
            _loc3_ += " ";
            if(this.showLinks && !_loc2_)
            {
               _loc3_ = this.linksInterceptor.checkLinks(_loc3_);
               this.htmlFlag = this.linksInterceptor.htmlFlag;
            }
            _loc7_ = int(_loc3_.search(_loc6_));
            if(_loc7_ > -1)
            {
               _loc3_ = _loc3_.replace(_loc6_,"<u><a href=\'event:$2\'>$1</a></u>");
               this.htmlFlag = true;
            }
            _loc3_ = this.replaceSharpLinks(_loc3_);
            this.chatPanel.addMessage(_loc4_.sourceUserStatus,_loc4_.targetUserStatus,_loc3_,_loc2_,this.htmlFlag);
            _loc8_++;
         }
         if(_loc8_ > 25)
         {
            this.chatPanel.output.scrollDown();
         }
      }
      
      private function showPanel() : void
      {
         if(!this.layer.contains(this.chatPanel))
         {
            this.layer.addChild(this.chatPanel);
            this.chatPanel.addEventListener(ChatFormEvent.SEND_MESSAGE,this.onSendChatMessage);
            this.chatPanel.addEventListener(TextEvent.LINK,this.onTextLink);
         }
      }
      
      private function hidePanel() : void
      {
         if(this.layer.contains(this.chatPanel))
         {
            this.layer.removeChild(this.chatPanel);
            this.chatPanel.removeEventListener(ChatFormEvent.SEND_MESSAGE,this.onSendChatMessage);
            this.chatPanel.removeEventListener(TextEvent.LINK,this.onTextLink);
         }
      }
      
      private function onTextLink(param1:TextEvent) : void
      {
         var _loc2_:RegExp = /^([0-9a-f]{16})$/gi;
         var _loc3_:String = param1.text;
         if(_loc3_.search(_loc2_) > -1)
         {
            battleLinkActivatorService.activateLink(_loc3_);
         }
         else
         {
            navigateToURL(new URLRequest(_loc3_),"_blank");
         }
      }
      
      public function cleanUsersMessages(param1:String) : void
      {
         this.chatPanel.cleanOutUsersMessages(param1);
      }
      
      public function clearAllMessages() : void
      {
         this.chatPanel.clearAll();
      }
      
      private function prepareSharpLink() : void
      {
         this.sharpLinks = [localeService.getText(TanksLocale.TEXT_CHAT_SHARP_RULES).split("|"),localeService.getText(TanksLocale.TEXT_CHAT_SHARP_WIKI).split("|"),localeService.getText(TanksLocale.§final var const§).split("|"),localeService.getText(TanksLocale.§#I§).split("|"),localeService.getText(TanksLocale.§^<§).split("|")];
         var _loc1_:int = 0;
         while(_loc1_ < this.sharpLinks.length)
         {
            this.sharpLinks[_loc1_][0] = new RegExp("#" + this.sharpLinks[_loc1_][0],"gi");
            _loc1_++;
         }
      }
      
      private function replaceSharpLinks(param1:String) : String
      {
         var _loc2_:RegExp = null;
         var _loc3_:int = 0;
         var _loc4_:String = param1;
         var _loc5_:int = 0;
         while(_loc5_ < this.sharpLinks.length)
         {
            _loc2_ = this.sharpLinks[_loc5_][0];
            _loc3_ = int(_loc4_.search(_loc2_));
            if(_loc3_ > -1)
            {
               _loc4_ = _loc4_.replace(_loc2_,"<u><a href=\'" + this.sharpLinks[_loc5_][2] + "\' target=\'_blank\'>" + this.sharpLinks[_loc5_][1] + "</a></u>");
               this.htmlFlag = true;
            }
            _loc5_++;
         }
         return _loc4_;
      }
      
      public function updateTypingSpeedAntifloodParams(param1:int, param2:int) : void
      {
         this.chatPanel.updateTypingAntifloodParams(param1,param2);
      }
   }
}

