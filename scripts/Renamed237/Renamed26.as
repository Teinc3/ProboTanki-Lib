package Renamed25
{
   public class Renamed26
   {
      private var Renamed6546:Number;
      
      private var Renamed6547:Number;
      
      private var Renamed6548:int;
      
      public function Renamed26(param1:Number = 0, param2:Number = 0, param3:int = 0)
      {
         super();
         this.Renamed6546 = param1;
         this.Renamed6547 = param2;
         this.Renamed6548 = param3;
      }
      
      public function get coneHorizontalAngle() : Number
      {
         return this.Renamed6546;
      }
      
      public function set coneHorizontalAngle(param1:Number) : void
      {
         this.Renamed6546 = param1;
      }
      
      public function get coneVerticalAngle() : Number
      {
         return this.Renamed6547;
      }
      
      public function set coneVerticalAngle(param1:Number) : void
      {
         this.Renamed6547 = param1;
      }
      
      public function get pelletCount() : int
      {
         return this.Renamed6548;
      }
      
      public function set pelletCount(param1:int) : void
      {
         this.Renamed6548 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "ShotGunAimingCC [";
         _loc1_ += "coneHorizontalAngle = " + this.coneHorizontalAngle + " ";
         _loc1_ += "coneVerticalAngle = " + this.coneVerticalAngle + " ";
         _loc1_ += "pelletCount = " + this.pelletCount + " ";
         return _loc1_ + "]";
      }
   }
}

