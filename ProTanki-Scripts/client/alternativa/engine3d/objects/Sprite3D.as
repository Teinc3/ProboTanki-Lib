package alternativa.engine3d.objects
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.Debug;
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.RayIntersectionData;
   import alternativa.engine3d.core.VG;
   import alternativa.engine3d.core.Vertex;
   import alternativa.engine3d.core.Wrapper;
   import alternativa.engine3d.lights.OmniLight;
   import alternativa.engine3d.lights.SpotLight;
   import alternativa.engine3d.lights.TubeLight;
   import alternativa.engine3d.materials.Material;
   import alternativa.engine3d.materials.TextureMaterial;
   import flash.display.BitmapData;
   import flash.geom.Vector3D;
   import flash.utils.Dictionary;
   
   use namespace alternativa3d;
   
   public class Sprite3D extends Object3D
   {
      public var material:Material;
      
      public var originX:Number = 0.5;
      
      public var originY:Number = 0.5;
      
      public var sorting:int = 0;
      
      public var clipping:int = 2;
      
      public var rotation:Number = 0;
      
      public var autoSize:Boolean = false;
      
      public var width:Number;
      
      public var height:Number;
      
      public var perspectiveScale:Boolean = true;
      
      public var topLeftU:Number = 0;
      
      public var topLeftV:Number = 0;
      
      public var bottomRightU:Number = 1;
      
      public var bottomRightV:Number = 1;
      
      public var depthTest:Boolean = true;
      
      alternativa3d var lightConst:Vector.<Number>;
      
      alternativa3d var lighted:Boolean;
      
      public function Sprite3D(param1:Number, param2:Number, param3:Material = null)
      {
         this.alternativa3d::lightConst = Vector.<Number>([0,0,0,1]);
         super();
         this.width = param1;
         this.height = param2;
         this.material = param3;
         shadowMapAlphaThreshold = 100;
      }
      
      override public function intersectRay(param1:Vector3D, param2:Vector3D, param3:Dictionary = null, param4:Camera3D = null) : RayIntersectionData
      {
         var _loc5_:RayIntersectionData = null;
         var _loc6_:Vertex = null;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Vector3D = null;
         if(param4 == null || param3 != null && param3[this])
         {
            return null;
         }
         param4.alternativa3d::composeCameraMatrix();
         var _loc13_:Object3D = param4;
         while(_loc13_.alternativa3d::_parent != null)
         {
            _loc13_ = _loc13_.alternativa3d::_parent;
            _loc13_.alternativa3d::composeMatrix();
            param4.alternativa3d::appendMatrix(_loc13_);
         }
         param4.alternativa3d::invertMatrix();
         alternativa3d::composeMatrix();
         _loc13_ = this;
         while(_loc13_.alternativa3d::_parent != null)
         {
            _loc13_ = _loc13_.alternativa3d::_parent;
            _loc13_.alternativa3d::composeMatrix();
            alternativa3d::appendMatrix(_loc13_);
         }
         alternativa3d::appendMatrix(param4);
         alternativa3d::calculateInverseMatrix();
         var _loc14_:Number = param4.nearClipping;
         var _loc15_:Number = param4.farClipping;
         param4.nearClipping = -Number.MAX_VALUE;
         param4.farClipping = Number.MAX_VALUE;
         alternativa3d::culling = 0;
         var _loc16_:Face = this.calculateFace(param4);
         param4.nearClipping = _loc14_;
         param4.farClipping = _loc15_;
         var _loc17_:Wrapper = _loc16_.alternativa3d::wrapper;
         while(_loc17_ != null)
         {
            (_loc6_ = _loc17_.alternativa3d::vertex).x = alternativa3d::ima * _loc6_.alternativa3d::cameraX + alternativa3d::imb * _loc6_.alternativa3d::cameraY + alternativa3d::imc * _loc6_.alternativa3d::cameraZ + alternativa3d::imd;
            _loc6_.y = alternativa3d::ime * _loc6_.alternativa3d::cameraX + alternativa3d::imf * _loc6_.alternativa3d::cameraY + alternativa3d::img * _loc6_.alternativa3d::cameraZ + alternativa3d::imh;
            _loc6_.z = alternativa3d::imi * _loc6_.alternativa3d::cameraX + alternativa3d::imj * _loc6_.alternativa3d::cameraY + alternativa3d::imk * _loc6_.alternativa3d::cameraZ + alternativa3d::iml;
            _loc17_ = _loc17_.alternativa3d::next;
         }
         var _loc18_:Wrapper = _loc16_.alternativa3d::wrapper;
         var _loc19_:Vertex = _loc18_.alternativa3d::vertex;
         _loc18_ = _loc18_.alternativa3d::next;
         var _loc20_:Vertex = _loc18_.alternativa3d::vertex;
         _loc18_ = _loc18_.alternativa3d::next;
         var _loc21_:Vertex = _loc18_.alternativa3d::vertex;
         _loc18_ = _loc18_.alternativa3d::next;
         var _loc22_:Vertex = _loc18_.alternativa3d::vertex;
         _loc19_.u = this.topLeftU;
         _loc19_.v = this.topLeftV;
         _loc20_.u = this.topLeftU;
         _loc20_.v = this.bottomRightV;
         _loc21_.u = this.bottomRightU;
         _loc21_.v = this.bottomRightV;
         _loc22_.u = this.bottomRightU;
         _loc22_.v = this.topLeftV;
         var _loc23_:Number = _loc20_.x - _loc19_.x;
         var _loc24_:Number = _loc20_.y - _loc19_.y;
         var _loc25_:Number = _loc20_.z - _loc19_.z;
         var _loc26_:Number = _loc21_.x - _loc19_.x;
         var _loc27_:Number = _loc21_.y - _loc19_.y;
         var _loc28_:Number = _loc21_.z - _loc19_.z;
         _loc16_.alternativa3d::normalX = _loc28_ * _loc24_ - _loc27_ * _loc25_;
         _loc16_.alternativa3d::normalY = _loc26_ * _loc25_ - _loc28_ * _loc23_;
         _loc16_.alternativa3d::normalZ = _loc27_ * _loc23_ - _loc26_ * _loc24_;
         var _loc29_:Number = 1 / Math.sqrt(_loc16_.alternativa3d::normalX * _loc16_.alternativa3d::normalX + _loc16_.alternativa3d::normalY * _loc16_.alternativa3d::normalY + _loc16_.alternativa3d::normalZ * _loc16_.alternativa3d::normalZ);
         _loc16_.alternativa3d::normalX *= _loc29_;
         _loc16_.alternativa3d::normalY *= _loc29_;
         _loc16_.alternativa3d::normalZ *= _loc29_;
         _loc16_.alternativa3d::offset = _loc19_.x * _loc16_.alternativa3d::normalX + _loc19_.y * _loc16_.alternativa3d::normalY + _loc19_.z * _loc16_.alternativa3d::normalZ;
         var _loc30_:Number = param2.x * _loc16_.alternativa3d::normalX + param2.y * _loc16_.alternativa3d::normalY + param2.z * _loc16_.alternativa3d::normalZ;
         if(_loc30_ < 0)
         {
            _loc7_ = param1.x * _loc16_.alternativa3d::normalX + param1.y * _loc16_.alternativa3d::normalY + param1.z * _loc16_.alternativa3d::normalZ - _loc16_.alternativa3d::offset;
            if(_loc7_ > 0)
            {
               _loc8_ = -_loc7_ / _loc30_;
               _loc9_ = param1.x + param2.x * _loc8_;
               _loc10_ = param1.y + param2.y * _loc8_;
               _loc11_ = param1.z + param2.z * _loc8_;
               _loc17_ = _loc16_.alternativa3d::wrapper;
               while(_loc17_ != null)
               {
                  _loc19_ = _loc17_.alternativa3d::vertex;
                  _loc20_ = _loc17_.alternativa3d::next != null ? _loc17_.alternativa3d::next.alternativa3d::vertex : _loc16_.alternativa3d::wrapper.alternativa3d::vertex;
                  _loc23_ = _loc20_.x - _loc19_.x;
                  _loc24_ = _loc20_.y - _loc19_.y;
                  _loc25_ = _loc20_.z - _loc19_.z;
                  _loc26_ = _loc9_ - _loc19_.x;
                  _loc27_ = _loc10_ - _loc19_.y;
                  _loc28_ = _loc11_ - _loc19_.z;
                  if((_loc28_ * _loc24_ - _loc27_ * _loc25_) * _loc16_.alternativa3d::normalX + (_loc26_ * _loc25_ - _loc28_ * _loc23_) * _loc16_.alternativa3d::normalY + (_loc27_ * _loc23_ - _loc26_ * _loc24_) * _loc16_.alternativa3d::normalZ < 0)
                  {
                     break;
                  }
                  _loc17_ = _loc17_.alternativa3d::next;
               }
               if(_loc17_ == null)
               {
                  _loc12_ = new Vector3D(_loc9_,_loc10_,_loc11_);
                  (_loc5_ = new RayIntersectionData()).object = this;
                  _loc5_.face = null;
                  _loc5_.point = _loc12_;
                  _loc5_.uv = _loc16_.getUV(_loc12_);
                  _loc5_.time = _loc8_;
               }
            }
         }
         param4.alternativa3d::deferredDestroy();
         return _loc5_;
      }
      
      override public function clone() : Object3D
      {
         var _loc1_:Sprite3D = new Sprite3D(this.width,this.height);
         _loc1_.clonePropertiesFrom(this);
         return _loc1_;
      }
      
      override protected function clonePropertiesFrom(param1:Object3D) : void
      {
         super.clonePropertiesFrom(param1);
         var _loc2_:Sprite3D = param1 as Sprite3D;
         this.width = _loc2_.width;
         this.height = _loc2_.height;
         this.autoSize = _loc2_.autoSize;
         this.material = _loc2_.material;
         this.clipping = _loc2_.clipping;
         this.sorting = _loc2_.sorting;
         this.originX = _loc2_.originX;
         this.originY = _loc2_.originY;
         this.topLeftU = _loc2_.topLeftU;
         this.topLeftV = _loc2_.topLeftV;
         this.bottomRightU = _loc2_.bottomRightU;
         this.bottomRightV = _loc2_.bottomRightV;
         this.rotation = _loc2_.rotation;
         this.perspectiveScale = _loc2_.perspectiveScale;
      }
      
      override alternativa3d function draw(param1:Camera3D) : void
      {
         var _loc2_:int = 0;
         if(this.material == null)
         {
            return;
         }
         var _loc3_:Face = this.calculateFace(param1);
         if(_loc3_ != null)
         {
            this.alternativa3d::lighted = false;
            if(useLight && !param1.view.alternativa3d::constrained && param1.deferredLighting && param1.deferredLightingStrength > 0)
            {
               this.calculateLight(param1);
            }
            if(param1.debug && (_loc2_ = param1.alternativa3d::checkInDebug(this)) > 0)
            {
               if(_loc2_ & Debug.EDGES)
               {
                  Debug.alternativa3d::drawEdges(param1,_loc3_,16777215);
               }
               if(_loc2_ & Debug.BOUNDS)
               {
                  Debug.drawBounds(param1,this,boundMinX,boundMinY,boundMinZ,boundMaxX,boundMaxY,boundMaxZ);
               }
            }
            param1.alternativa3d::addTransparent(_loc3_,this);
         }
      }
      
      override alternativa3d function getVG(param1:Camera3D) : VG
      {
         if(this.material == null)
         {
            return null;
         }
         var _loc2_:Face = this.calculateFace(param1);
         if(_loc2_ != null)
         {
            this.alternativa3d::lighted = false;
            if(useLight && !param1.view.alternativa3d::constrained && param1.deferredLighting && param1.deferredLightingStrength > 0)
            {
               this.calculateLight(param1);
            }
            _loc2_.alternativa3d::normalX = 0;
            _loc2_.alternativa3d::normalY = 0;
            _loc2_.alternativa3d::normalZ = -1;
            _loc2_.alternativa3d::offset = -alternativa3d::ml;
            return VG.alternativa3d::create(this,_loc2_,this.sorting,param1.debug ? int(param1.alternativa3d::checkInDebug(this)) : int(0),true);
         }
         return null;
      }
      
      private function calculateLight(param1:Camera3D) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:OmniLight = null;
         var _loc12_:SpotLight = null;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:TubeLight = null;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:Number = param1.alternativa3d::viewSizeX / param1.alternativa3d::focalLength;
         var _loc23_:Number = param1.alternativa3d::viewSizeY / param1.alternativa3d::focalLength;
         if(!param1.view.alternativa3d::constrained && (param1.directionalLight != null && param1.directionalLightStrength > 0 || param1.shadowMap != null && param1.shadowMapStrength > 0))
         {
            this.alternativa3d::lightConst[0] = 0;
            this.alternativa3d::lightConst[1] = 0;
            this.alternativa3d::lightConst[2] = 0;
         }
         else
         {
            this.alternativa3d::lightConst[0] = 1;
            this.alternativa3d::lightConst[1] = 1;
            this.alternativa3d::lightConst[2] = 1;
         }
         var _loc24_:Number = alternativa3d::md * _loc22_;
         var _loc25_:Number = alternativa3d::mh * _loc23_;
         var _loc26_:Number = Number(alternativa3d::ml);
         var _loc27_:Number = Math.sqrt(_loc24_ * _loc24_ + _loc25_ * _loc25_ + _loc26_ * _loc26_);
         var _loc28_:Number = -_loc24_ / _loc27_;
         var _loc29_:Number = -_loc25_ / _loc27_;
         var _loc30_:Number = -_loc26_ / _loc27_;
         _loc2_ = 0;
         while(_loc2_ < param1.alternativa3d::omniesCount)
         {
            _loc11_ = param1.alternativa3d::omnies[_loc2_];
            _loc3_ = _loc11_.alternativa3d::cmd * _loc22_;
            _loc4_ = _loc11_.alternativa3d::cmh * _loc23_;
            _loc5_ = Number(_loc11_.alternativa3d::cml);
            _loc6_ = _loc11_.attenuationEnd;
            if(_loc3_ - _loc6_ < _loc24_ && _loc3_ + _loc6_ > _loc24_ && _loc4_ - _loc6_ < _loc25_ && _loc4_ + _loc6_ > _loc25_ && _loc5_ - _loc6_ < _loc26_ && _loc5_ + _loc6_ > _loc26_)
            {
               _loc3_ -= _loc24_;
               _loc4_ -= _loc25_;
               _loc5_ -= _loc26_;
               _loc27_ = Math.sqrt(_loc3_ * _loc3_ + _loc4_ * _loc4_ + _loc5_ * _loc5_);
               if(_loc27_ > 0 && _loc27_ < _loc6_)
               {
                  _loc3_ /= _loc27_;
                  _loc4_ /= _loc27_;
                  _loc5_ /= _loc27_;
                  _loc7_ = (_loc6_ - _loc27_) / (_loc11_.attenuationEnd - _loc11_.attenuationBegin);
                  if(_loc7_ > 1)
                  {
                     _loc7_ = 1;
                  }
                  if(_loc7_ < 0)
                  {
                     _loc7_ = 0;
                  }
                  _loc7_ *= _loc7_;
                  _loc9_ = _loc3_ * _loc28_ + _loc4_ * _loc29_ + _loc5_ * _loc30_;
                  _loc9_ = (_loc9_ = _loc9_ * 0.5) + 0.5;
                  _loc10_ = _loc7_ * _loc9_ * _loc11_.intensity * 2 * param1.deferredLightingStrength;
                  this.alternativa3d::lightConst[0] += _loc10_ * (_loc11_.color >> 16 & 0xFF) / 255;
                  this.alternativa3d::lightConst[1] += _loc10_ * (_loc11_.color >> 8 & 0xFF) / 255;
                  this.alternativa3d::lightConst[2] += _loc10_ * (_loc11_.color & 0xFF) / 255;
                  this.alternativa3d::lighted = true;
               }
            }
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < param1.alternativa3d::spotsCount)
         {
            _loc12_ = param1.alternativa3d::spots[_loc2_];
            _loc3_ = _loc12_.alternativa3d::cmd * _loc22_;
            _loc4_ = _loc12_.alternativa3d::cmh * _loc23_;
            _loc5_ = Number(_loc12_.alternativa3d::cml);
            _loc6_ = _loc12_.attenuationEnd;
            if(_loc3_ - _loc6_ < _loc24_ && _loc3_ + _loc6_ > _loc24_ && _loc4_ - _loc6_ < _loc25_ && _loc4_ + _loc6_ > _loc25_ && _loc5_ - _loc6_ < _loc26_ && _loc5_ + _loc6_ > _loc26_)
            {
               _loc3_ -= _loc24_;
               _loc4_ -= _loc25_;
               _loc5_ -= _loc26_;
               _loc27_ = Math.sqrt(_loc3_ * _loc3_ + _loc4_ * _loc4_ + _loc5_ * _loc5_);
               if(_loc27_ > 0 && _loc27_ < _loc6_)
               {
                  _loc3_ /= _loc27_;
                  _loc4_ /= _loc27_;
                  _loc5_ /= _loc27_;
                  _loc13_ = -_loc3_ * _loc12_.alternativa3d::cmc * _loc22_ - _loc4_ * _loc12_.alternativa3d::cmg * _loc23_ - _loc5_ * _loc12_.alternativa3d::cmk;
                  _loc14_ = Math.cos(_loc12_.falloff * 0.5);
                  if(_loc13_ > _loc14_)
                  {
                     _loc9_ = _loc3_ * _loc28_ + _loc4_ * _loc29_ + _loc5_ * _loc30_;
                     _loc9_ = (_loc9_ = _loc9_ * 0.5) + 0.5;
                     _loc7_ = (_loc6_ - _loc27_) / (_loc12_.attenuationEnd - _loc12_.attenuationBegin);
                     if(_loc7_ > 1)
                     {
                        _loc7_ = 1;
                     }
                     if(_loc7_ < 0)
                     {
                        _loc7_ = 0;
                     }
                     _loc7_ *= _loc7_;
                     _loc8_ = (_loc13_ - _loc14_) / (Math.cos(_loc12_.hotspot * 0.5) - _loc14_);
                     if(_loc8_ > 1)
                     {
                        _loc8_ = 1;
                     }
                     if(_loc8_ < 0)
                     {
                        _loc8_ = 0;
                     }
                     _loc8_ *= _loc8_;
                     _loc10_ = _loc7_ * _loc8_ * _loc9_ * _loc12_.intensity * 2 * param1.deferredLightingStrength;
                     this.alternativa3d::lightConst[0] += _loc10_ * (_loc12_.color >> 16 & 0xFF) / 255;
                     this.alternativa3d::lightConst[1] += _loc10_ * (_loc12_.color >> 8 & 0xFF) / 255;
                     this.alternativa3d::lightConst[2] += _loc10_ * (_loc12_.color & 0xFF) / 255;
                     this.alternativa3d::lighted = true;
                  }
               }
            }
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < param1.alternativa3d::tubesCount)
         {
            _loc15_ = param1.alternativa3d::tubes[_loc2_];
            _loc17_ = (_loc16_ = _loc15_.length * 0.5) + _loc15_.falloff;
            _loc18_ = _loc15_.alternativa3d::cmc * _loc22_;
            _loc19_ = _loc15_.alternativa3d::cmg * _loc22_;
            _loc20_ = Number(_loc15_.alternativa3d::cmk);
            _loc3_ = _loc15_.alternativa3d::cmd * _loc22_ + _loc18_ * _loc16_;
            _loc4_ = _loc15_.alternativa3d::cmh * _loc23_ + _loc19_ * _loc16_;
            _loc5_ = _loc15_.alternativa3d::cml + _loc20_ * _loc16_;
            _loc21_ = _loc18_ * (_loc24_ - _loc3_) + _loc19_ * (_loc25_ - _loc4_) + _loc20_ * (_loc26_ - _loc5_);
            if(_loc21_ > -_loc17_ && _loc21_ < _loc17_)
            {
               _loc3_ += _loc18_ * _loc21_ - _loc24_;
               _loc4_ += _loc19_ * _loc21_ - _loc25_;
               _loc5_ += _loc20_ * _loc21_ - _loc26_;
               _loc27_ = Math.sqrt(_loc3_ * _loc3_ + _loc4_ * _loc4_ + _loc5_ * _loc5_);
               if(_loc27_ > 0 && _loc27_ < _loc15_.attenuationEnd)
               {
                  _loc3_ /= _loc27_;
                  _loc4_ /= _loc27_;
                  _loc5_ /= _loc27_;
                  _loc9_ = _loc3_ * _loc28_ + _loc4_ * _loc29_ + _loc5_ * _loc30_;
                  _loc9_ = (_loc9_ = _loc9_ * 0.5) + 0.5;
                  _loc7_ = (_loc15_.attenuationEnd - _loc27_) / (_loc15_.attenuationEnd - _loc15_.attenuationBegin);
                  if(_loc7_ > 1)
                  {
                     _loc7_ = 1;
                  }
                  if(_loc7_ < 0)
                  {
                     _loc7_ = 0;
                  }
                  _loc7_ *= _loc7_;
                  if(_loc21_ < 0)
                  {
                     _loc21_ = -_loc21_;
                  }
                  _loc8_ = (_loc17_ - _loc21_) / (_loc17_ - _loc16_);
                  if(_loc8_ > 1)
                  {
                     _loc8_ = 1;
                  }
                  if(_loc8_ < 0)
                  {
                     _loc8_ = 0;
                  }
                  _loc8_ *= _loc8_;
                  _loc10_ = _loc7_ * _loc8_ * _loc9_ * _loc15_.intensity * 2 * param1.deferredLightingStrength;
                  this.alternativa3d::lightConst[0] += _loc10_ * (_loc15_.color >> 16 & 0xFF) / 255;
                  this.alternativa3d::lightConst[1] += _loc10_ * (_loc15_.color >> 8 & 0xFF) / 255;
                  this.alternativa3d::lightConst[2] += _loc10_ * (_loc15_.color & 0xFF) / 255;
                  this.alternativa3d::lighted = true;
               }
            }
            _loc2_++;
         }
      }
      
      private function calculateFace(param1:Camera3D) : Face
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Vertex = null;
         var _loc11_:Vertex = null;
         var _loc12_:Number = NaN;
         var _loc13_:BitmapData = null;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         alternativa3d::culling &= 60;
         var _loc22_:Number = Number(alternativa3d::ml);
         if(_loc22_ <= param1.nearClipping || _loc22_ >= param1.farClipping)
         {
            return null;
         }
         var _loc23_:Number = this.width;
         var _loc24_:Number = this.height;
         var _loc25_:Number = this.bottomRightU - this.topLeftU;
         var _loc26_:Number = this.bottomRightV - this.topLeftV;
         if(this.autoSize && this.material is TextureMaterial)
         {
            _loc13_ = (this.material as TextureMaterial).texture;
            if(_loc13_ != null)
            {
               _loc23_ = _loc13_.width * _loc25_;
               _loc24_ = _loc13_.height * _loc26_;
            }
         }
         var _loc27_:Number = param1.alternativa3d::viewSizeX / _loc22_;
         var _loc28_:Number = param1.alternativa3d::viewSizeY / _loc22_;
         var _loc29_:Number = param1.alternativa3d::focalLength / _loc22_;
         var _loc30_:Number = param1.alternativa3d::focalLength / param1.alternativa3d::viewSizeX;
         var _loc31_:Number = param1.alternativa3d::focalLength / param1.alternativa3d::viewSizeY;
         _loc2_ = alternativa3d::ma / _loc30_;
         _loc3_ = alternativa3d::me / _loc31_;
         _loc12_ = Math.sqrt(_loc2_ * _loc2_ + _loc3_ * _loc3_ + alternativa3d::mi * alternativa3d::mi);
         _loc2_ = alternativa3d::mb / _loc30_;
         _loc3_ = alternativa3d::mf / _loc31_;
         _loc12_ += Math.sqrt(_loc2_ * _loc2_ + _loc3_ * _loc3_ + alternativa3d::mj * alternativa3d::mj);
         _loc2_ = alternativa3d::mc / _loc30_;
         _loc3_ = alternativa3d::mg / _loc31_;
         _loc12_ += Math.sqrt(_loc2_ * _loc2_ + _loc3_ * _loc3_ + alternativa3d::mk * alternativa3d::mk);
         _loc12_ = _loc12_ += Math.sqrt(_loc2_ * _loc2_ + _loc3_ * _loc3_ + alternativa3d::mk * alternativa3d::mk) / 3;
         if(!this.perspectiveScale)
         {
            _loc12_ /= _loc29_;
         }
         if(this.rotation == 0)
         {
            _loc14_ = _loc12_ * _loc23_ * _loc30_;
            _loc15_ = _loc12_ * _loc24_ * _loc31_;
            _loc2_ = alternativa3d::md - this.originX * _loc14_;
            _loc3_ = alternativa3d::mh - this.originY * _loc15_;
            _loc6_ = _loc2_ + _loc14_;
            _loc7_ = _loc3_ + _loc15_;
            if(alternativa3d::culling > 0 && (_loc2_ > _loc22_ || _loc3_ > _loc22_ || _loc6_ < -_loc22_ || _loc7_ < -_loc22_))
            {
               return null;
            }
            (_loc11_ = _loc10_ = Vertex.alternativa3d::createList(4)).alternativa3d::cameraX = _loc2_;
            _loc11_.alternativa3d::cameraY = _loc3_;
            _loc11_.alternativa3d::cameraZ = _loc22_;
            _loc11_.u = this.topLeftU;
            _loc11_.v = this.topLeftV;
            (_loc11_ = _loc11_.alternativa3d::next).alternativa3d::cameraX = _loc2_;
            _loc11_.alternativa3d::cameraY = _loc7_;
            _loc11_.alternativa3d::cameraZ = _loc22_;
            _loc11_.u = this.topLeftU;
            _loc11_.v = this.bottomRightV;
            (_loc11_ = _loc11_.alternativa3d::next).alternativa3d::cameraX = _loc6_;
            _loc11_.alternativa3d::cameraY = _loc7_;
            _loc11_.alternativa3d::cameraZ = _loc22_;
            _loc11_.u = this.bottomRightU;
            _loc11_.v = this.bottomRightV;
            (_loc11_ = _loc11_.alternativa3d::next).alternativa3d::cameraX = _loc6_;
            _loc11_.alternativa3d::cameraY = _loc3_;
            _loc11_.alternativa3d::cameraZ = _loc22_;
            _loc11_.u = this.bottomRightU;
            _loc11_.v = this.topLeftV;
         }
         else
         {
            _loc16_ = -Math.sin(this.rotation) * _loc12_;
            _loc17_ = Math.cos(this.rotation) * _loc12_;
            _loc18_ = _loc17_ * _loc23_ * _loc30_;
            _loc19_ = -_loc16_ * _loc23_ * _loc31_;
            _loc20_ = _loc16_ * _loc24_ * _loc30_;
            _loc21_ = _loc17_ * _loc24_ * _loc31_;
            _loc2_ = alternativa3d::md - this.originX * _loc18_ - this.originY * _loc20_;
            _loc3_ = alternativa3d::mh - this.originX * _loc19_ - this.originY * _loc21_;
            _loc4_ = _loc2_ + _loc20_;
            _loc5_ = _loc3_ + _loc21_;
            _loc6_ = _loc2_ + _loc18_ + _loc20_;
            _loc7_ = _loc3_ + _loc19_ + _loc21_;
            _loc8_ = _loc2_ + _loc18_;
            _loc9_ = _loc3_ + _loc19_;
            if(alternativa3d::culling > 0)
            {
               if(this.clipping == 1)
               {
                  if(alternativa3d::culling & 4 && _loc22_ <= -_loc2_ && _loc22_ <= -_loc4_ && _loc22_ <= -_loc6_ && _loc22_ <= -_loc8_)
                  {
                     return null;
                  }
                  if(alternativa3d::culling & 8 && _loc22_ <= _loc2_ && _loc22_ <= _loc4_ && _loc22_ <= _loc6_ && _loc22_ <= _loc8_)
                  {
                     return null;
                  }
                  if(alternativa3d::culling & 0x10 && _loc22_ <= -_loc3_ && _loc22_ <= -_loc5_ && _loc22_ <= -_loc7_ && _loc22_ <= -_loc9_)
                  {
                     return null;
                  }
                  if(alternativa3d::culling & 0x20 && _loc22_ <= _loc3_ && _loc22_ <= _loc5_ && _loc22_ <= _loc7_ && _loc22_ <= _loc9_)
                  {
                     return null;
                  }
                  (_loc11_ = _loc10_ = Vertex.alternativa3d::createList(4)).alternativa3d::cameraX = _loc2_;
                  _loc11_.alternativa3d::cameraY = _loc3_;
                  _loc11_.alternativa3d::cameraZ = _loc22_;
                  _loc11_.u = this.topLeftU;
                  _loc11_.v = this.topLeftV;
                  (_loc11_ = _loc11_.alternativa3d::next).alternativa3d::cameraX = _loc2_ + _loc20_;
                  _loc11_.alternativa3d::cameraY = _loc3_ + _loc21_;
                  _loc11_.alternativa3d::cameraZ = _loc22_;
                  _loc11_.u = this.topLeftU;
                  _loc11_.v = this.bottomRightV;
                  (_loc11_ = _loc11_.alternativa3d::next).alternativa3d::cameraX = _loc2_ + _loc18_ + _loc20_;
                  _loc11_.alternativa3d::cameraY = _loc3_ + _loc19_ + _loc21_;
                  _loc11_.alternativa3d::cameraZ = _loc22_;
                  _loc11_.u = this.bottomRightU;
                  _loc11_.v = this.bottomRightV;
                  (_loc11_ = _loc11_.alternativa3d::next).alternativa3d::cameraX = _loc2_ + _loc18_;
                  _loc11_.alternativa3d::cameraY = _loc3_ + _loc19_;
                  _loc11_.alternativa3d::cameraZ = _loc22_;
                  _loc11_.u = this.bottomRightU;
                  _loc11_.v = this.topLeftV;
               }
               else
               {
                  if(alternativa3d::culling & 4)
                  {
                     if(_loc22_ <= -_loc2_ && _loc22_ <= -_loc4_ && _loc22_ <= -_loc6_ && _loc22_ <= -_loc8_)
                     {
                        return null;
                     }
                     if(_loc22_ > -_loc2_ && _loc22_ > -_loc4_ && _loc22_ > -_loc6_ && _loc22_ > -_loc8_)
                     {
                        alternativa3d::culling &= 59;
                     }
                  }
                  if(alternativa3d::culling & 8)
                  {
                     if(_loc22_ <= _loc2_ && _loc22_ <= _loc4_ && _loc22_ <= _loc6_ && _loc22_ <= _loc8_)
                     {
                        return null;
                     }
                     if(_loc22_ > _loc2_ && _loc22_ > _loc4_ && _loc22_ > _loc6_ && _loc22_ > _loc8_)
                     {
                        alternativa3d::culling &= 55;
                     }
                  }
                  if(alternativa3d::culling & 0x10)
                  {
                     if(_loc22_ <= -_loc3_ && _loc22_ <= -_loc5_ && _loc22_ <= -_loc7_ && _loc22_ <= -_loc9_)
                     {
                        return null;
                     }
                     if(_loc22_ > -_loc3_ && _loc22_ > -_loc5_ && _loc22_ > -_loc7_ && _loc22_ > -_loc9_)
                     {
                        alternativa3d::culling &= 47;
                     }
                  }
                  if(alternativa3d::culling & 0x20)
                  {
                     if(_loc22_ <= _loc3_ && _loc22_ <= _loc5_ && _loc22_ <= _loc7_ && _loc22_ <= _loc9_)
                     {
                        return null;
                     }
                     if(_loc22_ > _loc3_ && _loc22_ > _loc5_ && _loc22_ > _loc7_ && _loc22_ > _loc9_)
                     {
                        alternativa3d::culling &= 31;
                     }
                  }
                  (_loc11_ = _loc10_ = Vertex.alternativa3d::createList(4)).alternativa3d::cameraX = _loc2_;
                  _loc11_.alternativa3d::cameraY = _loc3_;
                  _loc11_.alternativa3d::cameraZ = _loc22_;
                  _loc11_.u = this.topLeftU;
                  _loc11_.v = this.topLeftV;
                  (_loc11_ = _loc11_.alternativa3d::next).alternativa3d::cameraX = _loc2_ + _loc20_;
                  _loc11_.alternativa3d::cameraY = _loc3_ + _loc21_;
                  _loc11_.alternativa3d::cameraZ = _loc22_;
                  _loc11_.u = this.topLeftU;
                  _loc11_.v = this.bottomRightV;
                  (_loc11_ = _loc11_.alternativa3d::next).alternativa3d::cameraX = _loc2_ + _loc18_ + _loc20_;
                  _loc11_.alternativa3d::cameraY = _loc3_ + _loc19_ + _loc21_;
                  _loc11_.alternativa3d::cameraZ = _loc22_;
                  _loc11_.u = this.bottomRightU;
                  _loc11_.v = this.bottomRightV;
                  (_loc11_ = _loc11_.alternativa3d::next).alternativa3d::cameraX = _loc2_ + _loc18_;
                  _loc11_.alternativa3d::cameraY = _loc3_ + _loc19_;
                  _loc11_.alternativa3d::cameraZ = _loc22_;
                  _loc11_.u = this.bottomRightU;
                  _loc11_.v = this.topLeftV;
               }
            }
            else
            {
               (_loc11_ = _loc10_ = Vertex.alternativa3d::createList(4)).alternativa3d::cameraX = _loc2_;
               _loc11_.alternativa3d::cameraY = _loc3_;
               _loc11_.alternativa3d::cameraZ = _loc22_;
               _loc11_.u = this.topLeftU;
               _loc11_.v = this.topLeftV;
               (_loc11_ = _loc11_.alternativa3d::next).alternativa3d::cameraX = _loc2_ + _loc20_;
               _loc11_.alternativa3d::cameraY = _loc3_ + _loc21_;
               _loc11_.alternativa3d::cameraZ = _loc22_;
               _loc11_.u = this.topLeftU;
               _loc11_.v = this.bottomRightV;
               (_loc11_ = _loc11_.alternativa3d::next).alternativa3d::cameraX = _loc2_ + _loc18_ + _loc20_;
               _loc11_.alternativa3d::cameraY = _loc3_ + _loc19_ + _loc21_;
               _loc11_.alternativa3d::cameraZ = _loc22_;
               _loc11_.u = this.bottomRightU;
               _loc11_.v = this.bottomRightV;
               (_loc11_ = _loc11_.alternativa3d::next).alternativa3d::cameraX = _loc2_ + _loc18_;
               _loc11_.alternativa3d::cameraY = _loc3_ + _loc19_;
               _loc11_.alternativa3d::cameraZ = _loc22_;
               _loc11_.u = this.bottomRightU;
               _loc11_.v = this.topLeftV;
            }
         }
         param1.alternativa3d::lastVertex.alternativa3d::next = _loc10_;
         param1.alternativa3d::lastVertex = _loc11_;
         var _loc32_:Face;
         (_loc32_ = Face.alternativa3d::create()).material = this.material;
         param1.alternativa3d::lastFace.alternativa3d::next = _loc32_;
         param1.alternativa3d::lastFace = _loc32_;
         var _loc33_:Wrapper = Wrapper.alternativa3d::create();
         _loc32_.alternativa3d::wrapper = _loc33_;
         _loc33_.alternativa3d::vertex = _loc10_;
         _loc10_ = _loc10_.alternativa3d::next;
         while(_loc10_ != null)
         {
            _loc33_.alternativa3d::next = _loc33_.alternativa3d::create();
            (_loc33_ = _loc33_.alternativa3d::next).alternativa3d::vertex = _loc10_;
            _loc10_ = _loc10_.alternativa3d::next;
         }
         return _loc32_;
      }
      
      override alternativa3d function updateBounds(param1:Object3D, param2:Object3D = null) : void
      {
         var _loc3_:BitmapData = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = this.width;
         var _loc9_:Number = this.height;
         if(this.autoSize && this.material is TextureMaterial)
         {
            _loc3_ = (this.material as TextureMaterial).texture;
            if(_loc3_ != null)
            {
               _loc8_ = _loc3_.width * (this.bottomRightU - this.topLeftU);
               _loc9_ = _loc3_.height * (this.bottomRightV - this.topLeftV);
            }
         }
         var _loc10_:Number = (this.originX >= 0.5 ? this.originX : 1 - this.originX) * _loc8_;
         var _loc11_:Number = (this.originY >= 0.5 ? this.originY : 1 - this.originY) * _loc9_;
         var _loc12_:Number = Math.sqrt(_loc10_ * _loc10_ + _loc11_ * _loc11_);
         var _loc13_:Number = 0;
         var _loc14_:Number = 0;
         var _loc15_:Number = 0;
         if(param2 != null)
         {
            _loc4_ = param2.alternativa3d::ma;
            _loc5_ = param2.alternativa3d::me;
            _loc6_ = param2.alternativa3d::mi;
            _loc7_ = Math.sqrt(_loc4_ * _loc4_ + _loc5_ * _loc5_ + _loc6_ * _loc6_);
            _loc4_ = param2.alternativa3d::mb;
            _loc5_ = param2.alternativa3d::mf;
            _loc6_ = param2.alternativa3d::mj;
            _loc7_ += Math.sqrt(_loc4_ * _loc4_ + _loc5_ * _loc5_ + _loc6_ * _loc6_);
            _loc4_ = param2.alternativa3d::mc;
            _loc5_ = param2.alternativa3d::mg;
            _loc6_ = param2.alternativa3d::mk;
            _loc7_ += Math.sqrt(_loc4_ * _loc4_ + _loc5_ * _loc5_ + _loc6_ * _loc6_);
            _loc12_ *= _loc7_ / 3;
            _loc13_ = param2.alternativa3d::md;
            _loc14_ = param2.alternativa3d::mh;
            _loc15_ = param2.alternativa3d::ml;
         }
         if(_loc13_ - _loc12_ < param1.boundMinX)
         {
            param1.boundMinX = _loc13_ - _loc12_;
         }
         if(_loc13_ + _loc12_ > param1.boundMaxX)
         {
            param1.boundMaxX = _loc13_ + _loc12_;
         }
         if(_loc14_ - _loc12_ < param1.boundMinY)
         {
            param1.boundMinY = _loc14_ - _loc12_;
         }
         if(_loc14_ + _loc12_ > param1.boundMaxY)
         {
            param1.boundMaxY = _loc14_ + _loc12_;
         }
         if(_loc15_ - _loc12_ < param1.boundMinZ)
         {
            param1.boundMinZ = _loc15_ - _loc12_;
         }
         if(_loc15_ + _loc12_ > param1.boundMaxZ)
         {
            param1.boundMaxZ = _loc15_ + _loc12_;
         }
      }
   }
}

