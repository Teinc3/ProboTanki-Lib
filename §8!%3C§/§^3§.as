package §8!<§
{
   import projects.tanks.client.battleselect.model.info.BattleInfoUser;
   
   public class §^3§
   {
      private var _autoBalance:Boolean;
      
      private var §default package dynamic§:Boolean;
      
      private var §?#§:int;
      
      private var §<P§:int;
      
      private var §final implements§:Vector.<BattleInfoUser>;
      
      private var §get for do§:Vector.<BattleInfoUser>;
      
      public function §^3§(param1:Boolean = false, param2:Boolean = false, param3:int = 0, param4:int = 0, param5:Vector.<BattleInfoUser> = null, param6:Vector.<BattleInfoUser> = null)
      {
         super();
         this._autoBalance = param1;
         this.§default package dynamic§ = param2;
         this.§?#§ = param3;
         this.§<P§ = param4;
         this.§final implements§ = param5;
         this.§get for do§ = param6;
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
         return this.§default package dynamic§;
      }
      
      public function set friendlyFire(param1:Boolean) : void
      {
         this.§default package dynamic§ = param1;
      }
      
      public function get scoreBlue() : int
      {
         return this.§?#§;
      }
      
      public function set scoreBlue(param1:int) : void
      {
         this.§?#§ = param1;
      }
      
      public function get scoreRed() : int
      {
         return this.§<P§;
      }
      
      public function set scoreRed(param1:int) : void
      {
         this.§<P§ = param1;
      }
      
      public function get usersBlue() : Vector.<BattleInfoUser>
      {
         return this.§final implements§;
      }
      
      public function set usersBlue(param1:Vector.<BattleInfoUser>) : void
      {
         this.§final implements§ = param1;
      }
      
      public function get usersRed() : Vector.<BattleInfoUser>
      {
         return this.§get for do§;
      }
      
      public function set usersRed(param1:Vector.<BattleInfoUser>) : void
      {
         this.§get for do§ = param1;
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

