package alternativa.physics.collision.primitives
{
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.physics.PhysicsMaterial;
   import alternativa.physics.collision.CollisionShape;
   import alternativa.physics.collision.types.AABB;
   
   public class CollisionBox extends CollisionShape
   {
      public var hs:Vector3;
      
      public function CollisionBox(param1:Vector3, param2:int, param3:PhysicsMaterial)
      {
         this.hs = new Vector3();
         super(BOX,param2,param3);
         this.hs.copy(param1);
      }
      
      override public function calculateAABB() : AABB
      {
         var _loc1_:Matrix4 = null;
         var _loc2_:AABB = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         _loc1_ = transform;
         _loc2_ = this.aabb;
         _loc3_ = _loc1_.m00 < 0 ? Number(-_loc1_.m00) : Number(_loc1_.m00);
         _loc4_ = _loc1_.m01 < 0 ? Number(-_loc1_.m01) : Number(_loc1_.m01);
         _loc5_ = _loc1_.m02 < 0 ? Number(-_loc1_.m02) : Number(_loc1_.m02);
         _loc2_.maxX = this.hs.x * _loc3_ + this.hs.y * _loc4_ + this.hs.z * _loc5_;
         _loc2_.minX = -_loc2_.maxX;
         _loc3_ = _loc1_.m10 < 0 ? Number(-_loc1_.m10) : Number(_loc1_.m10);
         _loc4_ = _loc1_.m11 < 0 ? Number(-_loc1_.m11) : Number(_loc1_.m11);
         _loc5_ = _loc1_.m12 < 0 ? Number(-_loc1_.m12) : Number(_loc1_.m12);
         _loc2_.maxY = this.hs.x * _loc3_ + this.hs.y * _loc4_ + this.hs.z * _loc5_;
         _loc2_.minY = -_loc2_.maxY;
         _loc3_ = _loc1_.m20 < 0 ? Number(-_loc1_.m20) : Number(_loc1_.m20);
         _loc4_ = _loc1_.m21 < 0 ? Number(-_loc1_.m21) : Number(_loc1_.m21);
         _loc5_ = _loc1_.m22 < 0 ? Number(-_loc1_.m22) : Number(_loc1_.m22);
         _loc2_.maxZ = this.hs.x * _loc3_ + this.hs.y * _loc4_ + this.hs.z * _loc5_;
         _loc2_.minZ = -_loc2_.maxZ;
         _loc2_.minX += _loc1_.m03;
         _loc2_.maxX += _loc1_.m03;
         _loc2_.minY += _loc1_.m13;
         _loc2_.maxY += _loc1_.m13;
         _loc2_.minZ += _loc1_.m23;
         _loc2_.maxZ += _loc1_.m23;
         return _loc2_;
      }
      
      override public function copyFrom(param1:CollisionShape) : CollisionShape
      {
         var _loc2_:CollisionBox = param1 as CollisionBox;
         if(_loc2_ == null)
         {
            return this;
         }
         super.copyFrom(_loc2_);
         this.hs.copy(_loc2_.hs);
         return this;
      }
      
      override protected function createPrimitive() : CollisionShape
      {
         return new CollisionBox(this.hs,collisionGroup,material);
      }
      
      override public function raycast(param1:Vector3, param2:Vector3, param3:Number, param4:Vector3) : Number
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Matrix4 = this.transform;
         var _loc8_:Number = -1;
         var _loc9_:Number = 1e+308;
         var _loc10_:Number = param1.x - _loc7_.m03;
         var _loc11_:Number = param1.y - _loc7_.m13;
         var _loc12_:Number = param1.z - _loc7_.m23;
         var _loc13_:Number = _loc7_.m00 * _loc10_ + _loc7_.m10 * _loc11_ + _loc7_.m20 * _loc12_;
         var _loc14_:Number = _loc7_.m01 * _loc10_ + _loc7_.m11 * _loc11_ + _loc7_.m21 * _loc12_;
         var _loc15_:Number = _loc7_.m02 * _loc10_ + _loc7_.m12 * _loc11_ + _loc7_.m22 * _loc12_;
         _loc10_ = _loc7_.m00 * param2.x + _loc7_.m10 * param2.y + _loc7_.m20 * param2.z;
         _loc11_ = _loc7_.m01 * param2.x + _loc7_.m11 * param2.y + _loc7_.m21 * param2.z;
         _loc12_ = _loc7_.m02 * param2.x + _loc7_.m12 * param2.y + _loc7_.m22 * param2.z;
         if(_loc10_ < param3 && _loc10_ > -param3)
         {
            if(_loc13_ < -this.hs.x || _loc13_ > this.hs.x)
            {
               return -1;
            }
         }
         else
         {
            _loc5_ = (-this.hs.x - _loc13_) / _loc10_;
            _loc6_ = (this.hs.x - _loc13_) / _loc10_;
            if(_loc5_ < _loc6_)
            {
               if(_loc5_ > _loc8_)
               {
                  _loc8_ = _loc5_;
                  param4.x = -1;
                  param4.y = param4.z = 0;
               }
               if(_loc6_ < _loc9_)
               {
                  _loc9_ = _loc6_;
               }
            }
            else
            {
               if(_loc6_ > _loc8_)
               {
                  _loc8_ = _loc6_;
                  param4.x = 1;
                  param4.y = param4.z = 0;
               }
               if(_loc5_ < _loc9_)
               {
                  _loc9_ = _loc5_;
               }
            }
            if(_loc9_ < _loc8_)
            {
               return -1;
            }
         }
         if(_loc11_ < param3 && _loc11_ > -param3)
         {
            if(_loc14_ < -this.hs.y || _loc14_ > this.hs.y)
            {
               return -1;
            }
         }
         else
         {
            _loc5_ = (-this.hs.y - _loc14_) / _loc11_;
            _loc6_ = (this.hs.y - _loc14_) / _loc11_;
            if(_loc5_ < _loc6_)
            {
               if(_loc5_ > _loc8_)
               {
                  _loc8_ = _loc5_;
                  param4.y = -1;
                  param4.x = param4.z = 0;
               }
               if(_loc6_ < _loc9_)
               {
                  _loc9_ = _loc6_;
               }
            }
            else
            {
               if(_loc6_ > _loc8_)
               {
                  _loc8_ = _loc6_;
                  param4.y = 1;
                  param4.x = param4.z = 0;
               }
               if(_loc5_ < _loc9_)
               {
                  _loc9_ = _loc5_;
               }
            }
            if(_loc9_ < _loc8_)
            {
               return -1;
            }
         }
         if(_loc12_ < param3 && _loc12_ > -param3)
         {
            if(_loc15_ < -this.hs.z || _loc15_ > this.hs.z)
            {
               return -1;
            }
         }
         else
         {
            _loc5_ = (-this.hs.z - _loc15_) / _loc12_;
            _loc6_ = (this.hs.z - _loc15_) / _loc12_;
            if(_loc5_ < _loc6_)
            {
               if(_loc5_ > _loc8_)
               {
                  _loc8_ = _loc5_;
                  param4.z = -1;
                  param4.x = param4.y = 0;
               }
               if(_loc6_ < _loc9_)
               {
                  _loc9_ = _loc6_;
               }
            }
            else
            {
               if(_loc6_ > _loc8_)
               {
                  _loc8_ = _loc6_;
                  param4.z = 1;
                  param4.x = param4.y = 0;
               }
               if(_loc5_ < _loc9_)
               {
                  _loc9_ = _loc5_;
               }
            }
            if(_loc9_ < _loc8_)
            {
               return -1;
            }
         }
         _loc10_ = param4.x;
         _loc11_ = param4.y;
         _loc12_ = param4.z;
         param4.x = _loc7_.m00 * _loc10_ + _loc7_.m01 * _loc11_ + _loc7_.m02 * _loc12_;
         param4.y = _loc7_.m10 * _loc10_ + _loc7_.m11 * _loc11_ + _loc7_.m12 * _loc12_;
         param4.z = _loc7_.m20 * _loc10_ + _loc7_.m21 * _loc11_ + _loc7_.m22 * _loc12_;
         return _loc8_;
      }
   }
}

