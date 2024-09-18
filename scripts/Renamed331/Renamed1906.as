package Renamed331
{
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class Renamed1906
   {
      private var _count:int;
      
      private var Renamed7829:ImageResource;
      
      public function Renamed1906(param1:int = 0, param2:ImageResource = null)
      {
         super();
         this._count = param1;
         this.Renamed7829 = param2;
      }
      
      public function get count() : int
      {
         return this._count;
      }
      
      public function set count(param1:int) : void
      {
         this._count = param1;
      }
      
      public function get Renamed1918() : ImageResource
      {
         return this.Renamed7829;
      }
      
      public function set Renamed1918(param1:ImageResource) : void
      {
         this.Renamed7829 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "WeeklyQuestRewardItem [";
         _loc1_ += "count = " + this.count + " ";
         _loc1_ += "itemImage = " + this.Renamed1918 + " ";
         return _loc1_ + "]";
      }
   }
}

