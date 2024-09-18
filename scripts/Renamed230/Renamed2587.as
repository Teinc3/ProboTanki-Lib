package Renamed230
{
   import flash.display.Sprite;
   
   public class Renamed2587 extends Sprite
   {
      protected var Renamed6474:int = 3;
      
      protected var container:Sprite;
      
      protected var shift:Number;
      
      public function Renamed2587()
      {
         this.container = new Sprite();
         super();
         addChild(this.container);
      }
      
      public function Renamed2605(param1:Boolean = false) : Renamed2588
      {
         var _loc2_:int = this.container.numChildren;
         if(_loc2_ == 0)
         {
            return null;
         }
         var _loc3_:Renamed2588 = Renamed2588(this.container.getChildAt(0));
         this.shift = int(_loc3_.height + _loc3_.y + this.Renamed6474);
         this.container.removeChild(_loc3_);
         _loc2_--;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            this.container.getChildAt(_loc4_).y = this.container.getChildAt(_loc4_).y - this.shift;
            _loc4_++;
         }
         return _loc3_;
      }
      
      protected function Renamed2608(param1:Renamed2588) : void
      {
         param1.y = 0;
         param1.alpha = 1;
         this.container.addChildAt(param1,0);
         var _loc2_:int = this.container.numChildren;
         var _loc3_:int = 1;
         while(_loc3_ < _loc2_)
         {
            this.container.getChildAt(_loc3_).y = this.container.getChildAt(_loc3_).y + int(param1.height + this.Renamed6474);
            _loc3_++;
         }
      }
      
      protected function Renamed2601(param1:Renamed2588) : void
      {
         param1.y = this.container.numChildren > 0 ? Number(int(this.container.height + this.Renamed6474)) : Number(0);
         this.container.addChild(param1);
      }
   }
}

