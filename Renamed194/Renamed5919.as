package Renamed194
{
   public class Renamed5918
   {
      public static const NORMAL:Renamed5918 = new Renamed5918(0,"NORMAL");
      
      public static const CRITICAL:Renamed5918 = new Renamed5918(1,"CRITICAL");
      
      public static const FATAL:Renamed5918 = new Renamed5918(2,"FATAL");
      
      public static const HEAL:Renamed5918 = new Renamed5918(3,"HEAL");
      
      private var _value:int;
      
      private var _name:String;
      
      public function Renamed5918(param1:int, param2:String)
      {
         super();
         this._value = param1;
         this._name = param2;
      }
      
      public static function get values() : Vector.<Renamed5918>
      {
         var _loc1_:Vector.<Renamed5918> = new Vector.<Renamed5918>();
         _loc1_.push(NORMAL);
         _loc1_.push(CRITICAL);
         _loc1_.push(FATAL);
         _loc1_.push(HEAL);
         return _loc1_;
      }
      
      public function toString() : String
      {
         return "DamageIndicatorType [" + this._name + "]";
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

