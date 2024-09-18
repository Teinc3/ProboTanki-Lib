package Renamed386
{
   import alternativa.types.Long;
   
   public class Renamed8369
   {
      private var Renamed8370:Long;
      
      public function Renamed8369(param1:Long = null)
      {
         super();
         this.Renamed8370 = param1;
      }
      
      public function get Renamed8371() : Long
      {
         return this.Renamed8370;
      }
      
      public function set Renamed8371(param1:Long) : void
      {
         this.Renamed8370 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "UserNotifierCC [";
         _loc1_ += "currentUserId = " + this.Renamed8371 + " ";
         return _loc1_ + "]";
      }
   }
}

