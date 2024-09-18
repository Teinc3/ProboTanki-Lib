package §]!3§
{
   import flash.utils.Dictionary;
   
   public class §while catch static§
   {
      private var buffer:Dictionary;
      
      public function §while catch static§()
      {
         this.buffer = new Dictionary();
         super();
      }
      
      public function add(param1:String, param2:int) : void
      {
         this.buffer[param1] = param2;
      }
      
      public function remove(param1:String) : void
      {
         delete this.buffer[param1];
      }
      
      public function §="u§(param1:String) : int
      {
         var _loc2_:int = 0;
         if(this.buffer[param1] != undefined)
         {
            _loc2_ = int(this.buffer[param1]);
            delete this.buffer[param1];
            return _loc2_;
         }
         return -1;
      }
   }
}

