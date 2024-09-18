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
   
   public class OmniLight extends Light3D
   {
      public var attenuationBegin:Number;
      
      public var attenuationEnd:Number;
      
      public function OmniLight(param1:uint, param2:Number, param3:Number)
      {
         super();
         this.color = param1;
         this.attenuationBegin = param2;
         this.attenuationEnd = param3;
         calculateBounds();
      }
      
      override public function clone() : Object3D
      {
         var _loc1_:OmniLight = new OmniLight(color,this.attenuationBegin,this.attenuationEnd);
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
         var _loc13_:int = param1.alternativa3d::checkInDebug(this);
         if(_loc13_ > 0)
         {
            _loc2_ = param1.view.alternativa3d::canvas;
            if(Boolean(_loc13_ & Debug.LIGHTS) && alternativa3d::ml > param1.nearClipping)
            {
               _loc3_ = (color >> 16 & 0xFF) * intensity;
               _loc4_ = (color >> 8 & 0xFF) * intensity;
               _loc5_ = (color & 0xFF) * intensity;
               _loc6_ = ((_loc3_ > 255 ? 255 : _loc3_) << 16) + ((_loc4_ > 255 ? 255 : _loc4_) << 8) + (_loc5_ > 255 ? 255 : _loc5_);
               _loc7_ = alternativa3d::ma * param1.alternativa3d::viewSizeX / param1.alternativa3d::focalLength;
               _loc8_ = alternativa3d::me * param1.alternativa3d::viewSizeY / param1.alternativa3d::focalLength;
               _loc9_ = Math.sqrt(_loc7_ * _loc7_ + _loc8_ * _loc8_ + alternativa3d::mi * alternativa3d::mi);
               _loc7_ = alternativa3d::mb * param1.alternativa3d::viewSizeX / param1.alternativa3d::focalLength;
               _loc8_ = alternativa3d::mf * param1.alternativa3d::viewSizeY / param1.alternativa3d::focalLength;
               _loc9_ += Math.sqrt(_loc7_ * _loc7_ + _loc8_ * _loc8_ + alternativa3d::mj * alternativa3d::mj);
               _loc7_ = alternativa3d::mc * param1.alternativa3d::viewSizeX / param1.alternativa3d::focalLength;
               _loc8_ = alternativa3d::mg * param1.alternativa3d::viewSizeY / param1.alternativa3d::focalLength;
               _loc9_ += Math.sqrt(_loc7_ * _loc7_ + _loc8_ * _loc8_ + alternativa3d::mk * alternativa3d::mk);
               _loc9_ = _loc9_ += Math.sqrt(_loc7_ * _loc7_ + _loc8_ * _loc8_ + alternativa3d::mk * alternativa3d::mk) / 3;
               _loc10_ = Math.round(alternativa3d::md * param1.alternativa3d::viewSizeX / alternativa3d::ml);
               _loc11_ = Math.round(alternativa3d::mh * param1.alternativa3d::viewSizeY / alternativa3d::ml);
               _loc12_ = 8;
               _loc2_.graphics.lineStyle(1,_loc6_);
               _loc2_.graphics.moveTo(_loc10_ - _loc12_,_loc11_);
               _loc2_.graphics.lineTo(_loc10_ + _loc12_,_loc11_);
               _loc2_.graphics.moveTo(_loc10_,_loc11_ - _loc12_);
               _loc2_.graphics.lineTo(_loc10_,_loc11_ + _loc12_);
               _loc2_.graphics.moveTo(_loc10_ - _loc12_ * 0.7,_loc11_ - _loc12_ * 0.7);
               _loc2_.graphics.lineTo(_loc10_ + _loc12_ * 0.7,_loc11_ + _loc12_ * 0.7);
               _loc2_.graphics.moveTo(_loc10_ - _loc12_ * 0.7,_loc11_ + _loc12_ * 0.7);
               _loc2_.graphics.lineTo(_loc10_ + _loc12_ * 0.7,_loc11_ - _loc12_ * 0.7);
               _loc2_.graphics.drawCircle(_loc10_,_loc11_,this.attenuationBegin * _loc9_ * param1.alternativa3d::focalLength / alternativa3d::ml);
               _loc2_.graphics.lineStyle(1,_loc6_,0.5);
               _loc2_.graphics.drawCircle(_loc10_,_loc11_,this.attenuationEnd * _loc9_ * param1.alternativa3d::focalLength / alternativa3d::ml);
            }
            if(_loc13_ & Debug.BOUNDS)
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
            _loc3_.z = -this.attenuationEnd;
            _loc3_ = _loc3_.alternativa3d::next;
            _loc3_.x = this.attenuationEnd;
            _loc3_.y = -this.attenuationEnd;
            _loc3_.z = -this.attenuationEnd;
            _loc3_ = _loc3_.alternativa3d::next;
            _loc3_.x = -this.attenuationEnd;
            _loc3_.y = this.attenuationEnd;
            _loc3_.z = -this.attenuationEnd;
            _loc3_ = _loc3_.alternativa3d::next;
            _loc3_.x = this.attenuationEnd;
            _loc3_.y = this.attenuationEnd;
            _loc3_.z = -this.attenuationEnd;
            _loc3_ = _loc3_.alternativa3d::next;
            _loc3_.x = -this.attenuationEnd;
            _loc3_.y = -this.attenuationEnd;
            _loc3_.z = this.attenuationEnd;
            _loc3_ = _loc3_.alternativa3d::next;
            _loc3_.x = this.attenuationEnd;
            _loc3_.y = -this.attenuationEnd;
            _loc3_.z = this.attenuationEnd;
            _loc3_ = _loc3_.alternativa3d::next;
            _loc3_.x = -this.attenuationEnd;
            _loc3_.y = this.attenuationEnd;
            _loc3_.z = this.attenuationEnd;
            _loc3_ = _loc3_.alternativa3d::next;
            _loc3_.x = this.attenuationEnd;
            _loc3_.y = this.attenuationEnd;
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
            if(-this.attenuationEnd < param1.boundMinZ)
            {
               param1.boundMinZ = -this.attenuationEnd;
            }
            if(this.attenuationEnd > param1.boundMaxZ)
            {
               param1.boundMaxZ = this.attenuationEnd;
            }
         }
      }
   }
}

