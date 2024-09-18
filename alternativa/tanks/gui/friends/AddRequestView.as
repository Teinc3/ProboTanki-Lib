package alternativa.tanks.gui.friends
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.blur.IBlurService;
   import alternativa.tanks.locale.constants.TextConst;
   import alternativa.tanks.view.forms.primitives.ValidationIcon;
   import controls.base.LabelBase;
   import controls.base.TankInputBase;
   import flash.display.Sprite;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.ui.Keyboard;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import forms.events.LoginFormEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.AlertServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.IDialogWindowsDispatcherService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.FriendActionServiceUidEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendActionService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   
   public class AddRequestView extends Sprite
   {
      [Inject]
      public static var friendsActionService:IFriendActionService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var alertService:IAlertService;
      
      [Inject]
      public static var dialogWindowsDispatcherService:IDialogWindowsDispatcherService;
      
      [Inject]
      public static var blurService:IBlurService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      private static const SEARCH_TIMEOUT:int = 600;
      
      private var _searchFriendTextInput:TankInputBase;
      
      private var _searchFriendLabel:LabelBase;
      
      private var _addRequestButton:FriendWindowButton;
      
      private var _validateCheckUidIcon:ValidationIcon;
      
      private var _searchFriendTimeOut:uint;
      
      private var _searchFriendUid:String;
      
      private var _searchFriendExist:Boolean;
      
      private var _searchUserId:String;
      
      public function AddRequestView()
      {
         super();
         this.init();
      }
      
      private function init() : void
      {
         this._searchFriendTextInput = new TankInputBase();
         this._searchFriendTextInput.maxChars = 20;
         this._searchFriendTextInput.restrict = "0-9.a-zA-z_\\-*";
         addChild(this._searchFriendTextInput);
         this._searchFriendLabel = new LabelBase();
         addChild(this._searchFriendLabel);
         this._searchFriendLabel.mouseEnabled = false;
         this._searchFriendLabel.color = 10987948;
         this._searchFriendLabel.text = localeService.getText(TextConst.STRING_FRIENDS_FIND_TO_SEND);
         this._validateCheckUidIcon = new ValidationIcon();
         addChild(this._validateCheckUidIcon);
         this._addRequestButton = new FriendWindowButton();
         addChild(this._addRequestButton);
         this._addRequestButton.label = localeService.getText(TextConst.STRING_FRIENDS_SEND_REQUEST_BUTTON);
         this._addRequestButton.enable = false;
         this.resize();
      }
      
      public function resize() : void
      {
         this._searchFriendTextInput.width = 235;
         this._searchFriendTextInput.x = FriendsWindow.WINDOW_MARGIN;
         this._searchFriendLabel.x = this._searchFriendTextInput.x + 3;
         this._searchFriendLabel.y = this._searchFriendTextInput.y + 7;
         this._validateCheckUidIcon.x = this._searchFriendTextInput.x + this._searchFriendTextInput.width - this._validateCheckUidIcon.width - 15;
         this._validateCheckUidIcon.y = this._searchFriendTextInput.y + 7;
         this._addRequestButton.width = FriendsWindow.DEFAULT_BUTTON_WIDTH;
         this._addRequestButton.x = this._searchFriendTextInput.width + 8;
      }
      
      public function hide() : void
      {
         clearTimeout(this._searchFriendTimeOut);
         this.removeEvents();
         this.clearSearchFriendTextInput();
         this.visible = false;
      }
      
      private function removeEvents() : void
      {
         this._addRequestButton.removeEventListener(MouseEvent.CLICK,this.onClickAddRequestButton);
         this._searchFriendTextInput.removeEventListener(FocusEvent.FOCUS_IN,this.onFocusInSearchFriend);
         this._searchFriendTextInput.removeEventListener(FocusEvent.FOCUS_OUT,this.onFocusOutSearchFriend);
         this._searchFriendTextInput.removeEventListener(LoginFormEvent.TEXT_CHANGED,this.onSearchFriendTextChange);
         this._searchFriendTextInput.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         friendsActionService.removeEventListener(FriendActionServiceUidEvent.UID_EXIST,this.onUidExist);
         friendsActionService.removeEventListener(FriendActionServiceUidEvent.UID_NOT_EXIST,this.onUidNotExist);
         friendsActionService.removeEventListener(FriendActionServiceUidEvent.ALREADY_IN_ACCEPTED_FRIENDS,this.onAlreadyInAcceptedFriends);
         friendsActionService.removeEventListener(FriendActionServiceUidEvent.ALREADY_IN_OUTGOING_FRIENDS,this.onAlreadyInOutgoingFriends);
         friendsActionService.removeEventListener(FriendActionServiceUidEvent.ALREADY_IN_INCOMING_FRIENDS,this.onAlreadyInIncomingFriends);
      }
      
      public function show() : void
      {
         this.visible = true;
         this.setEvents();
         this._searchFriendTextInput.value = "";
         this.updateVisibleSearchFriendLabel();
      }
      
      private function setEvents() : void
      {
         this._addRequestButton.addEventListener(MouseEvent.CLICK,this.onClickAddRequestButton);
         this._searchFriendTextInput.addEventListener(FocusEvent.FOCUS_IN,this.onFocusInSearchFriend);
         this._searchFriendTextInput.addEventListener(FocusEvent.FOCUS_OUT,this.onFocusOutSearchFriend);
         this._searchFriendTextInput.addEventListener(LoginFormEvent.TEXT_CHANGED,this.onSearchFriendTextChange);
         this._searchFriendTextInput.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         friendsActionService.addEventListener(FriendActionServiceUidEvent.UID_EXIST,this.onUidExist);
         friendsActionService.addEventListener(FriendActionServiceUidEvent.UID_NOT_EXIST,this.onUidNotExist);
         friendsActionService.addEventListener(FriendActionServiceUidEvent.ALREADY_IN_ACCEPTED_FRIENDS,this.onAlreadyInAcceptedFriends);
         friendsActionService.addEventListener(FriendActionServiceUidEvent.ALREADY_IN_OUTGOING_FRIENDS,this.onAlreadyInOutgoingFriends);
         friendsActionService.addEventListener(FriendActionServiceUidEvent.ALREADY_IN_INCOMING_FRIENDS,this.onAlreadyInIncomingFriends);
      }
      
      private function onClickAddRequestButton(param1:MouseEvent) : void
      {
         this.addRequest();
      }
      
      private function addRequest() : void
      {
         if(this._searchFriendExist && this._searchFriendUid != null)
         {
            friendsActionService.addByUid(this._searchFriendUid);
            this.clearSearchFriendTextInput();
         }
      }
      
      private function clearSearchFriendTextInput() : void
      {
         this._searchFriendTextInput.value = "";
         this._addRequestButton.enable = false;
         this._validateCheckUidIcon.turnOff();
         this._searchFriendExist = false;
         this._searchFriendUid = null;
      }
      
      private function onFocusInSearchFriend(param1:FocusEvent) : void
      {
         this._searchFriendLabel.visible = false;
      }
      
      private function onFocusOutSearchFriend(param1:FocusEvent) : void
      {
         this.updateVisibleSearchFriendLabel();
      }
      
      private function updateVisibleSearchFriendLabel() : void
      {
         if(this._searchFriendTextInput.value.length == 0)
         {
            this._searchFriendLabel.visible = true;
            this._validateCheckUidIcon.turnOff();
            this._searchFriendTextInput.validValue = true;
         }
      }
      
      private function onSearchFriendTextChange(param1:LoginFormEvent) : void
      {
         this._searchFriendExist = false;
         this._addRequestButton.enable = false;
         this._validateCheckUidIcon.startProgress();
         this._validateCheckUidIcon.y = this._searchFriendTextInput.y + 5;
         if(this._searchFriendTextInput.value.length > 0)
         {
            this._searchFriendLabel.visible = false;
         }
         clearTimeout(this._searchFriendTimeOut);
         this._searchFriendTimeOut = setTimeout(this.searchFriendTextChange,SEARCH_TIMEOUT);
      }
      
      private function searchFriendTextChange() : void
      {
         if(this._searchFriendTextInput.value.length == 0)
         {
            this._validateCheckUidIcon.turnOff();
            this._searchFriendTextInput.validValue = true;
         }
         else
         {
            this._searchFriendUid = this._searchFriendTextInput.value;
            friendsActionService.checkUid(this._searchFriendUid);
         }
      }
      
      private function onKeyDown(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.ENTER)
         {
            this.addRequest();
         }
      }
      
      private function onUidExist(param1:FriendActionServiceUidEvent) : void
      {
         this._searchFriendTextInput.validValue = true;
         this._validateCheckUidIcon.markAsValid();
         this._validateCheckUidIcon.y = this._searchFriendTextInput.y + 7;
         if(userPropertiesService.userName.toLowerCase() != this._searchFriendUid.toLowerCase())
         {
            this._searchFriendExist = true;
            this._addRequestButton.enable = true;
         }
      }
      
      private function onUidNotExist(param1:FriendActionServiceUidEvent) : void
      {
         this._searchFriendUid = null;
         this._searchFriendTextInput.validValue = false;
         this._validateCheckUidIcon.markAsInvalid();
         this._validateCheckUidIcon.y = this._searchFriendTextInput.y + 7;
         this._addRequestButton.enable = false;
      }
      
      private function onAlreadyInAcceptedFriends(param1:FriendActionServiceUidEvent) : void
      {
         var _loc2_:String = localeService.getText(TextConst.STRING_FRIENDS_PLAYER_ALREADY_IN_LIST_ALERT).replace("%USERNAME%",param1.uid);
         alertService.showAlert(_loc2_,Vector.<String>([localeService.getText(TextConst.ALERT_ANSWER_OK)]));
         alertService.addEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onAlreadyInAcceptedFriendsAlertClick);
      }
      
      private function onAlreadyInAcceptedFriendsAlertClick(param1:AlertServiceEvent) : void
      {
         alertService.removeEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onAlreadyInAcceptedFriendsAlertClick);
         if(dialogWindowsDispatcherService.isOpen())
         {
            blurService.blur();
         }
      }
      
      private function onAlreadyInOutgoingFriends(param1:FriendActionServiceUidEvent) : void
      {
         var _loc2_:String = localeService.getText(TextConst.STRING_FRIENDS_REQUEST_EXIST_ALERT).replace("%USERNAME%",param1.uid);
         alertService.showAlert(_loc2_,Vector.<String>([localeService.getText(TextConst.ALERT_ANSWER_OK)]));
         alertService.addEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onAlreadyInOutgoingFriendsAlertClick);
      }
      
      private function onAlreadyInOutgoingFriendsAlertClick(param1:AlertServiceEvent) : void
      {
         alertService.removeEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onAlreadyInOutgoingFriendsAlertClick);
         if(dialogWindowsDispatcherService.isOpen())
         {
            blurService.blur();
         }
      }
      
      private function onAlreadyInIncomingFriends(param1:FriendActionServiceUidEvent) : void
      {
         this._searchUserId = param1.userId;
         var _loc2_:String = localeService.getText(TextConst.STRING_FRIENDS_ALREADY_HAVE_INCOMING).replace("%USERNAME%",param1.uid);
         alertService.showAlert(_loc2_,Vector.<String>([localeService.getText(TextConst.STRING_FRIENDS_YES),localeService.getText(TextConst.STRING_FRIENDS_CANCEL_BUTTON_TEXT)]));
         alertService.addEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onAlreadyInIncomingFriendsAlertConfirm);
      }
      
      private function onAlreadyInIncomingFriendsAlertConfirm(param1:AlertServiceEvent) : void
      {
         alertService.removeEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onAlreadyInIncomingFriendsAlertConfirm);
         if(param1.typeButton == localeService.getText(TextConst.STRING_FRIENDS_YES))
         {
            friendsActionService.accept(this._searchUserId);
         }
         if(dialogWindowsDispatcherService.isOpen())
         {
            blurService.blur();
         }
      }
   }
}

