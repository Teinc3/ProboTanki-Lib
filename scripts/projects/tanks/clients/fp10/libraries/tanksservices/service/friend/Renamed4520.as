package projects.tanks.clients.fp10.libraries.tanksservices.service.friend
{
   import flash.events.EventDispatcher;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.FriendState;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.Renamed4488;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.IInfoLabelUpdater;
   
   public class Renamed4520 extends EventDispatcher implements Renamed4488, IFriendsInfoLabelUpdater, IInfoLabelUpdater
   {
      [Inject]
      private var _state:FriendState;
      
      private var _visibleLabelsCounter:int;
      
      private var _lastAccessTime:Number;
      
      public function Renamed4520()
      {
         super();
      }
      
      public function setFriendState(param1:FriendState) : void
      {
         this._state = param1;
         dispatchEvent(new FriendInfoLabelUpdaterEvent(FriendInfoLabelUpdaterEvent.CHANGE_STATE));
      }
      
      public function get state() : FriendState
      {
         return this._state;
      }
      
      public function incrementVisibleLabelsCounter() : void
      {
         ++this._visibleLabelsCounter;
      }
      
      public function decrementVisibleLabelsCounter() : void
      {
         --this._visibleLabelsCounter;
      }
      
      public function get visibleLabelsCounter() : int
      {
         return this._visibleLabelsCounter;
      }
      
      public function updateLastAccessTime() : void
      {
         this._lastAccessTime = new Date().time;
      }
      
      public function get lastAccessTime() : Number
      {
         return this._lastAccessTime;
      }
   }
}

