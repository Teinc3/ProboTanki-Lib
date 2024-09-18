package alternativa.tanks.gui.friends
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.blur.IBlurService;
   import alternativa.tanks.gui.friends.list.AcceptedList;
   import alternativa.tanks.gui.friends.list.IncomingList;
   import alternativa.tanks.gui.friends.list.OutgoingList;
   import alternativa.tanks.locale.constants.TextConst;
   import controls.TankWindow;
   import controls.TankWindowHeader;
   import controls.TankWindowInner;
   import controls.base.LabelBase;
   import controls.base.TankInputBase;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import forms.events.LoginFormEvent;
   import projects.tanks.clients.flash.commons.services.battlelinkactivator.BattleLinkActivatorServiceEvent;
   import projects.tanks.clients.flash.commons.services.battlelinkactivator.IBattleLinkActivatorService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.AlertServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.gui.DialogWindow;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.IDialogWindowsDispatcherService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendActionService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.NewFriendEvent;
   
   public class FriendsWindow extends DialogWindow
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var dialogWindowsDispatcherService:IDialogWindowsDispatcherService;
      
      [Inject]
      public static var battleLinkActivatorService:IBattleLinkActivatorService;
      
      [Inject]
      public static var friendInfoService:IFriendInfoService;
      
      [Inject]
      public static var friendsActionService:IFriendActionService;
      
      [Inject]
      public static var alertService:IAlertService;
      
      [Inject]
      public static var blurService:IBlurService;
      
      public static const WINDOW_MARGIN:int = 12;
      
      public static const DEFAULT_BUTTON_WIDTH:int = 100;
      
      private static const WINDOW_WIDTH:int = 468 + WINDOW_MARGIN * 2 + 4;
      
      private static const WINDOW_HEIGHT:int = 485;
      
      private static const SEARCH_TIMEOUT:int = 600;
      
      private var _window:TankWindow;
      
      private var _windowInner:TankWindowInner;
      
      private var _windowSize:Point;
      
      private var _acceptedButton:FriendStateButton;
      
      private var _outgoingButton:FriendStateButton;
      
      private var _incomingButton:FriendStateButton;
      
      private var _closeButton:FriendWindowButton;
      
      private var _rejectAllIncomingButton:RejectAllIncomingButton;
      
      private var _acceptedList:AcceptedList;
      
      private var _outgoingList:OutgoingList;
      
      private var _incomingList:IncomingList;
      
      private var _currentList:IFriendsListState;
      
      private var _currentState:FriendsWindowState;
      
      private var _searchInListTextInput:TankInputBase;
      
      private var _searchInListLabel:LabelBase;
      
      private var _searchInListTimeOut:uint;
      
      private var _addRequestView:AddRequestView;
      
      public function FriendsWindow()
      {
         super();
         this.init();
      }
      
      private function init() : void
      {
         this._window = new TankWindow();
         addChild(this._window);
         this._window.headerLang = localeService.getText(TextConst.GUI_LANG);
         this._window.header = TankWindowHeader.FRIENDS;
         this._windowSize = new Point(WINDOW_WIDTH,WINDOW_HEIGHT);
         this._windowInner = new TankWindowInner(0,0,TankWindowInner.GREEN);
         addChild(this._windowInner);
         this._acceptedButton = new FriendStateButton();
         addChild(this._acceptedButton);
         this._acceptedButton.type = FriendsWindowState.ACCEPTED;
         this._acceptedButton.label = localeService.getText(TextConst.STRING_FRIENDS);
         this._acceptedButton.addEventListener(MouseEvent.CLICK,this.onChangeState);
         this._outgoingButton = new FriendStateButton();
         addChild(this._outgoingButton);
         this._outgoingButton.type = FriendsWindowState.OUTGOING;
         this._outgoingButton.label = localeService.getText(TextConst.STRING_FRIENDS_SENT_REQUESTS);
         this._outgoingButton.addEventListener(MouseEvent.CLICK,this.onChangeState);
         this._incomingButton = new FriendStateButton();
         addChild(this._incomingButton);
         this._incomingButton.type = FriendsWindowState.INCOMING;
         this._incomingButton.label = localeService.getText(TextConst.STRING_FRIENDS_IN_REQUESTS);
         this._incomingButton.addEventListener(MouseEvent.CLICK,this.onChangeState);
         this._rejectAllIncomingButton = new RejectAllIncomingButton();
         addChild(this._rejectAllIncomingButton);
         this._rejectAllIncomingButton.label = localeService.getText(TextConst.STRING_FRIENDS_DECLINE_ALL_BUTTON);
         this._rejectAllIncomingButton.addEventListener(MouseEvent.CLICK,this.onClickRejectAllIncoming);
         this._acceptedList = new AcceptedList();
         this._outgoingList = new OutgoingList();
         this._incomingList = new IncomingList(this._rejectAllIncomingButton);
         battleLinkActivatorService.addEventListener(BattleLinkActivatorServiceEvent.ACTIVATE_LINK,this.onBattleLinkClick);
         this._closeButton = new FriendWindowButton();
         addChild(this._closeButton);
         this._closeButton.label = localeService.getText(TextConst.STRING_FRIENDS_CLOSE);
         this._searchInListTextInput = new TankInputBase();
         this._searchInListTextInput.maxChars = 20;
         this._searchInListTextInput.restrict = "0-9.a-zA-z_\\-*";
         addChild(this._searchInListTextInput);
         this._searchInListTextInput.addEventListener(FocusEvent.FOCUS_IN,this.onFocusInSearchInList);
         this._searchInListTextInput.addEventListener(FocusEvent.FOCUS_OUT,this.onFocusOutSearchInList);
         this._searchInListTextInput.addEventListener(LoginFormEvent.TEXT_CHANGED,this.onTextChangeSearchInList);
         this._searchInListLabel = new LabelBase();
         addChild(this._searchInListLabel);
         this._searchInListLabel.mouseEnabled = false;
         this._searchInListLabel.color = 10987948;
         this._searchInListLabel.text = localeService.getText(TextConst.STRING_FRIENDS_FIND_IN_LIST_HINT);
         this._addRequestView = new AddRequestView();
         addChild(this._addRequestView);
         display.stage.addEventListener(Event.RESIZE,this.onStageResize);
         this.resize();
      }
      
      private function onClickRejectAllIncoming(param1:MouseEvent) : void
      {
         var _loc2_:String = localeService.getText(TextConst.STRING_FRIENDS_DECLINE_ALL_REQUESTS_ALERT);
         alertService.showAlert(_loc2_,Vector.<String>([localeService.getText(TextConst.ALERT_ANSWER_YES),localeService.getText(TextConst.ALERT_ANSWER_NO)]));
         alertService.addEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onConfirmRejectAllIncoming);
      }
      
      private function onConfirmRejectAllIncoming(param1:AlertServiceEvent) : void
      {
         alertService.removeEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onConfirmRejectAllIncoming);
         if(param1.typeButton == localeService.getText(TextConst.ALERT_ANSWER_YES))
         {
            friendsActionService.rejectAllIncoming();
         }
         else if(param1.typeButton == localeService.getText(TextConst.ALERT_ANSWER_NO) && dialogWindowsDispatcherService.isOpen())
         {
            blurService.blur();
         }
         if(dialogWindowsDispatcherService.isOpen())
         {
            blurService.blur();
         }
      }
      
      private function onTextChangeSearchInList(param1:LoginFormEvent) : void
      {
         if(this._searchInListTextInput.value.length > 0)
         {
            this._searchInListLabel.visible = false;
         }
         clearTimeout(this._searchInListTimeOut);
         this._searchInListTimeOut = setTimeout(this._currentList.filter,SEARCH_TIMEOUT,"uid",this._searchInListTextInput.value);
         this.updateVisibleSearchInListLabel();
      }
      
      private function onFocusInSearchInList(param1:FocusEvent) : void
      {
         this._searchInListLabel.visible = false;
      }
      
      private function onFocusOutSearchInList(param1:FocusEvent) : void
      {
         this.updateVisibleSearchInListLabel();
      }
      
      private function updateVisibleSearchInListLabel() : void
      {
         if(this._searchInListTextInput.value.length == 0 && display.stage.focus != this._searchInListTextInput.textField)
         {
            this._searchInListLabel.visible = true;
         }
      }
      
      private function onBattleLinkClick(param1:BattleLinkActivatorServiceEvent) : void
      {
         this.hide();
      }
      
      private function resize() : void
      {
         this._window.width = this._windowSize.x;
         this._window.height = this._windowSize.y;
         this._acceptedButton.width = DEFAULT_BUTTON_WIDTH;
         this._acceptedButton.x = WINDOW_MARGIN;
         this._acceptedButton.y = WINDOW_MARGIN;
         this._incomingButton.width = DEFAULT_BUTTON_WIDTH;
         this._incomingButton.x = this._windowSize.x - this._incomingButton.width - WINDOW_MARGIN;
         this._incomingButton.y = WINDOW_MARGIN;
         this._outgoingButton.width = DEFAULT_BUTTON_WIDTH;
         this._outgoingButton.x = this._incomingButton.x - this._outgoingButton.width - 6;
         this._outgoingButton.y = WINDOW_MARGIN;
         this._closeButton.width = DEFAULT_BUTTON_WIDTH;
         this._closeButton.x = this._windowSize.x - this._closeButton.width - WINDOW_MARGIN;
         this._closeButton.y = this._windowSize.y - this._closeButton.height - WINDOW_MARGIN;
         this._rejectAllIncomingButton.width = DEFAULT_BUTTON_WIDTH;
         this._rejectAllIncomingButton.x = this._closeButton.x - this._rejectAllIncomingButton.width - 6;
         this._rejectAllIncomingButton.y = this._windowSize.y - this._rejectAllIncomingButton.height - WINDOW_MARGIN;
         this._windowInner.x = WINDOW_MARGIN;
         this._windowInner.y = this._acceptedButton.y + this._acceptedButton.height + 1;
         this._windowInner.width = this._windowSize.x - WINDOW_MARGIN * 2;
         this._windowInner.height = this._windowSize.y - this._windowInner.y - this._closeButton.height - 18;
         var _loc1_:int = this._windowInner.x + 4;
         var _loc2_:int = this._windowInner.y + 4;
         var _loc3_:int = this._windowInner.width - 4 * 2 + 2;
         var _loc4_:int = this._windowInner.height - 4 * 2;
         this._acceptedList.resize(_loc3_,_loc4_);
         this._acceptedList.x = _loc1_;
         this._acceptedList.y = _loc2_;
         this._outgoingList.resize(_loc3_,_loc4_);
         this._outgoingList.x = _loc1_;
         this._outgoingList.y = _loc2_;
         this._incomingList.resize(_loc3_,_loc4_);
         this._incomingList.x = _loc1_;
         this._incomingList.y = _loc2_;
         this._searchInListTextInput.width = 235;
         this._searchInListTextInput.x = WINDOW_MARGIN;
         this._searchInListTextInput.y = this._windowSize.y - this._searchInListTextInput.height - WINDOW_MARGIN;
         this._searchInListLabel.x = this._searchInListTextInput.x + 3;
         this._searchInListLabel.y = this._searchInListTextInput.y + 7;
         this._addRequestView.y = this._windowSize.y - this._addRequestView.height - WINDOW_MARGIN;
      }
      
      private function onChangeState(param1:MouseEvent) : void
      {
         this.show(FriendStateButton(param1.currentTarget).type);
      }
      
      public function destroy() : void
      {
         display.stage.removeEventListener(Event.RESIZE,this.onStageResize);
         this._acceptedButton.removeEventListener(MouseEvent.CLICK,this.onChangeState);
         this._outgoingButton.removeEventListener(MouseEvent.CLICK,this.onChangeState);
         this._incomingButton.removeEventListener(MouseEvent.CLICK,this.onChangeState);
         battleLinkActivatorService.removeEventListener(BattleLinkActivatorServiceEvent.ACTIVATE_LINK,this.onBattleLinkClick);
         this._searchInListTextInput.removeEventListener(FocusEvent.FOCUS_IN,this.onFocusInSearchInList);
         this._searchInListTextInput.removeEventListener(FocusEvent.FOCUS_OUT,this.onFocusOutSearchInList);
         this._rejectAllIncomingButton.removeEventListener(MouseEvent.CLICK,this.onClickRejectAllIncoming);
         this.hide();
      }
      
      private function hide() : void
      {
         dialogService.removeDialog(this);
         if(this._closeButton.hasEventListener(MouseEvent.CLICK))
         {
            this._closeButton.removeEventListener(MouseEvent.CLICK,this.onCloseButtonClick);
         }
         if(this._currentList != null)
         {
            this._currentList.hide();
            this._currentList = null;
         }
         dialogWindowsDispatcherService.close();
         friendInfoService.removeEventListener(NewFriendEvent.ACCEPTED_CHANGE,this.onUpdateAcceptedCounter);
         friendInfoService.removeEventListener(NewFriendEvent.INCOMING_CHANGE,this.onUpdateIncomingCounter);
         clearTimeout(this._searchInListTimeOut);
         this._addRequestView.hide();
      }
      
      public function show(param1:FriendsWindowState) : void
      {
         this.updateAcceptedCounter();
         this.updateIncomingCounter();
         this.updateOutgoingCounter();
         friendInfoService.addEventListener(NewFriendEvent.ACCEPTED_CHANGE,this.onUpdateAcceptedCounter);
         friendInfoService.addEventListener(NewFriendEvent.INCOMING_CHANGE,this.onUpdateIncomingCounter);
         switch(param1)
         {
            case FriendsWindowState.ACCEPTED:
               this.showAccepted();
               break;
            case FriendsWindowState.INCOMING:
               this.showIncoming();
               break;
            case FriendsWindowState.OUTGOING:
               this.showOutgoing();
         }
         this._searchInListTextInput.value = "";
         this._currentList.resetFilter();
      }
      
      private function onUpdateIncomingCounter(param1:NewFriendEvent) : void
      {
         this.updateIncomingCounter();
      }
      
      private function onUpdateAcceptedCounter(param1:NewFriendEvent) : void
      {
         this.updateAcceptedCounter();
      }
      
      private function updateIncomingCounter() : void
      {
         this._incomingButton.setRequestCount(friendInfoService.incomingFriendsLength,friendInfoService.newIncomingFriendsLength);
      }
      
      private function updateAcceptedCounter() : void
      {
         this._acceptedButton.setRequestCount(friendInfoService.acceptedFriendsLength,friendInfoService.newAcceptedFriendsLength);
      }
      
      private function updateOutgoingCounter() : void
      {
         this._outgoingButton.currentRequestCount = friendInfoService.outgoingFriendsLength;
      }
      
      private function showAccepted() : void
      {
         this.updateState(FriendsWindowState.ACCEPTED);
         this._acceptedList.initList();
         addChild(this._acceptedList);
         this._currentList = this._acceptedList;
      }
      
      private function showIncoming() : void
      {
         this.updateState(FriendsWindowState.INCOMING);
         this._incomingList.initList();
         addChild(this._incomingList);
         this._currentList = this._incomingList;
      }
      
      private function showOutgoing() : void
      {
         this.updateState(FriendsWindowState.OUTGOING);
         this._outgoingList.initList();
         addChild(this._outgoingList);
         this._currentList = this._outgoingList;
      }
      
      private function updateState(param1:FriendsWindowState) : void
      {
         this.currentState = param1;
         if(this._currentList != null)
         {
            this._currentList.hide();
            this._currentList = null;
         }
         dialogService.addDialog(this);
         this.onStageResize();
         if(!this._closeButton.hasEventListener(MouseEvent.CLICK))
         {
            this._closeButton.addEventListener(MouseEvent.CLICK,this.onCloseButtonClick);
         }
      }
      
      private function onCloseButtonClick(param1:MouseEvent = null) : void
      {
         this._searchInListTextInput.value = "";
         this.updateVisibleSearchInListLabel();
         this.hide();
      }
      
      private function onStageResize(param1:Event = null) : void
      {
         this.x = display.stage.stageWidth - this._windowSize.x >> 1;
         this.y = display.stage.stageHeight - this._windowSize.y >> 1;
      }
      
      public function get currentState() : FriendsWindowState
      {
         return this._currentState;
      }
      
      public function set currentState(param1:FriendsWindowState) : void
      {
         this._currentState = param1;
         switch(this._currentState)
         {
            case FriendsWindowState.ACCEPTED:
               this._acceptedButton.enable = false;
               this._outgoingButton.enable = true;
               this._incomingButton.enable = true;
               this._rejectAllIncomingButton.visible = false;
               this._searchInListTextInput.visible = true;
               this.updateVisibleSearchInListLabel();
               this._addRequestView.hide();
               break;
            case FriendsWindowState.OUTGOING:
               this._acceptedButton.enable = true;
               this._outgoingButton.enable = false;
               this._incomingButton.enable = true;
               this._rejectAllIncomingButton.visible = false;
               this._searchInListTextInput.visible = false;
               this._searchInListLabel.visible = false;
               this._addRequestView.show();
               break;
            case FriendsWindowState.INCOMING:
               this._acceptedButton.enable = true;
               this._outgoingButton.enable = true;
               this._incomingButton.enable = false;
               this._rejectAllIncomingButton.visible = true;
               this._searchInListTextInput.visible = true;
               this.updateVisibleSearchInListLabel();
               this._addRequestView.hide();
         }
      }
      
      override protected function cancelKeyPressed() : void
      {
         this.onCloseButtonClick();
      }
   }
}

