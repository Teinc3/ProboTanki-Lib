package §,#a§
{
   public class §each package default§
   {
      public static const RED:§each package default§ = new §each package default§(0,"RED");
      
      public static const BLUE:§each package default§ = new §each package default§(1,"BLUE");
      
      public static const NEUTRAL:§each package default§ = new §each package default§(2,"NEUTRAL");
      
      private var _value:int;
      
      private var _name:String;
      
      public function §each package default§(param1:int, param2:String)
      {
         super();
         this._value = param1;
         this._name = param2;
      }
      
      public static function get values() : Vector.<§each package default§>
      {
         var _loc1_:Vector.<§each package default§> = new Vector.<§each package default§>();
         _loc1_.push(RED);
         _loc1_.push(BLUE);
         _loc1_.push(NEUTRAL);
         return _loc1_;
      }
      
      public function toString() : String
      {
         return "ControlPointState [" + this._name + "]";
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

