package §@"]§
{
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.scene3d.§else if§;
   
   public class §4#C§ implements §else if§
   {
      private static const §4"'§:Vector3 = new Vector3();
      
      private var §1#U§:Number;
      
      private var §!!-§:int;
      
      public function §4#C§()
      {
         this.center = new Vector3();
         this.objects = new Vector.<§with super§>();
         super();
      }
      
      public function add(param1:§with super§) : void
      {
         if(this.objects.indexOf(param1) < 0)
         {
            var _loc2_:* = this.§!!-§++;
            this.objects[_loc2_] = param1;
         }
      }
      
      public function remove(param1:§with super§) : void
      {
         var _loc2_:int = int(this.objects.indexOf(param1));
         if(_loc2_ >= 0)
         {
            param1.setAlphaMultiplier(1);
            --this.§!!-§;
            this.objects[_loc2_] = this.objects[this.§!!-§];
            this.objects[this.§!!-§] = null;
         }
      }
      
      public function §8#S§(param1:Vector3, param2:Number) : void
      {
         this.center.copy(param1);
         this.§1#U§ = param2 * param2;
      }
      
      public function §default package each§() : void
      {
         var _loc1_:§with super§ = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.§!!-§)
         {
            _loc1_ = this.objects[_loc2_];
            _loc1_.setAlphaMultiplier(1);
            _loc2_++;
         }
      }
      
      public function render(param1:int, param2:int) : void
      {
         var _loc3_:§with super§ = null;
         var _loc4_:int = 0;
         while(_loc4_ < this.§!!-§)
         {
            _loc3_ = this.objects[_loc4_];
            _loc3_.readPosition(§4"'§);
            _loc3_.setAlphaMultiplier(this.§0"3§(§4"'§));
            _loc4_++;
         }
      }
      
      private function §0"3§(param1:Vector3) : Number
      {
         var _loc2_:Number = param1.x - this.center.x;
         var _loc3_:Number = param1.y - this.center.y;
         var _loc4_:Number = param1.z - this.center.z;
         var _loc5_:Number = _loc2_ * _loc2_ + _loc3_ * _loc3_ + _loc4_ * _loc4_;
         if(_loc5_ < this.§1#U§)
         {
            return Math.sqrt(_loc5_ / this.§1#U§);
         }
         return 1;
      }
      
      public function clear() : void
      {
         this.objects.length = 0;
         this.§!!-§ = 0;
      }
   }
}

