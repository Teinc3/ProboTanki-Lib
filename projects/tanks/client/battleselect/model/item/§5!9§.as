package projects.tanks.client.battleselect.model.item
{
   public class §5!9§
   {
      public static const NONE:§5!9§ = new §5!9§(0,"NONE");
      
      public static const LOW:§5!9§ = new §5!9§(1,"LOW");
      
      public static const HIGH:§5!9§ = new §5!9§(2,"HIGH");
      
      private var _value:int;
      
      private var _name:String;
      
      public function §5!9§(param1:int, param2:String)
      {
         super();
         this._value = param1;
         this._name = param2;
      }
      
      public static function get values() : Vector.<§5!9§>
      {
         var _loc1_:Vector.<§5!9§> = new Vector.<§5!9§>();
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

