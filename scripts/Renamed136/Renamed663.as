package Renamed136
{
   public class Renamed663
   {
      public static const RED:Renamed663 = new Renamed663(0,"RED");
      
      public static const BLUE:Renamed663 = new Renamed663(1,"BLUE");
      
      public static const NONE:Renamed663 = new Renamed663(2,"NONE");
      
      private var _value:int;
      
      private var _name:String;
      
      public function Renamed663(param1:int, param2:String)
      {
         super();
         this._value = param1;
         this._name = param2;
      }
      
      public static function get values() : Vector.<Renamed663>
      {
         var _loc1_:Vector.<Renamed663> = new Vector.<Renamed663>();
         _loc1_.push(RED);
         _loc1_.push(BLUE);
         _loc1_.push(NONE);
         return _loc1_;
      }
      
      public function toString() : String
      {
         return "BattleTeam [" + this._name + "]";
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

