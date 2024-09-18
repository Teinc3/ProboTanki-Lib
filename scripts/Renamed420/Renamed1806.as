package Renamed420
{
   public class Renamed1806
   {
      private var Renamed8730:int;
      
      private var _user:String;
      
      public function Renamed1806(param1:int = 0, param2:String = null)
      {
         super();
         this.Renamed8730 = param1;
         this._user = param2;
      }
      
      public function get income() : int
      {
         return this.Renamed8730;
      }
      
      public function set income(param1:int) : void
      {
         this.Renamed8730 = param1;
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
         var _loc1_:String = "ReferrerIncomeData [";
         _loc1_ += "income = " + this.income + " ";
         _loc1_ += "user = " + this.user + " ";
         return _loc1_ + "]";
      }
   }
}

