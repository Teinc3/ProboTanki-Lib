package Renamed209
{
   public class Renamed6158
   {
      private var Renamed6159:int;
      
      public function Renamed6158(param1:int = 0)
      {
         super();
         this.Renamed6159 = param1;
      }
      
      public function get suicideDelayMS() : int
      {
         return this.Renamed6159;
      }
      
      public function set suicideDelayMS(param1:int) : void
      {
         this.Renamed6159 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "SuicideCC [";
         _loc1_ += "suicideDelayMS = " + this.suicideDelayMS + " ";
         return _loc1_ + "]";
      }
   }
}

