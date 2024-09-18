package §?#Z§
{
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.§+$%§;
   
   public class §return var native§
   {
      public var body:Body;
      
      public var §@"y§:Vector.<§9!c§>;
      
      public var §@x§:int;
      
      public var §continue const override§:int;
      
      public var §import set switch§:§`#T§;
      
      public var §6#§:Number = 0;
      
      public var §;<§:int;
      
      public function §return var native§(param1:Body, param2:int, param3:Vector3, param4:Number, param5:§`#T§, param6:int)
      {
         this.§2!7§ = new Vector3();
         super();
         this.body = param1;
         this.§;<§ = param6;
         this.§3"5§(param2,param3,param4,param5);
      }
      
      private function §3"5§(param1:int, param2:Vector3, param3:Number, param4:§`#T§) : void
      {
         var _loc5_:Vector3 = null;
         this.§@x§ = param1;
         this.§import set switch§ = param4;
         this.§@"y§ = new Vector.<§9!c§>(param1);
         var _loc6_:Number = param3 / (param1 - 1);
         var _loc7_:int = 0;
         while(_loc7_ < param1)
         {
            _loc5_ = new Vector3(param2.x,param2.y + 0.5 * param3 - _loc7_ * _loc6_,param2.z);
            this.§@"y§[_loc7_] = new §9!c§(this.body,_loc5_,Vector3.DOWN,param4);
            _loc7_++;
         }
      }
      
      public function §!G§(param1:int) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.§@x§)
         {
            §9!c§(this.§@"y§[_loc2_]).collisionGroup = param1;
            _loc2_++;
         }
      }
      
      public function §set extends§() : Boolean
      {
         var _loc1_:§9!c§ = null;
         for each(_loc1_ in this.§@"y§)
         {
            if(_loc1_.§="§ && !§+$%§.§ #T§(_loc1_.§extends const default§.shape.body))
            {
               return true;
            }
         }
         return false;
      }
      
      public function §=!>§(param1:Number) : void
      {
         var _loc2_:§9!c§ = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         this.§continue const override§ = 0;
         this.§2!7§.x = 0;
         this.§2!7§.y = 0;
         this.§2!7§.z = 0;
         var _loc6_:Vector3 = this.body.state.velocity;
         var _loc7_:int = 0;
         while(_loc7_ < this.§@x§)
         {
            _loc2_ = this.§@"y§[_loc7_];
            _loc2_.update(param1);
            if(_loc2_.§="§)
            {
               ++this.§continue const override§;
               this.body.addWorldForceScaled(_loc2_.§5!o§(),_loc2_.§package package native§(),-_loc2_.§5U§);
               this.§2!7§.x += _loc2_.§`"`§.x;
               this.§2!7§.y += _loc2_.§`"`§.y;
               this.§2!7§.z += _loc2_.§`"`§.z;
               _loc3_ = _loc6_.x - _loc2_.§`"`§.x;
               _loc4_ = _loc6_.y - _loc2_.§`"`§.y;
               _loc5_ = _loc6_.z - _loc2_.§`"`§.z;
               _loc2_.speed = Math.sqrt(_loc3_ * _loc3_ + _loc4_ * _loc4_ + _loc5_ * _loc5_);
            }
            else
            {
               _loc2_.speed = 0;
            }
            _loc7_++;
         }
         if(this.§continue const override§ > 1)
         {
            this.§2!7§.x /= this.§continue const override§;
            this.§2!7§.y /= this.§continue const override§;
            this.§2!7§.z /= this.§continue const override§;
         }
      }
      
      public function §get for native§(param1:Number, param2:Number) : void
      {
         var _loc3_:Number = NaN;
         if(this.§6#§ < param1)
         {
            _loc3_ = this.§6#§ + param2;
            this.§6#§ = _loc3_ > param1 ? Number(param1) : Number(_loc3_);
         }
         else if(this.§6#§ > param1)
         {
            _loc3_ = this.§6#§ - param2;
            this.§6#§ = _loc3_ < param1 ? Number(param1) : Number(_loc3_);
         }
      }
   }
}

