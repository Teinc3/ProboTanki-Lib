package alternativa.tanks.models.weapons.targeting.priority
{
   import §5"C§.§else var null§;
   import alternativa.physics.Body;
   import alternativa.physics.collision.types.RayHit;
   import §true catch null§.§&"g§;
   
   public class §import package dynamic§
   {
      private var §true var in§:§else var null§;
      
      private var §"!J§:Number;
      
      public function §import package dynamic§(param1:§else var null§, param2:Number = 0)
      {
         super();
         this.§true var in§ = param1;
         this.§"!J§ = param2;
      }
      
      public function §6!^§(param1:Number, param2:Vector.<§&"g§>) : Number
      {
         var _loc3_:§&"g§ = null;
         var _loc4_:Number = 0;
         var _loc5_:int = int(param2.length - 1);
         while(_loc5_ >= 0)
         {
            _loc3_ = param2[_loc5_];
            _loc4_ = Math.max(this.§native package static§(_loc3_,param1) + this.§"!J§ * _loc4_,_loc4_);
            _loc5_--;
         }
         return _loc4_;
      }
      
      private function §native package static§(param1:§&"g§, param2:Number) : Number
      {
         return this.§true var in§.§case var try§(param1.getTank(),param1.§6T§(),param2);
      }
      
      public function §function for§(param1:Number, param2:Vector.<RayHit>) : Number
      {
         var _loc3_:RayHit = null;
         var _loc4_:Number = 1;
         var _loc5_:Number = 0;
         for each(_loc3_ in param2)
         {
            _loc5_ += this.§false true§(param1,_loc3_) * _loc4_;
            _loc4_ *= this.§"!J§;
         }
         return _loc5_;
      }
      
      private function §false true§(param1:Number, param2:RayHit) : Number
      {
         var _loc3_:Body = param2.shape.body;
         if(param2.staticHit)
         {
            return 0;
         }
         return this.§true var in§.§case var try§(_loc3_.tank,param2.t,param1);
      }
   }
}

