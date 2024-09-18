package Renamed371
{
   public class Renamed3644
   {
      private var Renamed8255:Vector.<Renamed2242>;
      
      private var Renamed8256:String;
      
      private var Renamed8257:Boolean;
      
      public function Renamed3644(param1:Vector.<Renamed2242> = null, param2:String = null, param3:Boolean = false)
      {
         super();
         this.Renamed8255 = param1;
         this.Renamed8256 = param2;
         this.Renamed8257 = param3;
      }
      
      public function get Renamed3652() : Vector.<Renamed2242>
      {
         return this.Renamed8255;
      }
      
      public function set Renamed3652(param1:Vector.<Renamed2242>) : void
      {
         this.Renamed8255 = param1;
      }
      
      public function get defaultCountryCode() : String
      {
         return this.Renamed8256;
      }
      
      public function set defaultCountryCode(param1:String) : void
      {
         this.Renamed8256 = param1;
      }
      
      public function get Renamed3651() : Boolean
      {
         return this.Renamed8257;
      }
      
      public function set Renamed3651(param1:Boolean) : void
      {
         this.Renamed8257 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "UserCountryCC [";
         _loc1_ += "countries = " + this.Renamed3652 + " ";
         _loc1_ += "defaultCountryCode = " + this.defaultCountryCode + " ";
         _loc1_ += "locationCheckEnabled = " + this.Renamed3651 + " ";
         return _loc1_ + "]";
      }
   }
}

