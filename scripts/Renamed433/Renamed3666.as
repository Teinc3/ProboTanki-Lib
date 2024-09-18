package Renamed433
{
   public class Renamed3666
   {
      private var Renamed8876:int;
      
      private var Renamed8877:int;
      
      private var Renamed8878:int;
      
      public function Renamed3666(param1:int = 0, param2:int = 0, param3:int = 0)
      {
         super();
         this.Renamed8876 = param1;
         this.Renamed8877 = param2;
         this.Renamed8878 = param3;
      }
      
      public function get delayMountArmorInSec() : int
      {
         return this.Renamed8876;
      }
      
      public function set delayMountArmorInSec(param1:int) : void
      {
         this.Renamed8876 = param1;
      }
      
      public function get delayMountColorInSec() : int
      {
         return this.Renamed8877;
      }
      
      public function set delayMountColorInSec(param1:int) : void
      {
         this.Renamed8877 = param1;
      }
      
      public function get delayMountWeaponInSec() : int
      {
         return this.Renamed8878;
      }
      
      public function set delayMountWeaponInSec(param1:int) : void
      {
         this.Renamed8878 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "DelayMountCategoryCC [";
         _loc1_ += "delayMountArmorInSec = " + this.delayMountArmorInSec + " ";
         _loc1_ += "delayMountColorInSec = " + this.delayMountColorInSec + " ";
         _loc1_ += "delayMountWeaponInSec = " + this.delayMountWeaponInSec + " ";
         return _loc1_ + "]";
      }
   }
}

