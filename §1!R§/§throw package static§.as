package §1!R§
{
   public class §throw package static§
   {
      public static const NONE:§throw package static§ = new §throw package static§(0,"NONE");
      
      public static const HORNET_RAILGUN:§throw package static§ = new §throw package static§(1,"HORNET_RAILGUN");
      
      public static const WASP_RAILGUN:§throw package static§ = new §throw package static§(2,"WASP_RAILGUN");
      
      public static const HORNET_WASP_RAILGUN:§throw package static§ = new §throw package static§(3,"HORNET_WASP_RAILGUN");
      
      private var _value:int;
      
      private var _name:String;
      
      public function §throw package static§(param1:int, param2:String)
      {
         super();
         this._value = param1;
         this._name = param2;
      }
      
      public static function get values() : Vector.<§throw package static§>
      {
         var _loc1_:Vector.<§throw package static§> = new Vector.<§throw package static§>();
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

