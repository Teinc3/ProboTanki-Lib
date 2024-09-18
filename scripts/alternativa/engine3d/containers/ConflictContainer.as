package alternativa.engine3d.containers
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.Debug;
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.Object3DContainer;
   import alternativa.engine3d.core.VG;
   import alternativa.engine3d.core.Vertex;
   import alternativa.engine3d.core.Wrapper;
   
   use namespace alternativa3d;
   
   public class ConflictContainer extends Object3DContainer
   {
      public var resolveByAABB:Boolean = true;
      
      public var resolveByOOBB:Boolean = true;
      
      public var threshold:Number = 0.01;
      
      public function ConflictContainer()
      {
         super();
      }
      
      override public function clone() : Object3D
      {
         var _loc1_:ConflictContainer = new ConflictContainer();
         _loc1_.clonePropertiesFrom(this);
         return _loc1_;
      }
      
      override protected function clonePropertiesFrom(param1:Object3D) : void
      {
         super.clonePropertiesFrom(param1);
         var _loc2_:ConflictContainer = param1 as ConflictContainer;
         this.resolveByAABB = _loc2_.resolveByAABB;
         this.resolveByOOBB = _loc2_.resolveByOOBB;
         this.threshold = _loc2_.threshold;
      }
      
      override alternativa3d function draw(param1:Camera3D) : void
      {
         var _loc2_:int = 0;
         var _loc3_:VG = null;
         var _loc4_:VG = alternativa3d::getVG(param1);
         if(_loc4_ != null)
         {
            if(param1.debug && (_loc2_ = param1.alternativa3d::checkInDebug(this)) > 0)
            {
               if(_loc2_ & Debug.BOUNDS)
               {
                  Debug.drawBounds(param1,this,boundMinX,boundMinY,boundMinZ,boundMaxX,boundMaxY,boundMaxZ);
               }
            }
            if(_loc4_.alternativa3d::next != null)
            {
               alternativa3d::calculateInverseMatrix();
               if(this.resolveByAABB)
               {
                  _loc3_ = _loc4_;
                  while(_loc3_ != null)
                  {
                     _loc3_.alternativa3d::calculateAABB(alternativa3d::ima,alternativa3d::imb,alternativa3d::imc,alternativa3d::imd,alternativa3d::ime,alternativa3d::imf,alternativa3d::img,alternativa3d::imh,alternativa3d::imi,alternativa3d::imj,alternativa3d::imk,alternativa3d::iml);
                     _loc3_ = _loc3_.alternativa3d::next;
                  }
                  this.alternativa3d::drawAABBGeometry(param1,_loc4_);
               }
               else if(this.resolveByOOBB)
               {
                  _loc3_ = _loc4_;
                  while(_loc3_ != null)
                  {
                     _loc3_.alternativa3d::calculateOOBB(this);
                     _loc3_ = _loc3_.alternativa3d::next;
                  }
                  this.alternativa3d::drawOOBBGeometry(param1,_loc4_);
               }
               else
               {
                  this.alternativa3d::drawConflictGeometry(param1,_loc4_);
               }
            }
            else
            {
               _loc4_.alternativa3d::draw(param1,this.threshold,this);
               _loc4_.alternativa3d::destroy();
            }
         }
      }
      
      alternativa3d function drawAABBGeometry(param1:Camera3D, param2:VG) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = false;
         var _loc8_:VG = null;
         var _loc9_:Boolean = false;
         var _loc10_:VG = null;
         var _loc11_:VG = null;
         var _loc12_:VG = null;
         var _loc13_:VG = null;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:VG = param2;
         while(_loc16_ != null)
         {
            _loc3_ = _loc16_.alternativa3d::boundMinX;
            _loc4_ = _loc3_ - this.threshold;
            _loc5_ = _loc3_ + this.threshold;
            _loc9_ = false;
            _loc8_ = param2;
            while(_loc8_ != null)
            {
               if(_loc16_ != _loc8_)
               {
                  if(_loc8_.alternativa3d::boundMaxX <= _loc5_)
                  {
                     _loc9_ = true;
                  }
                  else if(_loc8_.alternativa3d::boundMinX < _loc4_)
                  {
                     break;
                  }
               }
               _loc8_ = _loc8_.alternativa3d::next;
            }
            if(_loc8_ == null && _loc9_)
            {
               _loc6_ = true;
               _loc7_ = false;
               break;
            }
            _loc3_ = _loc16_.alternativa3d::boundMaxX;
            _loc4_ = _loc3_ - this.threshold;
            _loc5_ = _loc3_ + this.threshold;
            _loc9_ = false;
            _loc8_ = param2;
            while(_loc8_ != null)
            {
               if(_loc16_ != _loc8_)
               {
                  if(_loc8_.alternativa3d::boundMinX >= _loc4_)
                  {
                     _loc9_ = true;
                  }
                  else if(_loc8_.alternativa3d::boundMaxX > _loc5_)
                  {
                     break;
                  }
               }
               _loc8_ = _loc8_.alternativa3d::next;
            }
            if(_loc8_ == null && _loc9_)
            {
               _loc6_ = true;
               _loc7_ = false;
               break;
            }
            _loc3_ = _loc16_.alternativa3d::boundMinY;
            _loc4_ = _loc3_ - this.threshold;
            _loc5_ = _loc3_ + this.threshold;
            _loc9_ = false;
            _loc8_ = param2;
            while(_loc8_ != null)
            {
               if(_loc16_ != _loc8_)
               {
                  if(_loc8_.alternativa3d::boundMaxY <= _loc5_)
                  {
                     _loc9_ = true;
                  }
                  else if(_loc8_.alternativa3d::boundMinY < _loc4_)
                  {
                     break;
                  }
               }
               _loc8_ = _loc8_.alternativa3d::next;
            }
            if(_loc8_ == null && _loc9_)
            {
               _loc6_ = false;
               _loc7_ = true;
               break;
            }
            _loc3_ = _loc16_.alternativa3d::boundMaxY;
            _loc4_ = _loc3_ - this.threshold;
            _loc5_ = _loc3_ + this.threshold;
            _loc9_ = false;
            _loc8_ = param2;
            while(_loc8_ != null)
            {
               if(_loc16_ != _loc8_)
               {
                  if(_loc8_.alternativa3d::boundMinY >= _loc4_)
                  {
                     _loc9_ = true;
                  }
                  else if(_loc8_.alternativa3d::boundMaxY > _loc5_)
                  {
                     break;
                  }
               }
               _loc8_ = _loc8_.alternativa3d::next;
            }
            if(_loc8_ == null && _loc9_)
            {
               _loc6_ = false;
               _loc7_ = true;
               break;
            }
            _loc3_ = _loc16_.alternativa3d::boundMinZ;
            _loc4_ = _loc3_ - this.threshold;
            _loc5_ = _loc3_ + this.threshold;
            _loc9_ = false;
            _loc8_ = param2;
            while(_loc8_ != null)
            {
               if(_loc16_ != _loc8_)
               {
                  if(_loc8_.alternativa3d::boundMaxZ <= _loc5_)
                  {
                     _loc9_ = true;
                  }
                  else if(_loc8_.alternativa3d::boundMinZ < _loc4_)
                  {
                     break;
                  }
               }
               _loc8_ = _loc8_.alternativa3d::next;
            }
            if(_loc8_ == null && _loc9_)
            {
               _loc6_ = false;
               _loc7_ = false;
               break;
            }
            _loc3_ = _loc16_.alternativa3d::boundMaxZ;
            _loc4_ = _loc3_ - this.threshold;
            _loc5_ = _loc3_ + this.threshold;
            _loc9_ = false;
            _loc8_ = param2;
            while(_loc8_ != null)
            {
               if(_loc16_ != _loc8_)
               {
                  if(_loc8_.alternativa3d::boundMinZ >= _loc4_)
                  {
                     _loc9_ = true;
                  }
                  else if(_loc8_.alternativa3d::boundMaxZ > _loc5_)
                  {
                     break;
                  }
               }
               _loc8_ = _loc8_.alternativa3d::next;
            }
            if(_loc8_ == null && _loc9_)
            {
               _loc6_ = false;
               _loc7_ = false;
               break;
            }
            _loc16_ = _loc16_.alternativa3d::next;
         }
         if(_loc16_ != null)
         {
            while(param2 != null)
            {
               _loc10_ = param2.alternativa3d::next;
               _loc14_ = _loc6_ ? Number(param2.alternativa3d::boundMinX) : (_loc7_ ? Number(param2.alternativa3d::boundMinY) : Number(param2.alternativa3d::boundMinZ));
               _loc15_ = _loc6_ ? Number(param2.alternativa3d::boundMaxX) : (_loc7_ ? Number(param2.alternativa3d::boundMaxY) : Number(param2.alternativa3d::boundMaxZ));
               if(_loc15_ > _loc5_)
               {
                  param2.alternativa3d::next = _loc13_;
                  _loc13_ = param2;
               }
               else if(_loc14_ < _loc4_)
               {
                  param2.alternativa3d::next = _loc11_;
                  _loc11_ = param2;
               }
               else
               {
                  param2.alternativa3d::next = _loc12_;
                  _loc12_ = param2;
               }
               param2 = _loc10_;
            }
            if(_loc6_ && alternativa3d::imd > _loc3_ || _loc7_ && alternativa3d::imh > _loc3_ || !_loc6_ && !_loc7_ && alternativa3d::iml > _loc3_)
            {
               if(_loc13_ != null)
               {
                  if(_loc13_.alternativa3d::next != null)
                  {
                     this.alternativa3d::drawAABBGeometry(param1,_loc13_);
                  }
                  else
                  {
                     _loc13_.alternativa3d::draw(param1,this.threshold,this);
                     _loc13_.alternativa3d::destroy();
                  }
               }
               while(_loc12_ != null)
               {
                  _loc10_ = _loc12_.alternativa3d::next;
                  _loc12_.alternativa3d::draw(param1,this.threshold,this);
                  _loc12_.alternativa3d::destroy();
                  _loc12_ = _loc10_;
               }
               if(_loc11_ != null)
               {
                  if(_loc11_.alternativa3d::next != null)
                  {
                     this.alternativa3d::drawAABBGeometry(param1,_loc11_);
                  }
                  else
                  {
                     _loc11_.alternativa3d::draw(param1,this.threshold,this);
                     _loc11_.alternativa3d::destroy();
                  }
               }
            }
            else
            {
               if(_loc11_ != null)
               {
                  if(_loc11_.alternativa3d::next != null)
                  {
                     this.alternativa3d::drawAABBGeometry(param1,_loc11_);
                  }
                  else
                  {
                     _loc11_.alternativa3d::draw(param1,this.threshold,this);
                     _loc11_.alternativa3d::destroy();
                  }
               }
               while(_loc12_ != null)
               {
                  _loc10_ = _loc12_.alternativa3d::next;
                  _loc12_.alternativa3d::draw(param1,this.threshold,this);
                  _loc12_.alternativa3d::destroy();
                  _loc12_ = _loc10_;
               }
               if(_loc13_ != null)
               {
                  if(_loc13_.alternativa3d::next != null)
                  {
                     this.alternativa3d::drawAABBGeometry(param1,_loc13_);
                  }
                  else
                  {
                     _loc13_.alternativa3d::draw(param1,this.threshold,this);
                     _loc13_.alternativa3d::destroy();
                  }
               }
            }
         }
         else if(this.resolveByOOBB)
         {
            _loc16_ = param2;
            while(_loc16_ != null)
            {
               _loc16_.alternativa3d::calculateOOBB(this);
               _loc16_ = _loc16_.alternativa3d::next;
            }
            this.alternativa3d::drawOOBBGeometry(param1,param2);
         }
         else
         {
            this.alternativa3d::drawConflictGeometry(param1,param2);
         }
      }
      
      alternativa3d function drawOOBBGeometry(param1:Camera3D, param2:VG) : void
      {
         var _loc3_:Vertex = null;
         var _loc4_:Vertex = null;
         var _loc5_:Wrapper = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Boolean = false;
         var _loc12_:Boolean = false;
         var _loc13_:VG = null;
         var _loc14_:VG = null;
         var _loc15_:Boolean = false;
         var _loc16_:VG = null;
         var _loc17_:VG = null;
         var _loc18_:VG = null;
         var _loc19_:VG = null;
         _loc13_ = param2;
         while(_loc13_ != null)
         {
            if(_loc13_.alternativa3d::viewAligned)
            {
               _loc10_ = _loc13_.alternativa3d::object.alternativa3d::ml;
               _loc14_ = param2;
               while(_loc14_ != null)
               {
                  if(!_loc14_.alternativa3d::viewAligned)
                  {
                     _loc11_ = false;
                     _loc12_ = false;
                     _loc3_ = _loc14_.alternativa3d::boundVertexList;
                     while(_loc3_ != null)
                     {
                        if(_loc3_.alternativa3d::cameraZ > _loc10_)
                        {
                           if(_loc11_)
                           {
                              break;
                           }
                           _loc12_ = true;
                        }
                        else
                        {
                           if(_loc12_)
                           {
                              break;
                           }
                           _loc11_ = true;
                        }
                        _loc3_ = _loc3_.alternativa3d::next;
                     }
                     if(_loc3_ != null)
                     {
                        break;
                     }
                  }
                  _loc14_ = _loc14_.alternativa3d::next;
               }
               if(_loc14_ == null)
               {
                  break;
               }
            }
            else
            {
               _loc4_ = _loc13_.alternativa3d::boundPlaneList;
               while(_loc4_ != null)
               {
                  _loc7_ = _loc4_.alternativa3d::cameraX;
                  _loc8_ = _loc4_.alternativa3d::cameraY;
                  _loc9_ = _loc4_.alternativa3d::cameraZ;
                  _loc10_ = _loc4_.alternativa3d::offset;
                  _loc15_ = false;
                  _loc14_ = param2;
                  while(_loc14_ != null)
                  {
                     if(_loc13_ != _loc14_)
                     {
                        _loc11_ = false;
                        _loc12_ = false;
                        if(_loc14_.alternativa3d::viewAligned)
                        {
                           _loc5_ = _loc14_.alternativa3d::faceStruct.alternativa3d::wrapper;
                           while(_loc5_ != null)
                           {
                              _loc3_ = _loc5_.alternativa3d::vertex;
                              if(_loc3_.alternativa3d::cameraX * _loc7_ + _loc3_.alternativa3d::cameraY * _loc8_ + _loc3_.alternativa3d::cameraZ * _loc9_ >= _loc10_ - this.threshold)
                              {
                                 if(_loc11_)
                                 {
                                    break;
                                 }
                                 _loc15_ = true;
                                 _loc12_ = true;
                              }
                              else
                              {
                                 if(_loc12_)
                                 {
                                    break;
                                 }
                                 _loc11_ = true;
                              }
                              _loc5_ = _loc5_.alternativa3d::next;
                           }
                           if(_loc5_ != null)
                           {
                              break;
                           }
                        }
                        else
                        {
                           _loc3_ = _loc14_.alternativa3d::boundVertexList;
                           while(_loc3_ != null)
                           {
                              if(_loc3_.alternativa3d::cameraX * _loc7_ + _loc3_.alternativa3d::cameraY * _loc8_ + _loc3_.alternativa3d::cameraZ * _loc9_ >= _loc10_ - this.threshold)
                              {
                                 if(_loc11_)
                                 {
                                    break;
                                 }
                                 _loc15_ = true;
                                 _loc12_ = true;
                              }
                              else
                              {
                                 if(_loc12_)
                                 {
                                    break;
                                 }
                                 _loc11_ = true;
                              }
                              _loc3_ = _loc3_.alternativa3d::next;
                           }
                           if(_loc3_ != null)
                           {
                              break;
                           }
                        }
                     }
                     _loc14_ = _loc14_.alternativa3d::next;
                  }
                  if(_loc14_ == null && _loc15_)
                  {
                     break;
                  }
                  _loc4_ = _loc4_.alternativa3d::next;
               }
               if(_loc4_ != null)
               {
                  break;
               }
            }
            _loc13_ = _loc13_.alternativa3d::next;
         }
         if(_loc13_ != null)
         {
            if(_loc13_.alternativa3d::viewAligned)
            {
               while(param2 != null)
               {
                  _loc16_ = param2.alternativa3d::next;
                  if(param2.alternativa3d::viewAligned)
                  {
                     _loc6_ = param2.alternativa3d::object.alternativa3d::ml - _loc10_;
                     if(_loc6_ < -this.threshold)
                     {
                        param2.alternativa3d::next = _loc19_;
                        _loc19_ = param2;
                     }
                     else if(_loc6_ > this.threshold)
                     {
                        param2.alternativa3d::next = _loc17_;
                        _loc17_ = param2;
                     }
                     else
                     {
                        param2.alternativa3d::next = _loc18_;
                        _loc18_ = param2;
                     }
                  }
                  else
                  {
                     _loc3_ = param2.alternativa3d::boundVertexList;
                     while(_loc3_ != null)
                     {
                        _loc6_ = _loc3_.alternativa3d::cameraZ - _loc10_;
                        if(_loc6_ < -this.threshold)
                        {
                           param2.alternativa3d::next = _loc19_;
                           _loc19_ = param2;
                           break;
                        }
                        if(_loc6_ > this.threshold)
                        {
                           param2.alternativa3d::next = _loc17_;
                           _loc17_ = param2;
                           break;
                        }
                        _loc3_ = _loc3_.alternativa3d::next;
                     }
                     if(_loc3_ == null)
                     {
                        param2.alternativa3d::next = _loc18_;
                        _loc18_ = param2;
                     }
                  }
                  param2 = _loc16_;
               }
            }
            else
            {
               while(param2 != null)
               {
                  _loc16_ = param2.alternativa3d::next;
                  if(param2.alternativa3d::viewAligned)
                  {
                     _loc5_ = param2.alternativa3d::faceStruct.alternativa3d::wrapper;
                     while(_loc5_ != null)
                     {
                        _loc3_ = _loc5_.alternativa3d::vertex;
                        _loc6_ = _loc3_.alternativa3d::cameraX * _loc7_ + _loc3_.alternativa3d::cameraY * _loc8_ + _loc3_.alternativa3d::cameraZ * _loc9_ - _loc10_;
                        if(_loc6_ < -this.threshold)
                        {
                           param2.alternativa3d::next = _loc17_;
                           _loc17_ = param2;
                           break;
                        }
                        if(_loc6_ > this.threshold)
                        {
                           param2.alternativa3d::next = _loc19_;
                           _loc19_ = param2;
                           break;
                        }
                        _loc5_ = _loc5_.alternativa3d::next;
                     }
                     if(_loc5_ == null)
                     {
                        param2.alternativa3d::next = _loc18_;
                        _loc18_ = param2;
                     }
                  }
                  else
                  {
                     _loc3_ = param2.alternativa3d::boundVertexList;
                     while(_loc3_ != null)
                     {
                        _loc6_ = _loc3_.alternativa3d::cameraX * _loc7_ + _loc3_.alternativa3d::cameraY * _loc8_ + _loc3_.alternativa3d::cameraZ * _loc9_ - _loc10_;
                        if(_loc6_ < -this.threshold)
                        {
                           param2.alternativa3d::next = _loc17_;
                           _loc17_ = param2;
                           break;
                        }
                        if(_loc6_ > this.threshold)
                        {
                           param2.alternativa3d::next = _loc19_;
                           _loc19_ = param2;
                           break;
                        }
                        _loc3_ = _loc3_.alternativa3d::next;
                     }
                     if(_loc3_ == null)
                     {
                        param2.alternativa3d::next = _loc18_;
                        _loc18_ = param2;
                     }
                  }
                  param2 = _loc16_;
               }
            }
            if(_loc13_.alternativa3d::viewAligned || _loc10_ < 0)
            {
               if(_loc19_ != null)
               {
                  if(_loc19_.alternativa3d::next != null)
                  {
                     this.alternativa3d::drawOOBBGeometry(param1,_loc19_);
                  }
                  else
                  {
                     _loc19_.alternativa3d::draw(param1,this.threshold,this);
                     _loc19_.alternativa3d::destroy();
                  }
               }
               while(_loc18_ != null)
               {
                  _loc16_ = _loc18_.alternativa3d::next;
                  _loc18_.alternativa3d::draw(param1,this.threshold,this);
                  _loc18_.alternativa3d::destroy();
                  _loc18_ = _loc16_;
               }
               if(_loc17_ != null)
               {
                  if(_loc17_.alternativa3d::next != null)
                  {
                     this.alternativa3d::drawOOBBGeometry(param1,_loc17_);
                  }
                  else
                  {
                     _loc17_.alternativa3d::draw(param1,this.threshold,this);
                     _loc17_.alternativa3d::destroy();
                  }
               }
            }
            else
            {
               if(_loc17_ != null)
               {
                  if(_loc17_.alternativa3d::next != null)
                  {
                     this.alternativa3d::drawOOBBGeometry(param1,_loc17_);
                  }
                  else
                  {
                     _loc17_.alternativa3d::draw(param1,this.threshold,this);
                     _loc17_.alternativa3d::destroy();
                  }
               }
               while(_loc18_ != null)
               {
                  _loc16_ = _loc18_.alternativa3d::next;
                  _loc18_.alternativa3d::draw(param1,this.threshold,this);
                  _loc18_.alternativa3d::destroy();
                  _loc18_ = _loc16_;
               }
               if(_loc19_ != null)
               {
                  if(_loc19_.alternativa3d::next != null)
                  {
                     this.alternativa3d::drawOOBBGeometry(param1,_loc19_);
                  }
                  else
                  {
                     _loc19_.alternativa3d::draw(param1,this.threshold,this);
                     _loc19_.alternativa3d::destroy();
                  }
               }
            }
         }
         else
         {
            this.alternativa3d::drawConflictGeometry(param1,param2);
         }
      }
      
      alternativa3d function drawConflictGeometry(param1:Camera3D, param2:VG) : void
      {
         var _loc3_:Face = null;
         var _loc4_:Face = null;
         var _loc5_:VG = null;
         var _loc6_:VG = null;
         var _loc7_:VG = null;
         var _loc8_:Face = null;
         var _loc9_:Face = null;
         var _loc10_:Face = null;
         var _loc11_:Face = null;
         var _loc12_:Face = null;
         var _loc13_:Face = null;
         var _loc14_:Face = null;
         var _loc15_:Face = null;
         var _loc16_:Face = null;
         var _loc17_:Boolean = false;
         while(param2 != null)
         {
            _loc5_ = param2.alternativa3d::next;
            if(param2.alternativa3d::space == 1)
            {
               param2.alternativa3d::transformStruct(param2.alternativa3d::faceStruct,++param2.alternativa3d::object.alternativa3d::transformId,alternativa3d::ma,alternativa3d::mb,alternativa3d::mc,alternativa3d::md,alternativa3d::me,alternativa3d::mf,alternativa3d::mg,alternativa3d::mh,alternativa3d::mi,alternativa3d::mj,alternativa3d::mk,alternativa3d::ml);
            }
            if(param2.alternativa3d::sorting == 3)
            {
               param2.alternativa3d::next = _loc6_;
               _loc6_ = param2;
            }
            else
            {
               if(param2.alternativa3d::sorting == 2)
               {
                  if(_loc8_ != null)
                  {
                     _loc9_.alternativa3d::processNext = param2.alternativa3d::faceStruct;
                  }
                  else
                  {
                     _loc8_ = param2.alternativa3d::faceStruct;
                  }
                  (_loc9_ = param2.alternativa3d::faceStruct).alternativa3d::geometry = param2;
                  while(_loc9_.alternativa3d::processNext != null)
                  {
                     (_loc9_ = _loc9_.alternativa3d::processNext).alternativa3d::geometry = param2;
                  }
               }
               else
               {
                  if(_loc10_ != null)
                  {
                     _loc11_.alternativa3d::processNext = param2.alternativa3d::faceStruct;
                  }
                  else
                  {
                     _loc10_ = param2.alternativa3d::faceStruct;
                  }
                  (_loc11_ = param2.alternativa3d::faceStruct).alternativa3d::geometry = param2;
                  while(_loc11_.alternativa3d::processNext != null)
                  {
                     (_loc11_ = _loc11_.alternativa3d::processNext).alternativa3d::geometry = param2;
                  }
               }
               param2.alternativa3d::faceStruct = null;
               param2.alternativa3d::next = _loc7_;
               _loc7_ = param2;
            }
            param2 = _loc5_;
         }
         if(_loc7_ != null)
         {
            param2 = _loc7_;
            while(param2.alternativa3d::next != null)
            {
               param2 = param2.alternativa3d::next;
            }
            param2.alternativa3d::next = _loc6_;
         }
         else
         {
            _loc7_ = _loc6_;
         }
         if(_loc8_ != null)
         {
            _loc12_ = _loc8_;
            _loc9_.alternativa3d::processNext = _loc10_;
         }
         else
         {
            _loc12_ = _loc10_;
         }
         if(_loc6_ != null)
         {
            _loc6_.alternativa3d::faceStruct.alternativa3d::geometry = _loc6_;
            _loc12_ = this.collectNode(_loc6_.alternativa3d::faceStruct,_loc12_,param1,this.threshold,true);
            _loc6_.alternativa3d::faceStruct = null;
            _loc6_ = _loc6_.alternativa3d::next;
            while(_loc6_ != null)
            {
               _loc6_.alternativa3d::faceStruct.alternativa3d::geometry = _loc6_;
               _loc12_ = this.collectNode(_loc6_.alternativa3d::faceStruct,_loc12_,param1,this.threshold,false);
               _loc6_.alternativa3d::faceStruct = null;
               _loc6_ = _loc6_.alternativa3d::next;
            }
         }
         else if(_loc8_ != null)
         {
            _loc12_ = this.collectNode(null,_loc12_,param1,this.threshold,true);
         }
         else if(_loc10_ != null)
         {
            _loc12_ = param1.alternativa3d::sortByAverageZ(_loc12_);
         }
         _loc3_ = _loc12_;
         while(_loc3_ != null)
         {
            _loc4_ = _loc3_.alternativa3d::processNext;
            param2 = _loc3_.alternativa3d::geometry;
            _loc3_.alternativa3d::geometry = null;
            _loc17_ = _loc4_ == null || param2 != _loc4_.alternativa3d::geometry;
            if((_loc17_) || _loc3_.material != _loc4_.material)
            {
               _loc3_.alternativa3d::processNext = null;
               if(_loc17_)
               {
                  if(_loc13_ != null)
                  {
                     _loc14_.alternativa3d::processNegative = _loc12_;
                     _loc13_ = null;
                     _loc14_ = null;
                  }
                  else
                  {
                     _loc12_.alternativa3d::processPositive = _loc15_;
                     (_loc15_ = _loc12_).alternativa3d::geometry = param2;
                  }
               }
               else
               {
                  if(_loc13_ != null)
                  {
                     _loc14_.alternativa3d::processNegative = _loc12_;
                  }
                  else
                  {
                     _loc12_.alternativa3d::processPositive = _loc15_;
                     (_loc15_ = _loc12_).alternativa3d::geometry = param2;
                     _loc13_ = _loc12_;
                  }
                  _loc14_ = _loc12_;
               }
               _loc12_ = _loc4_;
            }
            _loc3_ = _loc4_;
         }
         if(param1.debug)
         {
            _loc12_ = _loc15_;
            while(_loc12_ != null)
            {
               if(_loc12_.alternativa3d::geometry.alternativa3d::debug & Debug.EDGES)
               {
                  _loc3_ = _loc12_;
                  while(_loc3_ != null)
                  {
                     Debug.alternativa3d::drawEdges(param1,_loc3_,16711680);
                     _loc3_ = _loc3_.alternativa3d::processNegative;
                  }
               }
               _loc12_ = _loc12_.alternativa3d::processPositive;
            }
         }
         while(_loc15_ != null)
         {
            _loc12_ = _loc15_;
            _loc15_ = _loc12_.alternativa3d::processPositive;
            _loc12_.alternativa3d::processPositive = null;
            param2 = _loc12_.alternativa3d::geometry;
            _loc12_.alternativa3d::geometry = null;
            _loc16_ = null;
            while(_loc12_ != null)
            {
               _loc4_ = _loc12_.alternativa3d::processNegative;
               if(_loc12_.material != null)
               {
                  _loc12_.alternativa3d::processNegative = _loc16_;
                  _loc16_ = _loc12_;
               }
               else
               {
                  _loc12_.alternativa3d::processNegative = null;
                  while(_loc12_ != null)
                  {
                     _loc3_ = _loc12_.alternativa3d::processNext;
                     _loc12_.alternativa3d::processNext = null;
                     _loc12_ = _loc3_;
                  }
               }
               _loc12_ = _loc4_;
            }
            _loc12_ = _loc16_;
            while(_loc12_ != null)
            {
               _loc4_ = _loc12_.alternativa3d::processNegative;
               _loc12_.alternativa3d::processNegative = null;
               param1.alternativa3d::addTransparent(_loc12_,param2.alternativa3d::object);
               _loc12_ = _loc4_;
            }
         }
         param2 = _loc7_;
         while(param2 != null)
         {
            _loc5_ = param2.alternativa3d::next;
            param2.alternativa3d::destroy();
            param2 = _loc5_;
         }
      }
      
      private function collectNode(param1:Face, param2:Face, param3:Camera3D, param4:Number, param5:Boolean, param6:Face = null) : Face
      {
         var _loc7_:Wrapper = null;
         var _loc8_:Vertex = null;
         var _loc9_:Vertex = null;
         var _loc10_:Vertex = null;
         var _loc11_:Vertex = null;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Face = null;
         var _loc17_:Face = null;
         var _loc18_:Face = null;
         var _loc19_:VG = null;
         var _loc20_:Face = null;
         var _loc21_:Face = null;
         var _loc22_:Face = null;
         var _loc23_:Face = null;
         var _loc24_:Face = null;
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
         var _loc42_:Boolean = false;
         var _loc43_:Boolean = false;
         var _loc44_:Number = NaN;
         var _loc45_:Face = null;
         var _loc46_:Face = null;
         var _loc47_:Wrapper = null;
         var _loc48_:Wrapper = null;
         var _loc49_:Wrapper = null;
         var _loc50_:Boolean = false;
         var _loc51_:Number = NaN;
         if(param1 != null)
         {
            _loc19_ = param1.alternativa3d::geometry;
            if(param1.alternativa3d::offset < 0)
            {
               _loc17_ = param1.alternativa3d::processNegative;
               _loc18_ = param1.alternativa3d::processPositive;
               _loc12_ = param1.alternativa3d::normalX;
               _loc13_ = param1.alternativa3d::normalY;
               _loc14_ = param1.alternativa3d::normalZ;
               _loc15_ = param1.alternativa3d::offset;
            }
            else
            {
               _loc17_ = param1.alternativa3d::processPositive;
               _loc18_ = param1.alternativa3d::processNegative;
               _loc12_ = -param1.alternativa3d::normalX;
               _loc13_ = -param1.alternativa3d::normalY;
               _loc14_ = -param1.alternativa3d::normalZ;
               _loc15_ = -param1.alternativa3d::offset;
            }
            param1.alternativa3d::processNegative = null;
            param1.alternativa3d::processPositive = null;
            if(param1.alternativa3d::wrapper != null)
            {
               _loc16_ = param1;
               while(_loc16_.alternativa3d::processNext != null)
               {
                  (_loc16_ = _loc16_.alternativa3d::processNext).alternativa3d::geometry = _loc19_;
               }
            }
            else
            {
               param1.alternativa3d::geometry = null;
               param1 = null;
            }
         }
         else
         {
            param1 = param2;
            param2 = param1.alternativa3d::processNext;
            _loc16_ = param1;
            _loc7_ = param1.alternativa3d::wrapper;
            _loc8_ = _loc7_.alternativa3d::vertex;
            _loc7_ = _loc7_.alternativa3d::next;
            _loc9_ = _loc7_.alternativa3d::vertex;
            _loc25_ = _loc8_.alternativa3d::cameraX;
            _loc26_ = _loc8_.alternativa3d::cameraY;
            _loc27_ = _loc8_.alternativa3d::cameraZ;
            _loc28_ = _loc9_.alternativa3d::cameraX - _loc25_;
            _loc29_ = _loc9_.alternativa3d::cameraY - _loc26_;
            _loc30_ = _loc9_.alternativa3d::cameraZ - _loc27_;
            _loc12_ = 0;
            _loc13_ = 0;
            _loc14_ = 1;
            _loc15_ = _loc27_;
            _loc31_ = 0;
            _loc7_ = _loc7_.alternativa3d::next;
            while(_loc7_ != null)
            {
               _loc11_ = _loc7_.alternativa3d::vertex;
               _loc32_ = _loc11_.alternativa3d::cameraX - _loc25_;
               _loc33_ = _loc11_.alternativa3d::cameraY - _loc26_;
               _loc34_ = _loc11_.alternativa3d::cameraZ - _loc27_;
               _loc35_ = _loc34_ * _loc29_ - _loc33_ * _loc30_;
               _loc36_ = _loc32_ * _loc30_ - _loc34_ * _loc28_;
               _loc37_ = _loc33_ * _loc28_ - _loc32_ * _loc29_;
               _loc38_ = _loc35_ * _loc35_ + _loc36_ * _loc36_ + _loc37_ * _loc37_;
               if(_loc38_ > param4)
               {
                  _loc38_ = 1 / Math.sqrt(_loc38_);
                  _loc12_ = _loc35_ * _loc38_;
                  _loc13_ = _loc36_ * _loc38_;
                  _loc14_ = _loc37_ * _loc38_;
                  _loc15_ = _loc25_ * _loc12_ + _loc26_ * _loc13_ + _loc27_ * _loc14_;
                  break;
               }
               if(_loc38_ > _loc31_)
               {
                  _loc38_ = 1 / Math.sqrt(_loc38_);
                  _loc12_ = _loc35_ * _loc38_;
                  _loc13_ = _loc36_ * _loc38_;
                  _loc14_ = _loc37_ * _loc38_;
                  _loc15_ = _loc25_ * _loc12_ + _loc26_ * _loc13_ + _loc27_ * _loc14_;
                  _loc31_ = _loc38_;
               }
               _loc7_ = _loc7_.alternativa3d::next;
            }
         }
         var _loc52_:Number = _loc15_ - param4;
         var _loc53_:Number = _loc15_ + param4;
         var _loc54_:Face = param2;
         while(_loc54_ != null)
         {
            _loc24_ = _loc54_.alternativa3d::processNext;
            _loc7_ = _loc54_.alternativa3d::wrapper;
            _loc8_ = _loc7_.alternativa3d::vertex;
            _loc7_ = _loc7_.alternativa3d::next;
            _loc9_ = _loc7_.alternativa3d::vertex;
            _loc7_ = _loc7_.alternativa3d::next;
            _loc10_ = _loc7_.alternativa3d::vertex;
            _loc7_ = _loc7_.alternativa3d::next;
            _loc39_ = _loc8_.alternativa3d::cameraX * _loc12_ + _loc8_.alternativa3d::cameraY * _loc13_ + _loc8_.alternativa3d::cameraZ * _loc14_;
            _loc40_ = _loc9_.alternativa3d::cameraX * _loc12_ + _loc9_.alternativa3d::cameraY * _loc13_ + _loc9_.alternativa3d::cameraZ * _loc14_;
            _loc41_ = _loc10_.alternativa3d::cameraX * _loc12_ + _loc10_.alternativa3d::cameraY * _loc13_ + _loc10_.alternativa3d::cameraZ * _loc14_;
            _loc42_ = _loc39_ < _loc52_ || _loc40_ < _loc52_ || _loc41_ < _loc52_;
            _loc43_ = _loc39_ > _loc53_ || _loc40_ > _loc53_ || _loc41_ > _loc53_;
            while(_loc7_ != null)
            {
               _loc11_ = _loc7_.alternativa3d::vertex;
               if((_loc44_ = _loc11_.alternativa3d::cameraX * _loc12_ + _loc11_.alternativa3d::cameraY * _loc13_ + _loc11_.alternativa3d::cameraZ * _loc14_) < _loc52_)
               {
                  _loc42_ = true;
               }
               else if(_loc44_ > _loc53_)
               {
                  _loc43_ = true;
               }
               _loc11_.alternativa3d::offset = _loc44_;
               _loc7_ = _loc7_.alternativa3d::next;
            }
            if(!_loc42_)
            {
               if(!_loc43_)
               {
                  if(param1 != null)
                  {
                     _loc16_.alternativa3d::processNext = _loc54_;
                  }
                  else
                  {
                     param1 = _loc54_;
                  }
                  _loc16_ = _loc54_;
               }
               else
               {
                  if(_loc22_ != null)
                  {
                     _loc23_.alternativa3d::processNext = _loc54_;
                  }
                  else
                  {
                     _loc22_ = _loc54_;
                  }
                  _loc23_ = _loc54_;
               }
            }
            else if(!_loc43_)
            {
               if(_loc20_ != null)
               {
                  _loc21_.alternativa3d::processNext = _loc54_;
               }
               else
               {
                  _loc20_ = _loc54_;
               }
               _loc21_ = _loc54_;
            }
            else
            {
               _loc8_.alternativa3d::offset = _loc39_;
               _loc9_.alternativa3d::offset = _loc40_;
               _loc10_.alternativa3d::offset = _loc41_;
               (_loc45_ = _loc54_.alternativa3d::create()).material = _loc54_.material;
               _loc45_.alternativa3d::geometry = _loc54_.alternativa3d::geometry;
               param3.alternativa3d::lastFace.alternativa3d::next = _loc45_;
               param3.alternativa3d::lastFace = _loc45_;
               (_loc46_ = _loc54_.alternativa3d::create()).material = _loc54_.material;
               _loc46_.alternativa3d::geometry = _loc54_.alternativa3d::geometry;
               param3.alternativa3d::lastFace.alternativa3d::next = _loc46_;
               param3.alternativa3d::lastFace = _loc46_;
               _loc47_ = null;
               _loc48_ = null;
               _loc7_ = _loc54_.alternativa3d::wrapper.alternativa3d::next.alternativa3d::next;
               while(_loc7_.alternativa3d::next != null)
               {
                  _loc7_ = _loc7_.alternativa3d::next;
               }
               _loc8_ = _loc7_.alternativa3d::vertex;
               _loc39_ = _loc8_.alternativa3d::offset;
               _loc50_ = _loc54_.material != null && _loc54_.material.alternativa3d::useVerticesNormals;
               _loc7_ = _loc54_.alternativa3d::wrapper;
               while(_loc7_ != null)
               {
                  _loc9_ = _loc7_.alternativa3d::vertex;
                  _loc40_ = _loc9_.alternativa3d::offset;
                  if(_loc39_ < _loc52_ && _loc40_ > _loc53_ || _loc39_ > _loc53_ && _loc40_ < _loc52_)
                  {
                     _loc51_ = (_loc15_ - _loc39_) / (_loc40_ - _loc39_);
                     _loc11_ = _loc9_.alternativa3d::create();
                     param3.alternativa3d::lastVertex.alternativa3d::next = _loc11_;
                     param3.alternativa3d::lastVertex = _loc11_;
                     _loc11_.alternativa3d::cameraX = _loc8_.alternativa3d::cameraX + (_loc9_.alternativa3d::cameraX - _loc8_.alternativa3d::cameraX) * _loc51_;
                     _loc11_.alternativa3d::cameraY = _loc8_.alternativa3d::cameraY + (_loc9_.alternativa3d::cameraY - _loc8_.alternativa3d::cameraY) * _loc51_;
                     _loc11_.alternativa3d::cameraZ = _loc8_.alternativa3d::cameraZ + (_loc9_.alternativa3d::cameraZ - _loc8_.alternativa3d::cameraZ) * _loc51_;
                     _loc11_.u = _loc8_.u + (_loc9_.u - _loc8_.u) * _loc51_;
                     _loc11_.v = _loc8_.v + (_loc9_.v - _loc8_.v) * _loc51_;
                     if(_loc50_)
                     {
                        _loc11_.x = _loc8_.x + (_loc9_.x - _loc8_.x) * _loc51_;
                        _loc11_.y = _loc8_.y + (_loc9_.y - _loc8_.y) * _loc51_;
                        _loc11_.z = _loc8_.z + (_loc9_.z - _loc8_.z) * _loc51_;
                        _loc11_.normalX = _loc8_.normalX + (_loc9_.normalX - _loc8_.normalX) * _loc51_;
                        _loc11_.normalY = _loc8_.normalY + (_loc9_.normalY - _loc8_.normalY) * _loc51_;
                        _loc11_.normalZ = _loc8_.normalZ + (_loc9_.normalZ - _loc8_.normalZ) * _loc51_;
                     }
                     (_loc49_ = _loc7_.alternativa3d::create()).alternativa3d::vertex = _loc11_;
                     if(_loc47_ != null)
                     {
                        _loc47_.alternativa3d::next = _loc49_;
                     }
                     else
                     {
                        _loc45_.alternativa3d::wrapper = _loc49_;
                     }
                     _loc47_ = _loc49_;
                     (_loc49_ = _loc7_.alternativa3d::create()).alternativa3d::vertex = _loc11_;
                     if(_loc48_ != null)
                     {
                        _loc48_.alternativa3d::next = _loc49_;
                     }
                     else
                     {
                        _loc46_.alternativa3d::wrapper = _loc49_;
                     }
                     _loc48_ = _loc49_;
                  }
                  if(_loc40_ <= _loc53_)
                  {
                     (_loc49_ = _loc7_.alternativa3d::create()).alternativa3d::vertex = _loc9_;
                     if(_loc47_ != null)
                     {
                        _loc47_.alternativa3d::next = _loc49_;
                     }
                     else
                     {
                        _loc45_.alternativa3d::wrapper = _loc49_;
                     }
                     _loc47_ = _loc49_;
                  }
                  if(_loc40_ >= _loc52_)
                  {
                     (_loc49_ = _loc7_.alternativa3d::create()).alternativa3d::vertex = _loc9_;
                     if(_loc48_ != null)
                     {
                        _loc48_.alternativa3d::next = _loc49_;
                     }
                     else
                     {
                        _loc46_.alternativa3d::wrapper = _loc49_;
                     }
                     _loc48_ = _loc49_;
                  }
                  _loc8_ = _loc9_;
                  _loc39_ = _loc40_;
                  _loc7_ = _loc7_.alternativa3d::next;
               }
               if(_loc20_ != null)
               {
                  _loc21_.alternativa3d::processNext = _loc45_;
               }
               else
               {
                  _loc20_ = _loc45_;
               }
               _loc21_ = _loc45_;
               if(_loc22_ != null)
               {
                  _loc23_.alternativa3d::processNext = _loc46_;
               }
               else
               {
                  _loc22_ = _loc46_;
               }
               _loc23_ = _loc46_;
               _loc54_.alternativa3d::processNext = null;
               _loc54_.alternativa3d::geometry = null;
            }
            _loc54_ = _loc24_;
         }
         if(_loc18_ != null)
         {
            _loc18_.alternativa3d::geometry = _loc19_;
            if(_loc23_ != null)
            {
               _loc23_.alternativa3d::processNext = null;
            }
            param6 = this.collectNode(_loc18_,_loc22_,param3,param4,param5,param6);
         }
         else if(_loc22_ != null)
         {
            if(param5 && _loc22_ != _loc23_)
            {
               if(_loc23_ != null)
               {
                  _loc23_.alternativa3d::processNext = null;
               }
               if(_loc22_.alternativa3d::geometry.alternativa3d::sorting == 2)
               {
                  param6 = this.collectNode(null,_loc22_,param3,param4,param5,param6);
               }
               else
               {
                  _loc22_ = param3.alternativa3d::sortByAverageZ(_loc22_);
                  _loc23_ = _loc22_.alternativa3d::processNext;
                  while(_loc23_.alternativa3d::processNext != null)
                  {
                     _loc23_ = _loc23_.alternativa3d::processNext;
                  }
                  _loc23_.alternativa3d::processNext = param6;
                  param6 = _loc22_;
               }
            }
            else
            {
               _loc23_.alternativa3d::processNext = param6;
               param6 = _loc22_;
            }
         }
         if(param1 != null)
         {
            _loc16_.alternativa3d::processNext = param6;
            param6 = param1;
         }
         if(_loc17_ != null)
         {
            _loc17_.alternativa3d::geometry = _loc19_;
            if(_loc21_ != null)
            {
               _loc21_.alternativa3d::processNext = null;
            }
            param6 = this.collectNode(_loc17_,_loc20_,param3,param4,param5,param6);
         }
         else if(_loc20_ != null)
         {
            if(param5 && _loc20_ != _loc21_)
            {
               if(_loc21_ != null)
               {
                  _loc21_.alternativa3d::processNext = null;
               }
               if(_loc20_.alternativa3d::geometry.alternativa3d::sorting == 2)
               {
                  param6 = this.collectNode(null,_loc20_,param3,param4,param5,param6);
               }
               else
               {
                  _loc20_ = param3.alternativa3d::sortByAverageZ(_loc20_);
                  _loc21_ = _loc20_.alternativa3d::processNext;
                  while(_loc21_.alternativa3d::processNext != null)
                  {
                     _loc21_ = _loc21_.alternativa3d::processNext;
                  }
                  _loc21_.alternativa3d::processNext = param6;
                  param6 = _loc20_;
               }
            }
            else
            {
               _loc21_.alternativa3d::processNext = param6;
               param6 = _loc20_;
            }
         }
         return param6;
      }
   }
}

