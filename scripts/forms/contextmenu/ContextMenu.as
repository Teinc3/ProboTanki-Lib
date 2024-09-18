package forms.contextmenu
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.locale.constants.TextConst;
   import controls.TankWindow;
   import controls.TankWindowInner;
   import controls.base.LabelBase;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.system.System;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import forms.ColorConstants;
   import forms.ranks.SmallRankIcon;
   import forms.userlabel.UserLabel;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.blockuser.IBlockUserService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendActionService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.battleinvite.IBattleInviteService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.notifier.online.IOnlineNotifierService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoLabelUpdater;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.UserInfoLabelUpdaterEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import services.contextmenu.IContextMenuService;
   
   public class ContextMenu extends Sprite
   {
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var friendsActionService:IFriendActionService;
      
      [Inject]
      public static var battleInviteService:IBattleInviteService;
      
      [Inject]
      public static var contextMenuService:IContextMenuService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var onlineNotifierService:IOnlineNotifierService;
      
      [Inject]
      public static var userInfoService:IUserInfoService;
      
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      [Inject]
      public static var blockUserService:IBlockUserService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      private static const WINDOW_MARGIN:int = 11;
      
      private static const HIDE_DELAY_IN_MSEC:int = 10000;
      
      private static const LINE_COLOR:uint = 1723412;
      
      private var _window:TankWindow;
      
      private var _windowInner:TankWindowInner;
      
      private var _uidLabel:LabelBase;
      
      private var _onlineLabel:LabelBase;
      
      private var _addToFriendsLabel:ContextMenuLabel;
      
      private var _acceptRequestLabel:ContextMenuLabel;
      
      private var _rejectRequestLabel:ContextMenuLabel;
      
      private var _cancelRequestLabel:ContextMenuLabel;
      
      private var _copyUidLabel:ContextMenuLabel;
      
      private var _writeInChatLabel:ContextMenuLabel;
      
      private var _blockUserLabel:ContextMenuLabel;
      
      private var _unblockUserLabel:ContextMenuLabel;
      
      private var _inviteBattleLabel:BattleInviteContextMenuLabel;
      
      private var _focusOnUserLabel:ContextMenuLabel;
      
      private var _profileLink:ContextMenuLabel;
      
      private var _labels:Vector.<ContextMenuLabel>;
      
      private var _visibleLabels:Vector.<ContextMenuLabel>;
      
      private var _userId:String;
      
      private var _uid:String;
      
      private var _rank:int;
      
      private var _rankIcon:SmallRankIcon;
      
      private var _hideTimeOut:uint;
      
      private var _setEventTimeOut:uint;
      
      private var _isOver:Boolean;
      
      private var _hasEventListener:Boolean;
      
      private var _isInit:Boolean;
      
      private var _line:Shape;
      
      private var _userInfoUpdater:IUserInfoLabelUpdater;
      
      public function ContextMenu()
      {
         super();
      }
      
      public function show(param1:int, param2:int, param3:String, param4:int, param5:String, param6:Boolean, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:Boolean, param12:Boolean, param13:Boolean, param14:Boolean) : void
      {
         var _loc15_:Boolean = false;
         if(!this._isInit)
         {
            this._isInit = true;
            this.init();
         }
         this.x = param1;
         this.y = param2;
         this._userId = param3;
         this._uid = param5;
         this._rank = param4;
         this._rankIcon.setDefaultAccount(param4);
         this._uidLabel.text = param5;
         this._uidLabel.color = param7 ? uint(ColorConstants.FRIEND_COLOR) : uint(ColorConstants.GREEN_LABEL);
         if(param7)
         {
            this.updateOnlineStatus();
            this._userInfoUpdater = userInfoService.getOrCreateUpdater(this._userId);
         }
         this._onlineLabel.visible = param7;
         this._addToFriendsLabel.visible = param6;
         this._acceptRequestLabel.visible = param8;
         this._rejectRequestLabel.visible = param9;
         this._cancelRequestLabel.visible = param10;
         this._writeInChatLabel.visible = param11;
         if(param14)
         {
            _loc15_ = blockUserService.isBlocked(param3);
            this._blockUserLabel.visible = !_loc15_;
            this._unblockUserLabel.visible = _loc15_;
         }
         else
         {
            this._blockUserLabel.visible = false;
            this._unblockUserLabel.visible = false;
         }
         this._inviteBattleLabel.visible = param12 && battleInviteService.getAvailabilityInviteBattle(param3);
         this._focusOnUserLabel.visible = param13;
         this._visibleLabels.length = 0;
         var _loc16_:int = int(this._labels.length);
         var _loc17_:int = 0;
         while(_loc17_ < _loc16_)
         {
            if(this._labels[_loc17_].visible)
            {
               this._visibleLabels.push(this._labels[_loc17_]);
            }
            _loc17_++;
         }
         this.resize();
         display.noticesLayer.addChild(this);
         clearTimeout(this._hideTimeOut);
         this._hideTimeOut = setTimeout(this.onHideTimeOut,HIDE_DELAY_IN_MSEC);
         clearTimeout(this._setEventTimeOut);
         this._setEventTimeOut = setTimeout(this.setEvent,0);
      }
      
      private function updateOnlineStatus() : void
      {
         var _loc1_:Boolean = onlineNotifierService.hasUserOnlineData(this._userId) && onlineNotifierService.getUserOnlineData(this._userId).online;
         this._onlineLabel.color = _loc1_ ? uint(ColorConstants.CHAT_LABEL) : uint(ColorConstants.ACCESS_LABEL);
         if(_loc1_)
         {
            this._uidLabel.color = ColorConstants.FRIEND_COLOR;
            this._onlineLabel.color = ColorConstants.CHAT_LABEL;
            this._onlineLabel.text = localeService.getText(TextConst.STRING_ONLINE_LABEL);
         }
         else
         {
            this._uidLabel.color = ColorConstants.ACCESS_LABEL;
            this._onlineLabel.color = ColorConstants.ACCESS_LABEL;
            this._onlineLabel.text = localeService.getText(TextConst.STRING_OFFLINE_LABEL);
         }
         this.updateInviteBattleAvailability(_loc1_);
      }
      
      private function updateInviteBattleAvailability(param1:Boolean) : void
      {
         if(param1)
         {
            this._inviteBattleLabel.locked = !battleInfoService.availableRank(this._rank);
         }
         else
         {
            this._inviteBattleLabel.locked = true;
         }
      }
      
      private function init() : void
      {
         tabEnabled = false;
         tabChildren = false;
         this._window = new TankWindow();
         addChild(this._window);
         this._windowInner = new TankWindowInner(0,0,TankWindowInner.GREEN);
         addChild(this._windowInner);
         this._uidLabel = new LabelBase();
         this._uidLabel.mouseEnabled = false;
         addChild(this._uidLabel);
         this._rankIcon = new SmallRankIcon();
         addChild(this._rankIcon);
         this._onlineLabel = new LabelBase();
         addChild(this._onlineLabel);
         this._labels = new Vector.<ContextMenuLabel>();
         this._visibleLabels = new Vector.<ContextMenuLabel>();
         this._addToFriendsLabel = new ContextMenuLabel();
         this._addToFriendsLabel.text = localeService.getText(TextConst.STRING_FRIENDS_ADD);
         addChild(this._addToFriendsLabel);
         this._acceptRequestLabel = new ContextMenuLabel();
         this._acceptRequestLabel.text = localeService.getText(TextConst.STRING_FRIENDS_CONFIRM_REQUEST);
         addChild(this._acceptRequestLabel);
         this._rejectRequestLabel = new ContextMenuLabel();
         this._rejectRequestLabel.text = localeService.getText(TextConst.STRING_FRIENDS_DECLINE_REQUEST);
         addChild(this._rejectRequestLabel);
         this._cancelRequestLabel = new ContextMenuLabel();
         this._cancelRequestLabel.text = localeService.getText(TextConst.STRING_FRIENDS_CANCEL_REQUEST);
         addChild(this._cancelRequestLabel);
         this._copyUidLabel = new ContextMenuLabel();
         this._copyUidLabel.text = localeService.getText(TextConst.STRING_FRIENDS_COPY_NAME);
         addChild(this._copyUidLabel);
         this._writeInChatLabel = new ContextMenuLabel();
         this._writeInChatLabel.text = localeService.getText(TextConst.STRING_FRIENDS_WRITE);
         addChild(this._writeInChatLabel);
         this._blockUserLabel = new ContextMenuLabel();
         this._blockUserLabel.text = localeService.getText(TanksLocale.TEXT_BLOCK_USER_CONTEXT_MENU_LABEL);
         addChild(this._blockUserLabel);
         this._unblockUserLabel = new ContextMenuLabel();
         this._unblockUserLabel.text = localeService.getText(TanksLocale.TEXT_UNBLOCK_USER_CONTEXT_MENU_LABEL);
         addChild(this._unblockUserLabel);
         this._inviteBattleLabel = new BattleInviteContextMenuLabel();
         this._inviteBattleLabel.text = localeService.getText(TextConst.STRING_INVITE_TO_BATTLE_LABEL);
         addChild(this._inviteBattleLabel);
         this._focusOnUserLabel = new ContextMenuLabel();
         this._focusOnUserLabel.text = localeService.getText(TextConst.TEXT_SPECTATE_TEXT);
         addChild(this._focusOnUserLabel);
         this._labels.push(this._writeInChatLabel);
         this._labels.push(this._copyUidLabel);
         this._labels.push(this._addToFriendsLabel);
         this._labels.push(this._acceptRequestLabel);
         this._labels.push(this._rejectRequestLabel);
         this._labels.push(this._cancelRequestLabel);
         this._labels.push(this._inviteBattleLabel);
         this._labels.push(this._blockUserLabel);
         this._labels.push(this._unblockUserLabel);
         this._labels.push(this._focusOnUserLabel);
         this._line = new Shape();
         addChild(this._line);
         this.resize();
         display.stage.addEventListener(MouseEvent.CLICK,this.onContextMenuClickStage);
         display.stage.addEventListener(Event.DEACTIVATE,this.onContextMenuDeactivate);
      }
      
      private function resize() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Number = NaN;
         var _loc3_:ContextMenuLabel = null;
         var _loc4_:int = 0;
         this._rankIcon.x = WINDOW_MARGIN + 7;
         this._rankIcon.y = WINDOW_MARGIN + 8;
         this._uidLabel.x = this._rankIcon.x + this._rankIcon.width;
         this._uidLabel.y = WINDOW_MARGIN + 5;
         this._onlineLabel.x = WINDOW_MARGIN + 5;
         this._onlineLabel.y = this._uidLabel.y + this._uidLabel.height - 1;
         var _loc5_:int = this._uidLabel.x + this._uidLabel.width;
         var _loc6_:int = int(this._visibleLabels.length);
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_)
         {
            _loc3_ = this._visibleLabels[_loc7_];
            _loc3_.x = WINDOW_MARGIN + 5;
            if(_loc7_ == 0)
            {
               _loc3_.y = this._onlineLabel.visible ? Number(59) : Number(42);
            }
            else
            {
               _loc3_.y = this._visibleLabels[_loc7_ - 1].y + 18;
            }
            _loc1_ = _loc3_.y + 18;
            _loc4_ = _loc3_.x + _loc3_.width;
            if(_loc4_ > _loc5_)
            {
               _loc5_ = _loc4_;
            }
            _loc7_++;
         }
         _loc6_ = int(this._labels.length);
         var _loc8_:int = 0;
         while(_loc8_ < _loc6_)
         {
            if(!this._labels[_loc8_].visible)
            {
               this._labels[_loc8_].y = 0;
            }
            _loc8_++;
         }
         this._line.graphics.clear();
         this._line.graphics.beginFill(LINE_COLOR,1);
         if(this._onlineLabel.visible)
         {
            _loc2_ = this._onlineLabel.y + this._onlineLabel.height + 5;
         }
         else
         {
            _loc2_ = this._uidLabel.y + this._uidLabel.height + 4;
         }
         this._line.graphics.drawRect(WINDOW_MARGIN + 7,_loc2_,_loc5_ - WINDOW_MARGIN - 8,1);
         this._line.graphics.endFill();
         this._window.width = _loc5_ + WINDOW_MARGIN + 7;
         this._window.height = _loc1_ + WINDOW_MARGIN + 8;
         this._windowInner.x = WINDOW_MARGIN;
         this._windowInner.y = WINDOW_MARGIN;
         this._windowInner.width = this._window.width - WINDOW_MARGIN * 2;
         this._windowInner.height = this._window.height - WINDOW_MARGIN * 2;
         if(this.x + this._window.width > display.stage.stageWidth)
         {
            this.x = display.stage.stageWidth - this._window.width;
         }
         if(this.y + this._window.height > display.stage.stageHeight)
         {
            this.y = display.stage.stageHeight - this._window.height;
         }
      }
      
      private function onHideTimeOut() : void
      {
         if(!this._isOver)
         {
            this.hide();
         }
      }
      
      private function setEvent() : void
      {
         if(!this._hasEventListener)
         {
            this._hasEventListener = true;
            this._addToFriendsLabel.addEventListener(MouseEvent.CLICK,this.onAddToFriendClick);
            this._acceptRequestLabel.addEventListener(MouseEvent.CLICK,this.onAcceptRequestClick);
            this._rejectRequestLabel.addEventListener(MouseEvent.CLICK,this.onRejectRequestClick);
            this._cancelRequestLabel.addEventListener(MouseEvent.CLICK,this.onCancelRequestClick);
            this._copyUidLabel.addEventListener(MouseEvent.CLICK,this.onCopyUidClick);
            this._writeInChatLabel.addEventListener(MouseEvent.CLICK,this.onWriteInChatClick);
            this._blockUserLabel.addEventListener(MouseEvent.CLICK,this.onBlockUserClick);
            this._unblockUserLabel.addEventListener(MouseEvent.CLICK,this.onUnblockUserClick);
            this._inviteBattleLabel.addEventListener(MouseEvent.CLICK,this.onInvitationToBattleClick);
            this._focusOnUserLabel.addEventListener(MouseEvent.CLICK,this.onFocusOnUserClick);
            if(this._userInfoUpdater != null)
            {
               this._userInfoUpdater.addEventListener(UserInfoLabelUpdaterEvent.CHANGE_ONLINE,this.onChangeOnline);
            }
            this.addEventListener(MouseEvent.ROLL_OVER,this.onRollOver);
            this.addEventListener(MouseEvent.ROLL_OUT,this.onRollOut);
         }
      }
      
      private function onAddToFriendClick(param1:MouseEvent) : void
      {
         contextMenuService.addToFriend(this._userId);
         this.hide();
      }
      
      private function onAcceptRequestClick(param1:MouseEvent) : void
      {
         contextMenuService.acceptRequest(this._userId,this._uid);
         this.hide();
      }
      
      private function onRejectRequestClick(param1:MouseEvent) : void
      {
         contextMenuService.rejectRequest(this._userId,this._uid);
         this.hide();
      }
      
      private function onCancelRequestClick(param1:MouseEvent) : void
      {
         contextMenuService.cancelRequest(this._userId,this._uid);
         this.hide();
      }
      
      private function onProfileLinkClick(param1:MouseEvent) : void
      {
         var _loc2_:URLRequest = new URLRequest(userPropertiesService.getUserProfileUrl(this._uidLabel.text));
         navigateToURL(_loc2_,"_blank");
      }
      
      private function onCopyUidClick(param1:MouseEvent) : void
      {
         System.setClipboard(this._uidLabel.text);
         this.hide();
      }
      
      private function onWriteInChatClick(param1:MouseEvent) : void
      {
         contextMenuService.writeInChat(this._userId,this._uid);
         this.hide();
      }
      
      private function onBlockUserClick(param1:MouseEvent) : void
      {
         blockUserService.blockUser(this._uid);
         this.hide();
      }
      
      private function onUnblockUserClick(param1:MouseEvent) : void
      {
         blockUserService.unblockUser(this._uid);
         this.hide();
      }
      
      private function onInvitationToBattleClick(param1:MouseEvent) : void
      {
         battleInviteService.invite(this._userId);
         this.hide();
      }
      
      private function onFocusOnUserClick(param1:MouseEvent) : void
      {
         contextMenuService.focusOnUser(this._userId,this._uid);
         this.hide();
      }
      
      private function onChangeOnline(param1:UserInfoLabelUpdaterEvent) : void
      {
         this.updateOnlineStatus();
      }
      
      private function onRollOver(param1:MouseEvent) : void
      {
         this._isOver = true;
         clearTimeout(this._hideTimeOut);
      }
      
      private function onRollOut(param1:MouseEvent) : void
      {
         this._isOver = false;
         clearTimeout(this._hideTimeOut);
         this._hideTimeOut = setTimeout(this.onHideTimeOut,HIDE_DELAY_IN_MSEC);
      }
      
      private function onContextMenuClickStage(param1:MouseEvent) : void
      {
         if(!this._hasEventListener || this._isOver)
         {
            return;
         }
         var _loc2_:UserLabel = param1.target as UserLabel;
         if(_loc2_ == null || _loc2_.self)
         {
            this.hide();
         }
      }
      
      private function onContextMenuDeactivate(param1:Event) : void
      {
         this.hide();
      }
      
      private function hide() : void
      {
         this._userInfoUpdater = null;
         clearTimeout(this._hideTimeOut);
         clearTimeout(this._setEventTimeOut);
         if(display.noticesLayer.contains(this))
         {
            display.noticesLayer.removeChild(this);
         }
         this.removeEvents();
      }
      
      private function removeEvents() : void
      {
         if(this._hasEventListener)
         {
            this._hasEventListener = false;
            this._addToFriendsLabel.removeEventListener(MouseEvent.CLICK,this.onAddToFriendClick);
            this._acceptRequestLabel.removeEventListener(MouseEvent.CLICK,this.onAcceptRequestClick);
            this._rejectRequestLabel.removeEventListener(MouseEvent.CLICK,this.onRejectRequestClick);
            this._cancelRequestLabel.removeEventListener(MouseEvent.CLICK,this.onCancelRequestClick);
            this._copyUidLabel.removeEventListener(MouseEvent.CLICK,this.onCopyUidClick);
            this._writeInChatLabel.removeEventListener(MouseEvent.CLICK,this.onWriteInChatClick);
            this._blockUserLabel.removeEventListener(MouseEvent.CLICK,this.onBlockUserClick);
            this._unblockUserLabel.removeEventListener(MouseEvent.CLICK,this.onUnblockUserClick);
            this._inviteBattleLabel.removeEventListener(MouseEvent.CLICK,this.onInvitationToBattleClick);
            this._focusOnUserLabel.removeEventListener(MouseEvent.CLICK,this.onFocusOnUserClick);
            if(this._userInfoUpdater != null)
            {
               this._userInfoUpdater.removeEventListener(UserInfoLabelUpdaterEvent.CHANGE_ONLINE,this.onChangeOnline);
            }
            this.removeEventListener(MouseEvent.ROLL_OVER,this.onRollOver);
            this.removeEventListener(MouseEvent.ROLL_OUT,this.onRollOut);
         }
      }
   }
}

