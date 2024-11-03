package Renamed65
{
   public class Renamed66
   {
      private var Renamed10208:Number;
      
      private var Renamed10209:Number;
      
      private var Renamed6922:Number;
      
      public function Renamed66(param1:Number = 0, param2:Number = 0, param3:Number = 0)
      {
         super();
         this.Renamed10208 = param1;
         this.Renamed10209 = param2;
         this.Renamed6922 = param3;
      }
      
      public function get distance() : Number
      {
         return this.Renamed10208;
      }
      
      public function set distance(param1:Number) : void
      {
         this.Renamed10208 = param1;
      }
      
      public function get shellRadius() : Number
      {
         return this.Renamed10209;
      }
      
      public function set shellRadius(param1:Number) : void
      {
         this.Renamed10209 = param1;
      }
      
      public function get speed() : Number
      {
         return this.Renamed6922;
      }
      
      public function set speed(param1:Number) : void
      {
         this.Renamed6922 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "TwinsCC [";
         _loc1_ += "distance = " + this.distance + " ";
         _loc1_ += "shellRadius = " + this.shellRadius + " ";
         _loc1_ += "speed = " + this.speed + " ";
         return _loc1_ + "]";
      }
   }
}

