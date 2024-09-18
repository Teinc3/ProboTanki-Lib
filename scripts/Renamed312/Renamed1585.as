package Renamed312
{
   public class Renamed1585
   {
      private var Renamed7652:int;
      
      private var _timeLimitInSec:int;
      
      public function Renamed1585(param1:int = 0, param2:int = 0)
      {
         super();
         this.Renamed7652 = param1;
         this._timeLimitInSec = param2;
      }
      
      public function get scoreLimit() : int
      {
         return this.Renamed7652;
      }
      
      public function set scoreLimit(param1:int) : void
      {
         this.Renamed7652 = param1;
      }
      
      public function get timeLimitInSec() : int
      {
         return this._timeLimitInSec;
      }
      
      public function set timeLimitInSec(param1:int) : void
      {
         this._timeLimitInSec = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "BattleLimits [";
         _loc1_ += "scoreLimit = " + this.scoreLimit + " ";
         _loc1_ += "timeLimitInSec = " + this.timeLimitInSec + " ";
         return _loc1_ + "]";
      }
   }
}

