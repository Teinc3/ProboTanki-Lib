package alternativa.engine3d.core
{
   import alternativa.engine3d.alternativa3d;
   
   use namespace alternativa3d;
   
   public class Light3D extends Object3D
   {
      public var color:uint;
      
      public var intensity:Number = 1;
      
      alternativa3d var localWeight:Number;
      
      alternativa3d var localRed:Number;
      
      alternativa3d var localGreen:Number;
      
      alternativa3d var localBlue:Number;
      
      alternativa3d var cma:Number;
      
      alternativa3d var cmb:Number;
      
      alternativa3d var cmc:Number;
      
      alternativa3d var cmd:Number;
      
      alternativa3d var cme:Number;
      
      alternativa3d var cmf:Number;
      
      alternativa3d var cmg:Number;
      
      alternativa3d var cmh:Number;
      
      alternativa3d var cmi:Number;
      
      alternativa3d var cmj:Number;
      
      alternativa3d var cmk:Number;
      
      alternativa3d var cml:Number;
      
      alternativa3d var oma:Number;
      
      alternativa3d var omb:Number;
      
      alternativa3d var omc:Number;
      
      alternativa3d var omd:Number;
      
      alternativa3d var ome:Number;
      
      alternativa3d var omf:Number;
      
      alternativa3d var omg:Number;
      
      alternativa3d var omh:Number;
      
      alternativa3d var omi:Number;
      
      alternativa3d var omj:Number;
      
      alternativa3d var omk:Number;
      
      alternativa3d var oml:Number;
      
      alternativa3d var nextLight:Light3D;
      
      public function Light3D()
      {
         super();
      }
      
      override public function clone() : Object3D
      {
         var _loc1_:Light3D = new Light3D();
         _loc1_.clonePropertiesFrom(this);
         return _loc1_;
      }
      
      override protected function clonePropertiesFrom(param1:Object3D) : void
      {
         super.clonePropertiesFrom(param1);
         var _loc2_:Light3D = param1 as Light3D;
         this.color = _loc2_.color;
         this.intensity = _loc2_.intensity;
      }
      
      alternativa3d function calculateCameraMatrix(param1:Camera3D) : void
      {
         alternativa3d::composeMatrix();
         var _loc2_:Object3D = this;
         while(_loc2_.alternativa3d::_parent != null)
         {
            _loc2_ = _loc2_.alternativa3d::_parent;
            _loc2_.alternativa3d::composeMatrix();
            alternativa3d::appendMatrix(_loc2_);
         }
         alternativa3d::appendMatrix(param1);
         this.alternativa3d::cma = alternativa3d::ma;
         this.alternativa3d::cmb = alternativa3d::mb;
         this.alternativa3d::cmc = alternativa3d::mc;
         this.alternativa3d::cmd = alternativa3d::md;
         this.alternativa3d::cme = alternativa3d::me;
         this.alternativa3d::cmf = alternativa3d::mf;
         this.alternativa3d::cmg = alternativa3d::mg;
         this.alternativa3d::cmh = alternativa3d::mh;
         this.alternativa3d::cmi = alternativa3d::mi;
         this.alternativa3d::cmj = alternativa3d::mj;
         this.alternativa3d::cmk = alternativa3d::mk;
         this.alternativa3d::cml = alternativa3d::ml;
      }
      
      alternativa3d function calculateObjectMatrix(param1:Object3D) : void
      {
         this.alternativa3d::oma = param1.alternativa3d::ima * this.alternativa3d::cma + param1.alternativa3d::imb * this.alternativa3d::cme + param1.alternativa3d::imc * this.alternativa3d::cmi;
         this.alternativa3d::omb = param1.alternativa3d::ima * this.alternativa3d::cmb + param1.alternativa3d::imb * this.alternativa3d::cmf + param1.alternativa3d::imc * this.alternativa3d::cmj;
         this.alternativa3d::omc = param1.alternativa3d::ima * this.alternativa3d::cmc + param1.alternativa3d::imb * this.alternativa3d::cmg + param1.alternativa3d::imc * this.alternativa3d::cmk;
         this.alternativa3d::omd = param1.alternativa3d::ima * this.alternativa3d::cmd + param1.alternativa3d::imb * this.alternativa3d::cmh + param1.alternativa3d::imc * this.alternativa3d::cml + param1.alternativa3d::imd;
         this.alternativa3d::ome = param1.alternativa3d::ime * this.alternativa3d::cma + param1.alternativa3d::imf * this.alternativa3d::cme + param1.alternativa3d::img * this.alternativa3d::cmi;
         this.alternativa3d::omf = param1.alternativa3d::ime * this.alternativa3d::cmb + param1.alternativa3d::imf * this.alternativa3d::cmf + param1.alternativa3d::img * this.alternativa3d::cmj;
         this.alternativa3d::omg = param1.alternativa3d::ime * this.alternativa3d::cmc + param1.alternativa3d::imf * this.alternativa3d::cmg + param1.alternativa3d::img * this.alternativa3d::cmk;
         this.alternativa3d::omh = param1.alternativa3d::ime * this.alternativa3d::cmd + param1.alternativa3d::imf * this.alternativa3d::cmh + param1.alternativa3d::img * this.alternativa3d::cml + param1.alternativa3d::imh;
         this.alternativa3d::omi = param1.alternativa3d::imi * this.alternativa3d::cma + param1.alternativa3d::imj * this.alternativa3d::cme + param1.alternativa3d::imk * this.alternativa3d::cmi;
         this.alternativa3d::omj = param1.alternativa3d::imi * this.alternativa3d::cmb + param1.alternativa3d::imj * this.alternativa3d::cmf + param1.alternativa3d::imk * this.alternativa3d::cmj;
         this.alternativa3d::omk = param1.alternativa3d::imi * this.alternativa3d::cmc + param1.alternativa3d::imj * this.alternativa3d::cmg + param1.alternativa3d::imk * this.alternativa3d::cmk;
         this.alternativa3d::oml = param1.alternativa3d::imi * this.alternativa3d::cmd + param1.alternativa3d::imj * this.alternativa3d::cmh + param1.alternativa3d::imk * this.alternativa3d::cml + param1.alternativa3d::iml;
      }
      
      override alternativa3d function setParent(param1:Object3DContainer) : void
      {
         var _loc2_:Object3DContainer = null;
         var _loc3_:Light3D = null;
         var _loc4_:Light3D = null;
         if(param1 == null)
         {
            _loc2_ = alternativa3d::_parent;
            while(_loc2_.alternativa3d::_parent != null)
            {
               _loc2_ = _loc2_.alternativa3d::_parent;
            }
            _loc4_ = _loc2_.alternativa3d::lightList;
            while(_loc4_ != null)
            {
               if(_loc4_ == this)
               {
                  if(_loc3_ != null)
                  {
                     _loc3_.alternativa3d::nextLight = this.alternativa3d::nextLight;
                  }
                  else
                  {
                     _loc2_.alternativa3d::lightList = this.alternativa3d::nextLight;
                  }
                  this.alternativa3d::nextLight = null;
                  break;
               }
               _loc3_ = _loc4_;
               _loc4_ = _loc4_.alternativa3d::nextLight;
            }
         }
         else
         {
            _loc2_ = param1;
            while(_loc2_.alternativa3d::_parent != null)
            {
               _loc2_ = _loc2_.alternativa3d::_parent;
            }
            this.alternativa3d::nextLight = _loc2_.alternativa3d::lightList;
            _loc2_.alternativa3d::lightList = this;
         }
         alternativa3d::_parent = param1;
      }
      
      alternativa3d function drawDebug(param1:Camera3D) : void
      {
      }
      
      override alternativa3d function updateBounds(param1:Object3D, param2:Object3D = null) : void
      {
         param1.boundMinX = -1e+22;
         param1.boundMinY = -1e+22;
         param1.boundMinZ = -1e+22;
         param1.boundMaxX = 1e+22;
         param1.boundMaxY = 1e+22;
         param1.boundMaxZ = 1e+22;
      }
      
      override alternativa3d function cullingInCamera(param1:Camera3D, param2:int) : int
      {
         return -1;
      }
      
      alternativa3d function checkFrustumCulling(param1:Camera3D) : Boolean
      {
         var _loc2_:Vertex = alternativa3d::boundVertexList;
         _loc2_.x = boundMinX;
         _loc2_.y = boundMinY;
         _loc2_.z = boundMinZ;
         _loc2_ = _loc2_.alternativa3d::next;
         _loc2_.x = boundMaxX;
         _loc2_.y = boundMinY;
         _loc2_.z = boundMinZ;
         _loc2_ = _loc2_.alternativa3d::next;
         _loc2_.x = boundMinX;
         _loc2_.y = boundMaxY;
         _loc2_.z = boundMinZ;
         _loc2_ = _loc2_.alternativa3d::next;
         _loc2_.x = boundMaxX;
         _loc2_.y = boundMaxY;
         _loc2_.z = boundMinZ;
         _loc2_ = _loc2_.alternativa3d::next;
         _loc2_.x = boundMinX;
         _loc2_.y = boundMinY;
         _loc2_.z = boundMaxZ;
         _loc2_ = _loc2_.alternativa3d::next;
         _loc2_.x = boundMaxX;
         _loc2_.y = boundMinY;
         _loc2_.z = boundMaxZ;
         _loc2_ = _loc2_.alternativa3d::next;
         _loc2_.x = boundMinX;
         _loc2_.y = boundMaxY;
         _loc2_.z = boundMaxZ;
         _loc2_ = _loc2_.alternativa3d::next;
         _loc2_.x = boundMaxX;
         _loc2_.y = boundMaxY;
         _loc2_.z = boundMaxZ;
         _loc2_ = alternativa3d::boundVertexList;
         while(_loc2_ != null)
         {
            _loc2_.alternativa3d::cameraX = alternativa3d::ma * _loc2_.x + alternativa3d::mb * _loc2_.y + alternativa3d::mc * _loc2_.z + alternativa3d::md;
            _loc2_.alternativa3d::cameraY = alternativa3d::me * _loc2_.x + alternativa3d::mf * _loc2_.y + alternativa3d::mg * _loc2_.z + alternativa3d::mh;
            _loc2_.alternativa3d::cameraZ = alternativa3d::mi * _loc2_.x + alternativa3d::mj * _loc2_.y + alternativa3d::mk * _loc2_.z + alternativa3d::ml;
            _loc2_ = _loc2_.alternativa3d::next;
         }
         _loc2_ = alternativa3d::boundVertexList;
         while(_loc2_ != null)
         {
            if(_loc2_.alternativa3d::cameraZ > param1.nearClipping)
            {
               break;
            }
            _loc2_ = _loc2_.alternativa3d::next;
         }
         if(_loc2_ == null)
         {
            return false;
         }
         _loc2_ = alternativa3d::boundVertexList;
         while(_loc2_ != null)
         {
            if(_loc2_.alternativa3d::cameraZ < param1.farClipping)
            {
               break;
            }
            _loc2_ = _loc2_.alternativa3d::next;
         }
         if(_loc2_ == null)
         {
            return false;
         }
         _loc2_ = alternativa3d::boundVertexList;
         while(_loc2_ != null)
         {
            if(-_loc2_.alternativa3d::cameraX < _loc2_.alternativa3d::cameraZ)
            {
               break;
            }
            _loc2_ = _loc2_.alternativa3d::next;
         }
         if(_loc2_ == null)
         {
            return false;
         }
         _loc2_ = alternativa3d::boundVertexList;
         while(_loc2_ != null)
         {
            if(_loc2_.alternativa3d::cameraX < _loc2_.alternativa3d::cameraZ)
            {
               break;
            }
            _loc2_ = _loc2_.alternativa3d::next;
         }
         if(_loc2_ == null)
         {
            return false;
         }
         _loc2_ = alternativa3d::boundVertexList;
         while(_loc2_ != null)
         {
            if(-_loc2_.alternativa3d::cameraY < _loc2_.alternativa3d::cameraZ)
            {
               break;
            }
            _loc2_ = _loc2_.alternativa3d::next;
         }
         if(_loc2_ == null)
         {
            return false;
         }
         _loc2_ = alternativa3d::boundVertexList;
         while(_loc2_ != null)
         {
            if(_loc2_.alternativa3d::cameraY < _loc2_.alternativa3d::cameraZ)
            {
               break;
            }
            _loc2_ = _loc2_.alternativa3d::next;
         }
         if(_loc2_ == null)
         {
            return false;
         }
         return true;
      }
      
      alternativa3d function checkBoundsIntersection(param1:Object3D) : Boolean
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = (boundMaxX - boundMinX) * 0.5;
         var _loc5_:Number = (boundMaxY - boundMinY) * 0.5;
         var _loc6_:Number = (boundMaxZ - boundMinZ) * 0.5;
         var _loc7_:Number = this.alternativa3d::oma * _loc4_;
         var _loc8_:Number = this.alternativa3d::ome * _loc4_;
         var _loc9_:Number = this.alternativa3d::omi * _loc4_;
         var _loc10_:Number = this.alternativa3d::omb * _loc5_;
         var _loc11_:Number = this.alternativa3d::omf * _loc5_;
         var _loc12_:Number = this.alternativa3d::omj * _loc5_;
         var _loc13_:Number = this.alternativa3d::omc * _loc6_;
         var _loc14_:Number = this.alternativa3d::omg * _loc6_;
         var _loc15_:Number = this.alternativa3d::omk * _loc6_;
         var _loc16_:Number = (param1.boundMaxX - param1.boundMinX) * 0.5;
         var _loc17_:Number = (param1.boundMaxY - param1.boundMinY) * 0.5;
         var _loc18_:Number = (param1.boundMaxZ - param1.boundMinZ) * 0.5;
         var _loc19_:Number = this.alternativa3d::oma * (boundMinX + _loc4_) + this.alternativa3d::omb * (boundMinY + _loc5_) + this.alternativa3d::omc * (boundMinZ + _loc6_) + this.alternativa3d::omd - param1.boundMinX - _loc16_;
         var _loc20_:Number = this.alternativa3d::ome * (boundMinX + _loc4_) + this.alternativa3d::omf * (boundMinY + _loc5_) + this.alternativa3d::omg * (boundMinZ + _loc6_) + this.alternativa3d::omh - param1.boundMinY - _loc17_;
         var _loc21_:Number = this.alternativa3d::omi * (boundMinX + _loc4_) + this.alternativa3d::omj * (boundMinY + _loc5_) + this.alternativa3d::omk * (boundMinZ + _loc6_) + this.alternativa3d::oml - param1.boundMinZ - _loc18_;
         _loc2_ = 0;
         _loc3_ = _loc7_ >= 0 ? Number(_loc7_) : Number(-_loc7_);
         _loc2_ += _loc3_;
         _loc3_ = _loc10_ >= 0 ? Number(_loc10_) : Number(-_loc10_);
         _loc2_ += _loc3_;
         _loc3_ = _loc13_ >= 0 ? Number(_loc13_) : Number(-_loc13_);
         _loc2_ += _loc3_;
         _loc2_ += _loc16_;
         _loc3_ = _loc19_ >= 0 ? Number(_loc19_) : Number(-_loc19_);
         _loc2_ -= _loc3_;
         if(_loc2_ <= 0)
         {
            return false;
         }
         _loc2_ = 0;
         _loc3_ = _loc8_ >= 0 ? Number(_loc8_) : Number(-_loc8_);
         _loc2_ += _loc3_;
         _loc3_ = _loc11_ >= 0 ? Number(_loc11_) : Number(-_loc11_);
         _loc2_ += _loc3_;
         _loc3_ = _loc14_ >= 0 ? Number(_loc14_) : Number(-_loc14_);
         _loc2_ += _loc3_;
         _loc2_ += _loc17_;
         _loc3_ = _loc20_ >= 0 ? Number(_loc20_) : Number(-_loc20_);
         _loc2_ -= _loc3_;
         if(_loc2_ <= 0)
         {
            return false;
         }
         _loc2_ = 0;
         _loc3_ = _loc9_ >= 0 ? Number(_loc9_) : Number(-_loc9_);
         _loc2_ += _loc3_;
         _loc3_ = _loc12_ >= 0 ? Number(_loc12_) : Number(-_loc12_);
         _loc2_ += _loc3_;
         _loc3_ = _loc15_ >= 0 ? Number(_loc15_) : Number(-_loc15_);
         _loc2_ += _loc3_;
         _loc2_ += _loc17_;
         _loc3_ = _loc21_ >= 0 ? Number(_loc21_) : Number(-_loc21_);
         _loc2_ -= _loc3_;
         if(_loc2_ <= 0)
         {
            return false;
         }
         _loc2_ = 0;
         _loc3_ = this.alternativa3d::oma * _loc7_ + this.alternativa3d::ome * _loc8_ + this.alternativa3d::omi * _loc9_;
         _loc3_ = _loc3_ >= 0 ? Number(_loc3_) : Number(-_loc3_);
         _loc2_ += _loc3_;
         _loc3_ = this.alternativa3d::oma * _loc10_ + this.alternativa3d::ome * _loc11_ + this.alternativa3d::omi * _loc12_;
         _loc3_ = _loc3_ >= 0 ? Number(_loc3_) : Number(-_loc3_);
         _loc2_ += _loc3_;
         _loc3_ = this.alternativa3d::oma * _loc13_ + this.alternativa3d::ome * _loc14_ + this.alternativa3d::omi * _loc15_;
         _loc3_ = _loc3_ >= 0 ? Number(_loc3_) : Number(-_loc3_);
         _loc2_ += _loc3_;
         _loc3_ = this.alternativa3d::oma >= 0 ? Number(this.alternativa3d::oma * _loc16_) : Number(-this.alternativa3d::oma * _loc16_);
         _loc2_ += _loc3_;
         _loc3_ = this.alternativa3d::ome >= 0 ? Number(this.alternativa3d::ome * _loc17_) : Number(-this.alternativa3d::ome * _loc17_);
         _loc2_ += _loc3_;
         _loc3_ = this.alternativa3d::omi >= 0 ? Number(this.alternativa3d::omi * _loc18_) : Number(-this.alternativa3d::omi * _loc18_);
         _loc2_ += _loc3_;
         _loc3_ = this.alternativa3d::oma * _loc19_ + this.alternativa3d::ome * _loc20_ + this.alternativa3d::omi * _loc21_;
         _loc3_ = _loc3_ >= 0 ? Number(_loc3_) : Number(-_loc3_);
         _loc2_ -= _loc3_;
         if(_loc2_ <= 0)
         {
            return false;
         }
         _loc2_ = 0;
         _loc3_ = this.alternativa3d::omb * _loc7_ + this.alternativa3d::omf * _loc8_ + this.alternativa3d::omj * _loc9_;
         _loc3_ = _loc3_ >= 0 ? Number(_loc3_) : Number(-_loc3_);
         _loc2_ += _loc3_;
         _loc3_ = this.alternativa3d::omb * _loc10_ + this.alternativa3d::omf * _loc11_ + this.alternativa3d::omj * _loc12_;
         _loc3_ = _loc3_ >= 0 ? Number(_loc3_) : Number(-_loc3_);
         _loc2_ += _loc3_;
         _loc3_ = this.alternativa3d::omb * _loc13_ + this.alternativa3d::omf * _loc14_ + this.alternativa3d::omj * _loc15_;
         _loc3_ = _loc3_ >= 0 ? Number(_loc3_) : Number(-_loc3_);
         _loc2_ += _loc3_;
         _loc3_ = this.alternativa3d::omb >= 0 ? Number(this.alternativa3d::omb * _loc16_) : Number(-this.alternativa3d::omb * _loc16_);
         _loc2_ += _loc3_;
         _loc3_ = this.alternativa3d::omf >= 0 ? Number(this.alternativa3d::omf * _loc17_) : Number(-this.alternativa3d::omf * _loc17_);
         _loc2_ += _loc3_;
         _loc3_ = this.alternativa3d::omj >= 0 ? Number(this.alternativa3d::omj * _loc18_) : Number(-this.alternativa3d::omj * _loc18_);
         _loc2_ += _loc3_;
         _loc3_ = this.alternativa3d::omb * _loc19_ + this.alternativa3d::omf * _loc20_ + this.alternativa3d::omj * _loc21_;
         _loc3_ = _loc3_ >= 0 ? Number(_loc3_) : Number(-_loc3_);
         _loc2_ -= _loc3_;
         if(_loc2_ <= 0)
         {
            return false;
         }
         _loc2_ = 0;
         _loc3_ = this.alternativa3d::omc * _loc7_ + this.alternativa3d::omg * _loc8_ + this.alternativa3d::omk * _loc9_;
         _loc3_ = _loc3_ >= 0 ? Number(_loc3_) : Number(-_loc3_);
         _loc2_ += _loc3_;
         _loc3_ = this.alternativa3d::omc * _loc10_ + this.alternativa3d::omg * _loc11_ + this.alternativa3d::omk * _loc12_;
         _loc3_ = _loc3_ >= 0 ? Number(_loc3_) : Number(-_loc3_);
         _loc2_ += _loc3_;
         _loc3_ = this.alternativa3d::omc * _loc13_ + this.alternativa3d::omg * _loc14_ + this.alternativa3d::omk * _loc15_;
         _loc3_ = _loc3_ >= 0 ? Number(_loc3_) : Number(-_loc3_);
         _loc2_ += _loc3_;
         _loc3_ = this.alternativa3d::omc >= 0 ? Number(this.alternativa3d::omc * _loc16_) : Number(-this.alternativa3d::omc * _loc16_);
         _loc2_ += _loc3_;
         _loc3_ = this.alternativa3d::omg >= 0 ? Number(this.alternativa3d::omg * _loc17_) : Number(-this.alternativa3d::omg * _loc17_);
         _loc2_ += _loc3_;
         _loc3_ = this.alternativa3d::omk >= 0 ? Number(this.alternativa3d::omk * _loc18_) : Number(-this.alternativa3d::omk * _loc18_);
         _loc2_ += _loc3_;
         _loc3_ = this.alternativa3d::omc * _loc19_ + this.alternativa3d::omg * _loc20_ + this.alternativa3d::omk * _loc21_;
         _loc3_ = _loc3_ >= 0 ? Number(_loc3_) : Number(-_loc3_);
         _loc2_ -= _loc3_;
         if(_loc2_ <= 0)
         {
            return false;
         }
         return true;
      }
   }
}

