package §function catch if§
{
   public class §if package native§
   {
      public static const ALL:§if package native§ = new §if package native§(0,"ALL");
      
      public static const FRIENDS_ONLY:§if package native§ = new §if package native§(1,"FRIENDS_ONLY");
      
      public static const NONE:§if package native§ = new §if package native§(2,"NONE");
      
      private var _value:int;
      
      private var _name:String;
      
      public function §if package native§(param1:int, param2:String)
      {
         super();
         this._value = param1;
         this._name = param2;
      }
      
      public static function get values() : Vector.<§if package native§>
      {
         var _loc1_:Vector.<§if package native§> = new Vector.<§if package native§>();
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

