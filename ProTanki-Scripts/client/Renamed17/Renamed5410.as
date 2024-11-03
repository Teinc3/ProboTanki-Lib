package Renamed17
{
   public class Renamed5410
   {
      public static const AT_BASE:Renamed5410 = new Renamed5410(0,"AT_BASE");
      
      public static const DROPPED:Renamed5410 = new Renamed5410(1,"DROPPED");
      
      public static const CARRIED:Renamed5410 = new Renamed5410(2,"CARRIED");
      
      private var _value:int;
      
      private var Renamed5424:String;
      
      public function Renamed5410(param1:int, param2:String)
      {
         super();
         this._value = param1;
         this.Renamed5424 = param2;
      }
      
      public function get value() : int
      {
         return this._value;
      }
      
      public function toString() : String
      {
         return "CTFFlagState [" + this.Renamed5424 + "]";
      }
   }
}

