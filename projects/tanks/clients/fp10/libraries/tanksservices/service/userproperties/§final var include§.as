package projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties
{
   import flash.events.EventDispatcher;
   
   public class §final var include§ extends EventDispatcher implements IUserPropertiesService
   {
      private var _userId:String;
      
      private var _userName:String;
      
      private var _score:int;
      
      private var _rank:int;
      
      private var _userProfileUrl:String;
      
      private var _serverNumber:int;
      
      private var _templateBattlePage:String;
      
      private var _gameHost:String;
      
      public function §final var include§()
      {
         super();
      }
      
      public function get userId() : String
      {
         return this._userId;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function get rank() : int
      {
         return this._rank;
      }
      
      public function get score() : int
      {
         return this._score;
      }
      
      public function getUserProfileUrl(param1:String) : String
      {
         return this._userProfileUrl + param1;
      }
      
      public function get serverNumber() : int
      {
         return this._serverNumber;
      }
      
      public function get templateBattlePage() : String
      {
         return this._templateBattlePage;
      }
      
      public function get gameHost() : String
      {
         return this._gameHost;
      }
      
      public function updateRank(param1:int) : void
      {
         this._rank = param1;
         dispatchEvent(new UserPropertiesServiceEvent(UserPropertiesServiceEvent.UPDATE_RANK,new UserProperties(this._userId,this._userName,this._score,this._rank)));
      }
      
      public function updateScore(param1:int) : void
      {
         this._score = param1;
         dispatchEvent(new UserPropertiesServiceEvent(UserPropertiesServiceEvent.UPDATE_SCORE,new UserProperties(this._userId,this._userName,this._score,this._rank)));
      }
      
      public function init(param1:String, param2:String, param3:int, param4:int, param5:int, param6:String, param7:String, param8:String) : void
      {
         this._userId = param1;
         this._userName = param2;
         this._score = param3;
         this._rank = param4;
         this._serverNumber = param5;
         this._templateBattlePage = param6;
         this._gameHost = param7;
         this._userProfileUrl = param8;
      }
   }
}

