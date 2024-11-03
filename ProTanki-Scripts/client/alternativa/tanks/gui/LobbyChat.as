package alternativa.tanks.gui
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.osgi.service.logging.LogService;
   import alternativa.tanks.locale.constants.TextConst;
   import alternativa.tanks.model.ShowChat;
   import assets.scroller.color.ScrollThumbSkinGreen;
   import assets.scroller.color.ScrollTrackGreen;
   import controls.TankWindow;
   import controls.TankWindowHeader;
   import controls.TankWindowInner;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import controls.base.TankInputBase;
   import fl.controls.LabelButton;
   import fl.controls.ScrollBar;
   import fl.events.ScrollEvent;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.net.SharedObject;
   import flash.text.GridFitType;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.ui.Keyboard;
   import flash.utils.Timer;
   import forms.events.ChatFormEvent;
   import forms.events.LoginFormEvent;
   import forms.userlabel.UserLabelEvent;
   import projects.tanks.client.chat.types.UserStatus;
   import projects.tanks.client.users.services.chatmoderator.ChatModeratorLevel;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import services.contextmenu.ContextMenuServiceEvent;
   import services.contextmenu.IContextMenuService;
   
   public class LobbyChat extends Sprite implements ShowChat
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var storageService:IStorageService;
      
      [Inject]
      public static var logService:LogService;
      
      [Inject]
      public static var contextMenuService:IContextMenuService;
      
      private static var so:SharedObject;
      
      private static const LAST_MESSAGE_SHARED_KEY:String = "lobbyChatLastMessageKey";
      
      private static const ADDITIONAL_SCROLL_AREA_HEIGHT:Number = 7;
      
      private static const GRAY_COLOR:uint = 10987948;
      
      private static const UNAVAILABLE_TIMER_PERIOD:int = 1000;
      
      private var mainBackground:TankWindow;
      
      private var inner:TankWindowInner;
      
      private var inputControl:TankInputBase;
      
      private var input:TextField;
      
      private var disabledChatLabel:LabelBase;
      
      private var addressed:Boolean;
      
      private var isChatEnabled:Boolean = false;
      
      private var isChatAvailable:Boolean = true;
      
      private var _rangTo:int;
      
      private var _nameTo:String;
      
      private var _oldNameTo:String;
      
      private var delayTimer:Timer;
      
      private var CtrlPressed:Boolean = false;
      
      public var output:ChatOutput;
      
      public var sendButton:DefaultButtonBase;
      
      private var _selfName:String;
      
      private var _lastRespondent:String = "";
      
      public var systemUserStatus:UserStatus;
      
      public var emptyUserStatus:UserStatus;
      
      private var unavailableTimer:Timer;
      
      private var _lastMessageTime:Number = 0;
      
      private var _symbolCost:int;
      
      private var _messageCost:int;
      
      private var coloredTextFormat:TextFormat;
      
      private var standartTextFormat:TextFormat;
      
      private var _typingAntifloodEnabled:Boolean;
      
      public function LobbyChat()
      {
         this.mainBackground = new TankWindow();
         this.inner = new TankWindowInner(100,100,TankWindowInner.GREEN);
         this.inputControl = new TankInputBase();
         this.disabledChatLabel = new LabelBase();
         this.output = new ChatOutput();
         this.sendButton = new DefaultButtonBase();
         this.systemUserStatus = new UserStatus(ChatModeratorLevel.NONE,"",0,"System",null);
         this.emptyUserStatus = new UserStatus(ChatModeratorLevel.NONE,"",0,"",null);
         super();
         addEventListener(Event.ADDED_TO_STAGE,this.configUI);
         addEventListener(Event.ADDED_TO_STAGE,this.addResizeListener);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemoveFromStage);
      }
      
      public static function get blockList() : Array
      {
         var _loc1_:Array = null;
         if(so == null)
         {
            so = storageService.getStorage();
         }
         _loc1_ = so.data.blocklist;
         if(_loc1_ == null)
         {
            _loc1_ = new Array();
         }
         return _loc1_;
      }
      
      public static function blockUser(param1:String) : Boolean
      {
         var _loc2_:Array = null;
         so = storageService.getStorage();
         _loc2_ = so.data.blocklist;
         if(_loc2_ == null)
         {
            _loc2_ = new Array();
         }
         var _loc3_:int = int(_loc2_.indexOf(param1));
         if(_loc3_ > -1)
         {
            _loc2_.splice(_loc3_,1);
         }
         _loc2_.push(param1);
         so.data.blocklist = _loc2_;
         so.flush();
         return true;
      }
      
      public static function unblockUser(param1:String) : Boolean
      {
         var _loc2_:Array = null;
         so = storageService.getStorage();
         _loc2_ = so.data.blocklist;
         if(_loc2_ == null)
         {
            _loc2_ = new Array();
         }
         var _loc3_:int = int(_loc2_.indexOf(param1));
         if(_loc3_ > -1)
         {
            _loc2_.splice(_loc3_,1);
         }
         so.data.blocklist = _loc2_;
         so.flush();
         return true;
      }
      
      public static function unblockall() : Boolean
      {
         so = storageService.getStorage();
         so.data.blocklist = new Array();
         so.flush();
         return true;
      }
      
      public static function blocked(param1:String) : Boolean
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         so = storageService.getStorage();
         _loc2_ = so.data.blocklist;
         if(_loc2_ == null)
         {
            _loc2_ = new Array();
            so.data.blocklist = _loc2_;
            so.flush();
         }
         _loc3_ = int(_loc2_.indexOf(param1));
         return _loc3_ > -1;
      }
      
      public function set selfName(param1:String) : void
      {
         this._selfName = param1;
         this.output.selfName = this._selfName;
      }
      
      public function get inputText() : String
      {
         return this.input.text;
      }
      
      private function addResizeListener(param1:Event) : void
      {
         stage.addEventListener(Event.RESIZE,this.onResize);
         this.onResize(null);
      }
      
      private function onRemoveFromStage(param1:Event) : void
      {
         stage.removeEventListener(Event.RESIZE,this.onResize);
      }
      
      public function configUI(param1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.configUI);
         this.input = this.inputControl.textField;
         this.input.maxChars = 299;
         addChild(this.mainBackground);
         addChild(this.inner);
         this.inner.y = 11;
         this.inner.x = 11;
         this.inner.showBlink = true;
         this.mainBackground.headerLang = localeService.getText(TextConst.GUI_LANG);
         this.mainBackground.header = TankWindowHeader.CHAT;
         this.input.addEventListener(KeyboardEvent.KEY_DOWN,this.sendMessageKey);
         this.input.addEventListener(KeyboardEvent.KEY_UP,this.clearCtrlPressed);
         this.input.addEventListener(MouseEvent.CLICK,this.onInputClick);
         this.sendButton.addEventListener(MouseEvent.CLICK,this.sendMessage);
         addChild(this.inputControl);
         addChild(this.disabledChatLabel);
         this.disabledChatLabel.mouseEnabled = false;
         this.disabledChatLabel.color = GRAY_COLOR;
         this.disabledChatLabel.text = localeService.getText(TextConst.STRING_DISABLED_CHAT_LABEL_TEXT);
         addChild(this.output);
         this.output.move(15,15);
         this.confScroll();
         this.output.addEventListener(UserLabelEvent.CLICK_WITH_CTRL,this.onClickWithCtrlUserLabel);
         this.output.addEventListener(ScrollEvent.SCROLL,this.onScroll);
         this.output.verticalScrollBar.addEventListener(Event.ENTER_FRAME,this.updateScrollOnEnterFrame);
         this.inputControl.addEventListener(LoginFormEvent.TEXT_CHANGED,this.checkName);
         contextMenuService.addEventListener(ContextMenuServiceEvent.WRITE_IN_CHAT,this.onClickWriteInChatContextMenu);
         this.sendButton.x = 272;
         this.sendButton.width = 80;
         this.sendButton.label = localeService.getText(TextConst.CHAT_PANEL_BUTTON_SEND);
         addChild(this.sendButton);
         this.unavailableTimer = new Timer(UNAVAILABLE_TIMER_PERIOD);
         this.unavailableTimer.addEventListener(TimerEvent.TIMER,this.onAntifloodTimer);
         this.unavailableTimer.start();
         this.input.gridFitType = GridFitType.SUBPIXEL;
         this.coloredTextFormat = new TextFormat();
         this.coloredTextFormat.color = 16728642;
         this.standartTextFormat = new TextFormat();
         this.standartTextFormat.color = 16777215;
         if(storageService.getStorage().data[LAST_MESSAGE_SHARED_KEY])
         {
            this._lastMessageTime = storageService.getStorage().data[LAST_MESSAGE_SHARED_KEY];
         }
         else
         {
            this._lastMessageTime = 0;
         }
      }
      
      private function onClickWithCtrlUserLabel(param1:UserLabelEvent) : void
      {
         this.addUidInOutput(param1.uid);
      }
      
      private function onClickWriteInChatContextMenu(param1:ContextMenuServiceEvent) : void
      {
         this.addUidInOutput(param1.uid);
      }
      
      private function onAntifloodTimer(param1:TimerEvent) : void
      {
         this.updateTypingAntiflood();
      }
      
      private function updateScrollOnEnterFrame(param1:Event) : void
      {
         var _loc2_:Sprite = null;
         var _loc3_:Sprite = null;
         var _loc4_:ScrollBar = this.output.verticalScrollBar;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.numChildren)
         {
            _loc2_ = Sprite(_loc4_.getChildAt(_loc5_));
            if(_loc2_.hitArea != null)
            {
               _loc3_ = _loc2_.hitArea;
               _loc3_.graphics.clear();
            }
            else
            {
               _loc3_ = new Sprite();
               _loc3_.mouseEnabled = false;
               _loc2_.hitArea = _loc3_;
               this.output.addChild(_loc3_);
            }
            _loc3_.graphics.beginFill(0,0);
            if(_loc2_ is LabelButton)
            {
               _loc3_.graphics.drawRect(_loc4_.x - ADDITIONAL_SCROLL_AREA_HEIGHT,_loc2_.y - 14,_loc2_.width + ADDITIONAL_SCROLL_AREA_HEIGHT,_loc2_.height + 28);
            }
            else
            {
               _loc3_.graphics.drawRect(_loc4_.x - ADDITIONAL_SCROLL_AREA_HEIGHT,_loc2_.y,_loc2_.width + ADDITIONAL_SCROLL_AREA_HEIGHT,_loc2_.height);
            }
            _loc3_.graphics.endFill();
            _loc5_++;
         }
      }
      
      private function onInputClick(param1:MouseEvent) : void
      {
         if(stage.focus == null)
         {
            stage.focus = this.input;
         }
      }
      
      private function clearCtrlPressed(param1:KeyboardEvent) : void
      {
         this.CtrlPressed = false;
      }
      
      private function onScroll(param1:ScrollEvent) : void
      {
         this.output.deltaWidth = 18;
         this.output.setSize(this.inner.width + 1,this.inner.height - 8);
         this.output.removeEventListener(ScrollEvent.SCROLL,this.onScroll);
         this.output.firstFill = false;
      }
      
      private function checkName(param1:Event) : void
      {
         var _loc2_:RegExp = /^[a-z0-9](([\.\-\w](?!(-|_|\.){2,}))*[a-z0-9])\: /i;
         var _loc3_:int = int(this.input.text.search(_loc2_));
         var _loc4_:String = this.input.text.slice(0,this.input.text.indexOf(": "));
         if(_loc3_ == 0)
         {
            if(_loc4_.toLocaleLowerCase() == "re" && this._lastRespondent != "")
            {
               _loc4_ = this._lastRespondent;
               this.input.text = _loc4_ + ": ";
               this.input.setSelection(this.input.length,this.input.length);
            }
            else if(_loc4_.toLocaleLowerCase() == "re" && this._lastRespondent == "")
            {
               this.input.text = "";
            }
            if(!this.addressed || _loc4_ != this._oldNameTo)
            {
               this._oldNameTo = this._nameTo = _loc4_;
               this.addressed = true;
               this.output.selectUser(this._nameTo);
            }
         }
         else if(this.addressed)
         {
            this.addressed = false;
            this.output.selectUser("");
         }
         this.updateTypingAntiflood();
      }
      
      private function confScroll() : void
      {
         this.output.setStyle("downArrowUpSkin",ScrollArrowDownGreen);
         this.output.setStyle("downArrowDownSkin",ScrollArrowDownGreen);
         this.output.setStyle("downArrowOverSkin",ScrollArrowDownGreen);
         this.output.setStyle("downArrowDisabledSkin",ScrollArrowDownGreen);
         this.output.setStyle("upArrowUpSkin",ScrollArrowUpGreen);
         this.output.setStyle("upArrowDownSkin",ScrollArrowUpGreen);
         this.output.setStyle("upArrowOverSkin",ScrollArrowUpGreen);
         this.output.setStyle("upArrowDisabledSkin",ScrollArrowUpGreen);
         this.output.setStyle("trackUpSkin",ScrollTrackGreen);
         this.output.setStyle("trackDownSkin",ScrollTrackGreen);
         this.output.setStyle("trackOverSkin",ScrollTrackGreen);
         this.output.setStyle("trackDisabledSkin",ScrollTrackGreen);
         this.output.setStyle("thumbUpSkin",ScrollThumbSkinGreen);
         this.output.setStyle("thumbDownSkin",ScrollThumbSkinGreen);
         this.output.setStyle("thumbOverSkin",ScrollThumbSkinGreen);
         this.output.setStyle("thumbDisabledSkin",ScrollThumbSkinGreen);
      }
      
      private function addUidInOutput(param1:String) : void
      {
         this.output.selectUser(param1);
         var _loc2_:* = this.input.text;
         if(_loc2_.indexOf(": ") > 0)
         {
            _loc2_ = param1 + ": " + _loc2_.slice(_loc2_.indexOf(": ") + 2,_loc2_.length);
         }
         else
         {
            _loc2_ = param1 + ": " + _loc2_.slice(_loc2_.indexOf(": ") + 1,_loc2_.length);
         }
         this.input.text = _loc2_;
         stage.focus = this.input;
         this.input.setSelection(this.input.length,this.input.length);
         this.addressed = true;
         this._nameTo = param1;
         if(this.CtrlPressed)
         {
            _loc2_ = "/ban " + param1 + " ";
            this.input.text = _loc2_;
            stage.focus = this.input;
            this.input.setSelection(this.input.length,this.input.length);
            this.addressed = true;
            this._nameTo = param1;
         }
         this.updateTypingAntiflood();
      }
      
      private function sendMessageKey(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.ENTER)
         {
            this.send();
         }
         this.CtrlPressed = param1.ctrlKey && param1.shiftKey;
      }
      
      private function sendMessage(param1:MouseEvent) : void
      {
         this.send();
      }
      
      private function send() : void
      {
         var _loc1_:String = null;
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         if(!this.isChatAvailable)
         {
            return;
         }
         var _loc6_:*;
         var _loc7_:String = _loc6_ = this.input.text;
         var _loc8_:RegExp = /(^(\/block|\/unblock) ([a-z0-9](([\.\-\w](?!(-|_|\.){2,}))*[a-z0-9])))$/i;
         var _loc9_:RegExp = /^(\/unblockall|\/blocklist)$/;
         var _loc10_:RegExp = /^(\/showip|\/hideip)$/;
         var _loc11_:int = int(_loc7_.search(_loc8_));
         var _loc12_:int = int(_loc7_.search(_loc9_));
         var _loc13_:int = int(_loc7_.search(_loc10_));
         if(_loc11_ > -1)
         {
            _loc1_ = _loc7_.replace(_loc8_,"$2");
            _loc2_ = _loc7_.replace(_loc8_,"$3");
            if(_loc1_ == "/block")
            {
               LobbyChat.blockUser(_loc2_);
               _loc3_ = localeService.getText(TextConst.CHAT_PANEL_COMMAND_BLOCK,_loc2_);
            }
            else
            {
               LobbyChat.unblockUser(_loc2_);
               _loc3_ = localeService.getText(TextConst.CHAT_PANEL_COMMAND_UNBLOCK,_loc2_);
            }
            this.addMessage(this.systemUserStatus,this.emptyUserStatus,_loc3_,true);
            this.input.text = _loc1_ + " ";
            return;
         }
         if(_loc12_ > -1)
         {
            _loc1_ = _loc7_.replace(_loc8_,"$1");
            if(_loc1_ == "/unblockall")
            {
               LobbyChat.unblockall();
               _loc3_ = localeService.getText(TextConst.CHAT_PANEL_COMMAND_UNBLOCK_ALL);
               this.addMessage(this.systemUserStatus,this.emptyUserStatus,_loc3_);
            }
            else
            {
               _loc4_ = LobbyChat.blockList;
               if(_loc4_.length > 0)
               {
                  _loc3_ = localeService.getText(TextConst.CHAT_PANEL_COMMAND_BLOCK_LIST);
                  _loc6_ = "\n" + _loc3_ + "\n—————————————\n";
                  while(_loc5_ < _loc4_.length)
                  {
                     _loc6_ += String(_loc5_ + 1) + ": " + _loc4_[_loc5_] + "\n";
                     _loc5_++;
                  }
               }
               else
               {
                  _loc6_ = "...";
               }
               this.addMessage(this.systemUserStatus,this.emptyUserStatus,_loc6_);
            }
            this.input.text = "";
            return;
         }
         if(_loc13_ > -1)
         {
            _loc1_ = _loc7_.replace(_loc10_,"$1");
            if(_loc1_ == "/showip")
            {
               this.output.showIPMode = true;
               this.addMessage(this.systemUserStatus,this.emptyUserStatus,"show IP",true);
            }
            else
            {
               this.output.showIPMode = false;
               this.addMessage(this.systemUserStatus,this.emptyUserStatus,"hide IP",true);
            }
            return;
         }
         if(_loc6_ != "")
         {
            if(this.addressed)
            {
               _loc6_ = _loc6_.slice(_loc6_.indexOf(": ") + 2,_loc6_.length);
               this.input.text = _loc6_;
               dispatchEvent(new ChatFormEvent(this._rangTo,this._nameTo));
               this.input.text = this._nameTo + ": ";
            }
            else
            {
               dispatchEvent(new ChatFormEvent());
               this.input.text = "";
            }
            this.input.setSelection(0,0);
            this.input.setSelection(this.input.length,this.input.length);
            this.output.scrollDown();
         }
      }
      
      private function onResize(param1:Event) : void
      {
         var _loc2_:int = int(Math.max(970,stage.stageWidth));
         this.mainBackground.width = _loc2_ / 3;
         this.mainBackground.height = Math.max(stage.stageHeight - 60,530);
         x = 0;
         y = 60;
         this.inner.width = this.mainBackground.width - 22;
         this.inner.height = this.mainBackground.height - 58;
         this.sendButton.y = this.mainBackground.height - 42;
         this.sendButton.x = this.mainBackground.width - this.sendButton.width - 11;
         this.inputControl.x = 11;
         this.inputControl.y = this.mainBackground.height - 42;
         this.inputControl.width = this.sendButton.x - 16;
         this.disabledChatLabel.x = this.inputControl.x + 3;
         this.disabledChatLabel.y = this.inputControl.y + 7;
         this.output.setSize(this.inner.width + 1,this.inner.height - 8);
         if(this.delayTimer == null)
         {
            this.delayTimer = new Timer(200,1);
            this.delayTimer.addEventListener(TimerEvent.TIMER,this.correctResize);
         }
         this.delayTimer.reset();
         this.delayTimer.start();
      }
      
      private function correctResize(param1:TimerEvent = null) : void
      {
         this.output.setSize(this.inner.width + 1,this.inner.height - 8);
         this.delayTimer.removeEventListener(TimerEvent.TIMER,this.correctResize);
         this.delayTimer = null;
      }
      
      public function addMessage(param1:UserStatus, param2:UserStatus, param3:String, param4:Boolean = false, param5:Boolean = false) : void
      {
         if(param1 == null)
         {
            param1 = this.emptyUserStatus;
         }
         if(param2 == null)
         {
            param2 = this.emptyUserStatus;
         }
         if(!blocked(param1.uid))
         {
            this.output.addLine(param1,param2,param3,param4,param5);
            if(this.addressed)
            {
               this.output.selectUser(this._nameTo,true);
            }
            if(param2.uid == this._selfName)
            {
               this._lastRespondent = param1.uid;
            }
         }
      }
      
      public function hide() : void
      {
         if(this.delayTimer != null)
         {
            this.delayTimer.stop();
            this.delayTimer.removeEventListener(TimerEvent.TIMER,this.correctResize);
         }
         if(this.input != null)
         {
            this.input.removeEventListener(KeyboardEvent.KEY_DOWN,this.sendMessageKey);
            this.input.removeEventListener(KeyboardEvent.KEY_UP,this.clearCtrlPressed);
            this.input.removeEventListener(MouseEvent.CLICK,this.onInputClick);
         }
         if(this.sendButton != null)
         {
            this.sendButton.removeEventListener(MouseEvent.CLICK,this.sendMessage);
         }
         if(this.output != null)
         {
            this.output.verticalScrollBar.removeEventListener(Event.ENTER_FRAME,this.updateScrollOnEnterFrame);
            this.output.removeEventListener(ScrollEvent.SCROLL,this.onScroll);
            this.output.removeEventListener(UserLabelEvent.CLICK_WITH_CTRL,this.onClickWithCtrlUserLabel);
         }
         if(this.inputControl != null)
         {
            this.inputControl.removeEventListener(LoginFormEvent.TEXT_CHANGED,this.checkName);
         }
         contextMenuService.removeEventListener(ContextMenuServiceEvent.WRITE_IN_CHAT,this.onClickWriteInChatContextMenu);
      }
      
      public function cleanOutUsersMessages(param1:String) : void
      {
         this.output.cleanOutUsersMessages(param1);
      }
      
      public function clearAll() : void
      {
         this.output.clear();
      }
      
      public function setShowChat(param1:Boolean) : void
      {
         this.output.visible = param1;
         if(!param1)
         {
            this.inputControl.value = "";
         }
         this.isChatEnabled = param1;
         this.updateSendButtonLabel();
         this.updateDisabledChatLabel();
      }
      
      private function updateSendButtonLabel() : void
      {
         if(this.isChatEnabled && !this.isChatAvailable)
         {
            this.sendButton.enable = false;
         }
         else
         {
            this.sendButton.label = localeService.getText(TextConst.CHAT_PANEL_BUTTON_SEND);
            this.sendButton.enable = this.isChatEnabled;
         }
      }
      
      private function updateDisabledChatLabel() : void
      {
         if(this.isChatEnabled && !this.isChatAvailable)
         {
            this.disabledChatLabel.text = localeService.getText(TextConst.STRING_TYPING_SPEED_BANNED);
            this.disabledChatLabel.visible = true;
            this.inputControl.enable = false;
         }
         else
         {
            this.disabledChatLabel.text = localeService.getText(TextConst.STRING_DISABLED_CHAT_LABEL_TEXT);
            this.inputControl.enable = this.isChatEnabled;
            this.disabledChatLabel.visible = !this.isChatEnabled;
         }
      }
      
      private function updateTypingAntiflood() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:int = 0;
         if(!this._typingAntifloodEnabled)
         {
            return;
         }
         var _loc3_:String = this.input.text;
         var _loc4_:int = _loc3_.length * this._symbolCost + this._messageCost;
         var _loc5_:Number = Number(new Date().getTime());
         var _loc6_:Number = this._lastMessageTime + _loc4_;
         if(!this.isCommand(_loc3_) && _loc5_ < _loc6_)
         {
            _loc1_ = _loc6_ - _loc5_;
            this.sendButton.label = this.getUnbanTime(_loc1_);
            this.sendButton.enable = false;
            _loc2_ = _loc1_ / this._symbolCost;
            if(_loc2_ >= _loc3_.length)
            {
               this.input.setTextFormat(this.coloredTextFormat);
            }
            else if(_loc2_ != 0)
            {
               this.input.setTextFormat(this.standartTextFormat);
               this.input.setTextFormat(this.coloredTextFormat,_loc3_.length - _loc2_,_loc3_.length);
            }
            this.isChatAvailable = false;
         }
         else
         {
            this.input.setTextFormat(this.standartTextFormat);
            this.isChatAvailable = true;
         }
         this.updateSendButtonLabel();
      }
      
      private function getUnbanTime(param1:Number) : String
      {
         var _loc2_:Number = int(param1 / 1000);
         var _loc3_:Number = int(_loc2_ / 60);
         var _loc4_:Number = _loc2_ % 60;
         var _loc5_:String;
         if((_loc5_ = _loc4_.toString()).length < 2)
         {
            _loc5_ = "0" + _loc5_;
         }
         return _loc3_.toString() + ":" + _loc5_;
      }
      
      private function isCommand(param1:String) : Boolean
      {
         var _loc2_:RegExp = /^\s*\//i;
         var _loc3_:int = int(param1.search(_loc2_));
         return _loc3_ > -1;
      }
      
      public function set lastMessageTime(param1:Number) : void
      {
         this._lastMessageTime = param1;
         storageService.getStorage().data[LAST_MESSAGE_SHARED_KEY] = param1;
         this.updateTypingAntiflood();
      }
      
      public function updateTypingAntifloodParams(param1:int, param2:int) : void
      {
         this._symbolCost = param1;
         this._messageCost = param2;
         this.updateTypingAntiflood();
      }
      
      public function set typingAntifloodEnabled(param1:Boolean) : *
      {
         this._typingAntifloodEnabled = param1;
      }
   }
}

