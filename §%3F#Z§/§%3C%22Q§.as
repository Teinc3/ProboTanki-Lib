package §?#Z§
{
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.objects.tank.§implements set get§;
   import alternativa.tanks.battle.objects.tank.§native catch var§;
   import alternativa.tanks.utils.EncryptedNumber;
   import alternativa.tanks.utils.EncryptedNumberImpl;
   import alternativa.tanks.utils.MathUtils;
   
   public class §<"Q§
   {
      private static const §catch var implements§:Number = 400;
      
      private static const §""l§:Vector3 = new Vector3();
      
      private static const §use package super§:Vector3 = new Vector3();
      
      private static const §do catch true§:Vector3 = new Vector3();
      
      private static const §break for break§:Vector3 = new Vector3();
      
      private static const §continue catch do§:Vector3 = new Vector3();
      
      private static const _relativeVelocity:Vector3 = new Vector3();
      
      private static const §7d§:Vector3 = new Vector3();
      
      private static const §class return§:Vector3 = new Vector3();
      
      private static const §native super§:Vector3 = new Vector3();
      
      private var body:Body;
      
      private var §import set switch§:§`#T§;
      
      private var §[#0§:§implements set get§;
      
      public var §override native§:§return var native§;
      
      public var § "C§:§return var native§;
      
      public var §4;§:Boolean;
      
      public var §in var native§:int;
      
      public var §include package import§:int;
      
      public var §false set switch§:Boolean;
      
      public function §<"Q§(param1:Body, param2:§`#T§, param3:§implements set get§, param4:Vector3)
      {
         this.§finally const extends§ = new EncryptedNumberImpl();
         this.§for var§ = new EncryptedNumberImpl();
         this.§class set override§ = new EncryptedNumberImpl();
         this.§use package true§ = new EncryptedNumberImpl();
         this.§function var dynamic§ = new EncryptedNumberImpl();
         super();
         this.body = param1;
         this.§import set switch§ = param2;
         this.§[#0§ = param3;
         this.§0!k§(§native catch var§.§null package package§,param4);
      }
      
      private function §0!k§(param1:int, param2:Vector3) : void
      {
         var _loc3_:Number = param2.y * 0.8;
         var _loc4_:Number = param2.x - 40;
         this.§override native§ = new §return var native§(this.body,param1,new Vector3(-0.5 * _loc4_,0,-0.5 * param2.z + §native catch var§.§&#X§),_loc3_,this.§import set switch§,-1);
         this.§ "C§ = new §return var native§(this.body,param1,new Vector3(0.5 * _loc4_,0,-0.5 * param2.z + §native catch var§.§&#X§),_loc3_,this.§import set switch§,1);
      }
      
      public function §5`§(param1:Number) : void
      {
         this.§finally const extends§.setNumber(param1);
      }
      
      public function §5!c§(param1:Number) : void
      {
         this.§for var§.setNumber(param1);
      }
      
      public function §catch const catch§(param1:Number) : void
      {
         this.§class set override§.setNumber(param1);
      }
      
      public function setTurnAcceleration(param1:Number) : void
      {
         this.§use package true§.setNumber(param1);
      }
      
      public function §null override§(param1:Number) : void
      {
         this.§function var dynamic§.setNumber(param1);
      }
      
      public function §final var implements§() : Number
      {
         return this.§finally const extends§.getNumber();
      }
      
      public function §set package var§() : int
      {
         return this.§4;§ ? int(0) : int(this.§in var native§);
      }
      
      public function §extends var null§() : int
      {
         return this.§4;§ ? int(0) : int(this.§include package import§);
      }
      
      public function §2#u§(param1:int) : void
      {
         this.§override native§.§!G§(param1);
         this.§ "C§.§!G§(param1);
      }
      
      public function applyForces(param1:Number, param2:Number, param3:Number) : void
      {
         this.§dynamic package implements§();
         this.§=!>§(param3);
         this.§false set const§(param1,param2,param3);
         this.§%"r§();
      }
      
      private function §dynamic package implements§() : void
      {
         var _loc1_:Number = this.body.scene.gravity.length() * this.body.mass;
         this.§import set switch§.§?1§ = _loc1_ / (2 * §native catch var§.§null package package§ * (this.§import set switch§.§true package native§ - this.§import set switch§.§8#'§));
      }
      
      private function §=!>§(param1:Number) : void
      {
         this.§override native§.§=!>§(param1);
         this.§ "C§.§=!>§(param1);
      }
      
      private function §false set const§(param1:Number, param2:Number, param3:Number) : void
      {
         if(this.§override native§.§continue const override§ + this.§ "C§.§continue const override§ > 0)
         {
            this.§false const super§(param1,param2,param3);
         }
      }
      
      private function §false const super§(param1:Number, param2:Number, param3:Number) : void
      {
         var _loc4_:Vector3 = null;
         var _loc5_:Vector3 = null;
         var _loc6_:Matrix3 = null;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:int = 0;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:int = 0;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc24_:int = this.§4;§ ? int(0) : int(this.§in var native§);
         var _loc25_:int = this.§4;§ ? int(0) : int(this.§include package import§);
         _loc4_ = this.body.state.velocity;
         _loc5_ = this.body.state.angularVelocity;
         _loc6_ = this.body.baseMatrix;
         §""l§.x = _loc6_.m00;
         §""l§.y = _loc6_.m10;
         §""l§.z = _loc6_.m20;
         §use package super§.x = _loc6_.m01;
         §use package super§.y = _loc6_.m11;
         §use package super§.z = _loc6_.m21;
         §do catch true§.x = _loc6_.m02;
         §do catch true§.y = _loc6_.m12;
         §do catch true§.z = _loc6_.m22;
         _loc7_ = 1;
         var _loc26_:Number = Math.PI / 4;
         var _loc27_:Number = §native catch var§.§null catch true§;
         if(§do catch true§.z < Math.cos(_loc26_))
         {
            if(§do catch true§.z < Math.cos(_loc27_))
            {
               _loc7_ = 0;
            }
            else
            {
               _loc7_ = (_loc27_ - Math.acos(§do catch true§.z)) / (_loc27_ - _loc26_);
            }
         }
         this.§case for var§(§break for break§,§continue catch do§);
         _relativeVelocity.x = _loc4_.x - §break for break§.x;
         _relativeVelocity.y = _loc4_.y - §break for break§.y;
         _relativeVelocity.z = _loc4_.z - §break for break§.z;
         §7d§.x = _loc5_.x - §continue catch do§.x;
         §7d§.y = _loc5_.y - §continue catch do§.y;
         §7d§.z = _loc5_.z - §continue catch do§.z;
         var _loc28_:Number = _relativeVelocity.x * §use package super§.x + _relativeVelocity.y * §use package super§.y + _relativeVelocity.z * §use package super§.z;
         var _loc29_:Number = §7d§.x * §do catch true§.x + §7d§.y * §do catch true§.y + §7d§.z * §do catch true§.z;
         var _loc30_:Number = _relativeVelocity.x * §""l§.x + _relativeVelocity.y * §""l§.y + _relativeVelocity.z * §""l§.z;
         var _loc31_:Number = this.§class set override§.getNumber() * _loc7_ * param3;
         if(_loc30_ < 0)
         {
            if(_loc31_ > -_loc30_)
            {
               _loc30_ = 0;
            }
            else
            {
               _loc30_ += _loc31_;
            }
         }
         else if(_loc30_ > 0)
         {
            if(_loc31_ > _loc30_)
            {
               _loc30_ = 0;
            }
            else
            {
               _loc30_ -= _loc31_;
            }
         }
         _relativeVelocity.setLengthAlongDirection(§""l§,_loc30_);
         _loc4_.x = §break for break§.x + _relativeVelocity.x;
         _loc4_.y = §break for break§.y + _relativeVelocity.y;
         _loc4_.z = §break for break§.z + _relativeVelocity.z;
         var _loc32_:int = this.§override native§.§continue const override§;
         var _loc33_:int = this.§ "C§.§continue const override§;
         var _loc34_:Number = this.§finally const extends§.getNumber();
         var _loc35_:Number = this.§use package true§.getNumber();
         if(_loc32_ > 0 || _loc33_ > 0)
         {
            _loc8_ = 0;
            if(_loc24_ == 0)
            {
               _loc8_ = -MathUtils.sign(_loc28_) * _loc34_ * param3;
               if(MathUtils.sign(_loc28_) != MathUtils.sign(_loc28_ + _loc8_))
               {
                  _loc8_ = -_loc28_;
               }
            }
            else
            {
               if(MathUtils.sign(_loc28_) * MathUtils.sign(_loc24_) < 0)
               {
                  _loc34_ = this.§for var§.getNumber();
               }
               _loc8_ = _loc24_ * _loc34_ * param3;
            }
            _loc9_ = MathUtils.clamp(_loc28_ + _loc8_,-param1,param1);
            _loc10_ = _loc9_ - _loc28_;
            _loc11_ = 1;
            _loc12_ = MathUtils.clamp(1 - Math.abs(_loc28_ / param1),0,1);
            if(_loc12_ < _loc11_ && _loc24_ * MathUtils.sign(_loc28_) > 0)
            {
               _loc10_ *= _loc12_ / _loc11_;
            }
            _loc13_ = _loc10_ / param3;
            if(Math.abs(_loc13_) < §catch var implements§ && Math.abs(_loc9_) > 0.5 * this.§[#0§.§try package finally§())
            {
               _loc13_ = MathUtils.numberSign(_loc13_,0.1) * §catch var implements§;
            }
            _loc14_ = _loc13_ * this.body.mass;
            _loc15_ = _loc32_ + _loc33_;
            _loc16_ = _loc14_ * (_loc15_ + 0.21 * (20 - _loc15_)) / 10;
            _loc17_ = _loc16_ / _loc15_;
            _loc18_ = Math.PI / 4;
            _loc19_ = Math.PI / 3;
            _loc20_ = 0;
            while(_loc20_ < §native catch var§.§null package package§)
            {
               this.§while implements§(this.§override native§.§@"y§[_loc20_],§use package super§,_loc17_,_loc19_,_loc18_);
               this.§while implements§(this.§ "C§.§@"y§[_loc20_],§use package super§,_loc17_,_loc19_,_loc18_);
               _loc20_++;
            }
            _loc21_ = 1;
            if(_loc32_ == 0 || _loc33_ == 0)
            {
               _loc21_ = 0.5;
            }
            _loc22_ = 0;
            if(_loc25_ == 0)
            {
               _loc22_ = -MathUtils.sign(_loc29_) * _loc35_ * _loc7_ * param3;
               if(MathUtils.sign(_loc29_) != MathUtils.sign(_loc29_ + _loc22_))
               {
                  _loc22_ = -_loc29_;
               }
            }
            else
            {
               if(this.§@"`§(_loc25_,_loc29_,_loc24_,this.§false set switch§))
               {
                  _loc35_ = this.§function var dynamic§.getNumber();
               }
               _loc22_ = _loc25_ * _loc35_ * _loc7_ * param3;
               if(_loc24_ == -1 && this.§false set switch§)
               {
                  _loc22_ = -_loc22_;
               }
            }
            _loc23_ = MathUtils.clamp(_loc29_ + _loc22_,-param2 * _loc21_,param2 * _loc21_);
            §7d§.setLengthAlongDirection(§do catch true§,_loc23_);
            _loc5_.x = §continue catch do§.x + §7d§.x;
            _loc5_.y = §continue catch do§.y + §7d§.y;
            _loc5_.z = §continue catch do§.z + §7d§.z;
         }
      }
      
      private function §@"`§(param1:int, param2:Number, param3:int, param4:Boolean) : Boolean
      {
         var _loc5_:int = param4 && param3 < 0 ? int(-1) : int(1);
         return param1 * param2 * _loc5_ < 0;
      }
      
      private function §case for var§(param1:Vector3, param2:Vector3) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:§9!c§ = null;
         var _loc5_:int = 0;
         var _loc6_:Vector3 = null;
         _loc3_ = 1 / (this.§override native§.§continue const override§ + this.§ "C§.§continue const override§);
         var _loc7_:Number = 0;
         var _loc8_:Number = 0;
         var _loc9_:Number = 0;
         _loc5_ = 0;
         while(_loc5_ < §native catch var§.§null package package§)
         {
            _loc4_ = this.§override native§.§@"y§[_loc5_];
            if(_loc4_.§="§)
            {
               _loc6_ = _loc4_.§extends const default§.position;
               _loc7_ += _loc6_.x;
               _loc8_ += _loc6_.y;
               _loc9_ += _loc6_.z;
            }
            _loc4_ = this.§ "C§.§@"y§[_loc5_];
            if(_loc4_.§="§)
            {
               _loc6_ = _loc4_.§extends const default§.position;
               _loc7_ += _loc6_.x;
               _loc8_ += _loc6_.y;
               _loc9_ += _loc6_.z;
            }
            _loc5_++;
         }
         _loc7_ *= _loc3_;
         _loc8_ *= _loc3_;
         _loc9_ *= _loc3_;
         §native super§.x = _loc7_;
         §native super§.y = _loc8_;
         §native super§.z = _loc9_;
         param1.x = 0;
         param1.y = 0;
         param1.z = 0;
         param2.x = 0;
         param2.y = 0;
         param2.z = 0;
         _loc5_ = 0;
         while(_loc5_ < §native catch var§.§null package package§)
         {
            this.§3"t§(this.§override native§.§@"y§[_loc5_],§native super§,param1,param2);
            this.§3"t§(this.§ "C§.§@"y§[_loc5_],§native super§,param1,param2);
            _loc5_++;
         }
         param1.x *= _loc3_;
         param1.y *= _loc3_;
         param1.z *= _loc3_;
         param2.x *= _loc3_;
         param2.y *= _loc3_;
         param2.z *= _loc3_;
      }
      
      private function §3"t§(param1:§9!c§, param2:Vector3, param3:Vector3, param4:Vector3) : void
      {
         var _loc5_:Vector3 = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Vector3 = null;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         if(param1.§="§)
         {
            param3.x += param1.§`"`§.x;
            param3.y += param1.§`"`§.y;
            param3.z += param1.§`"`§.z;
            _loc5_ = param1.§extends const default§.position;
            _loc6_ = _loc5_.x - param2.x;
            _loc7_ = _loc5_.y - param2.y;
            _loc8_ = _loc5_.z - param2.z;
            _loc9_ = _loc6_ * _loc6_ + _loc7_ * _loc7_ + _loc8_ * _loc8_;
            if(_loc9_ > 1)
            {
               _loc10_ = 1 / _loc9_;
               _loc11_ = param1.§`"`§;
               _loc12_ = (_loc7_ * _loc11_.z - _loc8_ * _loc11_.y) * _loc10_;
               _loc13_ = (_loc8_ * _loc11_.x - _loc6_ * _loc11_.z) * _loc10_;
               _loc14_ = (_loc6_ * _loc11_.y - _loc7_ * _loc11_.x) * _loc10_;
               param4.x += _loc12_;
               param4.y += _loc13_;
               param4.z += _loc14_;
            }
         }
      }
      
      private function §while implements§(param1:§9!c§, param2:Vector3, param3:Number, param4:Number, param5:Number) : void
      {
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         if(param1.§="§)
         {
            _loc6_ = param2.x;
            _loc7_ = param2.y;
            _loc8_ = param2.z;
            _loc9_ = _loc6_ * _loc6_ + _loc7_ * _loc7_ + _loc8_ * _loc8_;
            if(_loc9_ > 0.00001)
            {
               _loc10_ = Math.acos(param1.§extends const default§.normal.z);
               if(_loc10_ < 0)
               {
                  _loc10_ = -_loc10_;
               }
               if(_loc10_ < param4)
               {
                  _loc11_ = param3 / Math.sqrt(_loc9_);
                  if(_loc10_ > param5)
                  {
                     _loc11_ *= (param4 - _loc10_) / (param4 - param5);
                  }
                  §class return§.x = _loc6_ * _loc11_;
                  §class return§.y = _loc7_ * _loc11_;
                  §class return§.z = _loc8_ * _loc11_;
                  this.body.addWorldForceAtLocalPoint(param1.§6"6§(),§class return§);
               }
            }
         }
      }
      
      private function §%"r§() : void
      {
         var _loc1_:Matrix3 = null;
         var _loc2_:Vector3 = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         if(this.§ "C§.§continue const override§ >= this.§ "C§.§@x§ >> 1 || this.§override native§.§continue const override§ >= this.§override native§.§@x§ >> 1)
         {
            _loc1_ = this.body.baseMatrix;
            _loc2_ = this.body.scene.gravity;
            _loc3_ = _loc2_.x * _loc1_.m02 + _loc2_.y * _loc1_.m12 + _loc2_.z * _loc1_.m22;
            _loc4_ = _loc2_.length();
            _loc5_ = Math.SQRT1_2 * _loc4_;
            if(_loc3_ < -_loc5_ || _loc3_ > _loc5_)
            {
               _loc6_ = (_loc1_.m02 * _loc3_ - _loc2_.x) * this.body.mass;
               _loc7_ = (_loc1_.m12 * _loc3_ - _loc2_.y) * this.body.mass;
               _loc8_ = (_loc1_.m22 * _loc3_ - _loc2_.z) * this.body.mass;
               this.body.addForceXYZ(_loc6_,_loc7_,_loc8_);
            }
         }
      }
      
      public function reset() : void
      {
         this.§4;§ = false;
      }
   }
}

