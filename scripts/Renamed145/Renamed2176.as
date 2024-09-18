package Renamed145
{
   public class Renamed2176
   {
      private var Renamed4981:Boolean;
      
      public function Renamed2176(param1:Boolean = false)
      {
         super();
         this.Renamed4981 = param1;
      }
      
      public function get Renamed2206() : Boolean
      {
         return this.Renamed4981;
      }
      
      public function set Renamed2206(param1:Boolean) : void
      {
         this.Renamed4981 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "ClientStoredSettings [";
         _loc1_ += "showDamageEnabled = " + this.Renamed2206 + " ";
         return _loc1_ + "]";
      }
   }
}

