package alternativa.engine3d.core
{
   import alternativa.engine3d.alternativa3d;
   import flash.geom.Vector3D;
   import flash.utils.Dictionary;
   
   use namespace alternativa3d;
   
   public class EllipsoidCollider
   {
      public var radiusX:Number;
      
      public var radiusY:Number;
      
      public var radiusZ:Number;
      
      public var threshold:Number = 0.001;
      
      private var matrix:Object3D;
      
      private var faces:Vector.<Face>;
      
      private var facesLength:int;
      
      private var radius:Number;
      
      private var src:Vector3D;
      
      private var displ:Vector3D;
      
      private var dest:Vector3D;
      
      private var collisionPoint:Vector3D;
      
      private var collisionPlane:Vector3D;
      
      private var vCenter:Vector3D;
      
      private var vA:Vector3D;
      
      private var vB:Vector3D;
      
      private var vC:Vector3D;
      
      private var vD:Vector3D;
      
      public function EllipsoidCollider(param1:Number, param2:Number, param3:Number)
      {
         this.matrix = new Object3D();
         this.faces = new Vector.<Face>();
         this.src = new Vector3D();
         this.displ = new Vector3D();
         this.dest = new Vector3D();
         this.collisionPoint = new Vector3D();
         this.collisionPlane = new Vector3D();
         this.vCenter = new Vector3D();
         this.vA = new Vector3D();
         this.vB = new Vector3D();
         this.vC = new Vector3D();
         this.vD = new Vector3D();
         super();
         this.radiusX = param1;
         this.radiusY = param2;
         this.radiusZ = param3;
      }
      
      private function prepare(param1:Vector3D, param2:Vector3D, param3:Object3D, param4:Dictionary, param5:Boolean) : void
      {
         var _loc6_:Number = NaN;
         this.radius = this.radiusX;
         if(this.radiusY > this.radius)
         {
            this.radius = this.radiusY;
         }
         if(this.radiusZ > this.radius)
         {
            this.radius = this.radiusZ;
         }
         this.matrix.scaleX = this.radiusX / this.radius;
         this.matrix.scaleY = this.radiusY / this.radius;
         this.matrix.scaleZ = this.radiusZ / this.radius;
         this.matrix.x = param1.x;
         this.matrix.y = param1.y;
         this.matrix.z = param1.z;
         this.matrix.alternativa3d::composeMatrix();
         this.matrix.alternativa3d::invertMatrix();
         this.src.x = 0;
         this.src.y = 0;
         this.src.z = 0;
         this.displ.x = this.matrix.alternativa3d::ma * param2.x + this.matrix.alternativa3d::mb * param2.y + this.matrix.alternativa3d::mc * param2.z;
         this.displ.y = this.matrix.alternativa3d::me * param2.x + this.matrix.alternativa3d::mf * param2.y + this.matrix.alternativa3d::mg * param2.z;
         this.displ.z = this.matrix.alternativa3d::mi * param2.x + this.matrix.alternativa3d::mj * param2.y + this.matrix.alternativa3d::mk * param2.z;
         this.dest.x = this.src.x + this.displ.x;
         this.dest.y = this.src.y + this.displ.y;
         this.dest.z = this.src.z + this.displ.z;
         if(param5)
         {
            this.vCenter.x = this.displ.x / 2;
            this.vCenter.y = this.displ.y / 2;
            this.vCenter.z = this.displ.z / 2;
            _loc6_ = this.radius + this.displ.length / 2;
         }
         else
         {
            this.vCenter.x = 0;
            this.vCenter.y = 0;
            this.vCenter.z = 0;
            _loc6_ = this.radius + this.displ.length;
         }
         this.vA.x = -_loc6_;
         this.vA.y = -_loc6_;
         this.vA.z = -_loc6_;
         this.vB.x = _loc6_;
         this.vB.y = -_loc6_;
         this.vB.z = -_loc6_;
         this.vC.x = _loc6_;
         this.vC.y = _loc6_;
         this.vC.z = -_loc6_;
         this.vD.x = -_loc6_;
         this.vD.y = _loc6_;
         this.vD.z = -_loc6_;
         param3.alternativa3d::composeAndAppend(this.matrix);
         param3.alternativa3d::collectPlanes(this.vCenter,this.vA,this.vB,this.vC,this.vD,this.faces,param4);
         this.facesLength = this.faces.length;
      }
      
      public function calculateDestination(param1:Vector3D, param2:Vector3D, param3:Object3D, param4:Dictionary = null) : Vector3D
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Number = NaN;
         if(param2.length <= this.threshold)
         {
            return param1.clone();
         }
         this.prepare(param1,param2,param3,param4,false);
         if(this.facesLength > 0)
         {
            _loc5_ = 50;
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               if(!this.checkCollision())
               {
                  break;
               }
               _loc7_ = this.radius + this.threshold + this.collisionPlane.w - this.dest.x * this.collisionPlane.x - this.dest.y * this.collisionPlane.y - this.dest.z * this.collisionPlane.z;
               this.dest.x += this.collisionPlane.x * _loc7_;
               this.dest.y += this.collisionPlane.y * _loc7_;
               this.dest.z += this.collisionPlane.z * _loc7_;
               this.src.x = this.collisionPoint.x + this.collisionPlane.x * (this.radius + this.threshold);
               this.src.y = this.collisionPoint.y + this.collisionPlane.y * (this.radius + this.threshold);
               this.src.z = this.collisionPoint.z + this.collisionPlane.z * (this.radius + this.threshold);
               this.displ.x = this.dest.x - this.src.x;
               this.displ.y = this.dest.y - this.src.y;
               this.displ.z = this.dest.z - this.src.z;
               if(this.displ.length < this.threshold)
               {
                  break;
               }
               _loc6_++;
            }
            this.faces.length = 0;
            this.matrix.alternativa3d::composeMatrix();
            return new Vector3D(this.matrix.alternativa3d::ma * this.dest.x + this.matrix.alternativa3d::mb * this.dest.y + this.matrix.alternativa3d::mc * this.dest.z + this.matrix.alternativa3d::md,this.matrix.alternativa3d::me * this.dest.x + this.matrix.alternativa3d::mf * this.dest.y + this.matrix.alternativa3d::mg * this.dest.z + this.matrix.alternativa3d::mh,this.matrix.alternativa3d::mi * this.dest.x + this.matrix.alternativa3d::mj * this.dest.y + this.matrix.alternativa3d::mk * this.dest.z + this.matrix.alternativa3d::ml);
         }
         return new Vector3D(param1.x + param2.x,param1.y + param2.y,param1.z + param2.z);
      }
      
      public function getCollision(param1:Vector3D, param2:Vector3D, param3:Vector3D, param4:Vector3D, param5:Object3D, param6:Dictionary = null) : Boolean
      {
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
         if(param2.length <= this.threshold)
         {
            return false;
         }
         this.prepare(param1,param2,param5,param6,true);
         if(this.facesLength > 0)
         {
            if(this.checkCollision())
            {
               this.matrix.alternativa3d::composeMatrix();
               param3.x = this.matrix.alternativa3d::ma * this.collisionPoint.x + this.matrix.alternativa3d::mb * this.collisionPoint.y + this.matrix.alternativa3d::mc * this.collisionPoint.z + this.matrix.alternativa3d::md;
               param3.y = this.matrix.alternativa3d::me * this.collisionPoint.x + this.matrix.alternativa3d::mf * this.collisionPoint.y + this.matrix.alternativa3d::mg * this.collisionPoint.z + this.matrix.alternativa3d::mh;
               param3.z = this.matrix.alternativa3d::mi * this.collisionPoint.x + this.matrix.alternativa3d::mj * this.collisionPoint.y + this.matrix.alternativa3d::mk * this.collisionPoint.z + this.matrix.alternativa3d::ml;
               if(this.collisionPlane.x < this.collisionPlane.y)
               {
                  if(this.collisionPlane.x < this.collisionPlane.z)
                  {
                     _loc7_ = 0;
                     _loc8_ = -this.collisionPlane.z;
                     _loc9_ = this.collisionPlane.y;
                  }
                  else
                  {
                     _loc7_ = -this.collisionPlane.y;
                     _loc8_ = this.collisionPlane.x;
                     _loc9_ = 0;
                  }
               }
               else if(this.collisionPlane.y < this.collisionPlane.z)
               {
                  _loc7_ = this.collisionPlane.z;
                  _loc8_ = 0;
                  _loc9_ = -this.collisionPlane.x;
               }
               else
               {
                  _loc7_ = -this.collisionPlane.y;
                  _loc8_ = this.collisionPlane.x;
                  _loc9_ = 0;
               }
               _loc10_ = this.collisionPlane.z * _loc8_ - this.collisionPlane.y * _loc9_;
               _loc11_ = this.collisionPlane.x * _loc9_ - this.collisionPlane.z * _loc7_;
               _loc12_ = this.collisionPlane.y * _loc7_ - this.collisionPlane.x * _loc8_;
               _loc13_ = this.matrix.alternativa3d::ma * _loc7_ + this.matrix.alternativa3d::mb * _loc8_ + this.matrix.alternativa3d::mc * _loc9_;
               _loc14_ = this.matrix.alternativa3d::me * _loc7_ + this.matrix.alternativa3d::mf * _loc8_ + this.matrix.alternativa3d::mg * _loc9_;
               _loc15_ = this.matrix.alternativa3d::mi * _loc7_ + this.matrix.alternativa3d::mj * _loc8_ + this.matrix.alternativa3d::mk * _loc9_;
               _loc16_ = this.matrix.alternativa3d::ma * _loc10_ + this.matrix.alternativa3d::mb * _loc11_ + this.matrix.alternativa3d::mc * _loc12_;
               _loc17_ = this.matrix.alternativa3d::me * _loc10_ + this.matrix.alternativa3d::mf * _loc11_ + this.matrix.alternativa3d::mg * _loc12_;
               _loc18_ = this.matrix.alternativa3d::mi * _loc10_ + this.matrix.alternativa3d::mj * _loc11_ + this.matrix.alternativa3d::mk * _loc12_;
               param4.x = _loc15_ * _loc17_ - _loc14_ * _loc18_;
               param4.y = _loc13_ * _loc18_ - _loc15_ * _loc16_;
               param4.z = _loc14_ * _loc16_ - _loc13_ * _loc17_;
               param4.normalize();
               param4.w = param3.x * param4.x + param3.y * param4.y + param3.z * param4.z;
               this.faces.length = 0;
               return true;
            }
            this.faces.length = 0;
            return false;
         }
         return false;
      }
      
      private function checkCollision() : Boolean
      {
         var _loc1_:Face = null;
         var _loc2_:Wrapper = null;
         var _loc3_:Vertex = null;
         var _loc4_:Vertex = null;
         var _loc5_:Vertex = null;
         var _loc6_:Number = NaN;
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
         var _loc25_:Boolean = false;
         var _loc26_:Wrapper = null;
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
         var _loc44_:Number = 1;
         var _loc45_:Number = this.displ.length;
         var _loc46_:int = 0;
         while(_loc46_ < this.facesLength)
         {
            _loc1_ = this.faces[_loc46_];
            _loc2_ = _loc1_.alternativa3d::wrapper;
            _loc3_ = _loc2_.alternativa3d::vertex;
            _loc2_ = _loc2_.alternativa3d::next;
            _loc4_ = _loc2_.alternativa3d::vertex;
            _loc2_ = _loc2_.alternativa3d::next;
            _loc5_ = _loc2_.alternativa3d::vertex;
            _loc6_ = _loc4_.alternativa3d::cameraX - _loc3_.alternativa3d::cameraX;
            _loc7_ = _loc4_.alternativa3d::cameraY - _loc3_.alternativa3d::cameraY;
            _loc8_ = _loc4_.alternativa3d::cameraZ - _loc3_.alternativa3d::cameraZ;
            _loc9_ = _loc5_.alternativa3d::cameraX - _loc3_.alternativa3d::cameraX;
            _loc10_ = _loc5_.alternativa3d::cameraY - _loc3_.alternativa3d::cameraY;
            _loc11_ = _loc5_.alternativa3d::cameraZ - _loc3_.alternativa3d::cameraZ;
            _loc12_ = _loc11_ * _loc7_ - _loc10_ * _loc8_;
            _loc13_ = _loc9_ * _loc8_ - _loc11_ * _loc6_;
            _loc14_ = _loc10_ * _loc6_ - _loc9_ * _loc7_;
            _loc15_ = _loc12_ * _loc12_ + _loc13_ * _loc13_ + _loc14_ * _loc14_;
            if(_loc15_ > 0.001)
            {
               _loc15_ = 1 / Math.sqrt(_loc15_);
               _loc12_ *= _loc15_;
               _loc13_ *= _loc15_;
               _loc14_ *= _loc15_;
               _loc16_ = _loc3_.alternativa3d::cameraX * _loc12_ + _loc3_.alternativa3d::cameraY * _loc13_ + _loc3_.alternativa3d::cameraZ * _loc14_;
               _loc17_ = this.src.x * _loc12_ + this.src.y * _loc13_ + this.src.z * _loc14_ - _loc16_;
               if(_loc17_ < this.radius)
               {
                  _loc18_ = this.src.x - _loc12_ * _loc17_;
                  _loc19_ = this.src.y - _loc13_ * _loc17_;
                  _loc20_ = this.src.z - _loc14_ * _loc17_;
               }
               else
               {
                  _loc30_ = (_loc17_ - this.radius) / (_loc17_ - this.dest.x * _loc12_ - this.dest.y * _loc13_ - this.dest.z * _loc14_ + _loc16_);
                  _loc18_ = this.src.x + this.displ.x * _loc30_ - _loc12_ * this.radius;
                  _loc19_ = this.src.y + this.displ.y * _loc30_ - _loc13_ * this.radius;
                  _loc20_ = this.src.z + this.displ.z * _loc30_ - _loc14_ * this.radius;
               }
               _loc24_ = 1e+22;
               _loc25_ = true;
               _loc26_ = _loc1_.alternativa3d::wrapper;
               while(_loc26_ != null)
               {
                  _loc3_ = _loc26_.alternativa3d::vertex;
                  _loc4_ = _loc26_.alternativa3d::next != null ? _loc26_.alternativa3d::next.alternativa3d::vertex : _loc1_.alternativa3d::wrapper.alternativa3d::vertex;
                  _loc6_ = _loc4_.alternativa3d::cameraX - _loc3_.alternativa3d::cameraX;
                  _loc7_ = _loc4_.alternativa3d::cameraY - _loc3_.alternativa3d::cameraY;
                  _loc8_ = _loc4_.alternativa3d::cameraZ - _loc3_.alternativa3d::cameraZ;
                  _loc9_ = _loc18_ - _loc3_.alternativa3d::cameraX;
                  _loc10_ = _loc19_ - _loc3_.alternativa3d::cameraY;
                  _loc11_ = _loc20_ - _loc3_.alternativa3d::cameraZ;
                  _loc31_ = _loc11_ * _loc7_ - _loc10_ * _loc8_;
                  _loc32_ = _loc9_ * _loc8_ - _loc11_ * _loc6_;
                  _loc33_ = _loc10_ * _loc6_ - _loc9_ * _loc7_;
                  if(_loc31_ * _loc12_ + _loc32_ * _loc13_ + _loc33_ * _loc14_ < 0)
                  {
                     _loc34_ = _loc6_ * _loc6_ + _loc7_ * _loc7_ + _loc8_ * _loc8_;
                     _loc35_ = (_loc31_ * _loc31_ + _loc32_ * _loc32_ + _loc33_ * _loc33_) / _loc34_;
                     if(_loc35_ < _loc24_)
                     {
                        _loc34_ = Math.sqrt(_loc34_);
                        _loc6_ /= _loc34_;
                        _loc7_ /= _loc34_;
                        _loc8_ /= _loc34_;
                        _loc30_ = _loc6_ * _loc9_ + _loc7_ * _loc10_ + _loc8_ * _loc11_;
                        if(_loc30_ < 0)
                        {
                           _loc36_ = _loc9_ * _loc9_ + _loc10_ * _loc10_ + _loc11_ * _loc11_;
                           if(_loc36_ < _loc24_)
                           {
                              _loc24_ = _loc36_;
                              _loc21_ = _loc3_.alternativa3d::cameraX;
                              _loc22_ = _loc3_.alternativa3d::cameraY;
                              _loc23_ = _loc3_.alternativa3d::cameraZ;
                           }
                        }
                        else if(_loc30_ > _loc34_)
                        {
                           _loc9_ = _loc18_ - _loc4_.alternativa3d::cameraX;
                           _loc10_ = _loc19_ - _loc4_.alternativa3d::cameraY;
                           _loc11_ = _loc20_ - _loc4_.alternativa3d::cameraZ;
                           _loc36_ = _loc9_ * _loc9_ + _loc10_ * _loc10_ + _loc11_ * _loc11_;
                           if(_loc36_ < _loc24_)
                           {
                              _loc24_ = _loc36_;
                              _loc21_ = _loc4_.alternativa3d::cameraX;
                              _loc22_ = _loc4_.alternativa3d::cameraY;
                              _loc23_ = _loc4_.alternativa3d::cameraZ;
                           }
                        }
                        else
                        {
                           _loc24_ = _loc35_;
                           _loc21_ = _loc3_.alternativa3d::cameraX + _loc6_ * _loc30_;
                           _loc22_ = _loc3_.alternativa3d::cameraY + _loc7_ * _loc30_;
                           _loc23_ = _loc3_.alternativa3d::cameraZ + _loc8_ * _loc30_;
                        }
                     }
                     _loc25_ = false;
                  }
                  _loc26_ = _loc26_.alternativa3d::next;
               }
               if(_loc25_)
               {
                  _loc21_ = _loc18_;
                  _loc22_ = _loc19_;
                  _loc23_ = _loc20_;
               }
               _loc27_ = this.src.x - _loc21_;
               _loc28_ = this.src.y - _loc22_;
               _loc29_ = this.src.z - _loc23_;
               if(_loc27_ * this.displ.x + _loc28_ * this.displ.y + _loc29_ * this.displ.z <= 0)
               {
                  _loc37_ = -this.displ.x / _loc45_;
                  _loc38_ = -this.displ.y / _loc45_;
                  _loc39_ = -this.displ.z / _loc45_;
                  _loc40_ = _loc27_ * _loc27_ + _loc28_ * _loc28_ + _loc29_ * _loc29_;
                  _loc41_ = _loc27_ * _loc37_ + _loc28_ * _loc38_ + _loc29_ * _loc39_;
                  _loc42_ = this.radius * this.radius - _loc40_ + _loc41_ * _loc41_;
                  if(_loc42_ > 0)
                  {
                     _loc43_ = (_loc41_ - Math.sqrt(_loc42_)) / _loc45_;
                     if(_loc43_ < _loc44_)
                     {
                        _loc44_ = _loc43_;
                        this.collisionPoint.x = _loc21_;
                        this.collisionPoint.y = _loc22_;
                        this.collisionPoint.z = _loc23_;
                        if(_loc25_)
                        {
                           this.collisionPlane.x = _loc12_;
                           this.collisionPlane.y = _loc13_;
                           this.collisionPlane.z = _loc14_;
                           this.collisionPlane.w = _loc16_;
                        }
                        else
                        {
                           _loc40_ = Math.sqrt(_loc40_);
                           this.collisionPlane.x = _loc27_ / _loc40_;
                           this.collisionPlane.y = _loc28_ / _loc40_;
                           this.collisionPlane.z = _loc29_ / _loc40_;
                           this.collisionPlane.w = this.collisionPoint.x * this.collisionPlane.x + this.collisionPoint.y * this.collisionPlane.y + this.collisionPoint.z * this.collisionPlane.z;
                        }
                     }
                  }
               }
            }
            _loc46_++;
         }
         return _loc44_ < 1;
      }
   }
}

