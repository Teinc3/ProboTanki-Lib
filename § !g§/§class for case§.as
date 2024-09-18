package § !g§
{
   public class §class for case§
   {
      public static const RED:§class for case§ = new §class for case§(0,"RED");
      
      public static const BLUE:§class for case§ = new §class for case§(1,"BLUE");
      
      public static const NONE:§class for case§ = new §class for case§(2,"NONE");
      
      private var _value:int;
      
      private var _name:String;
      
      public function §class for case§(param1:int, param2:String)
      {
         super();
         this._value = param1;
         this._name = param2;
      }
      
      public static function get values() : Vector.<§class for case§>
      {
         var _loc1_:Vector.<§class for case§> = new Vector.<§class for case§>();
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

