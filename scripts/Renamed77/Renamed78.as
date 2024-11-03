package Renamed77
{
   public class Renamed78
   {
      private var Renamed10272:int;
      
      private var Renamed10273:String;
      
      private var Renamed10274:String;
      
      private var Renamed10275:Boolean;
      
      public function Renamed78(param1:int = 0, param2:String = null, param3:String = null, param4:Boolean = false)
      {
         super();
         this.Renamed10272 = param1;
         this.Renamed10273 = param2;
         this.Renamed10274 = param3;
         this.Renamed10275 = param4;
      }
      
      public function get fadeInTimeMs() : int
      {
         return this.Renamed10272;
      }
      
      public function set fadeInTimeMs(param1:int) : void
      {
         this.Renamed10272 = param1;
      }
      
      public function get laserPointerBlueColor() : String
      {
         return this.Renamed10273;
      }
      
      public function set laserPointerBlueColor(param1:String) : void
      {
         this.Renamed10273 = param1;
      }
      
      public function get laserPointerRedColor() : String
      {
         return this.Renamed10274;
      }
      
      public function set laserPointerRedColor(param1:String) : void
      {
         this.Renamed10274 = param1;
      }
      
      public function get locallyVisible() : Boolean
      {
         return this.Renamed10275;
      }
      
      public function set locallyVisible(param1:Boolean) : void
      {
         this.Renamed10275 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "LaserPointerCC [";
         _loc1_ += "fadeInTimeMs = " + this.fadeInTimeMs + " ";
         _loc1_ += "laserPointerBlueColor = " + this.laserPointerBlueColor + " ";
         _loc1_ += "laserPointerRedColor = " + this.laserPointerRedColor + " ";
         _loc1_ += "locallyVisible = " + this.locallyVisible + " ";
         return _loc1_ + "]";
      }
   }
}

