package controls.containers
{
   import flash.display.DisplayObject;
   
   public class Renamed2259 extends Renamed4027
   {
      public function Renamed2259()
      {
         super();
      }
      
      override protected function Renamed4028(param1:DisplayObject) : void
      {
         if(items.length < 2)
         {
            height = param1.y + int(param1.height);
            width = Math.max(width,param1.x + Renamed4029(param1));
            return;
         }
         var _loc2_:DisplayObject = items[items.length - 2];
         var _loc3_:int = param1.y;
         param1.y = _loc2_.y + int(_loc2_.height) + Renamed4030() + param1.y;
         height = _loc2_.y + int(_loc2_.height) + Renamed4030() + _loc3_ + int(param1.height);
         width = Math.max(int(width),param1.x + Renamed4029(param1));
      }
      
      override protected function Renamed4031(param1:int, param2:DisplayObject) : void
      {
         if(param1 <= 0)
         {
            width = 0;
            height = 0;
            return;
         }
         if(param1 == items.length)
         {
            width = this.Renamed4034();
            height = items[items.length - 1].y + int(items[items.length - 1].height);
            return;
         }
         var _loc3_:int = items[param1].y - param2.y;
         var _loc4_:int = param1;
         while(_loc4_ < items.length)
         {
            items[_loc4_].y -= _loc3_;
            _loc4_++;
         }
         height = items[items.length - 1].y + int(items[items.length - 1].height);
         width = this.Renamed4034();
      }
      
      private function Renamed4034() : int
      {
         var _loc1_:DisplayObject = null;
         var _loc2_:int = 0;
         for each(_loc1_ in items)
         {
            _loc2_ = Math.max(_loc2_,_loc1_.x + Renamed4029(_loc1_));
         }
         return _loc2_;
      }
   }
}

