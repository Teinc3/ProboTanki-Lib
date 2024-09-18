package Renamed424
{
   public class Renamed8748
   {
      private var _users:Vector.<String>;
      
      public function Renamed8748(param1:Vector.<String> = null)
      {
         super();
         this._users = param1;
      }
      
      public function get users() : Vector.<String>
      {
         return this._users;
      }
      
      public function set users(param1:Vector.<String>) : void
      {
         this._users = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "BattleDMItemCC [";
         _loc1_ += "users = " + this.users + " ";
         return _loc1_ + "]";
      }
   }
}

