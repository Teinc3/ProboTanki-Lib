package Renamed82
{
   public class Renamed8544
   {
      public static const OFF:Renamed8544 = new Renamed8544(0,"OFF");
      
      public static const IDLE:Renamed8544 = new Renamed8544(1,"IDLE");
      
      public static const HEALING:Renamed8544 = new Renamed8544(2,"HEALING");
      
      public static const DAMAGING:Renamed8544 = new Renamed8544(3,"DAMAGING");
      
      private var _value:int;
      
      private var _name:String;
      
      public function Renamed8544(param1:int, param2:String)
      {
         super();
         this._value = param1;
         this._name = param2;
      }
      
      public static function get values() : Vector.<Renamed8544>
      {
         var _loc1_:Vector.<Renamed8544> = new Vector.<Renamed8544>();
         _loc1_.push(OFF);
         _loc1_.push(IDLE);
         _loc1_.push(HEALING);
         _loc1_.push(DAMAGING);
         return _loc1_;
      }
      
      public function toString() : String
      {
         return "IsisState [" + this._name + "]";
      }
      
      public function get value() : int
      {
         return this._value;
      }
      
      public function get name() : String
      {
         return this._name;
      }
   }
}

