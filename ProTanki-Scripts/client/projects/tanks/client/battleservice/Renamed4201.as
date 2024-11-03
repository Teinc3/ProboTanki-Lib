package projects.tanks.client.battleservice
{
   public class Renamed1586
   {
      private var Renamed4199:int;
      
      private var Renamed4200:int;
      
      public function Renamed1586(param1:int = 0, param2:int = 0)
      {
         super();
         this.Renamed4199 = param1;
         this.Renamed4200 = param2;
      }
      
      public function get max() : int
      {
         return this.Renamed4199;
      }
      
      public function set max(param1:int) : void
      {
         this.Renamed4199 = param1;
      }
      
      public function get min() : int
      {
         return this.Renamed4200;
      }
      
      public function set min(param1:int) : void
      {
         this.Renamed4200 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "Range [";
         _loc1_ += "max = " + this.max + " ";
         _loc1_ += "min = " + this.min + " ";
         return _loc1_ + "]";
      }
   }
}

