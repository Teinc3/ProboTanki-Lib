package platform.client.core.general.socialnetwork.types
{
   public class Gender
   {
      public static const MALE:Gender = new Gender(0,"MALE");
      
      public static const FEMALE:Gender = new Gender(1,"FEMALE");
      
      public static const NONE:Gender = new Gender(2,"NONE");
      
      private var _value:int;
      
      private var _name:String;
      
      public function Gender(param1:int, param2:String)
      {
         super();
         this._value = param1;
         this._name = param2;
      }
      
      public static function get values() : Vector.<Gender>
      {
         var _loc1_:Vector.<Gender> = new Vector.<Gender>();
         _loc1_.push(MALE);
         _loc1_.push(FEMALE);
         _loc1_.push(NONE);
         return _loc1_;
      }
      
      public function toString() : String
      {
         return "Gender [" + this._name + "]";
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

