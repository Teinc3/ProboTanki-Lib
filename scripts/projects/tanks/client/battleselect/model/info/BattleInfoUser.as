package projects.tanks.client.battleselect.model.info
{
   public class BattleInfoUser
   {
      private var _kills:int;
      
      private var _score:int;
      
      private var _suspicious:Boolean;
      
      private var _user:String;
      
      public function BattleInfoUser(param1:int = 0, param2:int = 0, param3:Boolean = false, param4:String = null)
      {
         super();
         this._kills = param1;
         this._score = param2;
         this._suspicious = param3;
         this._user = param4;
      }
      
      public function get kills() : int
      {
         return this._kills;
      }
      
      public function set kills(param1:int) : void
      {
         this._kills = param1;
      }
      
      public function get score() : int
      {
         return this._score;
      }
      
      public function set score(param1:int) : void
      {
         this._score = param1;
      }
      
      public function get suspicious() : Boolean
      {
         return this._suspicious;
      }
      
      public function set suspicious(param1:Boolean) : void
      {
         this._suspicious = param1;
      }
      
      public function get user() : String
      {
         return this._user;
      }
      
      public function set user(param1:String) : void
      {
         this._user = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "BattleInfoUser [";
         _loc1_ += "kills = " + this.kills + " ";
         _loc1_ += "score = " + this.score + " ";
         _loc1_ += "suspicious = " + this.suspicious + " ";
         _loc1_ += "user = " + this.user + " ";
         return _loc1_ + "]";
      }
   }
}

