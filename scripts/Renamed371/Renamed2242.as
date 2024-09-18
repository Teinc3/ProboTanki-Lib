package Renamed371
{
   public class Renamed2242
   {
      private var Renamed8253:String;
      
      private var Renamed8254:String;
      
      public function Renamed2242(param1:String = null, param2:String = null)
      {
         super();
         this.Renamed8253 = param1;
         this.Renamed8254 = param2;
      }
      
      public function get Renamed2256() : String
      {
         return this.Renamed8253;
      }
      
      public function set Renamed2256(param1:String) : void
      {
         this.Renamed8253 = param1;
      }
      
      public function get countryName() : String
      {
         return this.Renamed8254;
      }
      
      public function set countryName(param1:String) : void
      {
         this.Renamed8254 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "CountryInfo [";
         _loc1_ += "countryCode = " + this.Renamed2256 + " ";
         _loc1_ += "countryName = " + this.countryName + " ";
         return _loc1_ + "]";
      }
   }
}

