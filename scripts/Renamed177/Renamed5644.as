package Renamed4743
{
   import projects.tanks.client.battleselect.model.info.BattleInfoUser;
   
   public class Renamed5643
   {
      private var _users:Vector.<BattleInfoUser>;
      
      public function Renamed5643(param1:Vector.<BattleInfoUser> = null)
      {
         super();
         this._users = param1;
      }
      
      public function get users() : Vector.<BattleInfoUser>
      {
         return this._users;
      }
      
      public function set users(param1:Vector.<BattleInfoUser>) : void
      {
         this._users = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "BattleDMInfoCC [";
         _loc1_ += "users = " + this.users + " ";
         return _loc1_ + "]";
      }
   }
}

