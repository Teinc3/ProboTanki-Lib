package Renamed475
{
   import flash.utils.Dictionary;
   
   public class Renamed9369
   {
      private var buffer:Dictionary;
      
      public function Renamed9369()
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
      
      public function Renamed9376(param1:String) : int
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

