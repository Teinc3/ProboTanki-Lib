package Renamed374
{
   public class Renamed2180
   {
      public static const ALL:Renamed2180 = new Renamed2180(0,"ALL");
      
      public static const FRIENDS_ONLY:Renamed2180 = new Renamed2180(1,"FRIENDS_ONLY");
      
      public static const NONE:Renamed2180 = new Renamed2180(2,"NONE");
      
      private var _value:int;
      
      private var _name:String;
      
      public function Renamed2180(param1:int, param2:String)
      {
         super();
         this._value = param1;
         this._name = param2;
      }
      
      public static function get values() : Vector.<Renamed2180>
      {
         var _loc1_:Vector.<Renamed2180> = new Vector.<Renamed2180>();
         _loc1_.push(ALL);
         _loc1_.push(FRIENDS_ONLY);
         _loc1_.push(NONE);
         return _loc1_;
      }
      
      public function toString() : String
      {
         return "PersonalMessageReceiveMode [" + this._name + "]";
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

