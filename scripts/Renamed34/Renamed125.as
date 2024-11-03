package Renamed34
{
   public class Renamed125
   {
      private var Renamed7932:int;
      
      private var Renamed7933:int;
      
      public function Renamed125(param1:int = 0, param2:int = 0)
      {
         super();
         this.Renamed7932 = param1;
         this.Renamed7933 = param2;
      }
      
      public function get magazineReloadTime() : int
      {
         return this.Renamed7932;
      }
      
      public function set magazineReloadTime(param1:int) : void
      {
         this.Renamed7932 = param1;
      }
      
      public function get magazineSize() : int
      {
         return this.Renamed7933;
      }
      
      public function set magazineSize(param1:int) : void
      {
         this.Renamed7933 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "ShotgunShotCC [";
         _loc1_ += "magazineReloadTime = " + this.magazineReloadTime + " ";
         _loc1_ += "magazineSize = " + this.magazineSize + " ";
         return _loc1_ + "]";
      }
   }
}

