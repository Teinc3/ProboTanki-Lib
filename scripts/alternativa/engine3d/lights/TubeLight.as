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
   
   public class TubeLight extends Light3D
   {
      public var length:Number;
      
      public var attenuationBegin:Number;
      
      public var attenuationEnd:Number;
      
      public var falloff:Number;
      
      public function TubeLight(param1:uint, param2:Number, param3:Number, param4:Number, param5:Number)
      {
         super();
         this.color = param1;
         this.length = param2;
         this.attenuationBegin = param3;
         this.attenuationEnd = param4;
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
         var _loc1_:TubeLight = new TubeLight(color,this.length,this.attenuationBegin,this.attenuationEnd,this.falloff);
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
         var _loc55_:int = param1.alternativa3d::checkInDebug(this);
         if(_loc55_ > 0)
         {
            _loc2_ = param1.view.alternativa3d::canvas;
            if(Boolean(_loc55_ & Debug.LIGHTS) && alternativa3d::ml > param1.nearClipping)
            {
               _loc3_ = (color >> 16 & 0xFF) * intensity;
               _loc4_ = (color >> 8 & 0xFF) * intensity;
               _loc5_ = (color & 0xFF) * intensity;
               _loc6_ = ((_loc3_ > 255 ? 255 : _loc3_) << 16) + ((_loc4_ > 255 ? 255 : _loc4_) << 8) + (_loc5_ > 255 ? 255 : _loc5_);
               _loc7_ = alternativa3d::md + alternativa3d::ma * this.attenuationBegin;
               _loc8_ = alternativa3d::mh + alternativa3d::me * this.attenuationBegin;
               _loc9_ = alternativa3d::ml + alternativa3d::mi * this.attenuationBegin;
               _loc10_ = alternativa3d::md + (alternativa3d::ma * this.attenuationBegin + alternativa3d::mb * this.attenuationBegin) * 0.9;
               _loc11_ = alternativa3d::mh + (alternativa3d::me * this.attenuationBegin + alternativa3d::mf * this.attenuationBegin) * 0.9;
               _loc12_ = alternativa3d::ml + (alternativa3d::mi * this.attenuationBegin + alternativa3d::mj * this.attenuationBegin) * 0.9;
               _loc13_ = alternativa3d::md + alternativa3d::mb * this.attenuationBegin;
               _loc14_ = alternativa3d::mh + alternativa3d::mf * this.attenuationBegin;
               _loc15_ = alternativa3d::ml + alternativa3d::mj * this.attenuationBegin;
               _loc16_ = alternativa3d::md - (alternativa3d::ma * this.attenuationBegin - alternativa3d::mb * this.attenuationBegin) * 0.9;
               _loc17_ = alternativa3d::mh - (alternativa3d::me * this.attenuationBegin - alternativa3d::mf * this.attenuationBegin) * 0.9;
               _loc18_ = alternativa3d::ml - (alternativa3d::mi * this.attenuationBegin - alternativa3d::mj * this.attenuationBegin) * 0.9;
               _loc19_ = alternativa3d::md - alternativa3d::ma * this.attenuationBegin;
               _loc20_ = alternativa3d::mh - alternativa3d::me * this.attenuationBegin;
               _loc21_ = alternativa3d::ml - alternativa3d::mi * this.attenuationBegin;
               _loc22_ = alternativa3d::md - (alternativa3d::ma * this.attenuationBegin + alternativa3d::mb * this.attenuationBegin) * 0.9;
               _loc23_ = alternativa3d::mh - (alternativa3d::me * this.attenuationBegin + alternativa3d::mf * this.attenuationBegin) * 0.9;
               _loc24_ = alternativa3d::ml - (alternativa3d::mi * this.attenuationBegin + alternativa3d::mj * this.attenuationBegin) * 0.9;
               _loc25_ = alternativa3d::md - alternativa3d::mb * this.attenuationBegin;
               _loc26_ = alternativa3d::mh - alternativa3d::mf * this.attenuationBegin;
               _loc27_ = alternativa3d::ml - alternativa3d::mj * this.attenuationBegin;
               _loc28_ = alternativa3d::md + (alternativa3d::ma * this.attenuationBegin - alternativa3d::mb * this.attenuationBegin) * 0.9;
               _loc29_ = alternativa3d::mh + (alternativa3d::me * this.attenuationBegin - alternativa3d::mf * this.attenuationBegin) * 0.9;
               _loc30_ = alternativa3d::ml + (alternativa3d::mi * this.attenuationBegin - alternativa3d::mj * this.attenuationBegin) * 0.9;
               _loc31_ = alternativa3d::md + alternativa3d::mc * this.length + alternativa3d::ma * this.attenuationBegin;
               _loc32_ = alternativa3d::mh + alternativa3d::mg * this.length + alternativa3d::me * this.attenuationBegin;
               _loc33_ = alternativa3d::ml + alternativa3d::mk * this.length + alternativa3d::mi * this.attenuationBegin;
               _loc34_ = alternativa3d::md + alternativa3d::mc * this.length + (alternativa3d::ma * this.attenuationBegin + alternativa3d::mb * this.attenuationBegin) * 0.9;
               _loc35_ = alternativa3d::mh + alternativa3d::mg * this.length + (alternativa3d::me * this.attenuationBegin + alternativa3d::mf * this.attenuationBegin) * 0.9;
               _loc36_ = alternativa3d::ml + alternativa3d::mk * this.length + (alternativa3d::mi * this.attenuationBegin + alternativa3d::mj * this.attenuationBegin) * 0.9;
               _loc37_ = alternativa3d::md + alternativa3d::mc * this.length + alternativa3d::mb * this.attenuationBegin;
               _loc38_ = alternativa3d::mh + alternativa3d::mg * this.length + alternativa3d::mf * this.attenuationBegin;
               _loc39_ = alternativa3d::ml + alternativa3d::mk * this.length + alternativa3d::mj * this.attenuationBegin;
               _loc40_ = alternativa3d::md + alternativa3d::mc * this.length - (alternativa3d::ma * this.attenuationBegin - alternativa3d::mb * this.attenuationBegin) * 0.9;
               _loc41_ = alternativa3d::mh + alternativa3d::mg * this.length - (alternativa3d::me * this.attenuationBegin - alternativa3d::mf * this.attenuationBegin) * 0.9;
               _loc42_ = alternativa3d::ml + alternativa3d::mk * this.length - (alternativa3d::mi * this.attenuationBegin - alternativa3d::mj * this.attenuationBegin) * 0.9;
               _loc43_ = alternativa3d::md + alternativa3d::mc * this.length - alternativa3d::ma * this.attenuationBegin;
               _loc44_ = alternativa3d::mh + alternativa3d::mg * this.length - alternativa3d::me * this.attenuationBegin;
               _loc45_ = alternativa3d::ml + alternativa3d::mk * this.length - alternativa3d::mi * this.attenuationBegin;
               _loc46_ = alternativa3d::md + alternativa3d::mc * this.length - (alternativa3d::ma * this.attenuationBegin + alternativa3d::mb * this.attenuationBegin) * 0.9;
               _loc47_ = alternativa3d::mh + alternativa3d::mg * this.length - (alternativa3d::me * this.attenuationBegin + alternativa3d::mf * this.attenuationBegin) * 0.9;
               _loc48_ = alternativa3d::ml + alternativa3d::mk * this.length - (alternativa3d::mi * this.attenuationBegin + alternativa3d::mj * this.attenuationBegin) * 0.9;
               _loc49_ = alternativa3d::md + alternativa3d::mc * this.length - alternativa3d::mb * this.attenuationBegin;
               _loc50_ = alternativa3d::mh + alternativa3d::mg * this.length - alternativa3d::mf * this.attenuationBegin;
               _loc51_ = alternativa3d::ml + alternativa3d::mk * this.length - alternativa3d::mj * this.attenuationBegin;
               _loc52_ = alternativa3d::md + alternativa3d::mc * this.length + (alternativa3d::ma * this.attenuationBegin - alternativa3d::mb * this.attenuationBegin) * 0.9;
               _loc53_ = alternativa3d::mh + alternativa3d::mg * this.length + (alternativa3d::me * this.attenuationBegin - alternativa3d::mf * this.attenuationBegin) * 0.9;
               _loc54_ = alternativa3d::ml + alternativa3d::mk * this.length + (alternativa3d::mi * this.attenuationBegin - alternativa3d::mj * this.attenuationBegin) * 0.9;
               if(_loc9_ > param1.nearClipping && _loc12_ > param1.nearClipping && _loc15_ > param1.nearClipping && _loc18_ > param1.nearClipping && _loc21_ > param1.nearClipping && _loc24_ > param1.nearClipping && _loc27_ > param1.nearClipping && _loc30_ > param1.nearClipping && _loc33_ > param1.nearClipping && _loc36_ > param1.nearClipping && _loc39_ > param1.nearClipping && _loc42_ > param1.nearClipping && _loc45_ > param1.nearClipping && _loc48_ > param1.nearClipping && _loc51_ > param1.nearClipping && _loc54_ > param1.nearClipping)
               {
                  _loc2_.graphics.lineStyle(1,_loc6_);
                  _loc2_.graphics.moveTo(_loc7_ * param1.alternativa3d::viewSizeX / _loc9_,_loc8_ * param1.alternativa3d::viewSizeY / _loc9_);
                  _loc2_.graphics.curveTo(_loc10_ * param1.alternativa3d::viewSizeX / _loc12_,_loc11_ * param1.alternativa3d::viewSizeY / _loc12_,_loc13_ * param1.alternativa3d::viewSizeX / _loc15_,_loc14_ * param1.alternativa3d::viewSizeY / _loc15_);
                  _loc2_.graphics.curveTo(_loc16_ * param1.alternativa3d::viewSizeX / _loc18_,_loc17_ * param1.alternativa3d::viewSizeY / _loc18_,_loc19_ * param1.alternativa3d::viewSizeX / _loc21_,_loc20_ * param1.alternativa3d::viewSizeY / _loc21_);
                  _loc2_.graphics.curveTo(_loc22_ * param1.alternativa3d::viewSizeX / _loc24_,_loc23_ * param1.alternativa3d::viewSizeY / _loc24_,_loc25_ * param1.alternativa3d::viewSizeX / _loc27_,_loc26_ * param1.alternativa3d::viewSizeY / _loc27_);
                  _loc2_.graphics.curveTo(_loc28_ * param1.alternativa3d::viewSizeX / _loc30_,_loc29_ * param1.alternativa3d::viewSizeY / _loc30_,_loc7_ * param1.alternativa3d::viewSizeX / _loc9_,_loc8_ * param1.alternativa3d::viewSizeY / _loc9_);
                  _loc2_.graphics.moveTo(_loc31_ * param1.alternativa3d::viewSizeX / _loc33_,_loc32_ * param1.alternativa3d::viewSizeY / _loc33_);
                  _loc2_.graphics.curveTo(_loc34_ * param1.alternativa3d::viewSizeX / _loc36_,_loc35_ * param1.alternativa3d::viewSizeY / _loc36_,_loc37_ * param1.alternativa3d::viewSizeX / _loc39_,_loc38_ * param1.alternativa3d::viewSizeY / _loc39_);
                  _loc2_.graphics.curveTo(_loc40_ * param1.alternativa3d::viewSizeX / _loc42_,_loc41_ * param1.alternativa3d::viewSizeY / _loc42_,_loc43_ * param1.alternativa3d::viewSizeX / _loc45_,_loc44_ * param1.alternativa3d::viewSizeY / _loc45_);
                  _loc2_.graphics.curveTo(_loc46_ * param1.alternativa3d::viewSizeX / _loc48_,_loc47_ * param1.alternativa3d::viewSizeY / _loc48_,_loc49_ * param1.alternativa3d::viewSizeX / _loc51_,_loc50_ * param1.alternativa3d::viewSizeY / _loc51_);
                  _loc2_.graphics.curveTo(_loc52_ * param1.alternativa3d::viewSizeX / _loc54_,_loc53_ * param1.alternativa3d::viewSizeY / _loc54_,_loc31_ * param1.alternativa3d::viewSizeX / _loc33_,_loc32_ * param1.alternativa3d::viewSizeY / _loc33_);
                  _loc2_.graphics.moveTo(_loc7_ * param1.alternativa3d::viewSizeX / _loc9_,_loc8_ * param1.alternativa3d::viewSizeY / _loc9_);
                  _loc2_.graphics.lineTo(_loc31_ * param1.alternativa3d::viewSizeX / _loc33_,_loc32_ * param1.alternativa3d::viewSizeY / _loc33_);
                  _loc2_.graphics.moveTo(_loc13_ * param1.alternativa3d::viewSizeX / _loc15_,_loc14_ * param1.alternativa3d::viewSizeY / _loc15_);
                  _loc2_.graphics.lineTo(_loc37_ * param1.alternativa3d::viewSizeX / _loc39_,_loc38_ * param1.alternativa3d::viewSizeY / _loc39_);
                  _loc2_.graphics.moveTo(_loc19_ * param1.alternativa3d::viewSizeX / _loc21_,_loc20_ * param1.alternativa3d::viewSizeY / _loc21_);
                  _loc2_.graphics.lineTo(_loc43_ * param1.alternativa3d::viewSizeX / _loc45_,_loc44_ * param1.alternativa3d::viewSizeY / _loc45_);
                  _loc2_.graphics.moveTo(_loc25_ * param1.alternativa3d::viewSizeX / _loc27_,_loc26_ * param1.alternativa3d::viewSizeY / _loc27_);
                  _loc2_.graphics.lineTo(_loc49_ * param1.alternativa3d::viewSizeX / _loc51_,_loc50_ * param1.alternativa3d::viewSizeY / _loc51_);
               }
               _loc7_ = alternativa3d::md - alternativa3d::mc * this.falloff + alternativa3d::ma * this.attenuationEnd;
               _loc8_ = alternativa3d::mh - alternativa3d::mg * this.falloff + alternativa3d::me * this.attenuationEnd;
               _loc9_ = alternativa3d::ml - alternativa3d::mk * this.falloff + alternativa3d::mi * this.attenuationEnd;
               _loc10_ = alternativa3d::md - alternativa3d::mc * this.falloff + (alternativa3d::ma * this.attenuationEnd + alternativa3d::mb * this.attenuationEnd) * 0.9;
               _loc11_ = alternativa3d::mh - alternativa3d::mg * this.falloff + (alternativa3d::me * this.attenuationEnd + alternativa3d::mf * this.attenuationEnd) * 0.9;
               _loc12_ = alternativa3d::ml - alternativa3d::mk * this.falloff + (alternativa3d::mi * this.attenuationEnd + alternativa3d::mj * this.attenuationEnd) * 0.9;
               _loc13_ = alternativa3d::md - alternativa3d::mc * this.falloff + alternativa3d::mb * this.attenuationEnd;
               _loc14_ = alternativa3d::mh - alternativa3d::mg * this.falloff + alternativa3d::mf * this.attenuationEnd;
               _loc15_ = alternativa3d::ml - alternativa3d::mk * this.falloff + alternativa3d::mj * this.attenuationEnd;
               _loc16_ = alternativa3d::md - alternativa3d::mc * this.falloff - (alternativa3d::ma * this.attenuationEnd - alternativa3d::mb * this.attenuationEnd) * 0.9;
               _loc17_ = alternativa3d::mh - alternativa3d::mg * this.falloff - (alternativa3d::me * this.attenuationEnd - alternativa3d::mf * this.attenuationEnd) * 0.9;
               _loc18_ = alternativa3d::ml - alternativa3d::mk * this.falloff - (alternativa3d::mi * this.attenuationEnd - alternativa3d::mj * this.attenuationEnd) * 0.9;
               _loc19_ = alternativa3d::md - alternativa3d::mc * this.falloff - alternativa3d::ma * this.attenuationEnd;
               _loc20_ = alternativa3d::mh - alternativa3d::mg * this.falloff - alternativa3d::me * this.attenuationEnd;
               _loc21_ = alternativa3d::ml - alternativa3d::mk * this.falloff - alternativa3d::mi * this.attenuationEnd;
               _loc22_ = alternativa3d::md - alternativa3d::mc * this.falloff - (alternativa3d::ma * this.attenuationEnd + alternativa3d::mb * this.attenuationEnd) * 0.9;
               _loc23_ = alternativa3d::mh - alternativa3d::mg * this.falloff - (alternativa3d::me * this.attenuationEnd + alternativa3d::mf * this.attenuationEnd) * 0.9;
               _loc24_ = alternativa3d::ml - alternativa3d::mk * this.falloff - (alternativa3d::mi * this.attenuationEnd + alternativa3d::mj * this.attenuationEnd) * 0.9;
               _loc25_ = alternativa3d::md - alternativa3d::mc * this.falloff - alternativa3d::mb * this.attenuationEnd;
               _loc26_ = alternativa3d::mh - alternativa3d::mg * this.falloff - alternativa3d::mf * this.attenuationEnd;
               _loc27_ = alternativa3d::ml - alternativa3d::mk * this.falloff - alternativa3d::mj * this.attenuationEnd;
               _loc28_ = alternativa3d::md - alternativa3d::mc * this.falloff + (alternativa3d::ma * this.attenuationEnd - alternativa3d::mb * this.attenuationEnd) * 0.9;
               _loc29_ = alternativa3d::mh - alternativa3d::mg * this.falloff + (alternativa3d::me * this.attenuationEnd - alternativa3d::mf * this.attenuationEnd) * 0.9;
               _loc30_ = alternativa3d::ml - alternativa3d::mk * this.falloff + (alternativa3d::mi * this.attenuationEnd - alternativa3d::mj * this.attenuationEnd) * 0.9;
               _loc31_ = alternativa3d::md + alternativa3d::mc * (this.length + this.falloff) + alternativa3d::ma * this.attenuationEnd;
               _loc32_ = alternativa3d::mh + alternativa3d::mg * (this.length + this.falloff) + alternativa3d::me * this.attenuationEnd;
               _loc33_ = alternativa3d::ml + alternativa3d::mk * (this.length + this.falloff) + alternativa3d::mi * this.attenuationEnd;
               _loc34_ = alternativa3d::md + alternativa3d::mc * (this.length + this.falloff) + (alternativa3d::ma * this.attenuationEnd + alternativa3d::mb * this.attenuationEnd) * 0.9;
               _loc35_ = alternativa3d::mh + alternativa3d::mg * (this.length + this.falloff) + (alternativa3d::me * this.attenuationEnd + alternativa3d::mf * this.attenuationEnd) * 0.9;
               _loc36_ = alternativa3d::ml + alternativa3d::mk * (this.length + this.falloff) + (alternativa3d::mi * this.attenuationEnd + alternativa3d::mj * this.attenuationEnd) * 0.9;
               _loc37_ = alternativa3d::md + alternativa3d::mc * (this.length + this.falloff) + alternativa3d::mb * this.attenuationEnd;
               _loc38_ = alternativa3d::mh + alternativa3d::mg * (this.length + this.falloff) + alternativa3d::mf * this.attenuationEnd;
               _loc39_ = alternativa3d::ml + alternativa3d::mk * (this.length + this.falloff) + alternativa3d::mj * this.attenuationEnd;
               _loc40_ = alternativa3d::md + alternativa3d::mc * (this.length + this.falloff) - (alternativa3d::ma * this.attenuationEnd - alternativa3d::mb * this.attenuationEnd) * 0.9;
               _loc41_ = alternativa3d::mh + alternativa3d::mg * (this.length + this.falloff) - (alternativa3d::me * this.attenuationEnd - alternativa3d::mf * this.attenuationEnd) * 0.9;
               _loc42_ = alternativa3d::ml + alternativa3d::mk * (this.length + this.falloff) - (alternativa3d::mi * this.attenuationEnd - alternativa3d::mj * this.attenuationEnd) * 0.9;
               _loc43_ = alternativa3d::md + alternativa3d::mc * (this.length + this.falloff) - alternativa3d::ma * this.attenuationEnd;
               _loc44_ = alternativa3d::mh + alternativa3d::mg * (this.length + this.falloff) - alternativa3d::me * this.attenuationEnd;
               _loc45_ = alternativa3d::ml + alternativa3d::mk * (this.length + this.falloff) - alternativa3d::mi * this.attenuationEnd;
               _loc46_ = alternativa3d::md + alternativa3d::mc * (this.length + this.falloff) - (alternativa3d::ma * this.attenuationEnd + alternativa3d::mb * this.attenuationEnd) * 0.9;
               _loc47_ = alternativa3d::mh + alternativa3d::mg * (this.length + this.falloff) - (alternativa3d::me * this.attenuationEnd + alternativa3d::mf * this.attenuationEnd) * 0.9;
               _loc48_ = alternativa3d::ml + alternativa3d::mk * (this.length + this.falloff) - (alternativa3d::mi * this.attenuationEnd + alternativa3d::mj * this.attenuationEnd) * 0.9;
               _loc49_ = alternativa3d::md + alternativa3d::mc * (this.length + this.falloff) - alternativa3d::mb * this.attenuationEnd;
               _loc50_ = alternativa3d::mh + alternativa3d::mg * (this.length + this.falloff) - alternativa3d::mf * this.attenuationEnd;
               _loc51_ = alternativa3d::ml + alternativa3d::mk * (this.length + this.falloff) - alternativa3d::mj * this.attenuationEnd;
               _loc52_ = alternativa3d::md + alternativa3d::mc * (this.length + this.falloff) + (alternativa3d::ma * this.attenuationEnd - alternativa3d::mb * this.attenuationEnd) * 0.9;
               _loc53_ = alternativa3d::mh + alternativa3d::mg * (this.length + this.falloff) + (alternativa3d::me * this.attenuationEnd - alternativa3d::mf * this.attenuationEnd) * 0.9;
               _loc54_ = alternativa3d::ml + alternativa3d::mk * (this.length + this.falloff) + (alternativa3d::mi * this.attenuationEnd - alternativa3d::mj * this.attenuationEnd) * 0.9;
               if(_loc9_ > param1.nearClipping && _loc12_ > param1.nearClipping && _loc15_ > param1.nearClipping && _loc18_ > param1.nearClipping && _loc21_ > param1.nearClipping && _loc24_ > param1.nearClipping && _loc27_ > param1.nearClipping && _loc30_ > param1.nearClipping && _loc33_ > param1.nearClipping && _loc36_ > param1.nearClipping && _loc39_ > param1.nearClipping && _loc42_ > param1.nearClipping && _loc45_ > param1.nearClipping && _loc48_ > param1.nearClipping && _loc51_ > param1.nearClipping && _loc54_ > param1.nearClipping)
               {
                  _loc2_.graphics.lineStyle(1,_loc6_);
                  _loc2_.graphics.moveTo(_loc7_ * param1.alternativa3d::viewSizeX / _loc9_,_loc8_ * param1.alternativa3d::viewSizeY / _loc9_);
                  _loc2_.graphics.curveTo(_loc10_ * param1.alternativa3d::viewSizeX / _loc12_,_loc11_ * param1.alternativa3d::viewSizeY / _loc12_,_loc13_ * param1.alternativa3d::viewSizeX / _loc15_,_loc14_ * param1.alternativa3d::viewSizeY / _loc15_);
                  _loc2_.graphics.curveTo(_loc16_ * param1.alternativa3d::viewSizeX / _loc18_,_loc17_ * param1.alternativa3d::viewSizeY / _loc18_,_loc19_ * param1.alternativa3d::viewSizeX / _loc21_,_loc20_ * param1.alternativa3d::viewSizeY / _loc21_);
                  _loc2_.graphics.curveTo(_loc22_ * param1.alternativa3d::viewSizeX / _loc24_,_loc23_ * param1.alternativa3d::viewSizeY / _loc24_,_loc25_ * param1.alternativa3d::viewSizeX / _loc27_,_loc26_ * param1.alternativa3d::viewSizeY / _loc27_);
                  _loc2_.graphics.curveTo(_loc28_ * param1.alternativa3d::viewSizeX / _loc30_,_loc29_ * param1.alternativa3d::viewSizeY / _loc30_,_loc7_ * param1.alternativa3d::viewSizeX / _loc9_,_loc8_ * param1.alternativa3d::viewSizeY / _loc9_);
                  _loc2_.graphics.moveTo(_loc31_ * param1.alternativa3d::viewSizeX / _loc33_,_loc32_ * param1.alternativa3d::viewSizeY / _loc33_);
                  _loc2_.graphics.curveTo(_loc34_ * param1.alternativa3d::viewSizeX / _loc36_,_loc35_ * param1.alternativa3d::viewSizeY / _loc36_,_loc37_ * param1.alternativa3d::viewSizeX / _loc39_,_loc38_ * param1.alternativa3d::viewSizeY / _loc39_);
                  _loc2_.graphics.curveTo(_loc40_ * param1.alternativa3d::viewSizeX / _loc42_,_loc41_ * param1.alternativa3d::viewSizeY / _loc42_,_loc43_ * param1.alternativa3d::viewSizeX / _loc45_,_loc44_ * param1.alternativa3d::viewSizeY / _loc45_);
                  _loc2_.graphics.curveTo(_loc46_ * param1.alternativa3d::viewSizeX / _loc48_,_loc47_ * param1.alternativa3d::viewSizeY / _loc48_,_loc49_ * param1.alternativa3d::viewSizeX / _loc51_,_loc50_ * param1.alternativa3d::viewSizeY / _loc51_);
                  _loc2_.graphics.curveTo(_loc52_ * param1.alternativa3d::viewSizeX / _loc54_,_loc53_ * param1.alternativa3d::viewSizeY / _loc54_,_loc31_ * param1.alternativa3d::viewSizeX / _loc33_,_loc32_ * param1.alternativa3d::viewSizeY / _loc33_);
                  _loc2_.graphics.moveTo(_loc7_ * param1.alternativa3d::viewSizeX / _loc9_,_loc8_ * param1.alternativa3d::viewSizeY / _loc9_);
                  _loc2_.graphics.lineTo(_loc31_ * param1.alternativa3d::viewSizeX / _loc33_,_loc32_ * param1.alternativa3d::viewSizeY / _loc33_);
                  _loc2_.graphics.moveTo(_loc13_ * param1.alternativa3d::viewSizeX / _loc15_,_loc14_ * param1.alternativa3d::viewSizeY / _loc15_);
                  _loc2_.graphics.lineTo(_loc37_ * param1.alternativa3d::viewSizeX / _loc39_,_loc38_ * param1.alternativa3d::viewSizeY / _loc39_);
                  _loc2_.graphics.moveTo(_loc19_ * param1.alternativa3d::viewSizeX / _loc21_,_loc20_ * param1.alternativa3d::viewSizeY / _loc21_);
                  _loc2_.graphics.lineTo(_loc43_ * param1.alternativa3d::viewSizeX / _loc45_,_loc44_ * param1.alternativa3d::viewSizeY / _loc45_);
                  _loc2_.graphics.moveTo(_loc25_ * param1.alternativa3d::viewSizeX / _loc27_,_loc26_ * param1.alternativa3d::viewSizeY / _loc27_);
                  _loc2_.graphics.lineTo(_loc49_ * param1.alternativa3d::viewSizeX / _loc51_,_loc50_ * param1.alternativa3d::viewSizeY / _loc51_);
               }
            }
            if(_loc55_ & Debug.BOUNDS)
            {
               Debug.drawBounds(param1,this,boundMinX,boundMinY,boundMinZ,boundMaxX,boundMaxY,boundMaxZ,10092288);
            }
         }
      }
      
      override alternativa3d function updateBounds(param1:Object3D, param2:Object3D = null) : void
      {
         var _loc3_:Vertex = null;
         if(param2 != null)
         {
            _loc3_ = alternativa3d::boundVertexList;
            _loc3_.x = -this.attenuationEnd;
            _loc3_.y = -this.attenuationEnd;
            _loc3_.z = -this.falloff;
            _loc3_ = _loc3_.alternativa3d::next;
            _loc3_.x = this.attenuationEnd;
            _loc3_.y = -this.attenuationEnd;
            _loc3_.z = -this.falloff;
            _loc3_ = _loc3_.alternativa3d::next;
            _loc3_.x = -this.attenuationEnd;
            _loc3_.y = this.attenuationEnd;
            _loc3_.z = -this.falloff;
            _loc3_ = _loc3_.alternativa3d::next;
            _loc3_.x = this.attenuationEnd;
            _loc3_.y = this.attenuationEnd;
            _loc3_.z = -this.falloff;
            _loc3_ = _loc3_.alternativa3d::next;
            _loc3_.x = -this.attenuationEnd;
            _loc3_.y = -this.attenuationEnd;
            _loc3_.z = this.length + this.falloff;
            _loc3_ = _loc3_.alternativa3d::next;
            _loc3_.x = this.attenuationEnd;
            _loc3_.y = -this.attenuationEnd;
            _loc3_.z = this.length + this.falloff;
            _loc3_ = _loc3_.alternativa3d::next;
            _loc3_.x = -this.attenuationEnd;
            _loc3_.y = this.attenuationEnd;
            _loc3_.z = this.length + this.falloff;
            _loc3_ = _loc3_.alternativa3d::next;
            _loc3_.x = this.attenuationEnd;
            _loc3_.y = this.attenuationEnd;
            _loc3_.z = this.length + this.falloff;
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
            if(-this.attenuationEnd < param1.boundMinX)
            {
               param1.boundMinX = -this.attenuationEnd;
            }
            if(this.attenuationEnd > param1.boundMaxX)
            {
               param1.boundMaxX = this.attenuationEnd;
            }
            if(-this.attenuationEnd < param1.boundMinY)
            {
               param1.boundMinY = -this.attenuationEnd;
            }
            if(this.attenuationEnd > param1.boundMaxY)
            {
               param1.boundMaxY = this.attenuationEnd;
            }
            if(-this.falloff < param1.boundMinZ)
            {
               param1.boundMinZ = -this.falloff;
            }
            if(this.length + this.falloff > param1.boundMaxZ)
            {
               param1.boundMaxZ = this.length + this.falloff;
            }
         }
      }
   }
}

