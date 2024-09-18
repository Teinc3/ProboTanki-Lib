package §]!5§
{
   import base.DiscreteSprite;
   import §var package override§.§native for implements§;
   
   public class §implements final§ extends DiscreteSprite
   {
      public var columnCount:int = 3;
      
      public var §?"6§:int = 3;
      
      public var §=#<§:int = 3;
      
      public var items:Vector.<§native for implements§>;
      
      public function §implements final§()
      {
         super();
         this.items = new Vector.<§native for implements§>();
      }
      
      public function addItem(param1:§native for implements§) : void
      {
         param1.gridPosition = this.items.length;
         this.items.push(param1);
         addChild(param1);
      }
      
      public function render() : void
      {
         var _loc1_:§native for implements§ = null;
         _loc1_ = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         for each(_loc1_ in this.items)
         {
            if(_loc1_.§6B§ || _loc2_ + _loc1_.§implements const each§ > this.columnCount)
            {
               _loc2_ = 0;
               _loc3_ = 0;
               _loc4_ += this.§=#<§ + _loc5_;
               _loc5_ = 0;
            }
            _loc2_ += _loc1_.§implements const each§;
            _loc1_.x = _loc3_;
            _loc1_.y = _loc4_;
            _loc3_ += _loc1_.width + this.§?"6§;
            if(_loc1_.height > _loc5_)
            {
               _loc5_ = _loc1_.height;
            }
         }
      }
      
      public function destroy() : void
      {
         var _loc1_:§native for implements§ = null;
         for each(_loc1_ in this.items)
         {
            _loc1_.destroy();
         }
         this.items = null;
      }
      
      public function set §true const include§(param1:int) : void
      {
         this.§?"6§ = param1;
         this.§=#<§ = param1;
      }
   }
}

