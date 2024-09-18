package Renamed206
{
   public class Renamed5125
   {
      public static const RED:Renamed5125 = new Renamed5125(0,"RED");
      
      public static const BLUE:Renamed5125 = new Renamed5125(1,"BLUE");
      
      public static const NEUTRAL:Renamed5125 = new Renamed5125(2,"NEUTRAL");
      
      private var _value:int;
      
      private var _name:String;
      
      public function Renamed5125(param1:int, param2:String)
      {
         super();
         this._value = param1;
         this._name = param2;
      }
      
      public static function get values() : Vector.<Renamed5125>
      {
         var _loc1_:Vector.<Renamed5125> = new Vector.<Renamed5125>();
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

