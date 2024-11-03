package Renamed476
{
   import base.DiscreteSprite;
   import Renamed454.Renamed2268;
   
   public class Renamed9394 extends DiscreteSprite
   {
      public var columnCount:int = 3;
      
      public var Renamed9397:int = 3;
      
      public var Renamed9398:int = 3;
      
      public var items:Vector.<Renamed2268>;
      
      public function Renamed9394()
      {
         super();
         this.items = new Vector.<Renamed2268>();
      }
      
      public function addItem(param1:Renamed2268) : void
      {
         param1.gridPosition = this.items.length;
         this.items.push(param1);
         addChild(param1);
      }
      
      public function render() : void
      {
         var _loc1_:Renamed2268 = null;
         _loc1_ = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         for each(_loc1_ in this.items)
         {
            if(_loc1_.Renamed9096 || _loc2_ + _loc1_.Renamed9095 > this.columnCount)
            {
               _loc2_ = 0;
               _loc3_ = 0;
               _loc4_ += this.Renamed9398 + _loc5_;
               _loc5_ = 0;
            }
            _loc2_ += _loc1_.Renamed9095;
            _loc1_.x = _loc3_;
            _loc1_.y = _loc4_;
            _loc3_ += _loc1_.width + this.Renamed9397;
            if(_loc1_.height > _loc5_)
            {
               _loc5_ = _loc1_.height;
            }
         }
      }
      
      public function destroy() : void
      {
         var _loc1_:Renamed2268 = null;
         for each(_loc1_ in this.items)
         {
            _loc1_.destroy();
         }
         this.items = null;
      }
      
      public function set Renamed9399(param1:int) : void
      {
         this.Renamed9397 = param1;
         this.Renamed9398 = param1;
      }
   }
}

