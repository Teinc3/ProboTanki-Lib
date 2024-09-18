package Renamed306
{
   public class Renamed2405
   {
      private var Renamed7562:Number;
      
      private var Renamed7563:Number;
      
      private var Renamed7564:int;
      
      private var Renamed7565:int;
      
      public function Renamed2405(param1:Number = 0, param2:Number = 0, param3:int = 0, param4:int = 0)
      {
         super();
         this.Renamed7562 = param1;
         this.Renamed7563 = param2;
         this.Renamed7564 = param3;
         this.Renamed7565 = param4;
      }
      
      public function get angleX() : Number
      {
         return this.Renamed7562;
      }
      
      public function set angleX(param1:Number) : void
      {
         this.Renamed7562 = param1;
      }
      
      public function get angleZ() : Number
      {
         return this.Renamed7563;
      }
      
      public function set angleZ(param1:Number) : void
      {
         this.Renamed7563 = param1;
      }
      
      public function get lightColor() : int
      {
         return this.Renamed7564;
      }
      
      public function set lightColor(param1:int) : void
      {
         this.Renamed7564 = param1;
      }
      
      public function get shadowColor() : int
      {
         return this.Renamed7565;
      }
      
      public function set shadowColor(param1:int) : void
      {
         this.Renamed7565 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "DynamicShadowParams [";
         _loc1_ += "angleX = " + this.angleX + " ";
         _loc1_ += "angleZ = " + this.angleZ + " ";
         _loc1_ += "lightColor = " + this.lightColor + " ";
         _loc1_ += "shadowColor = " + this.shadowColor + " ";
         return _loc1_ + "]";
      }
   }
}

