package alternativa.engine3d.lights
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.Debug;
   import alternativa.engine3d.core.Light3D;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.Vertex;
   import flash.display.Sprite;
   
   use namespace alternativa3d;
   
   public class SpotLight extends Light3D
   {
      public var attenuationBegin:Number;
      
      public var attenuationEnd:Number;
      
      public var hotspot:Number;
      
      public var falloff:Number;
      
      public function SpotLight(param1:uint, param2:Number, param3:Number, param4:Number, param5:Number)
      {
         super();
         this.color = param1;
         this.attenuationBegin = param2;
         this.attenuationEnd = param3;
         this.hotspot = param4;
         this.falloff = param5;
         calculateBounds();
      }
      
      public function lookAt(param1:Number, param2:Number, param3:Number) : void
      {
         var _loc5_:Number = NaN;
         var _loc4_:Number = NaN;
         _loc4_ = param1 - this.x;
         _loc5_ = param2 - this.y;
         var _loc6_:Number = param3 - this.z;
         rotationX = Math.atan2(_loc6_,Math.sqrt(_loc4_ * _loc4_ + _loc5_ * _loc5_)) - Math.PI / 2;
         rotationY = 0;
         rotationZ = -Math.atan2(_loc4_,_loc5_);
      }
      
      override public function clone() : Object3D
      {
         var _loc1_:SpotLight = new SpotLight(color,this.attenuationBegin,this.attenuationEnd,this.hotspot,this.falloff);
         _loc1_.clonePropertiesFrom(this);
         return _loc1_;
      }
      
      override alternativa3d function drawDebug(param1:Camera3D) : void
      {
         var _loc2_:Sprite = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:int = 0;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc24_:Number = NaN;
         var _loc25_:Number = NaN;
         var _loc26_:Number = NaN;
         var _loc27_:Number = NaN;
         var _loc28_:Number = NaN;
         var _loc29_:Number = NaN;
         var _loc30_:Number = NaN;
         var _loc31_:Number = NaN;
         var _loc32_:Number = NaN;
         var _loc33_:Number = NaN;
         var _loc34_:Number = NaN;
         var _loc35_:Number = NaN;
         var _loc36_:Number = NaN;
         var _loc37_:Number = NaN;
         var _loc38_:Number = NaN;
         var _loc39_:Number = NaN;
         var _loc40_:Number = NaN;
         var _loc41_:Number = NaN;
         var _loc42_:Number = NaN;
         var _loc43_:Number = NaN;
         var _loc44_:Number = NaN;
         var _loc45_:Number = NaN;
         var _loc46_:Number = NaN;
         var _loc47_:int = param1.alternativa3d::checkInDebug(this);
         if(_loc47_ > 0)
         {
            _loc2_ = param1.view.alternativa3d::canvas;
            if(Boolean(_loc47_ & Debug.LIGHTS) && alternativa3d::ml > param1.nearClipping)
            {
               _loc3_ = (color >> 16 & 0xFF) * intensity;
               _loc4_ = (color >> 8 & 0xFF) * intensity;
               _loc5_ = (color & 0xFF) * intensity;
               _loc6_ = ((_loc3_ > 255 ? 255 : _loc3_) << 16) + ((_loc4_ > 255 ? 255 : _loc4_) << 8) + (_loc5_ > 255 ? 255 : _loc5_);
               _loc7_ = 0;
               _loc8_ = alternativa3d::md * param1.alternativa3d::viewSizeX / param1.alternativa3d::focalLength;
               _loc9_ = alternativa3d::mh * param1.alternativa3d::viewSizeY / param1.alternativa3d::focalLength;
               _loc10_ = Number(alternativa3d::ml);
               _loc11_ = alternativa3d::mc * param1.alternativa3d::viewSizeX / param1.alternativa3d::focalLength;
               _loc12_ = alternativa3d::mg * param1.alternativa3d::viewSizeY / param1.alternativa3d::focalLength;
               _loc13_ = Number(alternativa3d::mk);
               _loc14_ = Math.sqrt(_loc11_ * _loc11_ + _loc12_ * _loc12_ + _loc13_ * _loc13_);
               _loc7_ += _loc14_;
               _loc11_ /= _loc14_;
               _loc12_ /= _loc14_;
               _loc13_ /= _loc14_;
               _loc15_ = alternativa3d::ma * param1.alternativa3d::viewSizeX / param1.alternativa3d::focalLength;
               _loc16_ = alternativa3d::me * param1.alternativa3d::viewSizeY / param1.alternativa3d::focalLength;
               _loc17_ = Number(alternativa3d::mi);
               _loc7_ += Math.sqrt(_loc15_ * _loc15_ + _loc16_ * _loc16_ + _loc17_ * _loc17_);
               _loc18_ = _loc17_ * _loc12_ - _loc16_ * _loc13_;
               _loc19_ = _loc15_ * _loc13_ - _loc17_ * _loc11_;
               _loc20_ = _loc16_ * _loc11_ - _loc15_ * _loc12_;
               _loc14_ = Math.sqrt(_loc18_ * _loc18_ + _loc19_ * _loc19_ + _loc20_ * _loc20_);
               _loc18_ /= _loc14_;
               _loc19_ /= _loc14_;
               _loc20_ /= _loc14_;
               _loc15_ = alternativa3d::mb * param1.alternativa3d::viewSizeX / param1.alternativa3d::focalLength;
               _loc16_ = alternativa3d::mf * param1.alternativa3d::viewSizeY / param1.alternativa3d::focalLength;
               _loc17_ = Number(alternativa3d::mj);
               _loc7_ += Math.sqrt(_loc15_ * _loc15_ + _loc16_ * _loc16_ + _loc17_ * _loc17_);
               _loc7_ = _loc7_ += Math.sqrt(_loc15_ * _loc15_ + _loc16_ * _loc16_ + _loc17_ * _loc17_) / 3;
               _loc15_ = _loc20_ * _loc12_ - _loc19_ * _loc13_;
               _loc16_ = _loc18_ * _loc13_ - _loc20_ * _loc11_;
               _loc17_ = _loc19_ * _loc11_ - _loc18_ * _loc12_;
               _loc21_ = Math.cos(this.hotspot / 2);
               _loc22_ = Math.sin(this.hotspot / 2);
               _loc23_ = _loc8_ + (_loc11_ * _loc21_ + _loc15_ * _loc22_) * _loc7_ * this.attenuationBegin;
               _loc24_ = _loc9_ + (_loc12_ * _loc21_ + _loc16_ * _loc22_) * _loc7_ * this.attenuationBegin;
               _loc25_ = _loc10_ + (_loc13_ * _loc21_ + _loc17_ * _loc22_) * _loc7_ * this.attenuationBegin;
               _loc26_ = _loc8_ + (_loc11_ * _loc21_ + (_loc15_ + _loc18_) * 0.9 * _loc22_) * _loc7_ * this.attenuationBegin;
               _loc27_ = _loc9_ + (_loc12_ * _loc21_ + (_loc16_ + _loc19_) * 0.9 * _loc22_) * _loc7_ * this.attenuationBegin;
               _loc28_ = _loc10_ + (_loc13_ * _loc21_ + (_loc17_ + _loc20_) * 0.9 * _loc22_) * _loc7_ * this.attenuationBegin;
               _loc29_ = _loc8_ + (_loc11_ * _loc21_ + _loc18_ * _loc22_) * _loc7_ * this.attenuationBegin;
               _loc30_ = _loc9_ + (_loc12_ * _loc21_ + _loc19_ * _loc22_) * _loc7_ * this.attenuationBegin;
               _loc31_ = _loc10_ + (_loc13_ * _loc21_ + _loc20_ * _loc22_) * _loc7_ * this.attenuationBegin;
               _loc32_ = _loc8_ + (_loc11_ * _loc21_ - (_loc15_ - _loc18_) * 0.9 * _loc22_) * _loc7_ * this.attenuationBegin;
               _loc33_ = _loc9_ + (_loc12_ * _loc21_ - (_loc16_ - _loc19_) * 0.9 * _loc22_) * _loc7_ * this.attenuationBegin;
               _loc34_ = _loc10_ + (_loc13_ * _loc21_ - (_loc17_ - _loc20_) * 0.9 * _loc22_) * _loc7_ * this.attenuationBegin;
               _loc35_ = _loc8_ + (_loc11_ * _loc21_ - _loc15_ * _loc22_) * _loc7_ * this.attenuationBegin;
               _loc36_ = _loc9_ + (_loc12_ * _loc21_ - _loc16_ * _loc22_) * _loc7_ * this.attenuationBegin;
               _loc37_ = _loc10_ + (_loc13_ * _loc21_ - _loc17_ * _loc22_) * _loc7_ * this.attenuationBegin;
               _loc38_ = _loc8_ + (_loc11_ * _loc21_ - (_loc15_ + _loc18_) * 0.9 * _loc22_) * _loc7_ * this.attenuationBegin;
               _loc39_ = _loc9_ + (_loc12_ * _loc21_ - (_loc16_ + _loc19_) * 0.9 * _loc22_) * _loc7_ * this.attenuationBegin;
               _loc40_ = _loc10_ + (_loc13_ * _loc21_ - (_loc17_ + _loc20_) * 0.9 * _loc22_) * _loc7_ * this.attenuationBegin;
               _loc41_ = _loc8_ + (_loc11_ * _loc21_ - _loc18_ * _loc22_) * _loc7_ * this.attenuationBegin;
               _loc42_ = _loc9_ + (_loc12_ * _loc21_ - _loc19_ * _loc22_) * _loc7_ * this.attenuationBegin;
               _loc43_ = _loc10_ + (_loc13_ * _loc21_ - _loc20_ * _loc22_) * _loc7_ * this.attenuationBegin;
               _loc44_ = _loc8_ + (_loc11_ * _loc21_ + (_loc15_ - _loc18_) * 0.9 * _loc22_) * _loc7_ * this.attenuationBegin;
               _loc45_ = _loc9_ + (_loc12_ * _loc21_ + (_loc16_ - _loc19_) * 0.9 * _loc22_) * _loc7_ * this.attenuationBegin;
               _loc46_ = _loc10_ + (_loc13_ * _loc21_ + (_loc17_ - _loc20_) * 0.9 * _loc22_) * _loc7_ * this.attenuationBegin;
               if(_loc25_ > param1.nearClipping && _loc28_ > param1.nearClipping && _loc31_ > param1.nearClipping && _loc34_ > param1.nearClipping && _loc37_ > param1.nearClipping && _loc40_ > param1.nearClipping && _loc43_ > param1.nearClipping && _loc46_ > param1.nearClipping)
               {
                  _loc2_.graphics.lineStyle(1,_loc6_);
                  _loc2_.graphics.moveTo(_loc23_ * param1.alternativa3d::focalLength / _loc25_,_loc24_ * param1.alternativa3d::focalLength / _loc25_);
                  _loc2_.graphics.curveTo(_loc26_ * param1.alternativa3d::focalLength / _loc28_,_loc27_ * param1.alternativa3d::focalLength / _loc28_,_loc29_ * param1.alternativa3d::focalLength / _loc31_,_loc30_ * param1.alternativa3d::focalLength / _loc31_);
                  _loc2_.graphics.curveTo(_loc32_ * param1.alternativa3d::focalLength / _loc34_,_loc33_ * param1.alternativa3d::focalLength / _loc34_,_loc35_ * param1.alternativa3d::focalLength / _loc37_,_loc36_ * param1.alternativa3d::focalLength / _loc37_);
                  _loc2_.graphics.curveTo(_loc38_ * param1.alternativa3d::focalLength / _loc40_,_loc39_ * param1.alternativa3d::focalLength / _loc40_,_loc41_ * param1.alternativa3d::focalLength / _loc43_,_loc42_ * param1.alternativa3d::focalLength / _loc43_);
                  _loc2_.graphics.curveTo(_loc44_ * param1.alternativa3d::focalLength / _loc46_,_loc45_ * param1.alternativa3d::focalLength / _loc46_,_loc23_ * param1.alternativa3d::focalLength / _loc25_,_loc24_ * param1.alternativa3d::focalLength / _loc25_);
                  _loc2_.graphics.moveTo(_loc8_ * param1.alternativa3d::focalLength / _loc10_,_loc9_ * param1.alternativa3d::focalLength / _loc10_);
                  _loc2_.graphics.lineTo(_loc23_ * param1.alternativa3d::focalLength / _loc25_,_loc24_ * param1.alternativa3d::focalLength / _loc25_);
                  _loc2_.graphics.moveTo(_loc8_ * param1.alternativa3d::focalLength / _loc10_,_loc9_ * param1.alternativa3d::focalLength / _loc10_);
                  _loc2_.graphics.lineTo(_loc29_ * param1.alternativa3d::focalLength / _loc31_,_loc30_ * param1.alternativa3d::focalLength / _loc31_);
                  _loc2_.graphics.moveTo(_loc8_ * param1.alternativa3d::focalLength / _loc10_,_loc9_ * param1.alternativa3d::focalLength / _loc10_);
                  _loc2_.graphics.lineTo(_loc35_ * param1.alternativa3d::focalLength / _loc37_,_loc36_ * param1.alternativa3d::focalLength / _loc37_);
                  _loc2_.graphics.moveTo(_loc8_ * param1.alternativa3d::focalLength / _loc10_,_loc9_ * param1.alternativa3d::focalLength / _loc10_);
                  _loc2_.graphics.lineTo(_loc41_ * param1.alternativa3d::focalLength / _loc43_,_loc42_ * param1.alternativa3d::focalLength / _loc43_);
               }
               _loc21_ = Math.cos(this.falloff / 2);
               _loc22_ = Math.sin(this.falloff / 2);
               _loc23_ = _loc8_ + (_loc11_ * _loc21_ + _loc15_ * _loc22_) * _loc7_ * this.attenuationEnd;
               _loc24_ = _loc9_ + (_loc12_ * _loc21_ + _loc16_ * _loc22_) * _loc7_ * this.attenuationEnd;
               _loc25_ = _loc10_ + (_loc13_ * _loc21_ + _loc17_ * _loc22_) * _loc7_ * this.attenuationEnd;
               _loc26_ = _loc8_ + (_loc11_ * _loc21_ + (_loc15_ + _loc18_) * 0.9 * _loc22_) * _loc7_ * this.attenuationEnd;
               _loc27_ = _loc9_ + (_loc12_ * _loc21_ + (_loc16_ + _loc19_) * 0.9 * _loc22_) * _loc7_ * this.attenuationEnd;
               _loc28_ = _loc10_ + (_loc13_ * _loc21_ + (_loc17_ + _loc20_) * 0.9 * _loc22_) * _loc7_ * this.attenuationEnd;
               _loc29_ = _loc8_ + (_loc11_ * _loc21_ + _loc18_ * _loc22_) * _loc7_ * this.attenuationEnd;
               _loc30_ = _loc9_ + (_loc12_ * _loc21_ + _loc19_ * _loc22_) * _loc7_ * this.attenuationEnd;
               _loc31_ = _loc10_ + (_loc13_ * _loc21_ + _loc20_ * _loc22_) * _loc7_ * this.attenuationEnd;
               _loc32_ = _loc8_ + (_loc11_ * _loc21_ - (_loc15_ - _loc18_) * 0.9 * _loc22_) * _loc7_ * this.attenuationEnd;
               _loc33_ = _loc9_ + (_loc12_ * _loc21_ - (_loc16_ - _loc19_) * 0.9 * _loc22_) * _loc7_ * this.attenuationEnd;
               _loc34_ = _loc10_ + (_loc13_ * _loc21_ - (_loc17_ - _loc20_) * 0.9 * _loc22_) * _loc7_ * this.attenuationEnd;
               _loc35_ = _loc8_ + (_loc11_ * _loc21_ - _loc15_ * _loc22_) * _loc7_ * this.attenuationEnd;
               _loc36_ = _loc9_ + (_loc12_ * _loc21_ - _loc16_ * _loc22_) * _loc7_ * this.attenuationEnd;
               _loc37_ = _loc10_ + (_loc13_ * _loc21_ - _loc17_ * _loc22_) * _loc7_ * this.attenuationEnd;
               _loc38_ = _loc8_ + (_loc11_ * _loc21_ - (_loc15_ + _loc18_) * 0.9 * _loc22_) * _loc7_ * this.attenuationEnd;
               _loc39_ = _loc9_ + (_loc12_ * _loc21_ - (_loc16_ + _loc19_) * 0.9 * _loc22_) * _loc7_ * this.attenuationEnd;
               _loc40_ = _loc10_ + (_loc13_ * _loc21_ - (_loc17_ + _loc20_) * 0.9 * _loc22_) * _loc7_ * this.attenuationEnd;
               _loc41_ = _loc8_ + (_loc11_ * _loc21_ - _loc18_ * _loc22_) * _loc7_ * this.attenuationEnd;
               _loc42_ = _loc9_ + (_loc12_ * _loc21_ - _loc19_ * _loc22_) * _loc7_ * this.attenuationEnd;
               _loc43_ = _loc10_ + (_loc13_ * _loc21_ - _loc20_ * _loc22_) * _loc7_ * this.attenuationEnd;
               _loc44_ = _loc8_ + (_loc11_ * _loc21_ + (_loc15_ - _loc18_) * 0.9 * _loc22_) * _loc7_ * this.attenuationEnd;
               _loc45_ = _loc9_ + (_loc12_ * _loc21_ + (_loc16_ - _loc19_) * 0.9 * _loc22_) * _loc7_ * this.attenuationEnd;
               _loc46_ = _loc10_ + (_loc13_ * _loc21_ + (_loc17_ - _loc20_) * 0.9 * _loc22_) * _loc7_ * this.attenuationEnd;
               if(_loc25_ > param1.nearClipping && _loc28_ > param1.nearClipping && _loc31_ > param1.nearClipping && _loc34_ > param1.nearClipping && _loc37_ > param1.nearClipping && _loc40_ > param1.nearClipping && _loc43_ > param1.nearClipping && _loc46_ > param1.nearClipping)
               {
                  _loc2_.graphics.lineStyle(1,_loc6_,0.5);
                  _loc2_.graphics.moveTo(_loc23_ * param1.alternativa3d::focalLength / _loc25_,_loc24_ * param1.alternativa3d::focalLength / _loc25_);
                  _loc2_.graphics.curveTo(_loc26_ * param1.alternativa3d::focalLength / _loc28_,_loc27_ * param1.alternativa3d::focalLength / _loc28_,_loc29_ * param1.alternativa3d::focalLength / _loc31_,_loc30_ * param1.alternativa3d::focalLength / _loc31_);
                  _loc2_.graphics.curveTo(_loc32_ * param1.alternativa3d::focalLength / _loc34_,_loc33_ * param1.alternativa3d::focalLength / _loc34_,_loc35_ * param1.alternativa3d::focalLength / _loc37_,_loc36_ * param1.alternativa3d::focalLength / _loc37_);
                  _loc2_.graphics.curveTo(_loc38_ * param1.alternativa3d::focalLength / _loc40_,_loc39_ * param1.alternativa3d::focalLength / _loc40_,_loc41_ * param1.alternativa3d::focalLength / _loc43_,_loc42_ * param1.alternativa3d::focalLength / _loc43_);
                  _loc2_.graphics.curveTo(_loc44_ * param1.alternativa3d::focalLength / _loc46_,_loc45_ * param1.alternativa3d::focalLength / _loc46_,_loc23_ * param1.alternativa3d::focalLength / _loc25_,_loc24_ * param1.alternativa3d::focalLength / _loc25_);
                  _loc2_.graphics.moveTo(_loc8_ * param1.alternativa3d::focalLength / _loc10_,_loc9_ * param1.alternativa3d::focalLength / _loc10_);
                  _loc2_.graphics.lineTo(_loc23_ * param1.alternativa3d::focalLength / _loc25_,_loc24_ * param1.alternativa3d::focalLength / _loc25_);
                  _loc2_.graphics.moveTo(_loc8_ * param1.alternativa3d::focalLength / _loc10_,_loc9_ * param1.alternativa3d::focalLength / _loc10_);
                  _loc2_.graphics.lineTo(_loc29_ * param1.alternativa3d::focalLength / _loc31_,_loc30_ * param1.alternativa3d::focalLength / _loc31_);
                  _loc2_.graphics.moveTo(_loc8_ * param1.alternativa3d::focalLength / _loc10_,_loc9_ * param1.alternativa3d::focalLength / _loc10_);
                  _loc2_.graphics.lineTo(_loc35_ * param1.alternativa3d::focalLength / _loc37_,_loc36_ * param1.alternativa3d::focalLength / _loc37_);
                  _loc2_.graphics.moveTo(_loc8_ * param1.alternativa3d::focalLength / _loc10_,_loc9_ * param1.alternativa3d::focalLength / _loc10_);
                  _loc2_.graphics.lineTo(_loc41_ * param1.alternativa3d::focalLength / _loc43_,_loc42_ * param1.alternativa3d::focalLength / _loc43_);
               }
            }
            if(_loc47_ & Debug.BOUNDS)
            {
               Debug.drawBounds(param1,this,boundMinX,boundMinY,boundMinZ,boundMaxX,boundMaxY,boundMaxZ,10092288);
            }
         }
      }
      
      override alternativa3d function updateBounds(param1:Object3D, param2:Object3D = null) : void
      {
         var _loc3_:Vertex = null;
         var _loc4_:Number = this.falloff < Math.PI ? Number(Math.sin(this.falloff / 2) * this.attenuationEnd) : Number(this.attenuationEnd);
         var _loc5_:Number = this.falloff < Math.PI ? Number(0) : Number(Math.cos(this.falloff / 2) * this.attenuationEnd);
         if(param2 != null)
         {
            _loc3_ = alternativa3d::boundVertexList;
            _loc3_.x = -_loc4_;
            _loc3_.y = -_loc4_;
            _loc3_.z = _loc5_;
            _loc3_ = _loc3_.alternativa3d::next;
            _loc3_.x = _loc4_;
            _loc3_.y = -_loc4_;
            _loc3_.z = _loc5_;
            _loc3_ = _loc3_.alternativa3d::next;
            _loc3_.x = -_loc4_;
            _loc3_.y = _loc4_;
            _loc3_.z = _loc5_;
            _loc3_ = _loc3_.alternativa3d::next;
            _loc3_.x = _loc4_;
            _loc3_.y = _loc4_;
            _loc3_.z = _loc5_;
            _loc3_ = _loc3_.alternativa3d::next;
            _loc3_.x = -_loc4_;
            _loc3_.y = -_loc4_;
            _loc3_.z = this.attenuationEnd;
            _loc3_ = _loc3_.alternativa3d::next;
            _loc3_.x = _loc4_;
            _loc3_.y = -_loc4_;
            _loc3_.z = this.attenuationEnd;
            _loc3_ = _loc3_.alternativa3d::next;
            _loc3_.x = -_loc4_;
            _loc3_.y = _loc4_;
            _loc3_.z = this.attenuationEnd;
            _loc3_ = _loc3_.alternativa3d::next;
            _loc3_.x = _loc4_;
            _loc3_.y = _loc4_;
            _loc3_.z = this.attenuationEnd;
            _loc3_ = alternativa3d::boundVertexList;
            while(_loc3_ != null)
            {
               _loc3_.alternativa3d::cameraX = param2.alternativa3d::ma * _loc3_.x + param2.alternativa3d::mb * _loc3_.y + param2.alternativa3d::mc * _loc3_.z + param2.alternativa3d::md;
               _loc3_.alternativa3d::cameraY = param2.alternativa3d::me * _loc3_.x + param2.alternativa3d::mf * _loc3_.y + param2.alternativa3d::mg * _loc3_.z + param2.alternativa3d::mh;
               _loc3_.alternativa3d::cameraZ = param2.alternativa3d::mi * _loc3_.x + param2.alternativa3d::mj * _loc3_.y + param2.alternativa3d::mk * _loc3_.z + param2.alternativa3d::ml;
               if(_loc3_.alternativa3d::cameraX < param1.boundMinX)
               {
                  param1.boundMinX = _loc3_.alternativa3d::cameraX;
               }
               if(_loc3_.alternativa3d::cameraX > param1.boundMaxX)
               {
                  param1.boundMaxX = _loc3_.alternativa3d::cameraX;
               }
               if(_loc3_.alternativa3d::cameraY < param1.boundMinY)
               {
                  param1.boundMinY = _loc3_.alternativa3d::cameraY;
               }
               if(_loc3_.alternativa3d::cameraY > param1.boundMaxY)
               {
                  param1.boundMaxY = _loc3_.alternativa3d::cameraY;
               }
               if(_loc3_.alternativa3d::cameraZ < param1.boundMinZ)
               {
                  param1.boundMinZ = _loc3_.alternativa3d::cameraZ;
               }
               if(_loc3_.alternativa3d::cameraZ > param1.boundMaxZ)
               {
                  param1.boundMaxZ = _loc3_.alternativa3d::cameraZ;
               }
               _loc3_ = _loc3_.alternativa3d::next;
            }
         }
         else
         {
            if(-_loc4_ < param1.boundMinX)
            {
               param1.boundMinX = -_loc4_;
            }
            if(_loc4_ > param1.boundMaxX)
            {
               param1.boundMaxX = _loc4_;
            }
            if(-_loc4_ < param1.boundMinY)
            {
               param1.boundMinY = -_loc4_;
            }
            if(_loc4_ > param1.boundMaxY)
            {
               param1.boundMaxY = _loc4_;
            }
            if(_loc5_ < param1.boundMinZ)
            {
               param1.boundMinZ = _loc5_;
            }
            if(this.attenuationEnd > param1.boundMaxZ)
            {
               param1.boundMaxZ = this.attenuationEnd;
            }
         }
      }
   }
}

