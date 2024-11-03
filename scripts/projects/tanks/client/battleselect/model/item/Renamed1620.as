package projects.tanks.client.battleselect.model.item
{
   public class Renamed1620
   {
      public static const NONE:Renamed1620 = new Renamed1620(0,"NONE");
      
      public static const LOW:Renamed1620 = new Renamed1620(1,"LOW");
      
      public static const HIGH:Renamed1620 = new Renamed1620(2,"HIGH");
      
      private var _value:int;
      
      private var _name:String;
      
      public function Renamed1620(param1:int, param2:String)
      {
         super();
         this._value = param1;
         this._name = param2;
      }
      
      public static function get values() : Vector.<Renamed1620>
      {
         var _loc1_:Vector.<Renamed1620> = new Vector.<Renamed1620>();
         _loc1_.push(NONE);
         _loc1_.push(LOW);
         _loc1_.push(HIGH);
         return _loc1_;
      }
      
      public function toString() : String
      {
         return "BattleSuspicionLevel [" + this._name + "]";
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

