package services.contextmenu
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.locale.constants.TextConst;
   import flash.events.EventDispatcher;
   import forms.contextmenu.ContextMenu;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.AlertServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.blur.IBlurService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.IDialogWindowsDispatcherService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendActionService;
   
   public class ContextMenuService extends EventDispatcher implements IContextMenuService
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var alertService:IAlertService;
      
      [Inject]
      public static var blurService:IBlurService;
      
      [Inject]
      public static var friendsActionService:IFriendActionService;
      
      [Inject]
      public static var dialogWindowsDispatcherService:IDialogWindowsDispatcherService;
      
      private var _contextMenu:ContextMenu;
      
      private var _removeFromFriendsUserId:String;
      
      private var _removeFromFriendsUid:String;
      
      public function ContextMenuService()
      {
         super();
         this._contextMenu = new ContextMenu();
      }
      
      public function show(param1:int, param2:int, param3:String, param4:int, param5:String, param6:Boolean, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:Boolean, param12:Boolean, param13:Boolean = false, param14:Boolean = true) : void
      {
         this._contextMenu.show(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14);
      }
      
      public function writeInChat(param1:String, param2:String) : void
      {
         dispatchEvent(new ContextMenuServiceEvent(ContextMenuServiceEvent.WRITE_IN_CHAT,param1,param2));
      }
      
      public function removeFromFriends(param1:String, param2:String) : void
      {
         this._removeFromFriendsUserId = param1;
         this._removeFromFriendsUid = param2;
         var _loc3_:String = localeService.getText(TextConst.STRING_FRIENDS_REMOVE_USER).replace("%USERNAME%",param2);
         alertService.showAlert(_loc3_,Vector.<String>([localeService.getText(TextConst.STRING_FRIENDS_YES),localeService.getText(TextConst.STRING_FRIENDS_NO)]));
         alertService.addEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onConfirmRemoveFromFriends);
      }
      
      private function onConfirmRemoveFromFriends(param1:AlertServiceEvent) : void
      {
         alertService.removeEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onConfirmRemoveFromFriends);
         if(param1.typeButton == localeService.getText(TextConst.STRING_FRIENDS_YES))
         {
            friendsActionService.breakItOff(this._removeFromFriendsUserId);
            dispatchEvent(new ContextMenuServiceEvent(ContextMenuServiceEvent.REMOVE_FROM_FRIENDS,this._removeFromFriendsUserId,this._removeFromFriendsUid));
         }
      }
      
      public function rejectRequest(param1:String, param2:String) : void
      {
         friendsActionService.reject(param1);
         dispatchEvent(new ContextMenuServiceEvent(ContextMenuServiceEvent.REJECT_REQUEST,param1,param2));
      }
      
      public function acceptRequest(param1:String, param2:String) : void
      {
         friendsActionService.accept(param1);
         dispatchEvent(new ContextMenuServiceEvent(ContextMenuServiceEvent.ACCEPT_REQUEST,param1,param2));
      }
      
      public function cancelRequest(param1:String, param2:String) : void
      {
         friendsActionService.revoke(param1);
         dispatchEvent(new ContextMenuServiceEvent(ContextMenuServiceEvent.CANCEL_REQUEST,param1,param2));
      }
      
      public function addToFriend(param1:String) : void
      {
         friendsActionService.add(param1);
      }
      
      public function focusOnUser(param1:String, param2:String) : void
      {
         dispatchEvent(new ContextMenuServiceEvent(ContextMenuServiceEvent.FOCUS_ON_USER,param1,param2));
      }
   }
}

