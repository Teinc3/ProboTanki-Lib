package projects.tanks.clients.fp10.libraries.tanksservices.service.friend
{
   import flash.events.EventDispatcher;
   
   public class §include var switch§ extends EventDispatcher implements IFriendActionService
   {
      public function §include var switch§()
      {
         super();
      }
      
      public function add(param1:String) : void
      {
         dispatchEvent(new FriendActionServiceEvent(FriendActionServiceEvent.ADD,param1));
      }
      
      public function accept(param1:String) : void
      {
         dispatchEvent(new FriendActionServiceEvent(FriendActionServiceEvent.ACCEPT,param1));
      }
      
      public function breakItOff(param1:String) : void
      {
         dispatchEvent(new FriendActionServiceEvent(FriendActionServiceEvent.BREAK_OFF,param1));
      }
      
      public function reject(param1:String) : void
      {
         dispatchEvent(new FriendActionServiceEvent(FriendActionServiceEvent.REJECT,param1));
      }
      
      public function rejectAllIncoming() : void
      {
         dispatchEvent(new FriendActionServiceEvent(FriendActionServiceEvent.REJECT_ALL_INCOMING,null));
      }
      
      public function revoke(param1:String) : void
      {
         dispatchEvent(new FriendActionServiceEvent(FriendActionServiceEvent.REVOKE,param1));
      }
      
      public function addByUid(param1:String) : void
      {
         dispatchEvent(new FriendActionServiceUidEvent(FriendActionServiceUidEvent.ADD,param1));
      }
      
      public function checkUid(param1:String) : void
      {
         dispatchEvent(new FriendActionServiceUidEvent(FriendActionServiceUidEvent.CHECK,param1));
      }
      
      public function uidExist() : void
      {
         dispatchEvent(new FriendActionServiceUidEvent(FriendActionServiceUidEvent.UID_EXIST,""));
      }
      
      public function uidNotExist() : void
      {
         dispatchEvent(new FriendActionServiceUidEvent(FriendActionServiceUidEvent.UID_NOT_EXIST,""));
      }
      
      public function alreadyInIncomingFriends(param1:String, param2:String) : void
      {
         dispatchEvent(new FriendActionServiceUidEvent(FriendActionServiceUidEvent.ALREADY_IN_INCOMING_FRIENDS,param1,param2));
      }
      
      public function alreadyInAcceptedFriends(param1:String) : void
      {
         dispatchEvent(new FriendActionServiceUidEvent(FriendActionServiceUidEvent.ALREADY_IN_ACCEPTED_FRIENDS,param1));
      }
      
      public function alreadyInOutgoingFriends(param1:String) : void
      {
         dispatchEvent(new FriendActionServiceUidEvent(FriendActionServiceUidEvent.ALREADY_IN_OUTGOING_FRIENDS,param1));
      }
   }
}

