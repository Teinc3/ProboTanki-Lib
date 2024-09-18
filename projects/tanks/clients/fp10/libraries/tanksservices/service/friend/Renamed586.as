package projects.tanks.clients.fp10.libraries.tanksservices.service.friend
{
   import flash.events.EventDispatcher;
   import flash.utils.Dictionary;
   import platform.client.fp10.core.network.connection.ConnectionCloseStatus;
   import platform.client.fp10.core.network.handler.OnConnectionClosedServiceListener;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.FriendState;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.Renamed4488;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.TimeOutTruncateConsumers;
   
   public class Renamed586 extends EventDispatcher implements IFriendInfoService, OnConnectionClosedServiceListener
   {
      private var consumers:Dictionary;
      
      private var friends:Dictionary;
      
      private var Renamed4515:Dictionary;
      
      private var Renamed4516:Dictionary;
      
      private var truncateConsumers:TimeOutTruncateConsumers;
      
      public function Renamed586()
      {
         this.consumers = new Dictionary();
         this.friends = new Dictionary();
         this.Renamed4515 = new Dictionary();
         this.Renamed4516 = new Dictionary();
         super();
         this.truncateConsumers = new TimeOutTruncateConsumers();
         this.truncateConsumers.consumers = this.consumers;
         this.truncateConsumers.truncateFunction = this.unSubscribe;
      }
      
      private static function Renamed4517(param1:Dictionary, param2:Object = null) : int
      {
         var _loc3_:Object = null;
         var _loc4_:int = 0;
         for each(_loc3_ in param1)
         {
            if(param2 != null)
            {
               if(_loc3_ == param2)
               {
                  _loc4_++;
               }
            }
            else
            {
               _loc4_++;
            }
         }
         return _loc4_;
      }
      
      private function subscribe(param1:String, param2:Renamed4488) : void
      {
         this.consumers[param1] = param2;
         if(param1 in this.friends)
         {
            this.Renamed4518(param1,this.friends[param1]);
         }
      }
      
      private function unSubscribe(param1:Vector.<String>) : void
      {
         var _loc2_:String = null;
         for each(_loc2_ in param1)
         {
            delete this.consumers[_loc2_];
         }
      }
      
      public function setFriendState(param1:String, param2:FriendState) : void
      {
         var _loc3_:FriendState = this.Renamed4519(param1);
         this.friends[param1] = param2;
         this.Renamed4518(param1,param2);
         dispatchEvent(new FriendStateChangeEvent(FriendStateChangeEvent.CHANGE,param1,param2,_loc3_));
      }
      
      public function getFriendsIdByState(param1:FriendState) : Vector.<String>
      {
         var _loc2_:* = undefined;
         var _loc3_:Vector.<String> = new Vector.<String>();
         for(_loc2_ in this.friends)
         {
            if(this.friends[_loc2_] == param1)
            {
               _loc3_.push(_loc2_);
            }
         }
         return _loc3_;
      }
      
      public function onConnectionClosed(param1:ConnectionCloseStatus) : void
      {
         this.consumers = new Dictionary();
         this.friends = new Dictionary();
         this.Renamed4515 = new Dictionary();
         this.Renamed4516 = new Dictionary();
      }
      
      public function deleteFriend(param1:String, param2:FriendState) : void
      {
         var _loc3_:FriendState = null;
         if(this.isFriendsInState(param1,param2))
         {
            _loc3_ = this.Renamed4519(param1);
            delete this.friends[param1];
            this.Renamed4518(param1,FriendState.UNKNOWN);
            dispatchEvent(new FriendStateChangeEvent(FriendStateChangeEvent.CHANGE,param1,FriendState.UNKNOWN,_loc3_));
         }
      }
      
      public function getConsumer(param1:String) : Renamed4488
      {
         return this.consumers[param1];
      }
      
      private function Renamed4518(param1:String, param2:FriendState) : void
      {
         if(param1 in this.consumers)
         {
            this.getConsumer(param1).setFriendState(param2);
         }
      }
      
      public function getOrCreateUpdater(param1:String) : IFriendsInfoLabelUpdater
      {
         var _loc2_:Renamed4520 = null;
         this.truncateConsumers.updateLastAccessTime(param1);
         if(param1 in this.consumers)
         {
            _loc2_ = this.consumers[param1];
         }
         else
         {
            _loc2_ = new Renamed4520();
            this.consumers[param1] = _loc2_;
            this.subscribe(param1,_loc2_);
         }
         _loc2_.updateLastAccessTime();
         return _loc2_;
      }
      
      public function hasUpdater(param1:String) : Boolean
      {
         return param1 in this.consumers;
      }
      
      public function isFriendsInState(param1:String, param2:FriendState) : Boolean
      {
         return this.friends[param1] == param2;
      }
      
      public function Renamed4519(param1:String) : FriendState
      {
         if(param1 in this.friends)
         {
            return this.friends[param1];
         }
         return FriendState.UNKNOWN;
      }
      
      public function get acceptedFriendsLength() : int
      {
         return Renamed4517(this.friends,FriendState.ACCEPTED);
      }
      
      public function get outgoingFriendsLength() : int
      {
         return Renamed4517(this.friends,FriendState.OUTGOING);
      }
      
      public function get incomingFriendsLength() : int
      {
         return Renamed4517(this.friends,FriendState.INCOMING);
      }
      
      public function onAddNewAcceptedFriend(param1:String) : void
      {
         this.Renamed4515[param1] = true;
         this.Renamed4521(param1);
      }
      
      public function onRemoveNewAcceptedFriend(param1:String) : void
      {
         delete this.Renamed4515[param1];
         this.Renamed4521(param1);
      }
      
      public function removeNewAcceptedFriend(param1:String) : void
      {
         dispatchEvent(new NewFriendRemoveEvent(NewFriendRemoveEvent.ACCEPTED,param1));
      }
      
      public function isNewAcceptedFriend(param1:String) : Boolean
      {
         return param1 in this.Renamed4515;
      }
      
      public function get newAcceptedFriendsLength() : int
      {
         return Renamed4517(this.Renamed4515);
      }
      
      private function Renamed4521(param1:String) : void
      {
         dispatchEvent(new NewFriendEvent(NewFriendEvent.ACCEPTED_CHANGE,param1));
      }
      
      public function onAddNewIncomingFriend(param1:String) : void
      {
         this.Renamed4516[param1] = true;
         this.Renamed4522(param1);
      }
      
      public function onRemoveNewIncomingFriend(param1:String) : void
      {
         delete this.Renamed4516[param1];
         this.Renamed4522(param1);
      }
      
      public function removeNewIncomingFriend(param1:String) : void
      {
         dispatchEvent(new NewFriendRemoveEvent(NewFriendRemoveEvent.INCOMING,param1));
      }
      
      public function isNewIncomingFriend(param1:String) : Boolean
      {
         return param1 in this.Renamed4516;
      }
      
      public function get newIncomingFriendsLength() : int
      {
         return Renamed4517(this.Renamed4516);
      }
      
      private function Renamed4522(param1:String) : void
      {
         dispatchEvent(new NewFriendEvent(NewFriendEvent.INCOMING_CHANGE,param1));
      }
      
      public function isNewFriend(param1:String) : Boolean
      {
         return this.isNewAcceptedFriend(param1) || this.isNewIncomingFriend(param1);
      }
   }
}

