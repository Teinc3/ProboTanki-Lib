package projects.tanks.clients.fp10.libraries.tanksservices.service.friend.battleinvite
{
   import flash.events.EventDispatcher;
   import flash.media.Sound;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.FriendState;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendInfoService;
   
   public class BattleInviteService extends EventDispatcher implements IBattleInviteService
   {
      [Inject]
      public static var friendInfoService:IFriendInfoService;
      
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      private var _receiveBattleInvite:Boolean;
      
      private var _notificationSound:Sound;
      
      public function BattleInviteService()
      {
         super();
      }
      
      public function getAvailabilityInviteBattle(param1:String) : Boolean
      {
         return battleInfoService.hasCurrentSelectionBattleId() && friendInfoService.isFriendsInState(param1,FriendState.ACCEPTED);
      }
      
      public function invite(param1:String) : void
      {
         dispatchEvent(new BattleInviteServiceEvent(BattleInviteServiceEvent.INVITE,param1));
      }
      
      public function accept(param1:String, param2:String, param3:String, param4:Boolean) : void
      {
         var _loc5_:BattleInviteServiceEvent;
         (_loc5_ = new BattleInviteServiceEvent(BattleInviteServiceEvent.ACCEPT,param1)).battleId = param2;
         _loc5_.battleUrl = param3;
         _loc5_.isRemoteBattleUrl = param4;
         dispatchEvent(_loc5_);
      }
      
      public function reject(param1:String) : void
      {
         dispatchEvent(new BattleInviteServiceEvent(BattleInviteServiceEvent.REJECT,param1));
      }
      
      public function get receiveBattleInvite() : Boolean
      {
         return this._receiveBattleInvite;
      }
      
      public function set receiveBattleInvite(param1:Boolean) : void
      {
         if(this._receiveBattleInvite != param1)
         {
            dispatchEvent(new BattleInviteEnableEvent(BattleInviteEnableEvent.UPDATE,param1));
         }
         this._receiveBattleInvite = param1;
      }
      
      public function set notificationSound(param1:Sound) : void
      {
         this._notificationSound = param1;
      }
      
      public function removeInvite(param1:String) : void
      {
         dispatchEvent(new BattleInviteServiceEvent(BattleInviteServiceEvent.REMOVE_INVITE,param1));
      }
      
      public function playNotificationSound() : void
      {
         if(this._notificationSound != null)
         {
            this._notificationSound.play();
         }
      }
   }
}

