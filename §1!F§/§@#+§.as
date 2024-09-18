package §1!F§
{
   import flash.display.Sprite;
   
   public class §@#+§ extends Sprite
   {
      protected var §default const continue§:int = 3;
      
      protected var container:Sprite;
      
      protected var shift:Number;
      
      public function §@#+§()
      {
         this.container = new Sprite();
         super();
         addChild(this.container);
      }
      
      public function §-M§(param1:Boolean = false) : §switch var super§
      {
         var _loc2_:int = this.container.numChildren;
         if(_loc2_ == 0)
         {
            return null;
         }
         var _loc3_:§switch var super§ = §switch var super§(this.container.getChildAt(0));
         this.shift = int(_loc3_.height + _loc3_.y + this.§default const continue§);
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
      
      protected function §3#N§(param1:§switch var super§) : void
      {
         param1.y = 0;
         param1.alpha = 1;
         this.container.addChildAt(param1,0);
         var _loc2_:int = this.container.numChildren;
         var _loc3_:int = 1;
         while(_loc3_ < _loc2_)
         {
            this.container.getChildAt(_loc3_).y = this.container.getChildAt(_loc3_).y + int(param1.height + this.§default const continue§);
            _loc3_++;
         }
      }
      
      protected function §'"D§(param1:§switch var super§) : void
      {
         param1.y = this.container.numChildren > 0 ? Number(int(this.container.height + this.§default const continue§)) : Number(0);
         this.container.addChild(param1);
      }
   }
}

