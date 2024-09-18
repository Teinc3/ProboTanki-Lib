package alternativa.tanks.model.friends.battleinvite
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.blur.IBlurService;
   import alternativa.tanks.gui.friends.battleinvite.BattleInviteNotification;
   import alternativa.tanks.gui.friends.battleinvite.ResponseBattleInviteNotification;
   import alternativa.tanks.locale.constants.TextConst;
   import flash.utils.Dictionary;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.fp10.core.resource.types.SoundResource;
   import projects.tanks.client.commons.models.layout.LayoutState;
   import projects.tanks.client.panel.model.battleinvite.BattleInviteMessage;
   import projects.tanks.client.panel.model.battleinvite.§class set function§;
   import projects.tanks.client.panel.model.battleinvite.§default package override§;
   import projects.tanks.clients.flash.commons.services.battlelinkactivator.BattleLinkActivatorServiceEvent;
   import projects.tanks.clients.flash.commons.services.battlelinkactivator.BattleLinkAliveEvent;
   import projects.tanks.clients.flash.commons.services.battlelinkactivator.IBattleLinkActivatorService;
   import projects.tanks.clients.flash.commons.services.notification.INotificationService;
   import projects.tanks.clients.flash.commons.services.notification.sound.INotificationSoundService;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.FriendState;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.AlertServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.IDialogWindowsDispatcherService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.FriendStateChangeEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.battleinvite.BattleInviteServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.battleinvite.IBattleInviteService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoLabelUpdater;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoService;
   import services.alertservice.§get const use§;
   
   public class BattleInviteModel extends §default package override§ implements §class set function§, ObjectLoadListener, ObjectUnloadListener
   {
      [Inject]
      public static var battleInviteService:IBattleInviteService;
      
      [Inject]
      public static var notificationService:INotificationService;
      
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      [Inject]
      public static var battleLinkActivatorService:IBattleLinkActivatorService;
      
      [Inject]
      public static var alertService:IAlertService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      [Inject]
      public static var userInfoService:IUserInfoService;
      
      [Inject]
      public static var blurService:IBlurService;
      
      [Inject]
      public static var dialogWindowsDispatcherService:IDialogWindowsDispatcherService;
      
      [Inject]
      public static var friendInfoService:IFriendInfoService;
      
      [Inject]
      public static var §import for for§:INotificationSoundService;
      
      private var inviteList:Dictionary;
      
      private var userId:String;
      
      private var battleId:String;
      
      private var battleUrl:String;
      
      private var isRemoteBattleUrl:Boolean;
      
      private var inviteUserId:String;
      
      public function BattleInviteModel()
      {
         super();
      }
      
      private static function addNotificationAlreadyInvite(param1:String) : void
      {
         var _loc2_:String = localeService.getText(TextConst.STRING_IS_CONSIDERING_YOUR_INVITE_LABEL);
         if(!notificationService.hasNotification(param1,_loc2_))
         {
            notificationService.addNotification(new ResponseBattleInviteNotification(param1,_loc2_));
         }
      }
      
      private static function createInviteBattleMessage(param1:BattleInviteMessage) : String
      {
         var _loc2_:* = localeService.getText(TextConst.STRING_INVITES_YOU_TO_A_BATTLE_LABEL) + "\n";
         if(param1.availableRank)
         {
            if(param1.availableSlot)
            {
               _loc2_ += "\n" + localeService.getText(TextConst.STRING_THERE_ARE_PLACES_AVAILABLE_LABEL);
            }
            else
            {
               _loc2_ += "\n" + setGreyColor(localeService.getText(TextConst.STRING_NO_PLACES_AVAILABLE_LABEL));
            }
         }
         else
         {
            _loc2_ += "\n" + setGreyColor(localeService.getText(TextConst.STRING_BATTLE_IS_UNAVAILABLE_AT_YOUR_RANK_LABEL));
         }
         return _loc2_;
      }
      
      private static function createMapAndServerNumberString(param1:BattleInviteMessage) : String
      {
         var _loc2_:String = param1.serverNumber + " " + localeService.getText(TextConst.STRING_SERVER_LABEL);
         if(localeService.language == "en" || localeService.language == "de")
         {
            _loc2_ = localeService.getText(TextConst.STRING_SERVER_LABEL) + " " + param1.serverNumber;
         }
         return param1.mapName + " " + param1.mode.name + " (" + _loc2_ + ")";
      }
      
      private static function setGreyColor(param1:String) : String
      {
         return "<font color=\'#" + "b1b1b1" + "\'>" + param1 + "</font>";
      }
      
      private static function addNotificationBattleNotFound(param1:String) : void
      {
         notificationService.addNotification(new ResponseBattleInviteNotification(param1,localeService.getText(TextConst.STRING_BATTLE_CANNOT_BE_FOUND_LABEL)));
      }
      
      public function objectLoaded() : void
      {
         this.inviteList = new Dictionary();
         var _loc1_:SoundResource = getInitParam().§in package case§;
         if(_loc1_ != null && _loc1_.isLoaded)
         {
            §import for for§.notificationSound = getInitParam().§in package case§.sound;
         }
         battleInviteService.addEventListener(BattleInviteServiceEvent.INVITE,this.onBattleInvite);
         battleInviteService.addEventListener(BattleInviteServiceEvent.ACCEPT,this.onAccept);
         battleInviteService.addEventListener(BattleInviteServiceEvent.REJECT,this.onReject);
         battleLinkActivatorService.addEventListener(BattleLinkAliveEvent.ALIVE,this.onAlive);
         battleLinkActivatorService.addEventListener(BattleLinkAliveEvent.DEAD,this.onDead);
         friendInfoService.addEventListener(FriendStateChangeEvent.CHANGE,this.onChangeFriendState);
      }
      
      private function onBattleInvite(param1:BattleInviteServiceEvent) : void
      {
         var _loc2_:IUserInfoLabelUpdater = null;
         this.inviteUserId = param1.userId;
         if(this.inviteUserId in this.inviteList)
         {
            addNotificationAlreadyInvite(this.inviteUserId);
         }
         else if(battleInfoService.hasCurrentSelectionBattleId())
         {
            _loc2_ = userInfoService.getOrCreateUpdater(this.inviteUserId);
            if(battleInfoService.availableRank(_loc2_.rank))
            {
               this.sendInviteToServer();
            }
            else
            {
               alertService.showAlert(localeService.getText(TextConst.STRING_ALERT_INVITE_TO_BATTLE_IS_UNAVAILABLE_RANK),Vector.<String>([localeService.getText(§get const use§.YES),localeService.getText(§get const use§.NO)]));
               alertService.addEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onBattleInviteAlertClick);
            }
         }
         else
         {
            addNotificationBattleNotFound(this.inviteUserId);
         }
      }
      
      private function sendInviteToServer() : void
      {
         this.inviteList[this.inviteUserId] = true;
         server.invite(this.inviteUserId,battleInfoService.currentSelectionBattleId);
         this.inviteUserId = null;
      }
      
      private function onBattleInviteAlertClick(param1:AlertServiceEvent) : void
      {
         alertService.removeEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onBattleInviteAlertClick);
         if(param1.typeButton == localeService.getText(§get const use§.YES))
         {
            this.sendInviteToServer();
         }
         else if(param1.typeButton == localeService.getText(§get const use§.NO) && dialogWindowsDispatcherService.isOpen())
         {
            blurService.blur();
         }
      }
      
      private function onAccept(param1:BattleInviteServiceEvent) : void
      {
         this.userId = param1.userId;
         this.battleId = param1.battleId;
         this.battleUrl = param1.battleUrl;
         this.isRemoteBattleUrl = param1.isRemoteBattleUrl;
         battleLinkActivatorService.isAlive(param1.battleId);
      }
      
      private function onAlive(param1:BattleLinkAliveEvent) : void
      {
         if(this.battleId != param1.battleId)
         {
            return;
         }
         if(lobbyLayoutService.getCurrentState() == LayoutState.BATTLE && !battleInfoService.spectator)
         {
            battleLinkActivatorService.addEventListener(BattleLinkActivatorServiceEvent.CONFIRMED_NAVIGATE,this.onConfirmedNavigate);
            battleLinkActivatorService.addEventListener(BattleLinkActivatorServiceEvent.NOT_CONFIRMED_NAVIGATE,this.onNotConfirmedNavigate);
         }
         else
         {
            server.accept(this.userId);
         }
         battleLinkActivatorService.navigateToBattleUrlWithoutAvailableBattle(this.battleUrl,this.isRemoteBattleUrl);
      }
      
      private function onConfirmedNavigate(param1:BattleLinkActivatorServiceEvent) : void
      {
         this.removeConfirmedNavigateEvent();
         server.accept(this.userId);
      }
      
      private function removeConfirmedNavigateEvent() : void
      {
         battleLinkActivatorService.removeEventListener(BattleLinkActivatorServiceEvent.CONFIRMED_NAVIGATE,this.onConfirmedNavigate);
         battleLinkActivatorService.removeEventListener(BattleLinkActivatorServiceEvent.NOT_CONFIRMED_NAVIGATE,this.onNotConfirmedNavigate);
      }
      
      private function onNotConfirmedNavigate(param1:BattleLinkActivatorServiceEvent) : void
      {
         this.removeConfirmedNavigateEvent();
         server.reject(this.userId);
      }
      
      private function onDead(param1:BattleLinkAliveEvent) : void
      {
         if(this.battleId != param1.battleId)
         {
            return;
         }
         alertService.showAlert(localeService.getText(TextConst.STRING_BATTLE_CANNOT_BE_FOUND_ALERT),Vector.<String>([localeService.getText(§get const use§.OK)]));
         server.reject(this.userId);
      }
      
      private function onReject(param1:BattleInviteServiceEvent) : void
      {
         server.reject(param1.userId);
      }
      
      public function objectUnloaded() : void
      {
         battleInviteService.removeEventListener(BattleInviteServiceEvent.INVITE,this.onBattleInvite);
         battleInviteService.removeEventListener(BattleInviteServiceEvent.ACCEPT,this.onAccept);
         battleInviteService.removeEventListener(BattleInviteServiceEvent.REJECT,this.onReject);
         battleLinkActivatorService.removeEventListener(BattleLinkAliveEvent.ALIVE,this.onAlive);
         battleLinkActivatorService.removeEventListener(BattleLinkAliveEvent.DEAD,this.onDead);
         friendInfoService.removeEventListener(FriendStateChangeEvent.CHANGE,this.onChangeFriendState);
      }
      
      public function notify(param1:String, param2:BattleInviteMessage) : void
      {
         var _loc3_:String = null;
         notificationService.addNotification(new BattleInviteNotification(param1,createInviteBattleMessage(param2),param2.battleId,param2.battleId,param2.remote,createMapAndServerNumberString(param2),param2.noSuppliesBattle));
      }
      
      private function onChangeFriendState(param1:FriendStateChangeEvent) : void
      {
         var _loc2_:Boolean = param1.prevState == FriendState.ACCEPTED && param1.state != FriendState.ACCEPTED;
         if(_loc2_)
         {
            if(param1.userId in this.inviteList)
            {
               this.rejected(param1.userId);
            }
         }
      }
      
      public function accepted(param1:String) : void
      {
         this.removeInvite(param1);
         notificationService.addNotification(new ResponseBattleInviteNotification(param1,localeService.getText(TextConst.STRING_IS_JOINING_THE_BATTLE_AT_YOUR_INVITATION_LABEL)));
      }
      
      private function removeInvite(param1:String) : void
      {
         delete this.inviteList[param1];
         battleInviteService.removeInvite(param1);
      }
      
      public function rejected(param1:String) : void
      {
         this.removeInvite(param1);
         notificationService.addNotification(new ResponseBattleInviteNotification(param1,localeService.getText(TextConst.STRING_REFUSED_TO_JOIN_THE_BATTLE_AT_YOUR_INVITATION_LABEL)));
      }
      
      public function rejectedBattleNotFound(param1:String) : void
      {
         this.removeInvite(param1);
         addNotificationBattleNotFound(param1);
      }
      
      public function rejectedInvitationToBattleDisabled(param1:String) : void
      {
         this.removeInvite(param1);
         notificationService.addNotification(new ResponseBattleInviteNotification(param1,localeService.getText(TextConst.STRING_YOUR_FRIEND_DISABLED_INVITES_LABEL)));
      }
      
      public function rejectedPanelNotLoaded(param1:String) : void
      {
         this.removeInvite(param1);
         notificationService.addNotification(new ResponseBattleInviteNotification(param1,localeService.getText(TextConst.STRING_YOUR_FRIEND_IS_ENTERING_THE_GAME_LABEL)));
      }
      
      public function rejectedUserAlreadyInBattle(param1:String) : void
      {
         this.removeInvite(param1);
         notificationService.addNotification(new ResponseBattleInviteNotification(param1,localeService.getText(TextConst.STRING_YOUR_FRIEND_IS_ALREADY_IN_THIS_BATTLE_LABEL)));
      }
      
      public function rejectedUserOffline(param1:String) : void
      {
         this.removeInvite(param1);
         notificationService.addNotification(new ResponseBattleInviteNotification(param1,localeService.getText(TextConst.STRING_YOUR_FRIEND_IS_OFFLINE_LABEL)));
      }
   }
}

