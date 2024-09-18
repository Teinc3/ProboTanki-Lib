package alternativa.utils
{
   public class Properties
   {
      private var data:Object;
      
      public function Properties(param1:Object = null)
      {
         super();
         this.data = param1 || {};
      }
      
      public function getProperty(param1:String) : String
      {
         return this.data[param1];
      }
      
      public function getPropertyDef(param1:String, param2:String) : String
      {
         return this.data[param1] || param2;
      }
      
      public function setProperty(param1:String, param2:String) : void
      {
         if(!param2)
         {
            throw new ArgumentError("Empty values are not allowed");
         }
         this.data[param1] = param2;
      }
      
      public function removeProperty(param1:String) : void
      {
         delete this.data[param1];
      }
      
      public function get propertyNames() : Vector.<String>
      {
         var _loc1_:* = null;
         var _loc2_:Vector.<String> = new Vector.<String>();
         for(_loc1_ in this.data)
         {
            _loc2_.push(_loc1_);
         }
         return _loc2_;
      }
      
      public function toString() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = "";
         for(_loc1_ in this.data)
         {
            if(_loc2_)
            {
               _loc2_ += ", ";
            }
            _loc2_ += _loc1_ + ": " + this.data[_loc1_];
         }
         return "[Properties " + _loc2_ + "]";
      }
   }
}

