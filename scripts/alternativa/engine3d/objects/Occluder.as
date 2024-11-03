package alternativa.engine3d.objects
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.Debug;
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.Vertex;
   import alternativa.engine3d.core.Wrapper;
   import flash.display.Sprite;
   
   use namespace alternativa3d;
   
   public class Occluder extends Object3D
   {
      alternativa3d var faceList:Face;
      
      alternativa3d var edgeList:Edge;
      
      alternativa3d var vertexList:Vertex;
      
      public var minSize:Number = 0;
      
      public function Occluder()
      {
         super();
      }
      
      public function createForm(param1:Mesh, param2:Boolean = false) : void
      {
         this.destroyForm();
         if(!param2)
         {
            param1 = param1.clone() as Mesh;
         }
         this.alternativa3d::faceList = param1.alternativa3d::faceList;
         this.alternativa3d::vertexList = param1.alternativa3d::vertexList;
         param1.alternativa3d::faceList = null;
         param1.alternativa3d::vertexList = null;
         var _loc3_:Vertex = this.alternativa3d::vertexList;
         while(_loc3_ != null)
         {
            _loc3_.alternativa3d::transformId = 0;
            _loc3_.id = null;
            _loc3_ = _loc3_.alternativa3d::next;
         }
         var _loc4_:Face = this.alternativa3d::faceList;
         while(_loc4_ != null)
         {
            _loc4_.id = null;
            _loc4_ = _loc4_.alternativa3d::next;
         }
         var _loc5_:String = this.calculateEdges();
         if(_loc5_ != null)
         {
            this.destroyForm();
            throw new ArgumentError(_loc5_);
         }
         calculateBounds();
      }
      
      public function destroyForm() : void
      {
         this.alternativa3d::faceList = null;
         this.alternativa3d::edgeList = null;
         this.alternativa3d::vertexList = null;
      }
      
      override public function clone() : Object3D
      {
         var _loc1_:Occluder = new Occluder();
         _loc1_.clonePropertiesFrom(this);
         return _loc1_;
      }
      
      override protected function clonePropertiesFrom(param1:Object3D) : void
      {
         var _loc2_:Vertex = null;
         var _loc3_:Face = null;
         var _loc4_:Vertex = null;
         var _loc5_:Face = null;
         var _loc6_:Edge = null;
         var _loc7_:Vertex = null;
         var _loc8_:Face = null;
         var _loc9_:Wrapper = null;
         var _loc10_:Wrapper = null;
         var _loc11_:Wrapper = null;
         var _loc12_:Edge = null;
         super.clonePropertiesFrom(param1);
         var _loc13_:Occluder = param1 as Occluder;
         this.minSize = _loc13_.minSize;
         _loc2_ = _loc13_.alternativa3d::vertexList;
         while(_loc2_ != null)
         {
            (_loc7_ = new Vertex()).x = _loc2_.x;
            _loc7_.y = _loc2_.y;
            _loc7_.z = _loc2_.z;
            _loc7_.u = _loc2_.u;
            _loc7_.v = _loc2_.v;
            _loc7_.normalX = _loc2_.normalX;
            _loc7_.normalY = _loc2_.normalY;
            _loc7_.normalZ = _loc2_.normalZ;
            _loc2_.alternativa3d::value = _loc7_;
            if(_loc4_ != null)
            {
               _loc4_.alternativa3d::next = _loc7_;
            }
            else
            {
               this.alternativa3d::vertexList = _loc7_;
            }
            _loc4_ = _loc7_;
            _loc2_ = _loc2_.alternativa3d::next;
         }
         _loc3_ = _loc13_.alternativa3d::faceList;
         while(_loc3_ != null)
         {
            (_loc8_ = new Face()).material = _loc3_.material;
            _loc8_.alternativa3d::normalX = _loc3_.alternativa3d::normalX;
            _loc8_.alternativa3d::normalY = _loc3_.alternativa3d::normalY;
            _loc8_.alternativa3d::normalZ = _loc3_.alternativa3d::normalZ;
            _loc8_.alternativa3d::offset = _loc3_.alternativa3d::offset;
            _loc3_.alternativa3d::processNext = _loc8_;
            _loc9_ = null;
            _loc10_ = _loc3_.alternativa3d::wrapper;
            while(_loc10_ != null)
            {
               (_loc11_ = new Wrapper()).alternativa3d::vertex = _loc10_.alternativa3d::vertex.alternativa3d::value;
               if(_loc9_ != null)
               {
                  _loc9_.alternativa3d::next = _loc11_;
               }
               else
               {
                  _loc8_.alternativa3d::wrapper = _loc11_;
               }
               _loc9_ = _loc11_;
               _loc10_ = _loc10_.alternativa3d::next;
            }
            if(_loc5_ != null)
            {
               _loc5_.alternativa3d::next = _loc8_;
            }
            else
            {
               this.alternativa3d::faceList = _loc8_;
            }
            _loc5_ = _loc8_;
            _loc3_ = _loc3_.alternativa3d::next;
         }
         var _loc14_:Edge = _loc13_.alternativa3d::edgeList;
         while(_loc14_ != null)
         {
            (_loc12_ = new Edge()).a = _loc14_.a.alternativa3d::value;
            _loc12_.b = _loc14_.b.alternativa3d::value;
            _loc12_.left = _loc14_.left.alternativa3d::processNext;
            _loc12_.right = _loc14_.right.alternativa3d::processNext;
            if(_loc6_ != null)
            {
               _loc6_.next = _loc12_;
            }
            else
            {
               this.alternativa3d::edgeList = _loc12_;
            }
            _loc6_ = _loc12_;
            _loc14_ = _loc14_.next;
         }
         _loc2_ = _loc13_.alternativa3d::vertexList;
         while(_loc2_ != null)
         {
            _loc2_.alternativa3d::value = null;
            _loc2_ = _loc2_.alternativa3d::next;
         }
         _loc3_ = _loc13_.alternativa3d::faceList;
         while(_loc3_ != null)
         {
            _loc3_.alternativa3d::processNext = null;
            _loc3_ = _loc3_.alternativa3d::next;
         }
      }
      
      private function calculateEdges() : String
      {
         var _loc1_:Face = null;
         var _loc2_:Wrapper = null;
         var _loc3_:Edge = null;
         var _loc4_:Vertex = null;
         var _loc5_:Vertex = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         _loc1_ = this.alternativa3d::faceList;
         while(_loc1_ != null)
         {
            _loc1_.alternativa3d::calculateBestSequenceAndNormal();
            _loc2_ = _loc1_.alternativa3d::wrapper;
            while(_loc2_ != null)
            {
               _loc4_ = _loc2_.alternativa3d::vertex;
               _loc5_ = _loc2_.alternativa3d::next != null ? _loc2_.alternativa3d::next.alternativa3d::vertex : _loc1_.alternativa3d::wrapper.alternativa3d::vertex;
               _loc3_ = this.alternativa3d::edgeList;
               while(_loc3_ != null)
               {
                  if(_loc3_.a == _loc4_ && _loc3_.b == _loc5_)
                  {
                     return "The supplied geometry is not valid.";
                  }
                  if(_loc3_.a == _loc5_ && _loc3_.b == _loc4_)
                  {
                     break;
                  }
                  _loc3_ = _loc3_.next;
               }
               if(_loc3_ != null)
               {
                  _loc3_.right = _loc1_;
               }
               else
               {
                  _loc3_ = new Edge();
                  _loc3_.a = _loc4_;
                  _loc3_.b = _loc5_;
                  _loc3_.left = _loc1_;
                  _loc3_.next = this.alternativa3d::edgeList;
                  this.alternativa3d::edgeList = _loc3_;
               }
               _loc2_ = _loc2_.alternativa3d::next;
               _loc4_ = _loc5_;
            }
            _loc1_ = _loc1_.alternativa3d::next;
         }
         _loc3_ = this.alternativa3d::edgeList;
         while(_loc3_ != null)
         {
            if(_loc3_.left == null || _loc3_.right == null)
            {
               return "The supplied geometry is non whole.";
            }
            _loc6_ = _loc3_.b.x - _loc3_.a.x;
            _loc7_ = _loc3_.b.y - _loc3_.a.y;
            _loc8_ = _loc3_.b.z - _loc3_.a.z;
            _loc9_ = _loc3_.right.alternativa3d::normalZ * _loc3_.left.alternativa3d::normalY - _loc3_.right.alternativa3d::normalY * _loc3_.left.alternativa3d::normalZ;
            _loc10_ = _loc3_.right.alternativa3d::normalX * _loc3_.left.alternativa3d::normalZ - _loc3_.right.alternativa3d::normalZ * _loc3_.left.alternativa3d::normalX;
            _loc11_ = _loc3_.right.alternativa3d::normalY * _loc3_.left.alternativa3d::normalX - _loc3_.right.alternativa3d::normalX * _loc3_.left.alternativa3d::normalY;
            if(_loc6_ * _loc9_ + _loc7_ * _loc10_ + _loc8_ * _loc11_ < 0)
            {
            }
            _loc3_ = _loc3_.next;
         }
         return null;
      }
      
      override alternativa3d function draw(param1:Camera3D) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Sprite = null;
         var _loc4_:Vertex = null;
         var _loc5_:Vertex = null;
         var _loc6_:Vertex = null;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Vertex = null;
         var _loc15_:Vertex = null;
         var _loc16_:Number = NaN;
         if(this.alternativa3d::faceList == null || this.alternativa3d::edgeList == null)
         {
            return;
         }
         alternativa3d::calculateInverseMatrix();
         var _loc17_:Boolean = true;
         var _loc18_:Face = this.alternativa3d::faceList;
         while(_loc18_ != null)
         {
            if(_loc18_.alternativa3d::normalX * alternativa3d::imd + _loc18_.alternativa3d::normalY * alternativa3d::imh + _loc18_.alternativa3d::normalZ * alternativa3d::iml > _loc18_.alternativa3d::offset)
            {
               _loc18_.alternativa3d::distance = 1;
               _loc17_ = false;
            }
            else
            {
               _loc18_.alternativa3d::distance = 0;
            }
            _loc18_ = _loc18_.alternativa3d::next;
         }
         if(_loc17_)
         {
            return;
         }
         var _loc19_:int = 0;
         var _loc20_:Boolean = true;
         var _loc21_:Number = param1.alternativa3d::viewSizeX;
         var _loc22_:Number = param1.alternativa3d::viewSizeY;
         var _loc23_:Edge = this.alternativa3d::edgeList;
         for(; _loc23_ != null; _loc23_ = _loc23_.next)
         {
            if(_loc23_.left.alternativa3d::distance != _loc23_.right.alternativa3d::distance)
            {
               if(_loc23_.left.alternativa3d::distance > 0)
               {
                  _loc5_ = _loc23_.a;
                  _loc6_ = _loc23_.b;
               }
               else
               {
                  _loc5_ = _loc23_.b;
                  _loc6_ = _loc23_.a;
               }
               _loc7_ = alternativa3d::ma * _loc5_.x + alternativa3d::mb * _loc5_.y + alternativa3d::mc * _loc5_.z + alternativa3d::md;
               _loc8_ = alternativa3d::me * _loc5_.x + alternativa3d::mf * _loc5_.y + alternativa3d::mg * _loc5_.z + alternativa3d::mh;
               _loc9_ = alternativa3d::mi * _loc5_.x + alternativa3d::mj * _loc5_.y + alternativa3d::mk * _loc5_.z + alternativa3d::ml;
               _loc10_ = alternativa3d::ma * _loc6_.x + alternativa3d::mb * _loc6_.y + alternativa3d::mc * _loc6_.z + alternativa3d::md;
               _loc11_ = alternativa3d::me * _loc6_.x + alternativa3d::mf * _loc6_.y + alternativa3d::mg * _loc6_.z + alternativa3d::mh;
               _loc12_ = alternativa3d::mi * _loc6_.x + alternativa3d::mj * _loc6_.y + alternativa3d::mk * _loc6_.z + alternativa3d::ml;
               if(alternativa3d::culling > 0)
               {
                  if(_loc9_ <= -_loc7_ && _loc12_ <= -_loc10_)
                  {
                     if(_loc20_ && _loc11_ * _loc7_ - _loc10_ * _loc8_ > 0)
                     {
                        _loc20_ = false;
                     }
                     continue;
                  }
                  if(_loc12_ > -_loc10_ && _loc9_ <= -_loc7_)
                  {
                     _loc13_ = (_loc7_ + _loc9_) / (_loc7_ + _loc9_ - _loc10_ - _loc12_);
                     _loc7_ += (_loc10_ - _loc7_) * _loc13_;
                     _loc8_ += (_loc11_ - _loc8_) * _loc13_;
                     _loc9_ += (_loc12_ - _loc9_) * _loc13_;
                  }
                  else if(_loc12_ <= -_loc10_ && _loc9_ > -_loc7_)
                  {
                     _loc13_ = (_loc7_ + _loc9_) / (_loc7_ + _loc9_ - _loc10_ - _loc12_);
                     _loc10_ = _loc7_ + (_loc10_ - _loc7_) * _loc13_;
                     _loc11_ = _loc8_ + (_loc11_ - _loc8_) * _loc13_;
                     _loc12_ = _loc9_ + (_loc12_ - _loc9_) * _loc13_;
                  }
                  if(_loc9_ <= _loc7_ && _loc12_ <= _loc10_)
                  {
                     if(_loc20_ && _loc11_ * _loc7_ - _loc10_ * _loc8_ > 0)
                     {
                        _loc20_ = false;
                     }
                     continue;
                  }
                  if(_loc12_ > _loc10_ && _loc9_ <= _loc7_)
                  {
                     _loc13_ = (_loc9_ - _loc7_) / (_loc9_ - _loc7_ + _loc10_ - _loc12_);
                     _loc7_ += (_loc10_ - _loc7_) * _loc13_;
                     _loc8_ += (_loc11_ - _loc8_) * _loc13_;
                     _loc9_ += (_loc12_ - _loc9_) * _loc13_;
                  }
                  else if(_loc12_ <= _loc10_ && _loc9_ > _loc7_)
                  {
                     _loc13_ = (_loc9_ - _loc7_) / (_loc9_ - _loc7_ + _loc10_ - _loc12_);
                     _loc10_ = _loc7_ + (_loc10_ - _loc7_) * _loc13_;
                     _loc11_ = _loc8_ + (_loc11_ - _loc8_) * _loc13_;
                     _loc12_ = _loc9_ + (_loc12_ - _loc9_) * _loc13_;
                  }
                  if(_loc9_ <= -_loc8_ && _loc12_ <= -_loc11_)
                  {
                     if(_loc20_ && _loc11_ * _loc7_ - _loc10_ * _loc8_ > 0)
                     {
                        _loc20_ = false;
                     }
                     continue;
                  }
                  if(_loc12_ > -_loc11_ && _loc9_ <= -_loc8_)
                  {
                     _loc13_ = (_loc8_ + _loc9_) / (_loc8_ + _loc9_ - _loc11_ - _loc12_);
                     _loc7_ += (_loc10_ - _loc7_) * _loc13_;
                     _loc8_ += (_loc11_ - _loc8_) * _loc13_;
                     _loc9_ += (_loc12_ - _loc9_) * _loc13_;
                  }
                  else if(_loc12_ <= -_loc11_ && _loc9_ > -_loc8_)
                  {
                     _loc13_ = (_loc8_ + _loc9_) / (_loc8_ + _loc9_ - _loc11_ - _loc12_);
                     _loc10_ = _loc7_ + (_loc10_ - _loc7_) * _loc13_;
                     _loc11_ = _loc8_ + (_loc11_ - _loc8_) * _loc13_;
                     _loc12_ = _loc9_ + (_loc12_ - _loc9_) * _loc13_;
                  }
                  if(_loc9_ <= _loc8_ && _loc12_ <= _loc11_)
                  {
                     if(_loc20_ && _loc11_ * _loc7_ - _loc10_ * _loc8_ > 0)
                     {
                        _loc20_ = false;
                     }
                     continue;
                  }
                  if(_loc12_ > _loc11_ && _loc9_ <= _loc8_)
                  {
                     _loc13_ = (_loc9_ - _loc8_) / (_loc9_ - _loc8_ + _loc11_ - _loc12_);
                     _loc7_ += (_loc10_ - _loc7_) * _loc13_;
                     _loc8_ += (_loc11_ - _loc8_) * _loc13_;
                     _loc9_ += (_loc12_ - _loc9_) * _loc13_;
                  }
                  else if(_loc12_ <= _loc11_ && _loc9_ > _loc8_)
                  {
                     _loc13_ = (_loc9_ - _loc8_) / (_loc9_ - _loc8_ + _loc11_ - _loc12_);
                     _loc10_ = _loc7_ + (_loc10_ - _loc7_) * _loc13_;
                     _loc11_ = _loc8_ + (_loc11_ - _loc8_) * _loc13_;
                     _loc12_ = _loc9_ + (_loc12_ - _loc9_) * _loc13_;
                  }
                  _loc20_ = false;
               }
               (_loc5_ = _loc5_.alternativa3d::create()).alternativa3d::next = _loc4_;
               _loc19_++;
               (_loc4_ = _loc5_).alternativa3d::cameraX = _loc12_ * _loc8_ - _loc11_ * _loc9_;
               _loc4_.alternativa3d::cameraY = _loc10_ * _loc9_ - _loc12_ * _loc7_;
               _loc4_.alternativa3d::cameraZ = _loc11_ * _loc7_ - _loc10_ * _loc8_;
               _loc4_.x = _loc7_;
               _loc4_.y = _loc8_;
               _loc4_.z = _loc9_;
               _loc4_.u = _loc10_;
               _loc4_.v = _loc11_;
               _loc4_.alternativa3d::offset = _loc12_;
            }
         }
         if(_loc4_ != null)
         {
            if(this.minSize > 0)
            {
               _loc14_ = Vertex.alternativa3d::createList(_loc19_);
               _loc5_ = _loc4_;
               _loc6_ = _loc14_;
               while(_loc5_ != null)
               {
                  _loc6_.x = _loc5_.x * _loc21_ / _loc5_.z;
                  _loc6_.y = _loc5_.y * _loc22_ / _loc5_.z;
                  _loc6_.u = _loc5_.u * _loc21_ / _loc5_.alternativa3d::offset;
                  _loc6_.v = _loc5_.v * _loc22_ / _loc5_.alternativa3d::offset;
                  _loc6_.alternativa3d::cameraX = _loc6_.y - _loc6_.v;
                  _loc6_.alternativa3d::cameraY = _loc6_.u - _loc6_.x;
                  _loc6_.alternativa3d::offset = _loc6_.alternativa3d::cameraX * _loc6_.x + _loc6_.alternativa3d::cameraY * _loc6_.y;
                  _loc5_ = _loc5_.alternativa3d::next;
                  _loc6_ = _loc6_.alternativa3d::next;
               }
               if(alternativa3d::culling > 0)
               {
                  if(alternativa3d::culling & 4)
                  {
                     _loc7_ = -param1.alternativa3d::viewSizeX;
                     _loc8_ = -param1.alternativa3d::viewSizeY;
                     _loc10_ = -param1.alternativa3d::viewSizeX;
                     _loc11_ = param1.alternativa3d::viewSizeY;
                     _loc5_ = _loc14_;
                     while(_loc5_ != null)
                     {
                        _loc9_ = _loc7_ * _loc5_.alternativa3d::cameraX + _loc8_ * _loc5_.alternativa3d::cameraY - _loc5_.alternativa3d::offset;
                        _loc12_ = _loc10_ * _loc5_.alternativa3d::cameraX + _loc11_ * _loc5_.alternativa3d::cameraY - _loc5_.alternativa3d::offset;
                        if(!(_loc9_ < 0 || _loc12_ < 0))
                        {
                           break;
                        }
                        if(_loc9_ >= 0 && _loc12_ < 0)
                        {
                           _loc13_ = _loc9_ / (_loc9_ - _loc12_);
                           _loc7_ += (_loc10_ - _loc7_) * _loc13_;
                           _loc8_ += (_loc11_ - _loc8_) * _loc13_;
                        }
                        else if(_loc9_ < 0 && _loc12_ >= 0)
                        {
                           _loc13_ = _loc9_ / (_loc9_ - _loc12_);
                           _loc10_ = _loc7_ + (_loc10_ - _loc7_) * _loc13_;
                           _loc11_ = _loc8_ + (_loc11_ - _loc8_) * _loc13_;
                        }
                        _loc5_ = _loc5_.alternativa3d::next;
                     }
                     if(_loc5_ == null)
                     {
                        (_loc6_ = _loc4_.alternativa3d::create()).alternativa3d::next = _loc15_;
                        (_loc15_ = _loc6_).x = _loc7_;
                        _loc15_.y = _loc8_;
                        _loc15_.u = _loc10_;
                        _loc15_.v = _loc11_;
                     }
                  }
                  if(alternativa3d::culling & 8)
                  {
                     _loc7_ = param1.alternativa3d::viewSizeX;
                     _loc8_ = param1.alternativa3d::viewSizeY;
                     _loc10_ = param1.alternativa3d::viewSizeX;
                     _loc11_ = -param1.alternativa3d::viewSizeY;
                     _loc5_ = _loc14_;
                     while(_loc5_ != null)
                     {
                        _loc9_ = _loc7_ * _loc5_.alternativa3d::cameraX + _loc8_ * _loc5_.alternativa3d::cameraY - _loc5_.alternativa3d::offset;
                        _loc12_ = _loc10_ * _loc5_.alternativa3d::cameraX + _loc11_ * _loc5_.alternativa3d::cameraY - _loc5_.alternativa3d::offset;
                        if(!(_loc9_ < 0 || _loc12_ < 0))
                        {
                           break;
                        }
                        if(_loc9_ >= 0 && _loc12_ < 0)
                        {
                           _loc13_ = _loc9_ / (_loc9_ - _loc12_);
                           _loc7_ += (_loc10_ - _loc7_) * _loc13_;
                           _loc8_ += (_loc11_ - _loc8_) * _loc13_;
                        }
                        else if(_loc9_ < 0 && _loc12_ >= 0)
                        {
                           _loc13_ = _loc9_ / (_loc9_ - _loc12_);
                           _loc10_ = _loc7_ + (_loc10_ - _loc7_) * _loc13_;
                           _loc11_ = _loc8_ + (_loc11_ - _loc8_) * _loc13_;
                        }
                        _loc5_ = _loc5_.alternativa3d::next;
                     }
                     if(_loc5_ == null)
                     {
                        (_loc6_ = _loc4_.alternativa3d::create()).alternativa3d::next = _loc15_;
                        (_loc15_ = _loc6_).x = _loc7_;
                        _loc15_.y = _loc8_;
                        _loc15_.u = _loc10_;
                        _loc15_.v = _loc11_;
                     }
                  }
                  if(alternativa3d::culling & 0x10)
                  {
                     _loc7_ = param1.alternativa3d::viewSizeX;
                     _loc8_ = -param1.alternativa3d::viewSizeY;
                     _loc10_ = -param1.alternativa3d::viewSizeX;
                     _loc11_ = -param1.alternativa3d::viewSizeY;
                     _loc5_ = _loc14_;
                     while(_loc5_ != null)
                     {
                        _loc9_ = _loc7_ * _loc5_.alternativa3d::cameraX + _loc8_ * _loc5_.alternativa3d::cameraY - _loc5_.alternativa3d::offset;
                        _loc12_ = _loc10_ * _loc5_.alternativa3d::cameraX + _loc11_ * _loc5_.alternativa3d::cameraY - _loc5_.alternativa3d::offset;
                        if(!(_loc9_ < 0 || _loc12_ < 0))
                        {
                           break;
                        }
                        if(_loc9_ >= 0 && _loc12_ < 0)
                        {
                           _loc13_ = _loc9_ / (_loc9_ - _loc12_);
                           _loc7_ += (_loc10_ - _loc7_) * _loc13_;
                           _loc8_ += (_loc11_ - _loc8_) * _loc13_;
                        }
                        else if(_loc9_ < 0 && _loc12_ >= 0)
                        {
                           _loc13_ = _loc9_ / (_loc9_ - _loc12_);
                           _loc10_ = _loc7_ + (_loc10_ - _loc7_) * _loc13_;
                           _loc11_ = _loc8_ + (_loc11_ - _loc8_) * _loc13_;
                        }
                        _loc5_ = _loc5_.alternativa3d::next;
                     }
                     if(_loc5_ == null)
                     {
                        (_loc6_ = _loc4_.alternativa3d::create()).alternativa3d::next = _loc15_;
                        (_loc15_ = _loc6_).x = _loc7_;
                        _loc15_.y = _loc8_;
                        _loc15_.u = _loc10_;
                        _loc15_.v = _loc11_;
                     }
                  }
                  if(alternativa3d::culling & 0x20)
                  {
                     _loc7_ = -param1.alternativa3d::viewSizeX;
                     _loc8_ = param1.alternativa3d::viewSizeY;
                     _loc10_ = param1.alternativa3d::viewSizeX;
                     _loc11_ = param1.alternativa3d::viewSizeY;
                     _loc5_ = _loc14_;
                     while(_loc5_ != null)
                     {
                        _loc9_ = _loc7_ * _loc5_.alternativa3d::cameraX + _loc8_ * _loc5_.alternativa3d::cameraY - _loc5_.alternativa3d::offset;
                        _loc12_ = _loc10_ * _loc5_.alternativa3d::cameraX + _loc11_ * _loc5_.alternativa3d::cameraY - _loc5_.alternativa3d::offset;
                        if(!(_loc9_ < 0 || _loc12_ < 0))
                        {
                           break;
                        }
                        if(_loc9_ >= 0 && _loc12_ < 0)
                        {
                           _loc13_ = _loc9_ / (_loc9_ - _loc12_);
                           _loc7_ += (_loc10_ - _loc7_) * _loc13_;
                           _loc8_ += (_loc11_ - _loc8_) * _loc13_;
                        }
                        else if(_loc9_ < 0 && _loc12_ >= 0)
                        {
                           _loc13_ = _loc9_ / (_loc9_ - _loc12_);
                           _loc10_ = _loc7_ + (_loc10_ - _loc7_) * _loc13_;
                           _loc11_ = _loc8_ + (_loc11_ - _loc8_) * _loc13_;
                        }
                        _loc5_ = _loc5_.alternativa3d::next;
                     }
                     if(_loc5_ == null)
                     {
                        (_loc6_ = _loc4_.alternativa3d::create()).alternativa3d::next = _loc15_;
                        (_loc15_ = _loc6_).x = _loc7_;
                        _loc15_.y = _loc8_;
                        _loc15_.u = _loc10_;
                        _loc15_.v = _loc11_;
                     }
                  }
               }
               _loc16_ = 0;
               _loc9_ = _loc14_.x;
               _loc12_ = _loc14_.y;
               _loc5_ = _loc14_;
               while(_loc5_.alternativa3d::next != null)
               {
                  _loc5_ = _loc5_.alternativa3d::next;
               }
               _loc5_.alternativa3d::next = _loc15_;
               _loc5_ = _loc14_;
               while(_loc5_ != null)
               {
                  _loc16_ += (_loc5_.u - _loc9_) * (_loc5_.y - _loc12_) - (_loc5_.v - _loc12_) * (_loc5_.x - _loc9_);
                  if(_loc5_.alternativa3d::next == null)
                  {
                     break;
                  }
                  _loc5_ = _loc5_.alternativa3d::next;
               }
               _loc5_.alternativa3d::next = Vertex.alternativa3d::collector;
               Vertex.alternativa3d::collector = _loc14_;
               if(_loc16_ / (param1.alternativa3d::viewSizeX * param1.alternativa3d::viewSizeY * 8) < this.minSize)
               {
                  _loc5_ = _loc4_;
                  while(_loc5_.alternativa3d::next != null)
                  {
                     _loc5_ = _loc5_.alternativa3d::next;
                  }
                  _loc5_.alternativa3d::next = Vertex.alternativa3d::collector;
                  Vertex.alternativa3d::collector = _loc4_;
                  return;
               }
            }
            if(param1.debug && (_loc2_ = param1.alternativa3d::checkInDebug(this)) > 0)
            {
               if(_loc2_ & Debug.EDGES)
               {
                  _loc5_ = _loc4_;
                  while(_loc5_ != null)
                  {
                     _loc7_ = _loc5_.x * _loc21_ / _loc5_.z;
                     _loc8_ = _loc5_.y * _loc22_ / _loc5_.z;
                     _loc10_ = _loc5_.u * _loc21_ / _loc5_.alternativa3d::offset;
                     _loc11_ = _loc5_.v * _loc22_ / _loc5_.alternativa3d::offset;
                     _loc3_ = param1.view.alternativa3d::canvas;
                     _loc3_.graphics.moveTo(_loc7_,_loc8_);
                     _loc3_.graphics.lineStyle(3,255);
                     _loc3_.graphics.lineTo(_loc7_ + (_loc10_ - _loc7_) * 0.8,_loc8_ + (_loc11_ - _loc8_) * 0.8);
                     _loc3_.graphics.lineStyle(3,16711680);
                     _loc3_.graphics.lineTo(_loc10_,_loc11_);
                     _loc5_ = _loc5_.alternativa3d::next;
                  }
               }
               if(_loc2_ & Debug.BOUNDS)
               {
                  Debug.drawBounds(param1,this,boundMinX,boundMinY,boundMinZ,boundMaxX,boundMaxY,boundMaxZ);
               }
            }
            param1.alternativa3d::occluders[param1.alternativa3d::numOccluders] = _loc4_;
            ++param1.alternativa3d::numOccluders;
         }
         else if(_loc20_)
         {
            if(param1.debug && (_loc2_ = param1.alternativa3d::checkInDebug(this)) > 0)
            {
               if(_loc2_ & Debug.EDGES)
               {
                  _loc13_ = 1.5;
                  _loc3_ = param1.view.alternativa3d::canvas;
                  _loc3_.graphics.moveTo(-_loc21_ + _loc13_,-_loc22_ + _loc13_);
                  _loc3_.graphics.lineStyle(3,255);
                  _loc3_.graphics.lineTo(-_loc21_ + _loc13_,_loc22_ * 0.6);
                  _loc3_.graphics.lineStyle(3,16711680);
                  _loc3_.graphics.lineTo(-_loc21_ + _loc13_,_loc22_ - _loc13_);
                  _loc3_.graphics.lineStyle(3,255);
                  _loc3_.graphics.lineTo(_loc21_ * 0.6,_loc22_ - _loc13_);
                  _loc3_.graphics.lineStyle(3,16711680);
                  _loc3_.graphics.lineTo(_loc21_ - _loc13_,_loc22_ - _loc13_);
                  _loc3_.graphics.lineStyle(3,255);
                  _loc3_.graphics.lineTo(_loc21_ - _loc13_,-_loc22_ * 0.6);
                  _loc3_.graphics.lineStyle(3,16711680);
                  _loc3_.graphics.lineTo(_loc21_ - _loc13_,-_loc22_ + _loc13_);
                  _loc3_.graphics.lineStyle(3,255);
                  _loc3_.graphics.lineTo(-_loc21_ * 0.6,-_loc22_ + _loc13_);
                  _loc3_.graphics.lineStyle(3,16711680);
                  _loc3_.graphics.lineTo(-_loc21_ + _loc13_,-_loc22_ + _loc13_);
               }
               if(_loc2_ & Debug.BOUNDS)
               {
                  Debug.drawBounds(param1,this,boundMinX,boundMinY,boundMinZ,boundMaxX,boundMaxY,boundMaxZ);
               }
            }
            param1.alternativa3d::clearOccluders();
            param1.alternativa3d::occludedAll = true;
         }
      }
      
      override alternativa3d function updateBounds(param1:Object3D, param2:Object3D = null) : void
      {
         var _loc3_:Vertex = this.alternativa3d::vertexList;
         while(_loc3_ != null)
         {
            if(param2 != null)
            {
               _loc3_.alternativa3d::cameraX = param2.alternativa3d::ma * _loc3_.x + param2.alternativa3d::mb * _loc3_.y + param2.alternativa3d::mc * _loc3_.z + param2.alternativa3d::md;
               _loc3_.alternativa3d::cameraY = param2.alternativa3d::me * _loc3_.x + param2.alternativa3d::mf * _loc3_.y + param2.alternativa3d::mg * _loc3_.z + param2.alternativa3d::mh;
               _loc3_.alternativa3d::cameraZ = param2.alternativa3d::mi * _loc3_.x + param2.alternativa3d::mj * _loc3_.y + param2.alternativa3d::mk * _loc3_.z + param2.alternativa3d::ml;
            }
            else
            {
               _loc3_.alternativa3d::cameraX = _loc3_.x;
               _loc3_.alternativa3d::cameraY = _loc3_.y;
               _loc3_.alternativa3d::cameraZ = _loc3_.z;
            }
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
   }
}

import alternativa.engine3d.core.Face;
import alternativa.engine3d.core.Vertex;

class Edge
{
   public var next:Edge;
   
   public var a:Vertex;
   
   public var b:Vertex;
   
   public var left:Face;
   
   public var right:Face;
   
   public function Edge()
   {
      super();
   }
}

