package Renamed453
{
   public class Renamed7626
   {
      private var _proBattleEnterPrice:int;
      
      private var Renamed4178:int;
      
      public function Renamed7626(param1:int = 0, param2:int = 0)
      {
         super();
         this._proBattleEnterPrice = param1;
         this.Renamed4178 = param2;
      }
      
      public function get proBattleEnterPrice() : int
      {
         return this._proBattleEnterPrice;
      }
      
      public function set proBattleEnterPrice(param1:int) : void
      {
         this._proBattleEnterPrice = param1;
      }
      
      public function get timeLeftInSec() : int
      {
         return this.Renamed4178;
      }
      
      public function set timeLeftInSec(param1:int) : void
      {
         this.Renamed4178 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "ProBattleCC [";
         _loc1_ += "proBattleEnterPrice = " + this.proBattleEnterPrice + " ";
         _loc1_ += "timeLeftInSec = " + this.timeLeftInSec + " ";
         return _loc1_ + "]";
      }
   }
}

