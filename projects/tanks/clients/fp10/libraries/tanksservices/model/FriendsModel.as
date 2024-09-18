package projects.tanks.clients.fp10.libraries.tanksservices.model
{
   import projects.tanks.client.users.model.friends.Renamed4412;
   import projects.tanks.client.users.model.friends.Renamed4414;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.FriendActionServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.FriendActionServiceUidEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendActionService;
   
   public class FriendsModel extends Renamed4412 implements Renamed4414, IFriends
   {
      [Inject]
      public static var friendsActionService:IFriendActionService;
      
      public function FriendsModel()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         friendsActionService.addEventListener(FriendActionServiceEvent.ACCEPT,this.onAccept);
         friendsActionService.addEventListener(FriendActionServiceEvent.ADD,this.onAdd);
         friendsActionService.addEventListener(FriendActionServiceUidEvent.ADD,this.onAddByUid);
         friendsActionService.addEventListener(FriendActionServiceEvent.BREAK_OFF,this.onBreakItOff);
         friendsActionService.addEventListener(FriendActionServiceEvent.REJECT,this.onReject);
         friendsActionService.addEventListener(FriendActionServiceEvent.REJECT_ALL_INCOMING,this.onRejectAllIncoming);
         friendsActionService.addEventListener(FriendActionServiceEvent.REVOKE,this.onRevoke);
         friendsActionService.addEventListener(FriendActionServiceUidEvent.CHECK,this.onCheck);
      }
      
      private function onAccept(param1:FriendActionServiceEvent) : void
      {
         server.accept(param1.userId);
      }
      
      private function onAddByUid(param1:FriendActionServiceUidEvent) : void
      {
         server.addByUid(param1.uid);
      }
      
      private function onAdd(param1:FriendActionServiceEvent) : void
      {
         server.add(param1.userId);
      }
      
      private function onBreakItOff(param1:FriendActionServiceEvent) : void
      {
         server.breakItOff(param1.userId);
      }
      
      private function onReject(param1:FriendActionServiceEvent) : void
      {
         server.reject(param1.userId);
      }
      
      private function onRejectAllIncoming(param1:FriendActionServiceEvent) : void
      {
         server.Renamed4445();
      }
      
      private function onRevoke(param1:FriendActionServiceEvent) : void
      {
         server.revoke(param1.userId);
      }
      
      private function onCheck(param1:FriendActionServiceUidEvent) : void
      {
         server.Renamed822(param1.uid);
      }
      
      public function objectUnloaded() : void
      {
         friendsActionService.removeEventListener(FriendActionServiceEvent.ACCEPT,this.onAccept);
         friendsActionService.removeEventListener(FriendActionServiceEvent.ADD,this.onAdd);
         friendsActionService.removeEventListener(FriendActionServiceUidEvent.ADD,this.onAddByUid);
         friendsActionService.removeEventListener(FriendActionServiceEvent.BREAK_OFF,this.onBreakItOff);
         friendsActionService.removeEventListener(FriendActionServiceEvent.REJECT,this.onReject);
         friendsActionService.removeEventListener(FriendActionServiceEvent.REJECT_ALL_INCOMING,this.onRejectAllIncoming);
         friendsActionService.removeEventListener(FriendActionServiceEvent.REVOKE,this.onRevoke);
         friendsActionService.removeEventListener(FriendActionServiceUidEvent.CHECK,this.onCheck);
      }
      
      public function isLocal() : Boolean
      {
         return true;
      }
      
      public function alreadyInAcceptedFriends(param1:String) : void
      {
         friendsActionService.alreadyInAcceptedFriends(param1);
      }
      
      public function alreadyInIncomingFriends(param1:String, param2:String) : void
      {
         friendsActionService.alreadyInIncomingFriends(param1,param2);
      }
      
      public function alreadyInOutgoingFriends(param1:String) : void
      {
         friendsActionService.alreadyInOutgoingFriends(param1);
      }
      
      public function uidExist() : void
      {
         friendsActionService.uidExist();
      }
      
      public function uidNotExist() : void
      {
         friendsActionService.uidNotExist();
      }
   }
}

