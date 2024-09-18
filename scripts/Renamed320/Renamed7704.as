package Renamed320
{
   public class Renamed7704
   {
      private var _data:Vector.<Renamed6647>;
      
      public function Renamed7704(param1:Vector.<Renamed6647> = null)
      {
         super();
         this._data = param1;
      }
      
      public function get data() : Vector.<Renamed6647>
      {
         return this._data;
      }
      
      public function set data(param1:Vector.<Renamed6647>) : void
      {
         this._data = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "BCSHModelCC [";
         _loc1_ += "data = " + this.data + " ";
         return _loc1_ + "]";
      }
   }
}

