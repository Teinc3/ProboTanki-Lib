package Renamed1614
{
   public class Renamed1615
   {
      public static const SUMMER:Renamed1615 = new Renamed1615(0,"SUMMER");
      
      public static const WINTER:Renamed1615 = new Renamed1615(1,"WINTER");
      
      public static const SPACE:Renamed1615 = new Renamed1615(2,"SPACE");
      
      public static const SUMMER_DAY:Renamed1615 = new Renamed1615(3,"SUMMER_DAY");
      
      public static const SUMMER_NIGHT:Renamed1615 = new Renamed1615(4,"SUMMER_NIGHT");
      
      public static const WINTER_DAY:Renamed1615 = new Renamed1615(5,"WINTER_DAY");
      
      public static const WINTER_NIGHT:Renamed1615 = new Renamed1615(6,"WINTER_NIGHT");
      
      private var _value:int;
      
      private var _name:String;
      
      public function Renamed1615(param1:int, param2:String)
      {
         super();
         this._value = param1;
         this._name = param2;
      }
      
      public static function get values() : Vector.<Renamed1615>
      {
         var _loc1_:Vector.<Renamed1615> = new Vector.<Renamed1615>();
         _loc1_.push(SUMMER);
         _loc1_.push(WINTER);
         _loc1_.push(SPACE);
         _loc1_.push(SUMMER_DAY);
         _loc1_.push(SUMMER_NIGHT);
         _loc1_.push(WINTER_DAY);
         _loc1_.push(WINTER_NIGHT);
         return _loc1_;
      }
      
      public function toString() : String
      {
         return "MapTheme [" + this._name + "]";
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

