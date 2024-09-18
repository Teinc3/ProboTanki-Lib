package projects.tanks.client.panel.model.profile.userproperty
{
   public class UserPropertyCC
   {
      private var _crystals:int;
      
      private var _currentRankScore:int;
      
      private var _daysFromLastVisit:int;
      
      private var _daysFromRegistration:int;
      
      private var _durationCrystalAbonement:int;
      
      private var _gameHost:String;
      
      private var _hasDoubleCrystal:Boolean;
      
      private var _id:String;
      
      private var _nextRankScore:int;
      
      private var _place:int;
      
      private var _rank:int;
      
      private var _rating:Number;
      
      private var _score:int;
      
      private var _serverNumber:int;
      
      private var _templateBattlePage:String;
      
      private var _uid:String;
      
      private var _userProfileUrl:String;
      
      public function UserPropertyCC(param1:int = 0, param2:int = 0, param3:int = 0, param4:int = 0, param5:int = 0, param6:String = null, param7:Boolean = false, param8:String = null, param9:int = 0, param10:int = 0, param11:int = 0, param12:Number = 0, param13:int = 0, param14:int = 0, param15:String = null, param16:String = null, param17:String = null)
      {
         super();
         this._crystals = param1;
         this._currentRankScore = param2;
         this._daysFromLastVisit = param3;
         this._daysFromRegistration = param4;
         this._durationCrystalAbonement = param5;
         this._gameHost = param6;
         this._hasDoubleCrystal = param7;
         this._id = param8;
         this._nextRankScore = param9;
         this._place = param10;
         this._rank = param11;
         this._rating = param12;
         this._score = param13;
         this._serverNumber = param14;
         this._templateBattlePage = param15;
         this._uid = param16;
         this._userProfileUrl = param17;
      }
      
      public function get crystals() : int
      {
         return this._crystals;
      }
      
      public function set crystals(param1:int) : void
      {
         this._crystals = param1;
      }
      
      public function get currentRankScore() : int
      {
         return this._currentRankScore;
      }
      
      public function set currentRankScore(param1:int) : void
      {
         this._currentRankScore = param1;
      }
      
      public function get daysFromLastVisit() : int
      {
         return this._daysFromLastVisit;
      }
      
      public function set daysFromLastVisit(param1:int) : void
      {
         this._daysFromLastVisit = param1;
      }
      
      public function get daysFromRegistration() : int
      {
         return this._daysFromRegistration;
      }
      
      public function set daysFromRegistration(param1:int) : void
      {
         this._daysFromRegistration = param1;
      }
      
      public function get durationCrystalAbonement() : int
      {
         return this._durationCrystalAbonement;
      }
      
      public function set durationCrystalAbonement(param1:int) : void
      {
         this._durationCrystalAbonement = param1;
      }
      
      public function get gameHost() : String
      {
         return this._gameHost;
      }
      
      public function set gameHost(param1:String) : void
      {
         this._gameHost = param1;
      }
      
      public function get hasDoubleCrystal() : Boolean
      {
         return this._hasDoubleCrystal;
      }
      
      public function set hasDoubleCrystal(param1:Boolean) : void
      {
         this._hasDoubleCrystal = param1;
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function set id(param1:String) : void
      {
         this._id = param1;
      }
      
      public function get nextRankScore() : int
      {
         return this._nextRankScore;
      }
      
      public function set nextRankScore(param1:int) : void
      {
         this._nextRankScore = param1;
      }
      
      public function get place() : int
      {
         return this._place;
      }
      
      public function set place(param1:int) : void
      {
         this._place = param1;
      }
      
      public function get rank() : int
      {
         return this._rank;
      }
      
      public function set rank(param1:int) : void
      {
         this._rank = param1;
      }
      
      public function get rating() : Number
      {
         return this._rating;
      }
      
      public function set rating(param1:Number) : void
      {
         this._rating = param1;
      }
      
      public function get score() : int
      {
         return this._score;
      }
      
      public function set score(param1:int) : void
      {
         this._score = param1;
      }
      
      public function get serverNumber() : int
      {
         return this._serverNumber;
      }
      
      public function set serverNumber(param1:int) : void
      {
         this._serverNumber = param1;
      }
      
      public function get templateBattlePage() : String
      {
         return this._templateBattlePage;
      }
      
      public function set templateBattlePage(param1:String) : void
      {
         this._templateBattlePage = param1;
      }
      
      public function get uid() : String
      {
         return this._uid;
      }
      
      public function set uid(param1:String) : void
      {
         this._uid = param1;
      }
      
      public function get userProfileUrl() : String
      {
         return this._userProfileUrl;
      }
      
      public function set userProfileUrl(param1:String) : void
      {
         this._userProfileUrl = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "UserPropertyCC [";
         _loc1_ += "crystals = " + this.crystals + " ";
         _loc1_ += "currentRankScore = " + this.currentRankScore + " ";
         _loc1_ += "daysFromLastVisit = " + this.daysFromLastVisit + " ";
         _loc1_ += "daysFromRegistration = " + this.daysFromRegistration + " ";
         _loc1_ += "durationCrystalAbonement = " + this.durationCrystalAbonement + " ";
         _loc1_ += "gameHost = " + this.gameHost + " ";
         _loc1_ += "hasDoubleCrystal = " + this.hasDoubleCrystal + " ";
         _loc1_ += "id = " + this.id + " ";
         _loc1_ += "nextRankScore = " + this.nextRankScore + " ";
         _loc1_ += "place = " + this.place + " ";
         _loc1_ += "rank = " + this.rank + " ";
         _loc1_ += "rating = " + this.rating + " ";
         _loc1_ += "score = " + this.score + " ";
         _loc1_ += "serverNumber = " + this.serverNumber + " ";
         _loc1_ += "templateBattlePage = " + this.templateBattlePage + " ";
         _loc1_ += "uid = " + this.uid + " ";
         _loc1_ += "userProfileUrl = " + this.userProfileUrl + " ";
         return _loc1_ + "]";
      }
   }
}

