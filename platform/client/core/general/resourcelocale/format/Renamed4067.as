package platform.client.core.general.resourcelocale.format
{
   public class Renamed4059
   {
      private var _key:String;
      
      private var _value:Number;
      
      public function Renamed4059(param1:String = null, param2:Number = 0)
      {
         super();
         this._key = param1;
         this._value = param2;
      }
      
      public function get key() : String
      {
         return this._key;
      }
      
      public function set key(param1:String) : void
      {
         this._key = param1;
      }
      
      public function get value() : Number
      {
         return this._value;
      }
      
      public function set value(param1:Number) : void
      {
         this._value = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "DoublePair [";
         _loc1_ += "key = " + this.key + " ";
         _loc1_ += "value = " + this.value + " ";
         return _loc1_ + "]";
      }
   }
}

