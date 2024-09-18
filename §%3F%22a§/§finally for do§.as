package §?"a§
{
   public class §finally for do§
   {
      public static const SUMMER:§finally for do§ = new §finally for do§(0,"SUMMER");
      
      public static const WINTER:§finally for do§ = new §finally for do§(1,"WINTER");
      
      public static const SPACE:§finally for do§ = new §finally for do§(2,"SPACE");
      
      public static const SUMMER_DAY:§finally for do§ = new §finally for do§(3,"SUMMER_DAY");
      
      public static const SUMMER_NIGHT:§finally for do§ = new §finally for do§(4,"SUMMER_NIGHT");
      
      public static const WINTER_DAY:§finally for do§ = new §finally for do§(5,"WINTER_DAY");
      
      public static const WINTER_NIGHT:§finally for do§ = new §finally for do§(6,"WINTER_NIGHT");
      
      private var _value:int;
      
      private var _name:String;
      
      public function §finally for do§(param1:int, param2:String)
      {
         super();
         this._value = param1;
         this._name = param2;
      }
      
      public static function get values() : Vector.<§finally for do§>
      {
         var _loc1_:Vector.<§finally for do§> = new Vector.<§finally for do§>();
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

