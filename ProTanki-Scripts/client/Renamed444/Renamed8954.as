package Renamed444
{
   public class Renamed8950
   {
      private var Renamed8951:Number;
      
      private var Renamed8952:Number;
      
      private var Renamed8953:Number;
      
      public function Renamed8950(param1:Number = 0, param2:Number = 0, param3:Number = 0)
      {
         super();
         this.Renamed8951 = param1;
         this.Renamed8952 = param2;
         this.Renamed8953 = param3;
      }
      
      public function get Renamed7485() : Number
      {
         return this.Renamed8951;
      }
      
      public function set Renamed7485(param1:Number) : void
      {
         this.Renamed8951 = param1;
      }
      
      public function get Renamed7486() : Number
      {
         return this.Renamed8952;
      }
      
      public function set Renamed7486(param1:Number) : void
      {
         this.Renamed8952 = param1;
      }
      
      public function get Renamed7487() : Number
      {
         return this.Renamed8953;
      }
      
      public function set Renamed7487(param1:Number) : void
      {
         this.Renamed8953 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "WeaponWeakeningCC [";
         _loc1_ += "maximumDamageRadius = " + this.Renamed7485 + " ";
         _loc1_ += "minimumDamagePercent = " + this.Renamed7486 + " ";
         _loc1_ += "minimumDamageRadius = " + this.Renamed7487 + " ";
         return _loc1_ + "]";
      }
   }
}

