package Renamed232
{
   public class Renamed1582
   {
      public static const NONE:Renamed1582 = new Renamed1582(0,"NONE");
      
      public static const HORNET_RAILGUN:Renamed1582 = new Renamed1582(1,"HORNET_RAILGUN");
      
      public static const WASP_RAILGUN:Renamed1582 = new Renamed1582(2,"WASP_RAILGUN");
      
      public static const HORNET_WASP_RAILGUN:Renamed1582 = new Renamed1582(3,"HORNET_WASP_RAILGUN");
      
      private var _value:int;
      
      private var _name:String;
      
      public function Renamed1582(param1:int, param2:String)
      {
         super();
         this._value = param1;
         this._name = param2;
      }
      
      public static function get values() : Vector.<Renamed1582>
      {
         var _loc1_:Vector.<Renamed1582> = new Vector.<Renamed1582>();
         _loc1_.push(NONE);
         _loc1_.push(HORNET_RAILGUN);
         _loc1_.push(WASP_RAILGUN);
         _loc1_.push(HORNET_WASP_RAILGUN);
         return _loc1_;
      }
      
      public function toString() : String
      {
         return "EquipmentConstraintsMode [" + this._name + "]";
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

