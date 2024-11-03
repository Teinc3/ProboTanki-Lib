package Renamed838
{
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.objects.tank.Renamed947;
   import alternativa.tanks.battle.objects.tank.Renamed1049;
   import alternativa.tanks.utils.EncryptedNumber;
   import alternativa.tanks.utils.EncryptedNumberImpl;
   import alternativa.tanks.utils.MathUtils;
   
   public class Renamed910
   {
      private static const Renamed5758:Number = 400;
      
      private static const Renamed3374:Vector3 = new Vector3();
      
      private static const Renamed5759:Vector3 = new Vector3();
      
      private static const Renamed5760:Vector3 = new Vector3();
      
      private static const Renamed5761:Vector3 = new Vector3();
      
      private static const Renamed5762:Vector3 = new Vector3();
      
      private static const _relativeVelocity:Vector3 = new Vector3();
      
      private static const Renamed5763:Vector3 = new Vector3();
      
      private static const Renamed5764:Vector3 = new Vector3();
      
      private static const Renamed5765:Vector3 = new Vector3();
      
      private var body:Body;
      
      private var Renamed983:Renamed911;
      
      private var Renamed986:Renamed947;
      
      public var Renamed954:Renamed840;
      
      public var Renamed955:Renamed840;
      
      public var Renamed1038:Boolean;
      
      public var Renamed1035:int;
      
      public var Renamed1036:int;
      
      public var Renamed1037:Boolean;
      
      public function Renamed910(param1:Body, param2:Renamed911, param3:Renamed947, param4:Vector3)
      {
         this.Renamed973 = new EncryptedNumberImpl();
         this.Renamed5766 = new EncryptedNumberImpl();
         this.Renamed5767 = new EncryptedNumberImpl();
         this.Renamed5768 = new EncryptedNumberImpl();
         this.Renamed5769 = new EncryptedNumberImpl();
         super();
         this.body = param1;
         this.Renamed983 = param2;
         this.Renamed986 = param3;
         this.Renamed5770(Renamed1049.Renamed1164,param4);
      }
      
      private function Renamed5770(param1:int, param2:Vector3) : void
      {
         var _loc3_:Number = param2.y * 0.8;
         var _loc4_:Number = param2.x - 40;
         this.Renamed954 = new Renamed840(this.body,param1,new Vector3(-0.5 * _loc4_,0,-0.5 * param2.z + Renamed1049.Renamed952),_loc3_,this.Renamed983,-1);
         this.Renamed955 = new Renamed840(this.body,param1,new Vector3(0.5 * _loc4_,0,-0.5 * param2.z + Renamed1049.Renamed952),_loc3_,this.Renamed983,1);
      }
      
      public function Renamed1107(param1:Number) : void
      {
         this.Renamed973.setNumber(param1);
      }
      
      public function Renamed1108(param1:Number) : void
      {
         this.Renamed5766.setNumber(param1);
      }
      
      public function Renamed1109(param1:Number) : void
      {
         this.Renamed5767.setNumber(param1);
      }
      
      public function setTurnAcceleration(param1:Number) : void
      {
         this.Renamed5768.setNumber(param1);
      }
      
      public function Renamed1110(param1:Number) : void
      {
         this.Renamed5769.setNumber(param1);
      }
      
      public function Renamed1222() : Number
      {
         return this.Renamed973.getNumber();
      }
      
      public function Renamed1225() : int
      {
         return this.Renamed1038 ? int(0) : int(this.Renamed1035);
      }
      
      public function Renamed1226() : int
      {
         return this.Renamed1038 ? int(0) : int(this.Renamed1036);
      }
      
      public function Renamed1115(param1:int) : void
      {
         this.Renamed954.Renamed5771(param1);
         this.Renamed955.Renamed5771(param1);
      }
      
      public function applyForces(param1:Number, param2:Number, param3:Number) : void
      {
         this.Renamed5772();
         this.Renamed5773(param3);
         this.Renamed5774(param1,param2,param3);
         this.Renamed5775();
      }
      
      private function Renamed5772() : void
      {
         var _loc1_:Number = this.body.scene.gravity.length() * this.body.mass;
         this.Renamed983.Renamed5776 = _loc1_ / (2 * Renamed1049.Renamed1164 * (this.Renamed983.Renamed5777 - this.Renamed983.Renamed1048));
      }
      
      private function Renamed5773(param1:Number) : void
      {
         this.Renamed954.Renamed5773(param1);
         this.Renamed955.Renamed5773(param1);
      }
      
      private function Renamed5774(param1:Number, param2:Number, param3:Number) : void
      {
         if(this.Renamed954.Renamed1217 + this.Renamed955.Renamed1217 > 0)
         {
            this.Renamed5778(param1,param2,param3);
         }
      }
      
      private function Renamed5778(param1:Number, param2:Number, param3:Number) : void
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
         var _loc24_:int = this.Renamed1038 ? int(0) : int(this.Renamed1035);
         var _loc25_:int = this.Renamed1038 ? int(0) : int(this.Renamed1036);
         _loc4_ = this.body.state.velocity;
         _loc5_ = this.body.state.angularVelocity;
         _loc6_ = this.body.baseMatrix;
         Renamed3374.x = _loc6_.m00;
         Renamed3374.y = _loc6_.m10;
         Renamed3374.z = _loc6_.m20;
         Renamed5759.x = _loc6_.m01;
         Renamed5759.y = _loc6_.m11;
         Renamed5759.z = _loc6_.m21;
         Renamed5760.x = _loc6_.m02;
         Renamed5760.y = _loc6_.m12;
         Renamed5760.z = _loc6_.m22;
         _loc7_ = 1;
         var _loc26_:Number = Math.PI / 4;
         var _loc27_:Number = Renamed1049.Renamed1165;
         if(Renamed5760.z < Math.cos(_loc26_))
         {
            if(Renamed5760.z < Math.cos(_loc27_))
            {
               _loc7_ = 0;
            }
            else
            {
               _loc7_ = (_loc27_ - Math.acos(Renamed5760.z)) / (_loc27_ - _loc26_);
            }
         }
         this.Renamed5779(Renamed5761,Renamed5762);
         _relativeVelocity.x = _loc4_.x - Renamed5761.x;
         _relativeVelocity.y = _loc4_.y - Renamed5761.y;
         _relativeVelocity.z = _loc4_.z - Renamed5761.z;
         Renamed5763.x = _loc5_.x - Renamed5762.x;
         Renamed5763.y = _loc5_.y - Renamed5762.y;
         Renamed5763.z = _loc5_.z - Renamed5762.z;
         var _loc28_:Number = _relativeVelocity.x * Renamed5759.x + _relativeVelocity.y * Renamed5759.y + _relativeVelocity.z * Renamed5759.z;
         var _loc29_:Number = Renamed5763.x * Renamed5760.x + Renamed5763.y * Renamed5760.y + Renamed5763.z * Renamed5760.z;
         var _loc30_:Number = _relativeVelocity.x * Renamed3374.x + _relativeVelocity.y * Renamed3374.y + _relativeVelocity.z * Renamed3374.z;
         var _loc31_:Number = this.Renamed5767.getNumber() * _loc7_ * param3;
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
         _relativeVelocity.setLengthAlongDirection(Renamed3374,_loc30_);
         _loc4_.x = Renamed5761.x + _relativeVelocity.x;
         _loc4_.y = Renamed5761.y + _relativeVelocity.y;
         _loc4_.z = Renamed5761.z + _relativeVelocity.z;
         var _loc32_:int = this.Renamed954.Renamed1217;
         var _loc33_:int = this.Renamed955.Renamed1217;
         var _loc34_:Number = this.Renamed973.getNumber();
         var _loc35_:Number = this.Renamed5768.getNumber();
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
                  _loc34_ = this.Renamed5766.getNumber();
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
            if(Math.abs(_loc13_) < Renamed5758 && Math.abs(_loc9_) > 0.5 * this.Renamed986.Renamed1081())
            {
               _loc13_ = MathUtils.numberSign(_loc13_,0.1) * Renamed5758;
            }
            _loc14_ = _loc13_ * this.body.mass;
            _loc15_ = _loc32_ + _loc33_;
            _loc16_ = _loc14_ * (_loc15_ + 0.21 * (20 - _loc15_)) / 10;
            _loc17_ = _loc16_ / _loc15_;
            _loc18_ = Math.PI / 4;
            _loc19_ = Math.PI / 3;
            _loc20_ = 0;
            while(_loc20_ < Renamed1049.Renamed1164)
            {
               this.Renamed5780(this.Renamed954.Renamed861[_loc20_],Renamed5759,_loc17_,_loc19_,_loc18_);
               this.Renamed5780(this.Renamed955.Renamed861[_loc20_],Renamed5759,_loc17_,_loc19_,_loc18_);
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
               if(this.Renamed5781(_loc25_,_loc29_,_loc24_,this.Renamed1037))
               {
                  _loc35_ = this.Renamed5769.getNumber();
               }
               _loc22_ = _loc25_ * _loc35_ * _loc7_ * param3;
               if(_loc24_ == -1 && this.Renamed1037)
               {
                  _loc22_ = -_loc22_;
               }
            }
            _loc23_ = MathUtils.clamp(_loc29_ + _loc22_,-param2 * _loc21_,param2 * _loc21_);
            Renamed5763.setLengthAlongDirection(Renamed5760,_loc23_);
            _loc5_.x = Renamed5762.x + Renamed5763.x;
            _loc5_.y = Renamed5762.y + Renamed5763.y;
            _loc5_.z = Renamed5762.z + Renamed5763.z;
         }
      }
      
      private function Renamed5781(param1:int, param2:Number, param3:int, param4:Boolean) : Boolean
      {
         var _loc5_:int = param4 && param3 < 0 ? int(-1) : int(1);
         return param1 * param2 * _loc5_ < 0;
      }
      
      private function Renamed5779(param1:Vector3, param2:Vector3) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Renamed839 = null;
         var _loc5_:int = 0;
         var _loc6_:Vector3 = null;
         _loc3_ = 1 / (this.Renamed954.Renamed1217 + this.Renamed955.Renamed1217);
         var _loc7_:Number = 0;
         var _loc8_:Number = 0;
         var _loc9_:Number = 0;
         _loc5_ = 0;
         while(_loc5_ < Renamed1049.Renamed1164)
         {
            _loc4_ = this.Renamed954.Renamed861[_loc5_];
            if(_loc4_.Renamed5782)
            {
               _loc6_ = _loc4_.Renamed1299.position;
               _loc7_ += _loc6_.x;
               _loc8_ += _loc6_.y;
               _loc9_ += _loc6_.z;
            }
            _loc4_ = this.Renamed955.Renamed861[_loc5_];
            if(_loc4_.Renamed5782)
            {
               _loc6_ = _loc4_.Renamed1299.position;
               _loc7_ += _loc6_.x;
               _loc8_ += _loc6_.y;
               _loc9_ += _loc6_.z;
            }
            _loc5_++;
         }
         _loc7_ *= _loc3_;
         _loc8_ *= _loc3_;
         _loc9_ *= _loc3_;
         Renamed5765.x = _loc7_;
         Renamed5765.y = _loc8_;
         Renamed5765.z = _loc9_;
         param1.x = 0;
         param1.y = 0;
         param1.z = 0;
         param2.x = 0;
         param2.y = 0;
         param2.z = 0;
         _loc5_ = 0;
         while(_loc5_ < Renamed1049.Renamed1164)
         {
            this.Renamed5783(this.Renamed954.Renamed861[_loc5_],Renamed5765,param1,param2);
            this.Renamed5783(this.Renamed955.Renamed861[_loc5_],Renamed5765,param1,param2);
            _loc5_++;
         }
         param1.x *= _loc3_;
         param1.y *= _loc3_;
         param1.z *= _loc3_;
         param2.x *= _loc3_;
         param2.y *= _loc3_;
         param2.z *= _loc3_;
      }
      
      private function Renamed5783(param1:Renamed839, param2:Vector3, param3:Vector3, param4:Vector3) : void
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
         if(param1.Renamed5782)
         {
            param3.x += param1.Renamed5784.x;
            param3.y += param1.Renamed5784.y;
            param3.z += param1.Renamed5784.z;
            _loc5_ = param1.Renamed1299.position;
            _loc6_ = _loc5_.x - param2.x;
            _loc7_ = _loc5_.y - param2.y;
            _loc8_ = _loc5_.z - param2.z;
            _loc9_ = _loc6_ * _loc6_ + _loc7_ * _loc7_ + _loc8_ * _loc8_;
            if(_loc9_ > 1)
            {
               _loc10_ = 1 / _loc9_;
               _loc11_ = param1.Renamed5784;
               _loc12_ = (_loc7_ * _loc11_.z - _loc8_ * _loc11_.y) * _loc10_;
               _loc13_ = (_loc8_ * _loc11_.x - _loc6_ * _loc11_.z) * _loc10_;
               _loc14_ = (_loc6_ * _loc11_.y - _loc7_ * _loc11_.x) * _loc10_;
               param4.x += _loc12_;
               param4.y += _loc13_;
               param4.z += _loc14_;
            }
         }
      }
      
      private function Renamed5780(param1:Renamed839, param2:Vector3, param3:Number, param4:Number, param5:Number) : void
      {
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         if(param1.Renamed5782)
         {
            _loc6_ = param2.x;
            _loc7_ = param2.y;
            _loc8_ = param2.z;
            _loc9_ = _loc6_ * _loc6_ + _loc7_ * _loc7_ + _loc8_ * _loc8_;
            if(_loc9_ > 0.00001)
            {
               _loc10_ = Math.acos(param1.Renamed1299.normal.z);
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
                  Renamed5764.x = _loc6_ * _loc11_;
                  Renamed5764.y = _loc7_ * _loc11_;
                  Renamed5764.z = _loc8_ * _loc11_;
                  this.body.addWorldForceAtLocalPoint(param1.Renamed5785(),Renamed5764);
               }
            }
         }
      }
      
      private function Renamed5775() : void
      {
         var _loc1_:Matrix3 = null;
         var _loc2_:Vector3 = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         if(this.Renamed955.Renamed1217 >= this.Renamed955.Renamed860 >> 1 || this.Renamed954.Renamed1217 >= this.Renamed954.Renamed860 >> 1)
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
         this.Renamed1038 = false;
      }
   }
}

