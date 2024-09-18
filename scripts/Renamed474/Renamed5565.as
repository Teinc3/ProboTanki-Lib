package Renamed4776
{
   public class Renamed5565
   {
      private var Renamed9362:Boolean;
      
      public function Renamed5565(param1:Boolean = false)
      {
         super();
         this.Renamed9362 = param1;
      }
      
      public function get isForRent() : Boolean
      {
         return this.Renamed9362;
      }
      
      public function set isForRent(param1:Boolean) : void
      {
         this.Renamed9362 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "RentItemCC [";
         _loc1_ += "isForRent = " + this.isForRent + " ";
         return _loc1_ + "]";
      }
   }
}

