package §'!@§
{
   public class §'"a§
   {
      public static const NORMAL:§'"a§ = new §'"a§(0,"NORMAL");
      
      public static const CRITICAL:§'"a§ = new §'"a§(1,"CRITICAL");
      
      public static const FATAL:§'"a§ = new §'"a§(2,"FATAL");
      
      public static const HEAL:§'"a§ = new §'"a§(3,"HEAL");
      
      private var _value:int;
      
      private var _name:String;
      
      public function §'"a§(param1:int, param2:String)
      {
         super();
         this._value = param1;
         this._name = param2;
      }
      
      public static function get values() : Vector.<§'"a§>
      {
         var _loc1_:Vector.<§'"a§> = new Vector.<§'"a§>();
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

