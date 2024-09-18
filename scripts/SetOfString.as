package
{
   import flash.utils.Dictionary;
   
   public class SetOfString
   {
      private var _dictionary:Dictionary;
      
      public function SetOfString()
      {
         this._dictionary = new Dictionary();
         super();
      }
      
      public function add(param1:String) : void
      {
         this._dictionary[param1] = true;
      }
      
      public function contains(param1:String) : Boolean
      {
         return this._dictionary[param1];
      }
      
      public function remove(param1:String) : Boolean
      {
         var _loc2_:Boolean = this.contains(param1);
         if(_loc2_)
         {
            delete this._dictionary[param1];
         }
         return _loc2_;
      }
      
      public function get dictionary() : Dictionary
      {
         return this._dictionary;
      }
   }
}

