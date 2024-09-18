package Renamed194
{
   public class DamageType
   {
      public static const NORMAL:DamageType = new DamageType(0,"NORMAL");
      
      public static const CRITICAL:DamageType = new DamageType(1,"CRITICAL");
      
      public static const FATAL:DamageType = new DamageType(2,"FATAL");
      
      public static const HEAL:DamageType = new DamageType(3,"HEAL");
      
      private var _value:int;
      
      private var _name:String;
      
      public function DamageType(param1:int, param2:String)
      {
         super();
         this._value = param1;
         this._name = param2;
      }
      
      public static function get values() : Vector.<DamageType>
      {
         var _loc1_:Vector.<DamageType> = new Vector.<DamageType>();
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

