package alternativa.engine3d.lights
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.Debug;
   import alternativa.engine3d.core.Light3D;
   import alternativa.engine3d.core.Object3D;
   import flash.display.Sprite;
   
   use namespace alternativa3d;
   
   public class DirectionalLight extends Light3D
   {
      public function DirectionalLight(param1:uint)
      {
         super();
         this.color = param1;
         calculateBounds();
      }
      
      public function lookAt(param1:Number, param2:Number, param3:Number) : void
      {
         var _loc4_:Number = param1 - this.x;
         var _loc5_:Number = param2 - this.y;
         var _loc6_:Number = param3 - this.z;
         rotationX = Math.atan2(_loc6_,Math.sqrt(_loc4_ * _loc4_ + _loc5_ * _loc5_)) - Math.PI / 2;
         rotationY = 0;
         rotationZ = -Math.atan2(_loc4_,_loc5_);
      }
      
      override public function clone() : Object3D
      {
         var _loc1_:DirectionalLight = new DirectionalLight(color);
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
         var _loc47_:Number = NaN;
         var _loc48_:Number = NaN;
         var _loc49_:Number = NaN;
         var _loc50_:Number = NaN;
         var _loc51_:Number = NaN;
         var _loc52_:Number = NaN;
         var _loc53_:Number = NaN;
         var _loc54_:Number = NaN;
         var _loc55_:Number = NaN;
         var _loc56_:Number = NaN;
         var _loc57_:Number = NaN;
         var _loc58_:Number = NaN;
         var _loc59_:Number = NaN;
         var _loc60_:Number = NaN;
         var _loc61_:Number = NaN;
         var _loc62_:Number = NaN;
         var _loc63_:Number = NaN;
         var _loc64_:int = param1.alternativa3d::checkInDebug(this);
         if(_loc64_ > 0)
         {
            _loc2_ = param1.view.alternativa3d::canvas;
            if(Boolean(_loc64_ & Debug.LIGHTS) && alternativa3d::ml > param1.nearClipping)
            {
               _loc3_ = (color >> 16 & 0xFF) * intensity;
               _loc4_ = (color >> 8 & 0xFF) * intensity;
               _loc5_ = (color & 0xFF) * intensity;
               _loc6_ = ((_loc3_ > 255 ? 255 : _loc3_) << 16) + ((_loc4_ > 255 ? 255 : _loc4_) << 8) + (_loc5_ > 255 ? 255 : _loc5_);
               _loc7_ = alternativa3d::md * param1.alternativa3d::viewSizeX / param1.alternativa3d::focalLength;
               _loc8_ = alternativa3d::mh * param1.alternativa3d::viewSizeY / param1.alternativa3d::focalLength;
               _loc9_ = Number(alternativa3d::ml);
               _loc10_ = alternativa3d::mc * param1.alternativa3d::viewSizeX / param1.alternativa3d::focalLength;
               _loc11_ = alternativa3d::mg * param1.alternativa3d::viewSizeY / param1.alternativa3d::focalLength;
               _loc12_ = Number(alternativa3d::mk);
               _loc13_ = Math.sqrt(_loc10_ * _loc10_ + _loc11_ * _loc11_ + _loc12_ * _loc12_);
               _loc10_ /= _loc13_;
               _loc11_ /= _loc13_;
               _loc12_ /= _loc13_;
               _loc14_ = alternativa3d::ma * param1.alternativa3d::viewSizeX / param1.alternativa3d::focalLength;
               _loc15_ = alternativa3d::me * param1.alternativa3d::viewSizeY / param1.alternativa3d::focalLength;
               _loc16_ = Number(alternativa3d::mi);
               _loc17_ = _loc16_ * _loc11_ - _loc15_ * _loc12_;
               _loc18_ = _loc14_ * _loc12_ - _loc16_ * _loc10_;
               _loc19_ = _loc15_ * _loc10_ - _loc14_ * _loc11_;
               _loc13_ = Math.sqrt(_loc17_ * _loc17_ + _loc18_ * _loc18_ + _loc19_ * _loc19_);
               _loc17_ /= _loc13_;
               _loc18_ /= _loc13_;
               _loc19_ /= _loc13_;
               _loc14_ = alternativa3d::mb * param1.alternativa3d::viewSizeX / param1.alternativa3d::focalLength;
               _loc15_ = alternativa3d::mf * param1.alternativa3d::viewSizeY / param1.alternativa3d::focalLength;
               _loc16_ = Number(alternativa3d::mj);
               _loc14_ = _loc19_ * _loc11_ - _loc18_ * _loc12_;
               _loc15_ = _loc17_ * _loc12_ - _loc19_ * _loc10_;
               _loc16_ = _loc18_ * _loc10_ - _loc17_ * _loc11_;
               _loc20_ = alternativa3d::ml / param1.alternativa3d::focalLength;
               _loc10_ *= _loc20_;
               _loc11_ *= _loc20_;
               _loc12_ *= _loc20_;
               _loc14_ *= _loc20_;
               _loc15_ *= _loc20_;
               _loc16_ *= _loc20_;
               _loc17_ *= _loc20_;
               _loc18_ *= _loc20_;
               _loc19_ *= _loc20_;
               _loc21_ = 16;
               _loc22_ = 24;
               _loc23_ = 4;
               _loc24_ = 8;
               _loc25_ = _loc7_ + _loc10_ * _loc22_;
               _loc26_ = _loc8_ + _loc11_ * _loc22_;
               _loc27_ = _loc9_ + _loc12_ * _loc22_;
               _loc28_ = _loc7_ + _loc14_ * _loc23_ + _loc17_ * _loc23_;
               _loc29_ = _loc8_ + _loc15_ * _loc23_ + _loc18_ * _loc23_;
               _loc30_ = _loc9_ + _loc16_ * _loc23_ + _loc19_ * _loc23_;
               _loc31_ = _loc7_ - _loc14_ * _loc23_ + _loc17_ * _loc23_;
               _loc32_ = _loc8_ - _loc15_ * _loc23_ + _loc18_ * _loc23_;
               _loc33_ = _loc9_ - _loc16_ * _loc23_ + _loc19_ * _loc23_;
               _loc34_ = _loc7_ - _loc14_ * _loc23_ - _loc17_ * _loc23_;
               _loc35_ = _loc8_ - _loc15_ * _loc23_ - _loc18_ * _loc23_;
               _loc36_ = _loc9_ - _loc16_ * _loc23_ - _loc19_ * _loc23_;
               _loc37_ = _loc7_ + _loc14_ * _loc23_ - _loc17_ * _loc23_;
               _loc38_ = _loc8_ + _loc15_ * _loc23_ - _loc18_ * _loc23_;
               _loc39_ = _loc9_ + _loc16_ * _loc23_ - _loc19_ * _loc23_;
               _loc40_ = _loc7_ + _loc10_ * _loc21_ + _loc14_ * _loc23_ + _loc17_ * _loc23_;
               _loc41_ = _loc8_ + _loc11_ * _loc21_ + _loc15_ * _loc23_ + _loc18_ * _loc23_;
               _loc42_ = _loc9_ + _loc12_ * _loc21_ + _loc16_ * _loc23_ + _loc19_ * _loc23_;
               _loc43_ = _loc7_ + _loc10_ * _loc21_ - _loc14_ * _loc23_ + _loc17_ * _loc23_;
               _loc44_ = _loc8_ + _loc11_ * _loc21_ - _loc15_ * _loc23_ + _loc18_ * _loc23_;
               _loc45_ = _loc9_ + _loc12_ * _loc21_ - _loc16_ * _loc23_ + _loc19_ * _loc23_;
               _loc46_ = _loc7_ + _loc10_ * _loc21_ - _loc14_ * _loc23_ - _loc17_ * _loc23_;
               _loc47_ = _loc8_ + _loc11_ * _loc21_ - _loc15_ * _loc23_ - _loc18_ * _loc23_;
               _loc48_ = _loc9_ + _loc12_ * _loc21_ - _loc16_ * _loc23_ - _loc19_ * _loc23_;
               _loc49_ = _loc7_ + _loc10_ * _loc21_ + _loc14_ * _loc23_ - _loc17_ * _loc23_;
               _loc50_ = _loc8_ + _loc11_ * _loc21_ + _loc15_ * _loc23_ - _loc18_ * _loc23_;
               _loc51_ = _loc9_ + _loc12_ * _loc21_ + _loc16_ * _loc23_ - _loc19_ * _loc23_;
               _loc52_ = _loc7_ + _loc10_ * _loc21_ + _loc14_ * _loc24_ + _loc17_ * _loc24_;
               _loc53_ = _loc8_ + _loc11_ * _loc21_ + _loc15_ * _loc24_ + _loc18_ * _loc24_;
               _loc54_ = _loc9_ + _loc12_ * _loc21_ + _loc16_ * _loc24_ + _loc19_ * _loc24_;
               _loc55_ = _loc7_ + _loc10_ * _loc21_ - _loc14_ * _loc24_ + _loc17_ * _loc24_;
               _loc56_ = _loc8_ + _loc11_ * _loc21_ - _loc15_ * _loc24_ + _loc18_ * _loc24_;
               _loc57_ = _loc9_ + _loc12_ * _loc21_ - _loc16_ * _loc24_ + _loc19_ * _loc24_;
               _loc58_ = _loc7_ + _loc10_ * _loc21_ - _loc14_ * _loc24_ - _loc17_ * _loc24_;
               _loc59_ = _loc8_ + _loc11_ * _loc21_ - _loc15_ * _loc24_ - _loc18_ * _loc24_;
               _loc60_ = _loc9_ + _loc12_ * _loc21_ - _loc16_ * _loc24_ - _loc19_ * _loc24_;
               _loc61_ = _loc7_ + _loc10_ * _loc21_ + _loc14_ * _loc24_ - _loc17_ * _loc24_;
               _loc62_ = _loc8_ + _loc11_ * _loc21_ + _loc15_ * _loc24_ - _loc18_ * _loc24_;
               _loc63_ = _loc9_ + _loc12_ * _loc21_ + _loc16_ * _loc24_ - _loc19_ * _loc24_;
               if(_loc27_ > param1.nearClipping && _loc30_ > param1.nearClipping && _loc33_ > param1.nearClipping && _loc36_ > param1.nearClipping && _loc39_ > param1.nearClipping && _loc42_ > param1.nearClipping && _loc45_ > param1.nearClipping && _loc48_ > param1.nearClipping && _loc51_ > param1.nearClipping && _loc54_ > param1.nearClipping && _loc57_ > param1.nearClipping && _loc60_ > param1.nearClipping && _loc63_ > param1.nearClipping)
               {
                  _loc2_.graphics.lineStyle(1,_loc6_);
                  _loc2_.graphics.moveTo(_loc28_ * param1.alternativa3d::focalLength / _loc30_,_loc29_ * param1.alternativa3d::focalLength / _loc30_);
                  _loc2_.graphics.lineTo(_loc31_ * param1.alternativa3d::focalLength / _loc33_,_loc32_ * param1.alternativa3d::focalLength / _loc33_);
                  _loc2_.graphics.lineTo(_loc34_ * param1.alternativa3d::focalLength / _loc36_,_loc35_ * param1.alternativa3d::focalLength / _loc36_);
                  _loc2_.graphics.lineTo(_loc37_ * param1.alternativa3d::focalLength / _loc39_,_loc38_ * param1.alternativa3d::focalLength / _loc39_);
                  _loc2_.graphics.lineTo(_loc28_ * param1.alternativa3d::focalLength / _loc30_,_loc29_ * param1.alternativa3d::focalLength / _loc30_);
                  _loc2_.graphics.moveTo(_loc40_ * param1.alternativa3d::focalLength / _loc42_,_loc41_ * param1.alternativa3d::focalLength / _loc42_);
                  _loc2_.graphics.lineTo(_loc43_ * param1.alternativa3d::focalLength / _loc45_,_loc44_ * param1.alternativa3d::focalLength / _loc45_);
                  _loc2_.graphics.lineTo(_loc46_ * param1.alternativa3d::focalLength / _loc48_,_loc47_ * param1.alternativa3d::focalLength / _loc48_);
                  _loc2_.graphics.lineTo(_loc49_ * param1.alternativa3d::focalLength / _loc51_,_loc50_ * param1.alternativa3d::focalLength / _loc51_);
                  _loc2_.graphics.lineTo(_loc40_ * param1.alternativa3d::focalLength / _loc42_,_loc41_ * param1.alternativa3d::focalLength / _loc42_);
                  _loc2_.graphics.moveTo(_loc52_ * param1.alternativa3d::focalLength / _loc54_,_loc53_ * param1.alternativa3d::focalLength / _loc54_);
                  _loc2_.graphics.lineTo(_loc55_ * param1.alternativa3d::focalLength / _loc57_,_loc56_ * param1.alternativa3d::focalLength / _loc57_);
                  _loc2_.graphics.lineTo(_loc58_ * param1.alternativa3d::focalLength / _loc60_,_loc59_ * param1.alternativa3d::focalLength / _loc60_);
                  _loc2_.graphics.lineTo(_loc61_ * param1.alternativa3d::focalLength / _loc63_,_loc62_ * param1.alternativa3d::focalLength / _loc63_);
                  _loc2_.graphics.lineTo(_loc52_ * param1.alternativa3d::focalLength / _loc54_,_loc53_ * param1.alternativa3d::focalLength / _loc54_);
                  _loc2_.graphics.moveTo(_loc25_ * param1.alternativa3d::focalLength / _loc27_,_loc26_ * param1.alternativa3d::focalLength / _loc27_);
                  _loc2_.graphics.lineTo(_loc52_ * param1.alternativa3d::focalLength / _loc54_,_loc53_ * param1.alternativa3d::focalLength / _loc54_);
                  _loc2_.graphics.moveTo(_loc25_ * param1.alternativa3d::focalLength / _loc27_,_loc26_ * param1.alternativa3d::focalLength / _loc27_);
                  _loc2_.graphics.lineTo(_loc55_ * param1.alternativa3d::focalLength / _loc57_,_loc56_ * param1.alternativa3d::focalLength / _loc57_);
                  _loc2_.graphics.moveTo(_loc25_ * param1.alternativa3d::focalLength / _loc27_,_loc26_ * param1.alternativa3d::focalLength / _loc27_);
                  _loc2_.graphics.lineTo(_loc58_ * param1.alternativa3d::focalLength / _loc60_,_loc59_ * param1.alternativa3d::focalLength / _loc60_);
                  _loc2_.graphics.moveTo(_loc25_ * param1.alternativa3d::focalLength / _loc27_,_loc26_ * param1.alternativa3d::focalLength / _loc27_);
                  _loc2_.graphics.lineTo(_loc61_ * param1.alternativa3d::focalLength / _loc63_,_loc62_ * param1.alternativa3d::focalLength / _loc63_);
                  _loc2_.graphics.moveTo(_loc28_ * param1.alternativa3d::focalLength / _loc30_,_loc29_ * param1.alternativa3d::focalLength / _loc30_);
                  _loc2_.graphics.lineTo(_loc40_ * param1.alternativa3d::focalLength / _loc42_,_loc41_ * param1.alternativa3d::focalLength / _loc42_);
                  _loc2_.graphics.moveTo(_loc31_ * param1.alternativa3d::focalLength / _loc33_,_loc32_ * param1.alternativa3d::focalLength / _loc33_);
                  _loc2_.graphics.lineTo(_loc43_ * param1.alternativa3d::focalLength / _loc45_,_loc44_ * param1.alternativa3d::focalLength / _loc45_);
                  _loc2_.graphics.moveTo(_loc34_ * param1.alternativa3d::focalLength / _loc36_,_loc35_ * param1.alternativa3d::focalLength / _loc36_);
                  _loc2_.graphics.lineTo(_loc46_ * param1.alternativa3d::focalLength / _loc48_,_loc47_ * param1.alternativa3d::focalLength / _loc48_);
                  _loc2_.graphics.moveTo(_loc37_ * param1.alternativa3d::focalLength / _loc39_,_loc38_ * param1.alternativa3d::focalLength / _loc39_);
                  _loc2_.graphics.lineTo(_loc49_ * param1.alternativa3d::focalLength / _loc51_,_loc50_ * param1.alternativa3d::focalLength / _loc51_);
               }
            }
            if(_loc64_ & Debug.BOUNDS)
            {
               Debug.drawBounds(param1,this,boundMinX,boundMinY,boundMinZ,boundMaxX,boundMaxY,boundMaxZ,10092288);
            }
         }
      }
   }
}

