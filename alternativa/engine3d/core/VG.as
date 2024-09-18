package alternativa.engine3d.core
{
   import alternativa.engine3d.alternativa3d;
   
   use namespace alternativa3d;
   
   public class VG
   {
      private static var collector:VG;
      
      alternativa3d var next:VG;
      
      alternativa3d var faceStruct:Face;
      
      alternativa3d var object:Object3D;
      
      alternativa3d var sorting:int;
      
      alternativa3d var debug:int = 0;
      
      alternativa3d var space:int = 0;
      
      alternativa3d var viewAligned:Boolean = false;
      
      alternativa3d var boundMinX:Number;
      
      alternativa3d var boundMinY:Number;
      
      alternativa3d var boundMinZ:Number;
      
      alternativa3d var boundMaxX:Number;
      
      alternativa3d var boundMaxY:Number;
      
      alternativa3d var boundMaxZ:Number;
      
      alternativa3d var boundVertexList:Vertex;
      
      alternativa3d var boundPlaneList:Vertex;
      
      alternativa3d var numOccluders:int;
      
      public function VG()
      {
         this.alternativa3d::boundVertexList = Vertex.alternativa3d::createList(8);
         this.alternativa3d::boundPlaneList = Vertex.alternativa3d::createList(6);
         super();
      }
      
      alternativa3d static function create(param1:Object3D, param2:Face, param3:int, param4:int, param5:Boolean) : VG
      {
         var _loc6_:VG = null;
         if(collector != null)
         {
            _loc6_ = collector;
            collector = collector.alternativa3d::next;
            _loc6_.alternativa3d::next = null;
         }
         else
         {
            _loc6_ = new VG();
         }
         _loc6_.alternativa3d::object = param1;
         _loc6_.alternativa3d::faceStruct = param2;
         _loc6_.alternativa3d::sorting = param3;
         _loc6_.alternativa3d::debug = param4;
         _loc6_.alternativa3d::viewAligned = param5;
         return _loc6_;
      }
      
      alternativa3d function destroy() : void
      {
         if(this.alternativa3d::faceStruct != null)
         {
            this.destroyFaceStruct(this.alternativa3d::faceStruct);
            this.alternativa3d::faceStruct = null;
         }
         this.alternativa3d::object = null;
         this.alternativa3d::numOccluders = 0;
         this.alternativa3d::debug = 0;
         this.alternativa3d::space = 0;
         this.alternativa3d::next = collector;
         collector = this;
      }
      
      private function destroyFaceStruct(param1:Face) : void
      {
         if(param1.alternativa3d::processNegative != null)
         {
            this.destroyFaceStruct(param1.alternativa3d::processNegative);
            param1.alternativa3d::processNegative = null;
         }
         if(param1.alternativa3d::processPositive != null)
         {
            this.destroyFaceStruct(param1.alternativa3d::processPositive);
            param1.alternativa3d::processPositive = null;
         }
         var _loc2_:Face = param1.alternativa3d::processNext;
         while(_loc2_ != null)
         {
            param1.alternativa3d::processNext = null;
            param1 = _loc2_;
            _loc2_ = param1.alternativa3d::processNext;
         }
      }
      
      alternativa3d function calculateAABB(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number, param10:Number, param11:Number, param12:Number) : void
      {
         this.alternativa3d::boundMinX = 1e+22;
         this.alternativa3d::boundMinY = 1e+22;
         this.alternativa3d::boundMinZ = 1e+22;
         this.alternativa3d::boundMaxX = -1e+22;
         this.alternativa3d::boundMaxY = -1e+22;
         this.alternativa3d::boundMaxZ = -1e+22;
         this.calculateAABBStruct(this.alternativa3d::faceStruct,++this.alternativa3d::object.alternativa3d::transformId,param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12);
         this.alternativa3d::space = 1;
      }
      
      alternativa3d function calculateOOBB(param1:Object3D) : void
      {
         var _loc2_:Vertex = null;
         var _loc3_:Vertex = null;
         var _loc4_:Vertex = null;
         var _loc5_:Vertex = null;
         var _loc6_:Vertex = null;
         var _loc7_:Vertex = null;
         var _loc8_:Vertex = null;
         var _loc9_:Vertex = null;
         var _loc10_:Vertex = null;
         var _loc11_:Vertex = null;
         var _loc12_:Vertex = null;
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
         var _loc26_:Vertex = null;
         var _loc27_:Vertex = null;
         var _loc28_:Vertex = null;
         var _loc29_:Vertex = null;
         if(this.alternativa3d::space == 1)
         {
            this.alternativa3d::transformStruct(this.alternativa3d::faceStruct,++this.alternativa3d::object.alternativa3d::transformId,param1.alternativa3d::ma,param1.alternativa3d::mb,param1.alternativa3d::mc,param1.alternativa3d::md,param1.alternativa3d::me,param1.alternativa3d::mf,param1.alternativa3d::mg,param1.alternativa3d::mh,param1.alternativa3d::mi,param1.alternativa3d::mj,param1.alternativa3d::mk,param1.alternativa3d::ml);
         }
         if(!this.alternativa3d::viewAligned)
         {
            this.alternativa3d::boundMinX = 1e+22;
            this.alternativa3d::boundMinY = 1e+22;
            this.alternativa3d::boundMinZ = 1e+22;
            this.alternativa3d::boundMaxX = -1e+22;
            this.alternativa3d::boundMaxY = -1e+22;
            this.alternativa3d::boundMaxZ = -1e+22;
            this.calculateOOBBStruct(this.alternativa3d::faceStruct,++this.alternativa3d::object.alternativa3d::transformId,this.alternativa3d::object.alternativa3d::ima,this.alternativa3d::object.alternativa3d::imb,this.alternativa3d::object.alternativa3d::imc,this.alternativa3d::object.alternativa3d::imd,this.alternativa3d::object.alternativa3d::ime,this.alternativa3d::object.alternativa3d::imf,this.alternativa3d::object.alternativa3d::img,this.alternativa3d::object.alternativa3d::imh,this.alternativa3d::object.alternativa3d::imi,this.alternativa3d::object.alternativa3d::imj,this.alternativa3d::object.alternativa3d::imk,this.alternativa3d::object.alternativa3d::iml);
            if(this.alternativa3d::boundMaxX - this.alternativa3d::boundMinX < 1)
            {
               this.alternativa3d::boundMaxX = this.alternativa3d::boundMinX + 1;
            }
            if(this.alternativa3d::boundMaxY - this.alternativa3d::boundMinY < 1)
            {
               this.alternativa3d::boundMaxY = this.alternativa3d::boundMinY + 1;
            }
            if(this.alternativa3d::boundMaxZ - this.alternativa3d::boundMinZ < 1)
            {
               this.alternativa3d::boundMaxZ = this.alternativa3d::boundMinZ + 1;
            }
            _loc2_ = this.alternativa3d::boundVertexList;
            _loc2_.x = this.alternativa3d::boundMinX;
            _loc2_.y = this.alternativa3d::boundMinY;
            _loc2_.z = this.alternativa3d::boundMinZ;
            _loc3_ = _loc2_.alternativa3d::next;
            _loc3_.x = this.alternativa3d::boundMaxX;
            _loc3_.y = this.alternativa3d::boundMinY;
            _loc3_.z = this.alternativa3d::boundMinZ;
            (_loc4_ = _loc3_.alternativa3d::next).x = this.alternativa3d::boundMinX;
            _loc4_.y = this.alternativa3d::boundMaxY;
            _loc4_.z = this.alternativa3d::boundMinZ;
            (_loc5_ = _loc4_.alternativa3d::next).x = this.alternativa3d::boundMaxX;
            _loc5_.y = this.alternativa3d::boundMaxY;
            _loc5_.z = this.alternativa3d::boundMinZ;
            (_loc6_ = _loc5_.alternativa3d::next).x = this.alternativa3d::boundMinX;
            _loc6_.y = this.alternativa3d::boundMinY;
            _loc6_.z = this.alternativa3d::boundMaxZ;
            (_loc7_ = _loc6_.alternativa3d::next).x = this.alternativa3d::boundMaxX;
            _loc7_.y = this.alternativa3d::boundMinY;
            _loc7_.z = this.alternativa3d::boundMaxZ;
            (_loc8_ = _loc7_.alternativa3d::next).x = this.alternativa3d::boundMinX;
            _loc8_.y = this.alternativa3d::boundMaxY;
            _loc8_.z = this.alternativa3d::boundMaxZ;
            (_loc9_ = _loc8_.alternativa3d::next).x = this.alternativa3d::boundMaxX;
            _loc9_.y = this.alternativa3d::boundMaxY;
            _loc9_.z = this.alternativa3d::boundMaxZ;
            _loc10_ = _loc2_;
            while(_loc10_ != null)
            {
               _loc10_.alternativa3d::cameraX = this.alternativa3d::object.alternativa3d::ma * _loc10_.x + this.alternativa3d::object.alternativa3d::mb * _loc10_.y + this.alternativa3d::object.alternativa3d::mc * _loc10_.z + this.alternativa3d::object.alternativa3d::md;
               _loc10_.alternativa3d::cameraY = this.alternativa3d::object.alternativa3d::me * _loc10_.x + this.alternativa3d::object.alternativa3d::mf * _loc10_.y + this.alternativa3d::object.alternativa3d::mg * _loc10_.z + this.alternativa3d::object.alternativa3d::mh;
               _loc10_.alternativa3d::cameraZ = this.alternativa3d::object.alternativa3d::mi * _loc10_.x + this.alternativa3d::object.alternativa3d::mj * _loc10_.y + this.alternativa3d::object.alternativa3d::mk * _loc10_.z + this.alternativa3d::object.alternativa3d::ml;
               _loc10_ = _loc10_.alternativa3d::next;
            }
            _loc11_ = this.alternativa3d::boundPlaneList;
            _loc12_ = _loc11_.alternativa3d::next;
            _loc13_ = _loc2_.alternativa3d::cameraX;
            _loc14_ = _loc2_.alternativa3d::cameraY;
            _loc15_ = _loc2_.alternativa3d::cameraZ;
            _loc16_ = _loc3_.alternativa3d::cameraX - _loc13_;
            _loc17_ = _loc3_.alternativa3d::cameraY - _loc14_;
            _loc18_ = _loc3_.alternativa3d::cameraZ - _loc15_;
            _loc19_ = _loc6_.alternativa3d::cameraX - _loc13_;
            _loc20_ = _loc6_.alternativa3d::cameraY - _loc14_;
            _loc21_ = _loc6_.alternativa3d::cameraZ - _loc15_;
            _loc22_ = _loc21_ * _loc17_ - _loc20_ * _loc18_;
            _loc23_ = _loc19_ * _loc18_ - _loc21_ * _loc16_;
            _loc24_ = _loc20_ * _loc16_ - _loc19_ * _loc17_;
            _loc25_ = 1 / Math.sqrt(_loc22_ * _loc22_ + _loc23_ * _loc23_ + _loc24_ * _loc24_);
            _loc22_ *= _loc25_;
            _loc23_ *= _loc25_;
            _loc24_ *= _loc25_;
            _loc11_.alternativa3d::cameraX = _loc22_;
            _loc11_.alternativa3d::cameraY = _loc23_;
            _loc11_.alternativa3d::cameraZ = _loc24_;
            _loc11_.alternativa3d::offset = _loc13_ * _loc22_ + _loc14_ * _loc23_ + _loc15_ * _loc24_;
            _loc12_.alternativa3d::cameraX = -_loc22_;
            _loc12_.alternativa3d::cameraY = -_loc23_;
            _loc12_.alternativa3d::cameraZ = -_loc24_;
            _loc12_.alternativa3d::offset = -_loc4_.alternativa3d::cameraX * _loc22_ - _loc4_.alternativa3d::cameraY * _loc23_ - _loc4_.alternativa3d::cameraZ * _loc24_;
            _loc26_ = _loc12_.alternativa3d::next;
            _loc27_ = _loc26_.alternativa3d::next;
            _loc13_ = _loc2_.alternativa3d::cameraX;
            _loc14_ = _loc2_.alternativa3d::cameraY;
            _loc15_ = _loc2_.alternativa3d::cameraZ;
            _loc16_ = _loc6_.alternativa3d::cameraX - _loc13_;
            _loc17_ = _loc6_.alternativa3d::cameraY - _loc14_;
            _loc18_ = _loc6_.alternativa3d::cameraZ - _loc15_;
            _loc19_ = _loc4_.alternativa3d::cameraX - _loc13_;
            _loc20_ = _loc4_.alternativa3d::cameraY - _loc14_;
            _loc21_ = _loc4_.alternativa3d::cameraZ - _loc15_;
            _loc22_ = _loc21_ * _loc17_ - _loc20_ * _loc18_;
            _loc23_ = _loc19_ * _loc18_ - _loc21_ * _loc16_;
            _loc24_ = _loc20_ * _loc16_ - _loc19_ * _loc17_;
            _loc25_ = 1 / Math.sqrt(_loc22_ * _loc22_ + _loc23_ * _loc23_ + _loc24_ * _loc24_);
            _loc22_ *= _loc25_;
            _loc23_ *= _loc25_;
            _loc24_ *= _loc25_;
            _loc26_.alternativa3d::cameraX = _loc22_;
            _loc26_.alternativa3d::cameraY = _loc23_;
            _loc26_.alternativa3d::cameraZ = _loc24_;
            _loc26_.alternativa3d::offset = _loc13_ * _loc22_ + _loc14_ * _loc23_ + _loc15_ * _loc24_;
            _loc27_.alternativa3d::cameraX = -_loc22_;
            _loc27_.alternativa3d::cameraY = -_loc23_;
            _loc27_.alternativa3d::cameraZ = -_loc24_;
            _loc27_.alternativa3d::offset = -_loc3_.alternativa3d::cameraX * _loc22_ - _loc3_.alternativa3d::cameraY * _loc23_ - _loc3_.alternativa3d::cameraZ * _loc24_;
            _loc28_ = _loc27_.alternativa3d::next;
            _loc29_ = _loc28_.alternativa3d::next;
            _loc13_ = _loc6_.alternativa3d::cameraX;
            _loc14_ = _loc6_.alternativa3d::cameraY;
            _loc15_ = _loc6_.alternativa3d::cameraZ;
            _loc16_ = _loc7_.alternativa3d::cameraX - _loc13_;
            _loc17_ = _loc7_.alternativa3d::cameraY - _loc14_;
            _loc18_ = _loc7_.alternativa3d::cameraZ - _loc15_;
            _loc19_ = _loc8_.alternativa3d::cameraX - _loc13_;
            _loc20_ = _loc8_.alternativa3d::cameraY - _loc14_;
            _loc21_ = _loc8_.alternativa3d::cameraZ - _loc15_;
            _loc22_ = _loc21_ * _loc17_ - _loc20_ * _loc18_;
            _loc23_ = _loc19_ * _loc18_ - _loc21_ * _loc16_;
            _loc24_ = _loc20_ * _loc16_ - _loc19_ * _loc17_;
            _loc25_ = 1 / Math.sqrt(_loc22_ * _loc22_ + _loc23_ * _loc23_ + _loc24_ * _loc24_);
            _loc22_ *= _loc25_;
            _loc23_ *= _loc25_;
            _loc24_ *= _loc25_;
            _loc28_.alternativa3d::cameraX = _loc22_;
            _loc28_.alternativa3d::cameraY = _loc23_;
            _loc28_.alternativa3d::cameraZ = _loc24_;
            _loc28_.alternativa3d::offset = _loc13_ * _loc22_ + _loc14_ * _loc23_ + _loc15_ * _loc24_;
            _loc29_.alternativa3d::cameraX = -_loc22_;
            _loc29_.alternativa3d::cameraY = -_loc23_;
            _loc29_.alternativa3d::cameraZ = -_loc24_;
            _loc29_.alternativa3d::offset = -_loc2_.alternativa3d::cameraX * _loc22_ - _loc2_.alternativa3d::cameraY * _loc23_ - _loc2_.alternativa3d::cameraZ * _loc24_;
            if(_loc11_.alternativa3d::offset < -_loc12_.alternativa3d::offset)
            {
               _loc12_.alternativa3d::cameraX = -_loc12_.alternativa3d::cameraX;
               _loc12_.alternativa3d::cameraY = -_loc12_.alternativa3d::cameraY;
               _loc12_.alternativa3d::cameraZ = -_loc12_.alternativa3d::cameraZ;
               _loc12_.alternativa3d::offset = -_loc12_.alternativa3d::offset;
               _loc11_.alternativa3d::cameraX = -_loc11_.alternativa3d::cameraX;
               _loc11_.alternativa3d::cameraY = -_loc11_.alternativa3d::cameraY;
               _loc11_.alternativa3d::cameraZ = -_loc11_.alternativa3d::cameraZ;
               _loc11_.alternativa3d::offset = -_loc11_.alternativa3d::offset;
            }
            if(_loc26_.alternativa3d::offset < -_loc27_.alternativa3d::offset)
            {
               _loc26_.alternativa3d::cameraX = -_loc26_.alternativa3d::cameraX;
               _loc26_.alternativa3d::cameraY = -_loc26_.alternativa3d::cameraY;
               _loc26_.alternativa3d::cameraZ = -_loc26_.alternativa3d::cameraZ;
               _loc26_.alternativa3d::offset = -_loc26_.alternativa3d::offset;
               _loc27_.alternativa3d::cameraX = -_loc27_.alternativa3d::cameraX;
               _loc27_.alternativa3d::cameraY = -_loc27_.alternativa3d::cameraY;
               _loc27_.alternativa3d::cameraZ = -_loc27_.alternativa3d::cameraZ;
               _loc27_.alternativa3d::offset = -_loc27_.alternativa3d::offset;
            }
            if(_loc29_.alternativa3d::offset < -_loc28_.alternativa3d::offset)
            {
               _loc29_.alternativa3d::cameraX = -_loc29_.alternativa3d::cameraX;
               _loc29_.alternativa3d::cameraY = -_loc29_.alternativa3d::cameraY;
               _loc29_.alternativa3d::cameraZ = -_loc29_.alternativa3d::cameraZ;
               _loc29_.alternativa3d::offset = -_loc29_.alternativa3d::offset;
               _loc28_.alternativa3d::cameraX = -_loc28_.alternativa3d::cameraX;
               _loc28_.alternativa3d::cameraY = -_loc28_.alternativa3d::cameraY;
               _loc28_.alternativa3d::cameraZ = -_loc28_.alternativa3d::cameraZ;
               _loc28_.alternativa3d::offset = -_loc28_.alternativa3d::offset;
            }
         }
         this.alternativa3d::space = 2;
      }
      
      private function calculateAABBStruct(param1:Face, param2:int, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number, param10:Number, param11:Number, param12:Number, param13:Number, param14:Number) : void
      {
         var _loc15_:Wrapper = null;
         var _loc16_:Vertex = null;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Face = param1;
         while(_loc20_ != null)
         {
            _loc15_ = _loc20_.alternativa3d::wrapper;
            while(_loc15_ != null)
            {
               _loc16_ = _loc15_.alternativa3d::vertex;
               if(_loc16_.alternativa3d::transformId != param2)
               {
                  _loc17_ = _loc16_.alternativa3d::cameraX;
                  _loc18_ = _loc16_.alternativa3d::cameraY;
                  _loc19_ = _loc16_.alternativa3d::cameraZ;
                  _loc16_.alternativa3d::cameraX = param3 * _loc17_ + param4 * _loc18_ + param5 * _loc19_ + param6;
                  _loc16_.alternativa3d::cameraY = param7 * _loc17_ + param8 * _loc18_ + param9 * _loc19_ + param10;
                  _loc16_.alternativa3d::cameraZ = param11 * _loc17_ + param12 * _loc18_ + param13 * _loc19_ + param14;
                  if(_loc16_.alternativa3d::cameraX < this.alternativa3d::boundMinX)
                  {
                     this.alternativa3d::boundMinX = _loc16_.alternativa3d::cameraX;
                  }
                  if(_loc16_.alternativa3d::cameraX > this.alternativa3d::boundMaxX)
                  {
                     this.alternativa3d::boundMaxX = _loc16_.alternativa3d::cameraX;
                  }
                  if(_loc16_.alternativa3d::cameraY < this.alternativa3d::boundMinY)
                  {
                     this.alternativa3d::boundMinY = _loc16_.alternativa3d::cameraY;
                  }
                  if(_loc16_.alternativa3d::cameraY > this.alternativa3d::boundMaxY)
                  {
                     this.alternativa3d::boundMaxY = _loc16_.alternativa3d::cameraY;
                  }
                  if(_loc16_.alternativa3d::cameraZ < this.alternativa3d::boundMinZ)
                  {
                     this.alternativa3d::boundMinZ = _loc16_.alternativa3d::cameraZ;
                  }
                  if(_loc16_.alternativa3d::cameraZ > this.alternativa3d::boundMaxZ)
                  {
                     this.alternativa3d::boundMaxZ = _loc16_.alternativa3d::cameraZ;
                  }
                  _loc16_.alternativa3d::transformId = param2;
               }
               _loc15_ = _loc15_.alternativa3d::next;
            }
            _loc20_ = _loc20_.alternativa3d::processNext;
         }
         if(param1.alternativa3d::processNegative != null)
         {
            this.calculateAABBStruct(param1.alternativa3d::processNegative,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14);
         }
         if(param1.alternativa3d::processPositive != null)
         {
            this.calculateAABBStruct(param1.alternativa3d::processPositive,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14);
         }
      }
      
      private function calculateOOBBStruct(param1:Face, param2:int, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number, param10:Number, param11:Number, param12:Number, param13:Number, param14:Number) : void
      {
         var _loc15_:Wrapper = null;
         var _loc16_:Vertex = null;
         var _loc17_:Face = param1;
         while(_loc17_ != null)
         {
            _loc15_ = _loc17_.alternativa3d::wrapper;
            while(_loc15_ != null)
            {
               _loc16_ = _loc15_.alternativa3d::vertex;
               if(_loc16_.alternativa3d::transformId != param2)
               {
                  if(_loc16_.x < this.alternativa3d::boundMinX)
                  {
                     this.alternativa3d::boundMinX = _loc16_.x;
                  }
                  if(_loc16_.x > this.alternativa3d::boundMaxX)
                  {
                     this.alternativa3d::boundMaxX = _loc16_.x;
                  }
                  if(_loc16_.y < this.alternativa3d::boundMinY)
                  {
                     this.alternativa3d::boundMinY = _loc16_.y;
                  }
                  if(_loc16_.y > this.alternativa3d::boundMaxY)
                  {
                     this.alternativa3d::boundMaxY = _loc16_.y;
                  }
                  if(_loc16_.z < this.alternativa3d::boundMinZ)
                  {
                     this.alternativa3d::boundMinZ = _loc16_.z;
                  }
                  if(_loc16_.z > this.alternativa3d::boundMaxZ)
                  {
                     this.alternativa3d::boundMaxZ = _loc16_.z;
                  }
                  _loc16_.alternativa3d::transformId = param2;
               }
               _loc15_ = _loc15_.alternativa3d::next;
            }
            _loc17_ = _loc17_.alternativa3d::processNext;
         }
         if(param1.alternativa3d::processNegative != null)
         {
            this.calculateOOBBStruct(param1.alternativa3d::processNegative,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14);
         }
         if(param1.alternativa3d::processPositive != null)
         {
            this.calculateOOBBStruct(param1.alternativa3d::processPositive,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14);
         }
      }
      
      private function updateAABBStruct(param1:Face, param2:int) : void
      {
         var _loc3_:Wrapper = null;
         var _loc4_:Vertex = null;
         var _loc5_:Face = param1;
         while(_loc5_ != null)
         {
            _loc3_ = _loc5_.alternativa3d::wrapper;
            while(_loc3_ != null)
            {
               _loc4_ = _loc3_.alternativa3d::vertex;
               if(_loc4_.alternativa3d::transformId != param2)
               {
                  if(_loc4_.alternativa3d::cameraX < this.alternativa3d::boundMinX)
                  {
                     this.alternativa3d::boundMinX = _loc4_.alternativa3d::cameraX;
                  }
                  if(_loc4_.alternativa3d::cameraX > this.alternativa3d::boundMaxX)
                  {
                     this.alternativa3d::boundMaxX = _loc4_.alternativa3d::cameraX;
                  }
                  if(_loc4_.alternativa3d::cameraY < this.alternativa3d::boundMinY)
                  {
                     this.alternativa3d::boundMinY = _loc4_.alternativa3d::cameraY;
                  }
                  if(_loc4_.alternativa3d::cameraY > this.alternativa3d::boundMaxY)
                  {
                     this.alternativa3d::boundMaxY = _loc4_.alternativa3d::cameraY;
                  }
                  if(_loc4_.alternativa3d::cameraZ < this.alternativa3d::boundMinZ)
                  {
                     this.alternativa3d::boundMinZ = _loc4_.alternativa3d::cameraZ;
                  }
                  if(_loc4_.alternativa3d::cameraZ > this.alternativa3d::boundMaxZ)
                  {
                     this.alternativa3d::boundMaxZ = _loc4_.alternativa3d::cameraZ;
                  }
                  _loc4_.alternativa3d::transformId = param2;
               }
               _loc3_ = _loc3_.alternativa3d::next;
            }
            _loc5_ = _loc5_.alternativa3d::processNext;
         }
         if(param1.alternativa3d::processNegative != null)
         {
            this.updateAABBStruct(param1.alternativa3d::processNegative,param2);
         }
         if(param1.alternativa3d::processPositive != null)
         {
            this.updateAABBStruct(param1.alternativa3d::processPositive,param2);
         }
      }
      
      alternativa3d function split(param1:Camera3D, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
         var _loc7_:VG = null;
         var _loc8_:Face = this.alternativa3d::faceStruct.alternativa3d::create();
         this.splitFaceStruct(param1,this.alternativa3d::faceStruct,_loc8_,param2,param3,param4,param5,param5 - param6,param5 + param6);
         if(_loc8_.alternativa3d::processNegative != null)
         {
            if(collector != null)
            {
               _loc7_ = collector;
               collector = collector.alternativa3d::next;
               _loc7_.alternativa3d::next = null;
            }
            else
            {
               _loc7_ = new VG();
            }
            this.alternativa3d::next = _loc7_;
            _loc7_.alternativa3d::faceStruct = _loc8_.alternativa3d::processNegative;
            _loc8_.alternativa3d::processNegative = null;
            _loc7_.alternativa3d::object = this.alternativa3d::object;
            _loc7_.alternativa3d::sorting = this.alternativa3d::sorting;
            _loc7_.alternativa3d::debug = this.alternativa3d::debug;
            _loc7_.alternativa3d::space = this.alternativa3d::space;
            _loc7_.alternativa3d::viewAligned = this.alternativa3d::viewAligned;
            _loc7_.alternativa3d::boundMinX = 1e+22;
            _loc7_.alternativa3d::boundMinY = 1e+22;
            _loc7_.alternativa3d::boundMinZ = 1e+22;
            _loc7_.alternativa3d::boundMaxX = -1e+22;
            _loc7_.alternativa3d::boundMaxY = -1e+22;
            _loc7_.alternativa3d::boundMaxZ = -1e+22;
            _loc7_.updateAABBStruct(_loc7_.alternativa3d::faceStruct,++this.alternativa3d::object.alternativa3d::transformId);
         }
         else
         {
            this.alternativa3d::next = null;
         }
         if(_loc8_.alternativa3d::processPositive != null)
         {
            this.alternativa3d::faceStruct = _loc8_.alternativa3d::processPositive;
            _loc8_.alternativa3d::processPositive = null;
            this.alternativa3d::boundMinX = 1e+22;
            this.alternativa3d::boundMinY = 1e+22;
            this.alternativa3d::boundMinZ = 1e+22;
            this.alternativa3d::boundMaxX = -1e+22;
            this.alternativa3d::boundMaxY = -1e+22;
            this.alternativa3d::boundMaxZ = -1e+22;
            this.updateAABBStruct(this.alternativa3d::faceStruct,++this.alternativa3d::object.alternativa3d::transformId);
         }
         else
         {
            this.alternativa3d::faceStruct = null;
         }
         _loc8_.alternativa3d::next = Face.alternativa3d::collector;
         Face.alternativa3d::collector = _loc8_;
      }
      
      alternativa3d function crop(param1:Camera3D, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
         this.alternativa3d::faceStruct = this.cropFaceStruct(param1,this.alternativa3d::faceStruct,param2,param3,param4,param5,param5 - param6,param5 + param6);
         if(this.alternativa3d::faceStruct != null)
         {
            this.alternativa3d::boundMinX = 1e+22;
            this.alternativa3d::boundMinY = 1e+22;
            this.alternativa3d::boundMinZ = 1e+22;
            this.alternativa3d::boundMaxX = -1e+22;
            this.alternativa3d::boundMaxY = -1e+22;
            this.alternativa3d::boundMaxZ = -1e+22;
            this.updateAABBStruct(this.alternativa3d::faceStruct,++this.alternativa3d::object.alternativa3d::transformId);
         }
      }
      
      private function splitFaceStruct(param1:Camera3D, param2:Face, param3:Face, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number) : void
      {
         var _loc10_:Face = null;
         var _loc11_:Face = null;
         var _loc12_:Wrapper = null;
         var _loc13_:Vertex = null;
         var _loc14_:Vertex = null;
         var _loc15_:Face = null;
         var _loc16_:Face = null;
         var _loc17_:Face = null;
         var _loc18_:Face = null;
         var _loc19_:Face = null;
         var _loc20_:Face = null;
         var _loc21_:Face = null;
         var _loc22_:Face = null;
         var _loc23_:Face = null;
         var _loc24_:Face = null;
         var _loc25_:Wrapper = null;
         var _loc26_:Wrapper = null;
         var _loc27_:Wrapper = null;
         var _loc28_:Boolean = false;
         var _loc29_:Vertex = null;
         var _loc30_:Vertex = null;
         var _loc31_:Vertex = null;
         var _loc32_:Number = NaN;
         var _loc33_:Number = NaN;
         var _loc34_:Number = NaN;
         var _loc35_:Boolean = false;
         var _loc36_:Boolean = false;
         var _loc37_:Boolean = false;
         var _loc38_:Number = NaN;
         var _loc39_:Number = NaN;
         if(param2.alternativa3d::processNegative != null)
         {
            this.splitFaceStruct(param1,param2.alternativa3d::processNegative,param3,param4,param5,param6,param7,param8,param9);
            param2.alternativa3d::processNegative = null;
            _loc15_ = param3.alternativa3d::processNegative;
            _loc16_ = param3.alternativa3d::processPositive;
         }
         if(param2.alternativa3d::processPositive != null)
         {
            this.splitFaceStruct(param1,param2.alternativa3d::processPositive,param3,param4,param5,param6,param7,param8,param9);
            param2.alternativa3d::processPositive = null;
            _loc17_ = param3.alternativa3d::processNegative;
            _loc18_ = param3.alternativa3d::processPositive;
         }
         if(param2.alternativa3d::wrapper != null)
         {
            _loc10_ = param2;
            while(_loc10_ != null)
            {
               _loc11_ = _loc10_.alternativa3d::processNext;
               _loc12_ = _loc10_.alternativa3d::wrapper;
               _loc29_ = _loc12_.alternativa3d::vertex;
               _loc12_ = _loc12_.alternativa3d::next;
               _loc30_ = _loc12_.alternativa3d::vertex;
               _loc12_ = _loc12_.alternativa3d::next;
               _loc31_ = _loc12_.alternativa3d::vertex;
               _loc12_ = _loc12_.alternativa3d::next;
               _loc32_ = _loc29_.alternativa3d::cameraX * param4 + _loc29_.alternativa3d::cameraY * param5 + _loc29_.alternativa3d::cameraZ * param6;
               _loc33_ = _loc30_.alternativa3d::cameraX * param4 + _loc30_.alternativa3d::cameraY * param5 + _loc30_.alternativa3d::cameraZ * param6;
               _loc34_ = _loc31_.alternativa3d::cameraX * param4 + _loc31_.alternativa3d::cameraY * param5 + _loc31_.alternativa3d::cameraZ * param6;
               _loc35_ = _loc32_ < param8 || _loc33_ < param8 || _loc34_ < param8;
               _loc36_ = _loc32_ > param9 || _loc33_ > param9 || _loc34_ > param9;
               _loc37_ = _loc32_ < param8 && _loc33_ < param8 && _loc34_ < param8;
               while(_loc12_ != null)
               {
                  _loc13_ = _loc12_.alternativa3d::vertex;
                  if((_loc38_ = _loc13_.alternativa3d::cameraX * param4 + _loc13_.alternativa3d::cameraY * param5 + _loc13_.alternativa3d::cameraZ * param6) < param8)
                  {
                     _loc35_ = true;
                  }
                  else
                  {
                     _loc37_ = false;
                     if(_loc38_ > param9)
                     {
                        _loc36_ = true;
                     }
                  }
                  _loc13_.alternativa3d::offset = _loc38_;
                  _loc12_ = _loc12_.alternativa3d::next;
               }
               if(!_loc35_)
               {
                  if(_loc21_ != null)
                  {
                     _loc22_.alternativa3d::processNext = _loc10_;
                  }
                  else
                  {
                     _loc21_ = _loc10_;
                  }
                  _loc22_ = _loc10_;
               }
               else if(!_loc36_)
               {
                  if(_loc37_)
                  {
                     if(_loc19_ != null)
                     {
                        _loc20_.alternativa3d::processNext = _loc10_;
                     }
                     else
                     {
                        _loc19_ = _loc10_;
                     }
                     _loc20_ = _loc10_;
                  }
                  else
                  {
                     _loc29_.alternativa3d::offset = _loc32_;
                     _loc30_.alternativa3d::offset = _loc33_;
                     _loc31_.alternativa3d::offset = _loc34_;
                     (_loc23_ = _loc10_.alternativa3d::create()).material = _loc10_.material;
                     param1.alternativa3d::lastFace.alternativa3d::next = _loc23_;
                     param1.alternativa3d::lastFace = _loc23_;
                     _loc25_ = null;
                     _loc28_ = _loc10_.material != null && _loc10_.material.alternativa3d::useVerticesNormals;
                     _loc12_ = _loc10_.alternativa3d::wrapper;
                     while(_loc12_ != null)
                     {
                        _loc30_ = _loc12_.alternativa3d::vertex;
                        if(_loc30_.alternativa3d::offset >= param8)
                        {
                           _loc14_ = _loc30_.alternativa3d::create();
                           param1.alternativa3d::lastVertex.alternativa3d::next = _loc14_;
                           param1.alternativa3d::lastVertex = _loc14_;
                           _loc14_.x = _loc30_.x;
                           _loc14_.y = _loc30_.y;
                           _loc14_.z = _loc30_.z;
                           _loc14_.u = _loc30_.u;
                           _loc14_.v = _loc30_.v;
                           _loc14_.alternativa3d::cameraX = _loc30_.alternativa3d::cameraX;
                           _loc14_.alternativa3d::cameraY = _loc30_.alternativa3d::cameraY;
                           _loc14_.alternativa3d::cameraZ = _loc30_.alternativa3d::cameraZ;
                           if(_loc28_)
                           {
                              _loc14_.normalX = _loc30_.normalX;
                              _loc14_.normalY = _loc30_.normalY;
                              _loc14_.normalZ = _loc30_.normalZ;
                           }
                           _loc30_ = _loc14_;
                        }
                        (_loc27_ = _loc12_.alternativa3d::create()).alternativa3d::vertex = _loc30_;
                        if(_loc25_ != null)
                        {
                           _loc25_.alternativa3d::next = _loc27_;
                        }
                        else
                        {
                           _loc23_.alternativa3d::wrapper = _loc27_;
                        }
                        _loc25_ = _loc27_;
                        _loc12_ = _loc12_.alternativa3d::next;
                     }
                     if(_loc19_ != null)
                     {
                        _loc20_.alternativa3d::processNext = _loc23_;
                     }
                     else
                     {
                        _loc19_ = _loc23_;
                     }
                     _loc20_ = _loc23_;
                     _loc10_.alternativa3d::processNext = null;
                  }
               }
               else
               {
                  _loc29_.alternativa3d::offset = _loc32_;
                  _loc30_.alternativa3d::offset = _loc33_;
                  _loc31_.alternativa3d::offset = _loc34_;
                  (_loc23_ = _loc10_.alternativa3d::create()).material = _loc10_.material;
                  param1.alternativa3d::lastFace.alternativa3d::next = _loc23_;
                  param1.alternativa3d::lastFace = _loc23_;
                  (_loc24_ = _loc10_.alternativa3d::create()).material = _loc10_.material;
                  param1.alternativa3d::lastFace.alternativa3d::next = _loc24_;
                  param1.alternativa3d::lastFace = _loc24_;
                  _loc25_ = null;
                  _loc26_ = null;
                  _loc12_ = _loc10_.alternativa3d::wrapper.alternativa3d::next.alternativa3d::next;
                  while(_loc12_.alternativa3d::next != null)
                  {
                     _loc12_ = _loc12_.alternativa3d::next;
                  }
                  _loc29_ = _loc12_.alternativa3d::vertex;
                  _loc32_ = _loc29_.alternativa3d::offset;
                  _loc28_ = _loc10_.material != null && _loc10_.material.alternativa3d::useVerticesNormals;
                  _loc12_ = _loc10_.alternativa3d::wrapper;
                  while(_loc12_ != null)
                  {
                     _loc30_ = _loc12_.alternativa3d::vertex;
                     _loc33_ = _loc30_.alternativa3d::offset;
                     if(_loc32_ < param8 && _loc33_ > param9 || _loc32_ > param9 && _loc33_ < param8)
                     {
                        _loc39_ = (param7 - _loc32_) / (_loc33_ - _loc32_);
                        _loc13_ = _loc30_.alternativa3d::create();
                        param1.alternativa3d::lastVertex.alternativa3d::next = _loc13_;
                        param1.alternativa3d::lastVertex = _loc13_;
                        _loc13_.x = _loc29_.x + (_loc30_.x - _loc29_.x) * _loc39_;
                        _loc13_.y = _loc29_.y + (_loc30_.y - _loc29_.y) * _loc39_;
                        _loc13_.z = _loc29_.z + (_loc30_.z - _loc29_.z) * _loc39_;
                        _loc13_.u = _loc29_.u + (_loc30_.u - _loc29_.u) * _loc39_;
                        _loc13_.v = _loc29_.v + (_loc30_.v - _loc29_.v) * _loc39_;
                        _loc13_.alternativa3d::cameraX = _loc29_.alternativa3d::cameraX + (_loc30_.alternativa3d::cameraX - _loc29_.alternativa3d::cameraX) * _loc39_;
                        _loc13_.alternativa3d::cameraY = _loc29_.alternativa3d::cameraY + (_loc30_.alternativa3d::cameraY - _loc29_.alternativa3d::cameraY) * _loc39_;
                        _loc13_.alternativa3d::cameraZ = _loc29_.alternativa3d::cameraZ + (_loc30_.alternativa3d::cameraZ - _loc29_.alternativa3d::cameraZ) * _loc39_;
                        if(_loc28_)
                        {
                           _loc13_.normalX = _loc29_.normalX + (_loc30_.normalX - _loc29_.normalX) * _loc39_;
                           _loc13_.normalY = _loc29_.normalY + (_loc30_.normalY - _loc29_.normalY) * _loc39_;
                           _loc13_.normalZ = _loc29_.normalZ + (_loc30_.normalZ - _loc29_.normalZ) * _loc39_;
                        }
                        (_loc27_ = _loc12_.alternativa3d::create()).alternativa3d::vertex = _loc13_;
                        if(_loc25_ != null)
                        {
                           _loc25_.alternativa3d::next = _loc27_;
                        }
                        else
                        {
                           _loc23_.alternativa3d::wrapper = _loc27_;
                        }
                        _loc25_ = _loc27_;
                        _loc14_ = _loc30_.alternativa3d::create();
                        param1.alternativa3d::lastVertex.alternativa3d::next = _loc14_;
                        param1.alternativa3d::lastVertex = _loc14_;
                        _loc14_.x = _loc13_.x;
                        _loc14_.y = _loc13_.y;
                        _loc14_.z = _loc13_.z;
                        _loc14_.u = _loc13_.u;
                        _loc14_.v = _loc13_.v;
                        _loc14_.alternativa3d::cameraX = _loc13_.alternativa3d::cameraX;
                        _loc14_.alternativa3d::cameraY = _loc13_.alternativa3d::cameraY;
                        _loc14_.alternativa3d::cameraZ = _loc13_.alternativa3d::cameraZ;
                        if(_loc28_)
                        {
                           _loc14_.normalX = _loc13_.normalX;
                           _loc14_.normalY = _loc13_.normalY;
                           _loc14_.normalZ = _loc13_.normalZ;
                        }
                        (_loc27_ = _loc12_.alternativa3d::create()).alternativa3d::vertex = _loc14_;
                        if(_loc26_ != null)
                        {
                           _loc26_.alternativa3d::next = _loc27_;
                        }
                        else
                        {
                           _loc24_.alternativa3d::wrapper = _loc27_;
                        }
                        _loc26_ = _loc27_;
                     }
                     if(_loc30_.alternativa3d::offset < param8)
                     {
                        (_loc27_ = _loc12_.alternativa3d::create()).alternativa3d::vertex = _loc30_;
                        if(_loc25_ != null)
                        {
                           _loc25_.alternativa3d::next = _loc27_;
                        }
                        else
                        {
                           _loc23_.alternativa3d::wrapper = _loc27_;
                        }
                        _loc25_ = _loc27_;
                     }
                     else if(_loc30_.alternativa3d::offset > param9)
                     {
                        (_loc27_ = _loc12_.alternativa3d::create()).alternativa3d::vertex = _loc30_;
                        if(_loc26_ != null)
                        {
                           _loc26_.alternativa3d::next = _loc27_;
                        }
                        else
                        {
                           _loc24_.alternativa3d::wrapper = _loc27_;
                        }
                        _loc26_ = _loc27_;
                     }
                     else
                     {
                        (_loc27_ = _loc12_.alternativa3d::create()).alternativa3d::vertex = _loc30_;
                        if(_loc26_ != null)
                        {
                           _loc26_.alternativa3d::next = _loc27_;
                        }
                        else
                        {
                           _loc24_.alternativa3d::wrapper = _loc27_;
                        }
                        _loc26_ = _loc27_;
                        _loc14_ = _loc30_.alternativa3d::create();
                        param1.alternativa3d::lastVertex.alternativa3d::next = _loc14_;
                        param1.alternativa3d::lastVertex = _loc14_;
                        _loc14_.x = _loc30_.x;
                        _loc14_.y = _loc30_.y;
                        _loc14_.z = _loc30_.z;
                        _loc14_.u = _loc30_.u;
                        _loc14_.v = _loc30_.v;
                        _loc14_.alternativa3d::cameraX = _loc30_.alternativa3d::cameraX;
                        _loc14_.alternativa3d::cameraY = _loc30_.alternativa3d::cameraY;
                        _loc14_.alternativa3d::cameraZ = _loc30_.alternativa3d::cameraZ;
                        if(_loc28_)
                        {
                           _loc14_.normalX = _loc30_.normalX;
                           _loc14_.normalY = _loc30_.normalY;
                           _loc14_.normalZ = _loc30_.normalZ;
                        }
                        (_loc27_ = _loc12_.alternativa3d::create()).alternativa3d::vertex = _loc14_;
                        if(_loc25_ != null)
                        {
                           _loc25_.alternativa3d::next = _loc27_;
                        }
                        else
                        {
                           _loc23_.alternativa3d::wrapper = _loc27_;
                        }
                        _loc25_ = _loc27_;
                     }
                     _loc29_ = _loc30_;
                     _loc32_ = _loc33_;
                     _loc12_ = _loc12_.alternativa3d::next;
                  }
                  if(_loc19_ != null)
                  {
                     _loc20_.alternativa3d::processNext = _loc23_;
                  }
                  else
                  {
                     _loc19_ = _loc23_;
                  }
                  _loc20_ = _loc23_;
                  if(_loc21_ != null)
                  {
                     _loc22_.alternativa3d::processNext = _loc24_;
                  }
                  else
                  {
                     _loc21_ = _loc24_;
                  }
                  _loc22_ = _loc24_;
                  _loc10_.alternativa3d::processNext = null;
               }
               _loc10_ = _loc11_;
            }
         }
         if(_loc19_ != null || _loc15_ != null && _loc17_ != null)
         {
            if(_loc19_ == null)
            {
               _loc19_ = param2.alternativa3d::create();
               param1.alternativa3d::lastFace.alternativa3d::next = _loc19_;
               param1.alternativa3d::lastFace = _loc19_;
            }
            else
            {
               _loc20_.alternativa3d::processNext = null;
            }
            if(this.alternativa3d::sorting == 3)
            {
               _loc19_.alternativa3d::normalX = param2.alternativa3d::normalX;
               _loc19_.alternativa3d::normalY = param2.alternativa3d::normalY;
               _loc19_.alternativa3d::normalZ = param2.alternativa3d::normalZ;
               _loc19_.alternativa3d::offset = param2.alternativa3d::offset;
            }
            _loc19_.alternativa3d::processNegative = _loc15_;
            _loc19_.alternativa3d::processPositive = _loc17_;
            param3.alternativa3d::processNegative = _loc19_;
         }
         else
         {
            param3.alternativa3d::processNegative = _loc15_ != null ? _loc15_ : _loc17_;
         }
         if(_loc21_ != null || _loc16_ != null && _loc18_ != null)
         {
            if(_loc21_ == null)
            {
               _loc21_ = param2.alternativa3d::create();
               param1.alternativa3d::lastFace.alternativa3d::next = _loc21_;
               param1.alternativa3d::lastFace = _loc21_;
            }
            else
            {
               _loc22_.alternativa3d::processNext = null;
            }
            if(this.alternativa3d::sorting == 3)
            {
               _loc21_.alternativa3d::normalX = param2.alternativa3d::normalX;
               _loc21_.alternativa3d::normalY = param2.alternativa3d::normalY;
               _loc21_.alternativa3d::normalZ = param2.alternativa3d::normalZ;
               _loc21_.alternativa3d::offset = param2.alternativa3d::offset;
            }
            _loc21_.alternativa3d::processNegative = _loc16_;
            _loc21_.alternativa3d::processPositive = _loc18_;
            param3.alternativa3d::processPositive = _loc21_;
         }
         else
         {
            param3.alternativa3d::processPositive = _loc16_ != null ? _loc16_ : _loc18_;
         }
      }
      
      private function cropFaceStruct(param1:Camera3D, param2:Face, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number) : Face
      {
         var _loc9_:Face = null;
         var _loc10_:Face = null;
         var _loc11_:Wrapper = null;
         var _loc12_:Vertex = null;
         var _loc13_:Face = null;
         var _loc14_:Face = null;
         var _loc15_:Face = null;
         var _loc16_:Face = null;
         var _loc17_:Vertex = null;
         var _loc18_:Vertex = null;
         var _loc19_:Vertex = null;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc23_:Boolean = false;
         var _loc24_:Boolean = false;
         var _loc25_:Number = NaN;
         var _loc26_:Face = null;
         var _loc27_:Wrapper = null;
         var _loc28_:Wrapper = null;
         var _loc29_:Boolean = false;
         var _loc30_:Number = NaN;
         if(param2.alternativa3d::processNegative != null)
         {
            _loc13_ = this.cropFaceStruct(param1,param2.alternativa3d::processNegative,param3,param4,param5,param6,param7,param8);
            param2.alternativa3d::processNegative = null;
         }
         if(param2.alternativa3d::processPositive != null)
         {
            _loc14_ = this.cropFaceStruct(param1,param2.alternativa3d::processPositive,param3,param4,param5,param6,param7,param8);
            param2.alternativa3d::processPositive = null;
         }
         if(param2.alternativa3d::wrapper != null)
         {
            _loc9_ = param2;
            while(_loc9_ != null)
            {
               _loc10_ = _loc9_.alternativa3d::processNext;
               _loc11_ = _loc9_.alternativa3d::wrapper;
               _loc17_ = _loc11_.alternativa3d::vertex;
               _loc11_ = _loc11_.alternativa3d::next;
               _loc18_ = _loc11_.alternativa3d::vertex;
               _loc11_ = _loc11_.alternativa3d::next;
               _loc19_ = _loc11_.alternativa3d::vertex;
               _loc11_ = _loc11_.alternativa3d::next;
               _loc20_ = _loc17_.alternativa3d::cameraX * param3 + _loc17_.alternativa3d::cameraY * param4 + _loc17_.alternativa3d::cameraZ * param5;
               _loc21_ = _loc18_.alternativa3d::cameraX * param3 + _loc18_.alternativa3d::cameraY * param4 + _loc18_.alternativa3d::cameraZ * param5;
               _loc22_ = _loc19_.alternativa3d::cameraX * param3 + _loc19_.alternativa3d::cameraY * param4 + _loc19_.alternativa3d::cameraZ * param5;
               _loc23_ = _loc20_ < param7 || _loc21_ < param7 || _loc22_ < param7;
               _loc24_ = _loc20_ > param8 || _loc21_ > param8 || _loc22_ > param8;
               while(_loc11_ != null)
               {
                  _loc12_ = _loc11_.alternativa3d::vertex;
                  if((_loc25_ = _loc12_.alternativa3d::cameraX * param3 + _loc12_.alternativa3d::cameraY * param4 + _loc12_.alternativa3d::cameraZ * param5) < param7)
                  {
                     _loc23_ = true;
                  }
                  else if(_loc25_ > param8)
                  {
                     _loc24_ = true;
                  }
                  _loc12_.alternativa3d::offset = _loc25_;
                  _loc11_ = _loc11_.alternativa3d::next;
               }
               if(!_loc24_)
               {
                  _loc9_.alternativa3d::processNext = null;
               }
               else if(!_loc23_)
               {
                  if(_loc15_ != null)
                  {
                     _loc16_.alternativa3d::processNext = _loc9_;
                  }
                  else
                  {
                     _loc15_ = _loc9_;
                  }
                  _loc16_ = _loc9_;
               }
               else
               {
                  _loc17_.alternativa3d::offset = _loc20_;
                  _loc18_.alternativa3d::offset = _loc21_;
                  _loc19_.alternativa3d::offset = _loc22_;
                  (_loc26_ = _loc9_.alternativa3d::create()).material = _loc9_.material;
                  param1.alternativa3d::lastFace.alternativa3d::next = _loc26_;
                  param1.alternativa3d::lastFace = _loc26_;
                  _loc27_ = null;
                  _loc11_ = _loc9_.alternativa3d::wrapper.alternativa3d::next.alternativa3d::next;
                  while(_loc11_.alternativa3d::next != null)
                  {
                     _loc11_ = _loc11_.alternativa3d::next;
                  }
                  _loc17_ = _loc11_.alternativa3d::vertex;
                  _loc20_ = _loc17_.alternativa3d::offset;
                  _loc29_ = _loc9_.material != null && _loc9_.material.alternativa3d::useVerticesNormals;
                  _loc11_ = _loc9_.alternativa3d::wrapper;
                  while(_loc11_ != null)
                  {
                     _loc18_ = _loc11_.alternativa3d::vertex;
                     _loc21_ = _loc18_.alternativa3d::offset;
                     if(_loc20_ < param7 && _loc21_ > param8 || _loc20_ > param8 && _loc21_ < param7)
                     {
                        _loc30_ = (param6 - _loc20_) / (_loc21_ - _loc20_);
                        _loc12_ = _loc18_.alternativa3d::create();
                        param1.alternativa3d::lastVertex.alternativa3d::next = _loc12_;
                        param1.alternativa3d::lastVertex = _loc12_;
                        _loc12_.x = _loc17_.x + (_loc18_.x - _loc17_.x) * _loc30_;
                        _loc12_.y = _loc17_.y + (_loc18_.y - _loc17_.y) * _loc30_;
                        _loc12_.z = _loc17_.z + (_loc18_.z - _loc17_.z) * _loc30_;
                        _loc12_.u = _loc17_.u + (_loc18_.u - _loc17_.u) * _loc30_;
                        _loc12_.v = _loc17_.v + (_loc18_.v - _loc17_.v) * _loc30_;
                        _loc12_.alternativa3d::cameraX = _loc17_.alternativa3d::cameraX + (_loc18_.alternativa3d::cameraX - _loc17_.alternativa3d::cameraX) * _loc30_;
                        _loc12_.alternativa3d::cameraY = _loc17_.alternativa3d::cameraY + (_loc18_.alternativa3d::cameraY - _loc17_.alternativa3d::cameraY) * _loc30_;
                        _loc12_.alternativa3d::cameraZ = _loc17_.alternativa3d::cameraZ + (_loc18_.alternativa3d::cameraZ - _loc17_.alternativa3d::cameraZ) * _loc30_;
                        if(_loc29_)
                        {
                           _loc12_.normalX = _loc17_.normalX + (_loc18_.normalX - _loc17_.normalX) * _loc30_;
                           _loc12_.normalY = _loc17_.normalY + (_loc18_.normalY - _loc17_.normalY) * _loc30_;
                           _loc12_.normalZ = _loc17_.normalZ + (_loc18_.normalZ - _loc17_.normalZ) * _loc30_;
                        }
                        (_loc28_ = _loc11_.alternativa3d::create()).alternativa3d::vertex = _loc12_;
                        if(_loc27_ != null)
                        {
                           _loc27_.alternativa3d::next = _loc28_;
                        }
                        else
                        {
                           _loc26_.alternativa3d::wrapper = _loc28_;
                        }
                        _loc27_ = _loc28_;
                     }
                     if(_loc21_ >= param7)
                     {
                        (_loc28_ = _loc11_.alternativa3d::create()).alternativa3d::vertex = _loc18_;
                        if(_loc27_ != null)
                        {
                           _loc27_.alternativa3d::next = _loc28_;
                        }
                        else
                        {
                           _loc26_.alternativa3d::wrapper = _loc28_;
                        }
                        _loc27_ = _loc28_;
                     }
                     _loc17_ = _loc18_;
                     _loc20_ = _loc21_;
                     _loc11_ = _loc11_.alternativa3d::next;
                  }
                  if(_loc15_ != null)
                  {
                     _loc16_.alternativa3d::processNext = _loc26_;
                  }
                  else
                  {
                     _loc15_ = _loc26_;
                  }
                  _loc16_ = _loc26_;
                  _loc9_.alternativa3d::processNext = null;
               }
               _loc9_ = _loc10_;
            }
         }
         if(_loc15_ != null || _loc13_ != null && _loc14_ != null)
         {
            if(_loc15_ == null)
            {
               _loc15_ = param2.alternativa3d::create();
               param1.alternativa3d::lastFace.alternativa3d::next = _loc15_;
               param1.alternativa3d::lastFace = _loc15_;
            }
            else
            {
               _loc16_.alternativa3d::processNext = null;
            }
            if(this.alternativa3d::sorting == 3)
            {
               _loc15_.alternativa3d::normalX = param2.alternativa3d::normalX;
               _loc15_.alternativa3d::normalY = param2.alternativa3d::normalY;
               _loc15_.alternativa3d::normalZ = param2.alternativa3d::normalZ;
               _loc15_.alternativa3d::offset = param2.alternativa3d::offset;
            }
            _loc15_.alternativa3d::processNegative = _loc13_;
            _loc15_.alternativa3d::processPositive = _loc14_;
            return _loc15_;
         }
         return _loc13_ != null ? _loc13_ : _loc14_;
      }
      
      alternativa3d function transformStruct(param1:Face, param2:int, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number, param10:Number, param11:Number, param12:Number, param13:Number, param14:Number) : void
      {
         var _loc15_:Wrapper = null;
         var _loc16_:Vertex = null;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Face = param1;
         while(_loc20_ != null)
         {
            _loc15_ = _loc20_.alternativa3d::wrapper;
            while(_loc15_ != null)
            {
               _loc16_ = _loc15_.alternativa3d::vertex;
               if(_loc16_.alternativa3d::transformId != param2)
               {
                  _loc17_ = _loc16_.alternativa3d::cameraX;
                  _loc18_ = _loc16_.alternativa3d::cameraY;
                  _loc19_ = _loc16_.alternativa3d::cameraZ;
                  _loc16_.alternativa3d::cameraX = param3 * _loc17_ + param4 * _loc18_ + param5 * _loc19_ + param6;
                  _loc16_.alternativa3d::cameraY = param7 * _loc17_ + param8 * _loc18_ + param9 * _loc19_ + param10;
                  _loc16_.alternativa3d::cameraZ = param11 * _loc17_ + param12 * _loc18_ + param13 * _loc19_ + param14;
                  _loc16_.alternativa3d::transformId = param2;
               }
               _loc15_ = _loc15_.alternativa3d::next;
            }
            _loc20_ = _loc20_.alternativa3d::processNext;
         }
         if(param1.alternativa3d::processNegative != null)
         {
            this.alternativa3d::transformStruct(param1.alternativa3d::processNegative,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14);
         }
         if(param1.alternativa3d::processPositive != null)
         {
            this.alternativa3d::transformStruct(param1.alternativa3d::processPositive,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14);
         }
      }
      
      alternativa3d function draw(param1:Camera3D, param2:Number, param3:Object3D) : void
      {
         var _loc4_:Face = null;
         var _loc5_:Face = null;
         var _loc6_:Face = null;
         var _loc7_:Face = null;
         if(this.alternativa3d::space == 1)
         {
            this.alternativa3d::transformStruct(this.alternativa3d::faceStruct,++this.alternativa3d::object.alternativa3d::transformId,param3.alternativa3d::ma,param3.alternativa3d::mb,param3.alternativa3d::mc,param3.alternativa3d::md,param3.alternativa3d::me,param3.alternativa3d::mf,param3.alternativa3d::mg,param3.alternativa3d::mh,param3.alternativa3d::mi,param3.alternativa3d::mj,param3.alternativa3d::mk,param3.alternativa3d::ml);
         }
         if(this.alternativa3d::viewAligned)
         {
            _loc4_ = this.alternativa3d::faceStruct;
            if(this.alternativa3d::debug > 0)
            {
               if(this.alternativa3d::debug & Debug.EDGES)
               {
                  Debug.alternativa3d::drawEdges(param1,_loc4_,this.alternativa3d::space != 2 ? int(16777215) : int(16750848));
               }
               if(this.alternativa3d::debug & Debug.BOUNDS)
               {
                  if(this.alternativa3d::space == 1)
                  {
                     Debug.drawBounds(param1,param3,this.alternativa3d::boundMinX,this.alternativa3d::boundMinY,this.alternativa3d::boundMinZ,this.alternativa3d::boundMaxX,this.alternativa3d::boundMaxY,this.alternativa3d::boundMaxZ,10092288);
                  }
               }
            }
            param1.alternativa3d::addTransparent(_loc4_,this.alternativa3d::object);
         }
         else
         {
            switch(this.alternativa3d::sorting)
            {
               case 0:
                  _loc4_ = this.alternativa3d::faceStruct;
                  break;
               case 1:
                  _loc4_ = this.alternativa3d::faceStruct.alternativa3d::processNext != null ? param1.alternativa3d::sortByAverageZ(this.alternativa3d::faceStruct) : this.alternativa3d::faceStruct;
                  break;
               case 2:
                  _loc4_ = this.alternativa3d::faceStruct.alternativa3d::processNext != null ? param1.alternativa3d::sortByDynamicBSP(this.alternativa3d::faceStruct,param2) : this.alternativa3d::faceStruct;
                  break;
               case 3:
                  _loc4_ = this.collectNode(this.alternativa3d::faceStruct);
            }
            if(this.alternativa3d::debug > 0)
            {
               if(this.alternativa3d::debug & Debug.EDGES)
               {
                  Debug.alternativa3d::drawEdges(param1,_loc4_,16777215);
               }
               if(this.alternativa3d::debug & Debug.BOUNDS)
               {
                  if(this.alternativa3d::space == 1)
                  {
                     Debug.drawBounds(param1,param3,this.alternativa3d::boundMinX,this.alternativa3d::boundMinY,this.alternativa3d::boundMinZ,this.alternativa3d::boundMaxX,this.alternativa3d::boundMaxY,this.alternativa3d::boundMaxZ,10092288);
                  }
                  else if(this.alternativa3d::space == 2)
                  {
                     Debug.drawBounds(param1,this.alternativa3d::object,this.alternativa3d::boundMinX,this.alternativa3d::boundMinY,this.alternativa3d::boundMinZ,this.alternativa3d::boundMaxX,this.alternativa3d::boundMaxY,this.alternativa3d::boundMaxZ,16750848);
                  }
               }
            }
            _loc7_ = _loc4_;
            while(_loc7_ != null)
            {
               _loc5_ = _loc7_.alternativa3d::processNext;
               if(_loc5_ == null || _loc5_.material != _loc4_.material)
               {
                  _loc7_.alternativa3d::processNext = null;
                  if(_loc4_.material != null)
                  {
                     _loc4_.alternativa3d::processNegative = _loc6_;
                     _loc6_ = _loc4_;
                  }
                  else
                  {
                     while(_loc4_ != null)
                     {
                        _loc7_ = _loc4_.alternativa3d::processNext;
                        _loc4_.alternativa3d::processNext = null;
                        _loc4_ = _loc7_;
                     }
                  }
                  _loc4_ = _loc5_;
               }
               _loc7_ = _loc5_;
            }
            _loc4_ = _loc6_;
            while(_loc4_ != null)
            {
               _loc5_ = _loc4_.alternativa3d::processNegative;
               _loc4_.alternativa3d::processNegative = null;
               param1.alternativa3d::addTransparent(_loc4_,this.alternativa3d::object);
               _loc4_ = _loc5_;
            }
         }
         this.alternativa3d::faceStruct = null;
      }
      
      private function collectNode(param1:Face, param2:Face = null) : Face
      {
         var _loc3_:Face = null;
         var _loc4_:Face = null;
         var _loc5_:Face = null;
         if(param1.alternativa3d::offset < 0)
         {
            _loc4_ = param1.alternativa3d::processNegative;
            _loc5_ = param1.alternativa3d::processPositive;
         }
         else
         {
            _loc4_ = param1.alternativa3d::processPositive;
            _loc5_ = param1.alternativa3d::processNegative;
         }
         param1.alternativa3d::processNegative = null;
         param1.alternativa3d::processPositive = null;
         if(_loc5_ != null)
         {
            param2 = this.collectNode(_loc5_,param2);
         }
         if(param1.alternativa3d::wrapper != null)
         {
            _loc3_ = param1;
            while(_loc3_.alternativa3d::processNext != null)
            {
               _loc3_ = _loc3_.alternativa3d::processNext;
            }
            _loc3_.alternativa3d::processNext = param2;
            param2 = param1;
         }
         if(_loc4_ != null)
         {
            param2 = this.collectNode(_loc4_,param2);
         }
         return param2;
      }
   }
}

