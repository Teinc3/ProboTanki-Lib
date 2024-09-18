package Renamed207
{
   public class Renamed6142
   {
      private var _count:int;
      
      private var Renamed6143:int;
      
      public function Renamed6142(param1:int = 0, param2:int = 0)
      {
         super();
         this._count = param1;
         this.Renamed6143 = param2;
      }
      
      public function get count() : int
      {
         return this._count;
      }
      
      public function set count(param1:int) : void
      {
         this._count = param1;
      }
      
      public function get itemIndex() : int
      {
         return this.Renamed6143;
      }
      
      public function set itemIndex(param1:int) : void
      {
         this.Renamed6143 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "InventoryItemCC [";
         _loc1_ += "count = " + this.count + " ";
         _loc1_ += "itemIndex = " + this.itemIndex + " ";
         return _loc1_ + "]";
      }
   }
}

