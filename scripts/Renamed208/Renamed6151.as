package Renamed4533
{
   public class Renamed6151
   {
      private var _receiveBattleInvite:Boolean;
      
      public function Renamed6151(param1:Boolean = false)
      {
         super();
         this._receiveBattleInvite = param1;
      }
      
      public function get receiveBattleInvite() : Boolean
      {
         return this._receiveBattleInvite;
      }
      
      public function set receiveBattleInvite(param1:Boolean) : void
      {
         this._receiveBattleInvite = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "NotificationEnabledCC [";
         _loc1_ += "receiveBattleInvite = " + this.receiveBattleInvite + " ";
         return _loc1_ + "]";
      }
   }
}

