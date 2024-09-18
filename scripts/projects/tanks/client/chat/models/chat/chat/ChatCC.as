package projects.tanks.client.chat.models.chat.chat
{
   import projects.tanks.client.users.services.chatmoderator.ChatModeratorLevel;
   
   public class ChatCC
   {
      private var _admin:Boolean;
      
      private var _antifloodEnabled:Boolean;
      
      private var _bufferSize:int;
      
      private var _channels:Vector.<String>;
      
      private var _chatEnabled:Boolean;
      
      private var _chatModeratorLevel:ChatModeratorLevel;
      
      private var _linksWhiteList:Vector.<String>;
      
      private var _minChar:int;
      
      private var _minWord:int;
      
      private var _privateMessagesEnabled:Boolean;
      
      private var _selfName:String;
      
      private var _showLinks:Boolean;
      
      private var _typingSpeedAntifloodEnabled:Boolean;
      
      public function ChatCC(param1:Boolean = false, param2:Boolean = false, param3:int = 0, param4:Vector.<String> = null, param5:Boolean = false, param6:ChatModeratorLevel = null, param7:Vector.<String> = null, param8:int = 0, param9:int = 0, param10:Boolean = false, param11:String = null, param12:Boolean = false, param13:Boolean = false)
      {
         super();
         this._admin = param1;
         this._antifloodEnabled = param2;
         this._bufferSize = param3;
         this._channels = param4;
         this._chatEnabled = param5;
         this._chatModeratorLevel = param6;
         this._linksWhiteList = param7;
         this._minChar = param8;
         this._minWord = param9;
         this._privateMessagesEnabled = param10;
         this._selfName = param11;
         this._showLinks = param12;
         this._typingSpeedAntifloodEnabled = param13;
      }
      
      public function get admin() : Boolean
      {
         return this._admin;
      }
      
      public function set admin(param1:Boolean) : void
      {
         this._admin = param1;
      }
      
      public function get antifloodEnabled() : Boolean
      {
         return this._antifloodEnabled;
      }
      
      public function set antifloodEnabled(param1:Boolean) : void
      {
         this._antifloodEnabled = param1;
      }
      
      public function get bufferSize() : int
      {
         return this._bufferSize;
      }
      
      public function set bufferSize(param1:int) : void
      {
         this._bufferSize = param1;
      }
      
      public function get channels() : Vector.<String>
      {
         return this._channels;
      }
      
      public function set channels(param1:Vector.<String>) : void
      {
         this._channels = param1;
      }
      
      public function get chatEnabled() : Boolean
      {
         return this._chatEnabled;
      }
      
      public function set chatEnabled(param1:Boolean) : void
      {
         this._chatEnabled = param1;
      }
      
      public function get chatModeratorLevel() : ChatModeratorLevel
      {
         return this._chatModeratorLevel;
      }
      
      public function set chatModeratorLevel(param1:ChatModeratorLevel) : void
      {
         this._chatModeratorLevel = param1;
      }
      
      public function get linksWhiteList() : Vector.<String>
      {
         return this._linksWhiteList;
      }
      
      public function set linksWhiteList(param1:Vector.<String>) : void
      {
         this._linksWhiteList = param1;
      }
      
      public function get minChar() : int
      {
         return this._minChar;
      }
      
      public function set minChar(param1:int) : void
      {
         this._minChar = param1;
      }
      
      public function get minWord() : int
      {
         return this._minWord;
      }
      
      public function set minWord(param1:int) : void
      {
         this._minWord = param1;
      }
      
      public function get privateMessagesEnabled() : Boolean
      {
         return this._privateMessagesEnabled;
      }
      
      public function set privateMessagesEnabled(param1:Boolean) : void
      {
         this._privateMessagesEnabled = param1;
      }
      
      public function get selfName() : String
      {
         return this._selfName;
      }
      
      public function set selfName(param1:String) : void
      {
         this._selfName = param1;
      }
      
      public function get showLinks() : Boolean
      {
         return this._showLinks;
      }
      
      public function set showLinks(param1:Boolean) : void
      {
         this._showLinks = param1;
      }
      
      public function get typingSpeedAntifloodEnabled() : Boolean
      {
         return this._typingSpeedAntifloodEnabled;
      }
      
      public function set typingSpeedAntifloodEnabled(param1:Boolean) : void
      {
         this._typingSpeedAntifloodEnabled = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "ChatCC [";
         _loc1_ += "admin = " + this.admin + " ";
         _loc1_ += "antifloodEnabled = " + this.antifloodEnabled + " ";
         _loc1_ += "bufferSize = " + this.bufferSize + " ";
         _loc1_ += "channels = " + this.channels + " ";
         _loc1_ += "chatEnabled = " + this.chatEnabled + " ";
         _loc1_ += "chatModeratorLevel = " + this.chatModeratorLevel + " ";
         _loc1_ += "linksWhiteList = " + this.linksWhiteList + " ";
         _loc1_ += "minChar = " + this.minChar + " ";
         _loc1_ += "minWord = " + this.minWord + " ";
         _loc1_ += "privateMessagesEnabled = " + this.privateMessagesEnabled + " ";
         _loc1_ += "selfName = " + this.selfName + " ";
         _loc1_ += "showLinks = " + this.showLinks + " ";
         _loc1_ += "typingSpeedAntifloodEnabled = " + this.typingSpeedAntifloodEnabled + " ";
         return _loc1_ + "]";
      }
   }
}

