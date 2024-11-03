package Renamed4741
{
   import projects.tanks.client.battleselect.model.info.BattleInfoUser;
   
   public class Renamed7087
   {
      private var _autoBalance:Boolean;
      
      private var Renamed4202:Boolean;
      
      private var Renamed7088:int;
      
      private var Renamed7089:int;
      
      private var Renamed5679:Vector.<BattleInfoUser>;
      
      private var Renamed5680:Vector.<BattleInfoUser>;
      
      public function Renamed7087(param1:Boolean = false, param2:Boolean = false, param3:int = 0, param4:int = 0, param5:Vector.<BattleInfoUser> = null, param6:Vector.<BattleInfoUser> = null)
      {
         super();
         this._autoBalance = param1;
         this.Renamed4202 = param2;
         this.Renamed7088 = param3;
         this.Renamed7089 = param4;
         this.Renamed5679 = param5;
         this.Renamed5680 = param6;
      }
      
      public function get autoBalance() : Boolean
      {
         return this._autoBalance;
      }
      
      public function set autoBalance(param1:Boolean) : void
      {
         this._autoBalance = param1;
      }
      
      public function get friendlyFire() : Boolean
      {
         return this.Renamed4202;
      }
      
      public function set friendlyFire(param1:Boolean) : void
      {
         this.Renamed4202 = param1;
      }
      
      public function get scoreBlue() : int
      {
         return this.Renamed7088;
      }
      
      public function set scoreBlue(param1:int) : void
      {
         this.Renamed7088 = param1;
      }
      
      public function get scoreRed() : int
      {
         return this.Renamed7089;
      }
      
      public function set scoreRed(param1:int) : void
      {
         this.Renamed7089 = param1;
      }
      
      public function get usersBlue() : Vector.<BattleInfoUser>
      {
         return this.Renamed5679;
      }
      
      public function set usersBlue(param1:Vector.<BattleInfoUser>) : void
      {
         this.Renamed5679 = param1;
      }
      
      public function get usersRed() : Vector.<BattleInfoUser>
      {
         return this.Renamed5680;
      }
      
      public function set usersRed(param1:Vector.<BattleInfoUser>) : void
      {
         this.Renamed5680 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "TeamBattleInfoCC [";
         _loc1_ += "autoBalance = " + this.autoBalance + " ";
         _loc1_ += "friendlyFire = " + this.friendlyFire + " ";
         _loc1_ += "scoreBlue = " + this.scoreBlue + " ";
         _loc1_ += "scoreRed = " + this.scoreRed + " ";
         _loc1_ += "usersBlue = " + this.usersBlue + " ";
         _loc1_ += "usersRed = " + this.usersRed + " ";
         return _loc1_ + "]";
      }
   }
}

