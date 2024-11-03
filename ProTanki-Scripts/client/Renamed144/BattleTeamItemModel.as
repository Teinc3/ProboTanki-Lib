package Renamed144
{
   import Renamed136.Renamed663;
   import Renamed4745.Renamed4961;
   import Renamed4745.Renamed4746;
   import alternativa.tanks.controllers.BattleSelectVectorUtil;
   import alternativa.tanks.model.item.BattleItem;
   import alternativa.tanks.service.battle.IBattleUserInfoService;
   import alternativa.tanks.service.battlelist.IBattleListFormService;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.FriendState;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendInfoService;
   
   public class BattleTeamItemModel extends Renamed4961 implements Renamed4746, Renamed3638, BattleItem, ObjectLoadListener
   {
      [Inject]
      public static var battleListFormService:IBattleListFormService;
      
      [Inject]
      public static var friendsInfoService:IFriendInfoService;
      
      [Inject]
      public static var battleUserInfoService:IBattleUserInfoService;
      
      public function BattleTeamItemModel()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         var _loc1_:BattleTeamData = this.data();
         var _loc2_:Vector.<String> = getInitParam().usersRed;
         this.Renamed4962(_loc2_,_loc1_.usersRed,_loc1_.friendsRed);
         var _loc3_:Vector.<String> = getInitParam().usersBlue;
         this.Renamed4962(_loc3_,_loc1_.usersBlue,_loc1_.friendsBlue);
      }
      
      private function Renamed4962(param1:Vector.<String>, param2:Vector.<String>, param3:Vector.<String>) : void
      {
         var _loc4_:int = int(param1.length - 1);
         while(_loc4_ >= 0)
         {
            param2.push(param1[_loc4_]);
            battleUserInfoService.connect(param1[_loc4_],object);
            if(friendsInfoService.isFriendsInState(param1[_loc4_],FriendState.ACCEPTED))
            {
               param3.push(param1[_loc4_]);
            }
            _loc4_--;
         }
      }
      
      private function Renamed4963(param1:String, param2:Vector.<String>, param3:Vector.<String>) : void
      {
         if(BattleSelectVectorUtil.containsElementInVector(param2,param1))
         {
            BattleSelectVectorUtil.deleteElementInLongsVector(param3,param1);
         }
      }
      
      private function Renamed4964(param1:String, param2:Vector.<String>, param3:Vector.<String>) : void
      {
         if(BattleSelectVectorUtil.containsElementInVector(param2,param1))
         {
            param3.push(param1);
         }
      }
      
      public function getUsersCountBlue() : int
      {
         return this.data().usersBlue.length;
      }
      
      public function getUsersCountRed() : int
      {
         return this.data().usersRed.length;
      }
      
      public function getFriendsCountBlue() : int
      {
         return this.data().friendsBlue.length;
      }
      
      public function getFriendsCountRed() : int
      {
         return this.data().friendsRed.length;
      }
      
      public function Renamed4965(param1:String, param2:Renamed663) : void
      {
         switch(param2)
         {
            case Renamed663.RED:
               this.Renamed4966(param1,this.data().usersRed,this.data().friendsRed);
               break;
            case Renamed663.BLUE:
               this.Renamed4966(param1,this.data().usersBlue,this.data().friendsBlue);
         }
         battleUserInfoService.connect(param1,object);
         if(friendsInfoService.isFriendsInState(param1,FriendState.ACCEPTED))
         {
            this.onAddFriend(param1);
         }
         battleListFormService.updateUsersCountTeam(object.name,this.data().usersRed.length,this.data().usersBlue.length,this.data().friendsRed.length,this.data().friendsBlue.length);
      }
      
      private function Renamed4966(param1:String, param2:Vector.<String>, param3:Vector.<String>) : void
      {
         param2.push(param1);
      }
      
      public function Renamed4967(param1:String) : void
      {
         BattleSelectVectorUtil.deleteElementInLongsVector(this.data().usersBlue,param1);
         BattleSelectVectorUtil.deleteElementInLongsVector(this.data().usersRed,param1);
         BattleSelectVectorUtil.deleteElementInLongsVector(this.data().friendsRed,param1);
         BattleSelectVectorUtil.deleteElementInLongsVector(this.data().friendsBlue,param1);
         battleUserInfoService.disconnect(param1);
         if(friendsInfoService.isFriendsInState(param1,FriendState.ACCEPTED))
         {
            this.onDeleteFriend(param1);
         }
         battleListFormService.updateUsersCountTeam(object.name,this.data().usersRed.length,this.data().usersBlue.length,this.data().friendsRed.length,this.data().friendsBlue.length);
      }
      
      public function swapTeams() : void
      {
         var _loc1_:Vector.<String> = this.data().usersBlue;
         this.data().usersBlue = this.data().usersRed;
         this.data().usersRed = _loc1_;
         var _loc2_:Vector.<String> = this.data().friendsBlue;
         this.data().friendsBlue = this.data().friendsRed;
         this.data().friendsRed = _loc2_;
         battleListFormService.swapTeams(object.name);
      }
      
      private function data() : BattleTeamData
      {
         var _loc1_:BattleTeamData = BattleTeamData(getData(BattleTeamData));
         if(_loc1_ == null)
         {
            _loc1_ = new BattleTeamData();
            putData(BattleTeamData,_loc1_);
         }
         return _loc1_;
      }
      
      public function onAddFriend(param1:String) : void
      {
         this.Renamed4964(param1,this.data().usersRed,this.data().friendsRed);
         this.Renamed4964(param1,this.data().usersBlue,this.data().friendsBlue);
         battleListFormService.updateUsersCountTeam(object.name,this.data().usersRed.length,this.data().usersBlue.length,this.data().friendsRed.length,this.data().friendsBlue.length);
      }
      
      public function onDeleteFriend(param1:String) : void
      {
         this.Renamed4963(param1,this.data().usersRed,this.data().friendsRed);
         this.Renamed4963(param1,this.data().usersBlue,this.data().friendsBlue);
         battleListFormService.updateUsersCountTeam(object.name,this.data().usersRed.length,this.data().usersBlue.length,this.data().friendsRed.length,this.data().friendsBlue.length);
      }
   }
}

class BattleTeamData
{
   public var usersRed:Vector.<String>;
   
   public var usersBlue:Vector.<String>;
   
   public var friendsRed:Vector.<String>;
   
   public var friendsBlue:Vector.<String>;
   
   public function BattleTeamData()
   {
      this.usersRed = new Vector.<String>();
      this.usersBlue = new Vector.<String>();
      this.friendsRed = new Vector.<String>();
      this.friendsBlue = new Vector.<String>();
      super();
   }
}

