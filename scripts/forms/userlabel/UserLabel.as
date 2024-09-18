package forms.userlabel
{
   import alternativa.osgi.service.display.IDisplay;
   import base.DiscreteSprite;
   import controls.base.LabelBase;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.system.System;
   import forms.ColorConstants;
   import forms.ranks.SmallRankIcon;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.FriendState;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.FriendInfoLabelUpdaterEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendsInfoLabelUpdater;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.premium.PremiumService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoLabelUpdater;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.UserInfoLabelUpdaterEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import services.contextmenu.IContextMenuService;
   
   public class UserLabel extends Sprite
   {
      [Inject]
      public static var userInfoService:IUserInfoService;
      
      [Inject]
      public static var friendInfoService:IFriendInfoService;
      
      [Inject]
      public static var contextMenuService:IContextMenuService;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      [Inject]
      public static var premiumService:PremiumService;
      
      protected static const RANK_ICON_CONT_WIDTH:int = 20;
      
      private static const RANK_ICON_CONT_HEIGHT:int = 18;
      
      protected var shadowContainer:DiscreteSprite;
      
      protected var _userId:String;
      
      protected var _uid:String;
      
      protected var _rank:int;
      
      protected var _friendState:FriendState;
      
      protected var _friendInfoUpdater:IFriendsInfoLabelUpdater;
      
      protected var _userInfoUpdater:IUserInfoLabelUpdater;
      
      protected var _uidLabel:LabelBase;
      
      protected var _writeInChat:Boolean;
      
      protected var _blockUserEnable:Boolean;
      
      protected var _forciblySubscribeFriend:Boolean;
      
      protected var _isInitRank:Boolean;
      
      protected var _isInitUid:Boolean;
      
      protected var _focusOnUserEnabled:Boolean;
      
      protected var _hasPremium:Boolean;
      
      private var _inviteBattleEnable:Boolean;
      
      private var _rankIcon:SmallRankIcon;
      
      private var _online:Boolean;
      
      private var _serverNumber:int;
      
      private var _self:Boolean;
      
      private var _lastUidColor:uint;
      
      private var _ignoreFriendsColor:Boolean;
      
      private var _additionalText:String = "";
      
      public function UserLabel(param1:String)
      {
         this.shadowContainer = new DiscreteSprite();
         super();
         if(param1 == null)
         {
            throw Error("UserLabel userId is NULL");
         }
         this._userId = param1;
         this.init();
      }
      
      protected function getShadowFilters() : Array
      {
         return null;
      }
      
      private function init() : void
      {
         mouseChildren = false;
         mouseEnabled = true;
         tabEnabled = false;
         tabChildren = false;
         addChild(this.shadowContainer);
         this.shadowContainer.filters = this.getShadowFilters();
         this._lastUidColor = ColorConstants.GREEN_LABEL;
         this._self = userPropertiesService.userId == this._userId;
         if(!this._self)
         {
            buttonMode = useHandCursor = true;
         }
         this.createRankIcon();
         this.createAdditionalIcons();
         this.createUidLabel();
         userInfoService.forciblySubscribe(this._userId);
         this._userInfoUpdater = userInfoService.getOrCreateUpdater(this._userId);
         this._friendInfoUpdater = friendInfoService.getOrCreateUpdater(this._userId);
         this.updateProperties();
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
      
      protected function createAdditionalIcons() : void
      {
      }
      
      protected function updateProperties() : void
      {
         if(this._userInfoUpdater.hasData())
         {
            this.setRank(this._userInfoUpdater.rank);
            this.setUid(this._userInfoUpdater.uid);
            this.updateStatusOnline();
         }
         this.setFriendState(this._friendInfoUpdater.state);
      }
      
      protected function getAdditionalIconsWidth() : Number
      {
         return 0;
      }
      
      protected function createUidLabel() : void
      {
         this._uidLabel = new LabelBase();
         this._uidLabel.x = RANK_ICON_CONT_WIDTH - 2 + this.getAdditionalIconsWidth();
         this.shadowContainer.addChild(this._uidLabel);
         this._uidLabel.visible = false;
      }
      
      private function createRankIcon() : void
      {
         var _loc1_:Sprite = new Sprite();
         _loc1_.graphics.clear();
         _loc1_.graphics.beginFill(65535,0);
         _loc1_.graphics.drawRect(0,0,RANK_ICON_CONT_WIDTH,RANK_ICON_CONT_HEIGHT);
         _loc1_.graphics.endFill();
         this._rankIcon = new SmallRankIcon();
         _loc1_.addChild(this._rankIcon);
         this.shadowContainer.addChild(_loc1_);
         this._rankIcon.visible = false;
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemoveFromStage);
         this.setEvent();
         this._userInfoUpdater.incrementVisibleLabelsCounter();
         this._friendInfoUpdater.incrementVisibleLabelsCounter();
      }
      
      private function onRemoveFromStage(param1:Event) : void
      {
         removeEventListener(Event.REMOVED_FROM_STAGE,this.onRemoveFromStage);
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         this.removeEvent();
         this._userInfoUpdater.decrementVisibleLabelsCounter();
         this._friendInfoUpdater.decrementVisibleLabelsCounter();
      }
      
      private function setEvent() : void
      {
         if(!this.hasEventListener(MouseEvent.CLICK))
         {
            this.addEventListener(MouseEvent.CLICK,this.onMouseClick);
         }
         this._userInfoUpdater.addEventListener(UserInfoLabelUpdaterEvent.CHANGE_ONLINE,this.onChangeOnline,false,0,true);
         this._userInfoUpdater.addEventListener(UserInfoLabelUpdaterEvent.CHANGE_UID,this.onChangeUid,false,0,true);
         this._userInfoUpdater.addEventListener(UserInfoLabelUpdaterEvent.CHANGE_RANK,this.onChangeRank,false,0,true);
         this._userInfoUpdater.addEventListener(UserInfoLabelUpdaterEvent.CHANGE_PREMIUM_STATUS,this.onChangePremiumStatus,false,0,true);
         premiumService.addEventListener(Event.CHANGE,this.onChangePremiumStatus);
         this._friendInfoUpdater.addEventListener(FriendInfoLabelUpdaterEvent.CHANGE_STATE,this.onChangeFriendState,false,0,true);
      }
      
      private function removeEvent() : void
      {
         if(this.hasEventListener(MouseEvent.CLICK))
         {
            this.removeEventListener(MouseEvent.CLICK,this.onMouseClick);
         }
         this._userInfoUpdater.removeEventListener(UserInfoLabelUpdaterEvent.CHANGE_ONLINE,this.onChangeOnline);
         this._userInfoUpdater.removeEventListener(UserInfoLabelUpdaterEvent.CHANGE_UID,this.onChangeUid);
         this._userInfoUpdater.removeEventListener(UserInfoLabelUpdaterEvent.CHANGE_RANK,this.onChangeRank);
         this._userInfoUpdater.removeEventListener(UserInfoLabelUpdaterEvent.CHANGE_PREMIUM_STATUS,this.onChangePremiumStatus);
         premiumService.removeEventListener(Event.CHANGE,this.onChangePremiumStatus);
         this._friendInfoUpdater.removeEventListener(FriendInfoLabelUpdaterEvent.CHANGE_STATE,this.onChangeFriendState);
      }
      
      protected function onMouseClick(param1:MouseEvent) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = false;
         if(userPropertiesService.userId == this._userId)
         {
            return;
         }
         if(!this._isInitRank || !this._isInitUid)
         {
            return;
         }
         if(param1.ctrlKey)
         {
            System.setClipboard(this._uid);
         }
         else
         {
            switch(this._friendState)
            {
               case FriendState.ACCEPTED:
                  _loc3_ = true;
                  break;
               case FriendState.INCOMING:
                  _loc4_ = true;
                  _loc5_ = true;
                  break;
               case FriendState.OUTGOING:
                  _loc6_ = true;
                  break;
               default:
                  _loc2_ = true;
            }
            contextMenuService.show(display.stage.mouseX,display.stage.mouseY,this._userId,this._rank,this._uid,_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,this._writeInChat,this._inviteBattleEnable,this._focusOnUserEnabled,this._blockUserEnable);
         }
      }
      
      private function onChangeOnline(param1:UserInfoLabelUpdaterEvent) : void
      {
         this.updateStatusOnline();
      }
      
      private function updateStatusOnline() : void
      {
         this._online = this._userInfoUpdater.online;
         this._serverNumber = 1;
      }
      
      private function onChangeUid(param1:UserInfoLabelUpdaterEvent) : void
      {
         this.setUid(this._userInfoUpdater.uid);
      }
      
      protected function setUid(param1:String) : void
      {
         if(!this._isInitUid)
         {
            this._isInitUid = true;
            this._uidLabel.visible = true;
         }
         this._uid = param1;
         var _loc2_:String = this._uid + this._additionalText;
         if(this._uidLabel.text == _loc2_)
         {
            return;
         }
         this._uidLabel.text = _loc2_;
         dispatchEvent(new ChatUpdateEvent(ChatUpdateEvent.UPDATE,true));
      }
      
      public function setAdditionalText(param1:String) : void
      {
         this._additionalText = param1;
         this.setUid(this._uid);
      }
      
      private function onChangeRank(param1:UserInfoLabelUpdaterEvent) : void
      {
         this.setRank(this._userInfoUpdater.rank);
      }
      
      private function onChangePremiumStatus(param1:Event = null) : void
      {
         this.updateProperties();
      }
      
      protected function setRank(param1:int) : void
      {
         this._rank = param1;
         this.updateStatusPremium();
         if(!this._isInitRank)
         {
            this._isInitRank = true;
            this._rankIcon.init(this._hasPremium,this._rank);
            this._rankIcon.visible = true;
         }
         else if(this._hasPremium)
         {
            this._rankIcon.setPremium(this._rank);
         }
         else
         {
            this._rankIcon.setRank(this._rank);
         }
         this.alignRankIcon();
      }
      
      protected function updateStatusPremium() : void
      {
         if(this._self)
         {
            this._hasPremium = premiumService.hasPremium();
         }
         else
         {
            this._hasPremium = this._userInfoUpdater.hasPremium();
         }
      }
      
      private function alignRankIcon() : void
      {
         this._rankIcon.x = RANK_ICON_CONT_WIDTH - this._rankIcon.width >> 1;
         this._rankIcon.y = RANK_ICON_CONT_HEIGHT - this._rankIcon.height >> 1;
      }
      
      private function onChangeFriendState(param1:FriendInfoLabelUpdaterEvent) : void
      {
         this.setFriendState(this._friendInfoUpdater.state);
      }
      
      protected function setFriendState(param1:FriendState) : void
      {
         this._friendState = param1;
         this.refreshFriendState();
      }
      
      protected function refreshFriendState() : void
      {
         if(!this._ignoreFriendsColor)
         {
            if(this._friendState == FriendState.ACCEPTED)
            {
               this._uidLabel.color = ColorConstants.FRIEND_COLOR;
               return;
            }
            this._uidLabel.color = this._lastUidColor;
         }
      }
      
      public function setUidColor(param1:uint, param2:Boolean = false) : void
      {
         this._lastUidColor = param1;
         this._ignoreFriendsColor = param2;
         this._uidLabel.color = param1;
         this.refreshFriendState();
      }
      
      public function get online() : Boolean
      {
         return this._online;
      }
      
      public function get serverNumber() : int
      {
         return this._serverNumber;
      }
      
      public function get userRank() : int
      {
         return this._rank;
      }
      
      public function get self() : Boolean
      {
         return this._self;
      }
      
      public function get uid() : String
      {
         return this._uid;
      }
      
      public function get userId() : String
      {
         return this._userId;
      }
      
      public function get inviteBattleEnable() : Boolean
      {
         return this._inviteBattleEnable;
      }
      
      public function set inviteBattleEnable(param1:Boolean) : void
      {
         this._inviteBattleEnable = param1;
      }
      
      public function get premium() : Boolean
      {
         return this._hasPremium;
      }
      
      public function set premium(param1:Boolean) : void
      {
         this._hasPremium = param1;
         this.updateProperties();
      }
   }
}

