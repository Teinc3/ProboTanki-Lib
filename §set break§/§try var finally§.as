package §set break§
{
   public class §try var finally§
   {
      public static const OFF:§try var finally§ = new §try var finally§(0,"OFF");
      
      public static const IDLE:§try var finally§ = new §try var finally§(1,"IDLE");
      
      public static const HEALING:§try var finally§ = new §try var finally§(2,"HEALING");
      
      public static const DAMAGING:§try var finally§ = new §try var finally§(3,"DAMAGING");
      
      private var _value:int;
      
      private var _name:String;
      
      public function §try var finally§(param1:int, param2:String)
      {
         super();
         this._value = param1;
         this._name = param2;
      }
      
      public static function get values() : Vector.<§try var finally§>
      {
         var _loc1_:Vector.<§try var finally§> = new Vector.<§try var finally§>();
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

