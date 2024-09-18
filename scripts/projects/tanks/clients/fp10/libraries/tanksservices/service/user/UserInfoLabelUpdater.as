package projects.tanks.clients.fp10.libraries.tanksservices.service.user
{
   import flash.events.EventDispatcher;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.UserInfoConsumer;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.battle.BattleLinkData;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.IInfoLabelUpdater;
   
   public class UserInfoLabelUpdater extends EventDispatcher implements UserInfoConsumer, IUserInfoLabelUpdater, IInfoLabelUpdater
   {
      private var _rank:int = 0;
      
      private var _uid:String = null;
      
      private var _online:Boolean = false;
      
      private var _serverNumber:int;
      
      private var _battleLink:BattleLinkData;
      
      private var _visibleLabelsCounter:int;
      
      private var _lastAccessTime:Number;
      
      private var _hasPremium:Boolean;
      
      public function UserInfoLabelUpdater()
      {
         super();
      }
      
      public function setOnline(param1:Boolean, param2:int) : void
      {
         this._online = param1;
         this._serverNumber = param2;
         dispatchEvent(new UserInfoLabelUpdaterEvent(UserInfoLabelUpdaterEvent.CHANGE_ONLINE));
      }
      
      public function setUid(param1:String) : void
      {
         this._uid = param1;
         dispatchEvent(new UserInfoLabelUpdaterEvent(UserInfoLabelUpdaterEvent.CHANGE_UID));
      }
      
      public function setRank(param1:int) : void
      {
         this._rank = param1;
         dispatchEvent(new UserInfoLabelUpdaterEvent(UserInfoLabelUpdaterEvent.CHANGE_RANK));
      }
      
      public function setBattleUrl(param1:BattleLinkData) : void
      {
         this._battleLink = param1;
         dispatchEvent(new UserInfoLabelUpdaterEvent(UserInfoLabelUpdaterEvent.CHANGE_BATTLE_LINK));
      }
      
      public function setPremium(param1:Boolean, param2:String = null) : void
      {
         this._hasPremium = param1;
         dispatchEvent(new UserInfoLabelUpdaterEvent(UserInfoLabelUpdaterEvent.CHANGE_PREMIUM_STATUS,false,false,false,param2));
      }
      
      public function hasData() : Boolean
      {
         return this.uid != null;
      }
      
      public function get rank() : int
      {
         return this._rank;
      }
      
      public function get uid() : String
      {
         return this._uid;
      }
      
      public function get online() : Boolean
      {
         return this._online;
      }
      
      public function get serverNumber() : int
      {
         return this._serverNumber;
      }
      
      public function get battleLink() : BattleLinkData
      {
         return this._battleLink;
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
      
      public function hasBattleLink() : Boolean
      {
         return this._battleLink != null;
      }
      
      public function hasPremium() : Boolean
      {
         return this._hasPremium;
      }
   }
}

