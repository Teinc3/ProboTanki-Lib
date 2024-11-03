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
   import alternativa.engine3d.materials.Material;
   import alternativa.gfx.core.IndexBufferResource;
   import alternativa.gfx.core.VertexBufferResource;
   import flash.geom.Vector3D;
   import flash.utils.Dictionary;
   
   use namespace alternativa3d;
   
   public class BSP extends Object3D
   {
      public var clipping:int = 2;
      
      public var threshold:Number = 0.01;
      
      public var splitAnalysis:Boolean = true;
      
      alternativa3d var vertexList:Vertex;
      
      alternativa3d var root:Node;
      
      alternativa3d var faces:Vector.<Face>;
      
      alternativa3d var vertexBuffer:VertexBufferResource;
      
      alternativa3d var indexBuffer:IndexBufferResource;
      
      alternativa3d var numTriangles:int;
      
      public function BSP()
      {
         this.alternativa3d::faces = new Vector.<Face>();
         super();
      }
      
      public function createTree(param1:Mesh, param2:Boolean = false) : void
      {
         this.destroyTree();
         if(!param2)
         {
            param1 = param1.clone() as Mesh;
         }
         param1.optimizeForDynamicBSP(2);
         var _loc3_:Face = param1.alternativa3d::faceList;
         this.alternativa3d::vertexList = param1.alternativa3d::vertexList;
         param1.alternativa3d::faceList = null;
         param1.alternativa3d::vertexList = null;
         var _loc4_:Vertex = this.alternativa3d::vertexList;
         while(_loc4_ != null)
         {
            _loc4_.alternativa3d::transformId = 0;
            _loc4_.id = null;
            _loc4_ = _loc4_.alternativa3d::next;
         }
         var _loc5_:int = 0;
         var _loc6_:Face = _loc3_;
         while(_loc6_ != null)
         {
            _loc6_.alternativa3d::calculateBestSequenceAndNormal();
            _loc6_.id = null;
            this.alternativa3d::faces[_loc5_] = _loc6_;
            _loc5_++;
            _loc6_ = _loc6_.alternativa3d::next;
         }
         if(_loc3_ != null)
         {
            this.alternativa3d::root = this.createNode(_loc3_);
         }
         calculateBounds();
      }
      
      public function destroyTree() : void
      {
         this.alternativa3d::deleteResources();
         this.alternativa3d::vertexList = null;
         if(this.alternativa3d::root != null)
         {
            this.destroyNode(this.alternativa3d::root);
            this.alternativa3d::root = null;
         }
         this.alternativa3d::faces.length = 0;
      }
      
      public function setMaterialToAllFaces(param1:Material) : void
      {
         var _loc2_:Face = null;
         this.alternativa3d::deleteResources();
         var _loc3_:int = int(this.alternativa3d::faces.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this.alternativa3d::faces[_loc4_];
            _loc2_.material = param1;
            _loc4_++;
         }
         if(this.alternativa3d::root != null)
         {
            this.setMaterialToNode(this.alternativa3d::root,param1);
         }
      }
      
      override public function intersectRay(param1:Vector3D, param2:Vector3D, param3:Dictionary = null, param4:Camera3D = null) : RayIntersectionData
      {
         if(param3 != null && Boolean(param3[this]))
         {
            return null;
         }
         if(!alternativa3d::boundIntersectRay(param1,param2,boundMinX,boundMinY,boundMinZ,boundMaxX,boundMaxY,boundMaxZ))
         {
            return null;
         }
         if(this.alternativa3d::root != null)
         {
            return this.intersectRayNode(this.alternativa3d::root,param1.x,param1.y,param1.z,param2.x,param2.y,param2.z);
         }
         return null;
      }
      
      private function intersectRayNode(param1:Node, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number) : RayIntersectionData
      {
         var _loc8_:RayIntersectionData = null;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Face = null;
         var _loc16_:Wrapper = null;
         var _loc17_:Vertex = null;
         var _loc18_:Vertex = null;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc24_:Number = NaN;
         var _loc9_:Number = param1.normalX * param2 + param1.normalY * param3 + param1.normalZ * param4 - param1.offset;
         if(_loc9_ > 0)
         {
            if(param1.positive != null)
            {
               _loc8_ = this.intersectRayNode(param1.positive,param2,param3,param4,param5,param6,param7);
               if(_loc8_ != null)
               {
                  return _loc8_;
               }
            }
            _loc10_ = param5 * param1.normalX + param6 * param1.normalY + param7 * param1.normalZ;
            if(_loc10_ < 0)
            {
               _loc11_ = -_loc9_ / _loc10_;
               _loc12_ = param2 + param5 * _loc11_;
               _loc13_ = param3 + param6 * _loc11_;
               _loc14_ = param4 + param7 * _loc11_;
               _loc15_ = param1.faceList;
               while(true)
               {
                  if(_loc15_ != null)
                  {
                     _loc16_ = _loc15_.alternativa3d::wrapper;
                     while(_loc16_ != null)
                     {
                        _loc17_ = _loc16_.alternativa3d::vertex;
                        _loc18_ = _loc16_.alternativa3d::next != null ? _loc16_.alternativa3d::next.alternativa3d::vertex : _loc15_.alternativa3d::wrapper.alternativa3d::vertex;
                        _loc19_ = _loc18_.x - _loc17_.x;
                        _loc20_ = _loc18_.y - _loc17_.y;
                        _loc21_ = _loc18_.z - _loc17_.z;
                        _loc22_ = _loc12_ - _loc17_.x;
                        _loc23_ = _loc13_ - _loc17_.y;
                        _loc24_ = _loc14_ - _loc17_.z;
                        if((_loc24_ * _loc20_ - _loc23_ * _loc21_) * param1.normalX + (_loc22_ * _loc21_ - _loc24_ * _loc19_) * param1.normalY + (_loc23_ * _loc19_ - _loc22_ * _loc20_) * param1.normalZ < 0)
                        {
                           break;
                        }
                        _loc16_ = _loc16_.alternativa3d::next;
                     }
                     if(_loc16_ == null)
                     {
                        break;
                     }
                     _loc15_ = _loc15_.alternativa3d::next;
                     continue;
                  }
                  if(param1.negative != null)
                  {
                     return this.intersectRayNode(param1.negative,param2,param3,param4,param5,param6,param7);
                  }
               }
               (_loc8_ = new RayIntersectionData()).object = this;
               _loc8_.face = _loc15_;
               _loc8_.point = new Vector3D(_loc12_,_loc13_,_loc14_);
               _loc8_.time = _loc11_;
               return _loc8_;
            }
         }
         else
         {
            if(param1.negative != null)
            {
               _loc8_ = this.intersectRayNode(param1.negative,param2,param3,param4,param5,param6,param7);
               if(_loc8_ != null)
               {
                  return _loc8_;
               }
            }
            if(param1.positive != null && param5 * param1.normalX + param6 * param1.normalY + param7 * param1.normalZ > 0)
            {
               return this.intersectRayNode(param1.positive,param2,param3,param4,param5,param6,param7);
            }
         }
         return null;
      }
      
      override alternativa3d function checkIntersection(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Dictionary) : Boolean
      {
         return this.alternativa3d::root != null ? Boolean(this.checkIntersectionNode(this.alternativa3d::root,param1,param2,param3,param4,param5,param6,param7)) : Boolean(false);
      }
      
      private function checkIntersectionNode(param1:Node, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number) : Boolean
      {
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Face = null;
         var _loc15_:Wrapper = null;
         var _loc16_:Vertex = null;
         var _loc17_:Vertex = null;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc24_:Number = param1.normalX;
         var _loc25_:Number = param1.normalY;
         var _loc26_:Number = param1.normalZ;
         var _loc27_:Number = _loc24_ * param2 + _loc25_ * param3 + _loc26_ * param4 - param1.offset;
         if(_loc27_ > 0)
         {
            _loc9_ = param5 * _loc24_ + param6 * _loc25_ + param7 * _loc26_;
            if(_loc9_ < 0)
            {
               _loc10_ = -_loc27_ / _loc9_;
               if(_loc10_ < param8)
               {
                  _loc11_ = param2 + param5 * _loc10_;
                  _loc12_ = param3 + param6 * _loc10_;
                  _loc13_ = param4 + param7 * _loc10_;
                  _loc14_ = param1.faceList;
                  while(true)
                  {
                     if(_loc14_ == null)
                     {
                        if(param1.negative != null && this.checkIntersectionNode(param1.negative,param2,param3,param4,param5,param6,param7,param8))
                        {
                           return true;
                        }
                     }
                     else
                     {
                        _loc15_ = _loc14_.alternativa3d::wrapper;
                        while(_loc15_ != null)
                        {
                           _loc16_ = _loc15_.alternativa3d::vertex;
                           _loc17_ = _loc15_.alternativa3d::next != null ? _loc15_.alternativa3d::next.alternativa3d::vertex : _loc14_.alternativa3d::wrapper.alternativa3d::vertex;
                           _loc18_ = _loc17_.x - _loc16_.x;
                           _loc19_ = _loc17_.y - _loc16_.y;
                           _loc20_ = _loc17_.z - _loc16_.z;
                           _loc21_ = _loc11_ - _loc16_.x;
                           _loc22_ = _loc12_ - _loc16_.y;
                           _loc23_ = _loc13_ - _loc16_.z;
                           if((_loc23_ * _loc19_ - _loc22_ * _loc20_) * _loc24_ + (_loc21_ * _loc20_ - _loc23_ * _loc18_) * _loc25_ + (_loc22_ * _loc18_ - _loc21_ * _loc19_) * _loc26_ < 0)
                           {
                              break;
                           }
                           _loc15_ = _loc15_.alternativa3d::next;
                        }
                        if(_loc15_ == null)
                        {
                           break;
                        }
                        _loc14_ = _loc14_.alternativa3d::next;
                     }
                  }
                  return true;
               }
            }
            return param1.positive != null && this.checkIntersectionNode(param1.positive,param2,param3,param4,param5,param6,param7,param8);
         }
         if(param1.negative != null && this.checkIntersectionNode(param1.negative,param2,param3,param4,param5,param6,param7,param8))
         {
            return true;
         }
         if(param1.positive != null)
         {
            _loc9_ = param5 * _loc24_ + param6 * _loc25_ + param7 * _loc26_;
            return _loc9_ > 0 && -_loc27_ / _loc9_ < param8 && this.checkIntersectionNode(param1.positive,param2,param3,param4,param5,param6,param7,param8);
         }
         return false;
      }
      
      override alternativa3d function collectPlanes(param1:Vector3D, param2:Vector3D, param3:Vector3D, param4:Vector3D, param5:Vector3D, param6:Vector.<Face>, param7:Dictionary = null) : void
      {
         if(param7 != null && param7[this] || this.alternativa3d::root == null)
         {
            return;
         }
         var _loc8_:Vector3D = alternativa3d::calculateSphere(param1,param2,param3,param4,param5);
         if(!alternativa3d::boundIntersectSphere(_loc8_,boundMinX,boundMinY,boundMinZ,boundMaxX,boundMaxY,boundMaxZ))
         {
            return;
         }
         this.collectPlanesNode(this.alternativa3d::root,_loc8_,param6);
      }
      
      private function collectPlanesNode(param1:Node, param2:Vector3D, param3:Vector.<Face>) : void
      {
         var _loc4_:Face = null;
         var _loc5_:Wrapper = null;
         var _loc6_:Vertex = null;
         var _loc7_:Number = param1.normalX * param2.x + param1.normalY * param2.y + param1.normalZ * param2.z - param1.offset;
         if(_loc7_ >= param2.w)
         {
            if(param1.positive != null)
            {
               this.collectPlanesNode(param1.positive,param2,param3);
            }
         }
         else if(_loc7_ <= -param2.w)
         {
            if(param1.negative != null)
            {
               this.collectPlanesNode(param1.negative,param2,param3);
            }
         }
         else
         {
            _loc4_ = param1.faceList;
            while(_loc4_ != null)
            {
               _loc5_ = _loc4_.alternativa3d::wrapper;
               while(_loc5_ != null)
               {
                  (_loc6_ = _loc5_.alternativa3d::vertex).alternativa3d::cameraX = alternativa3d::ma * _loc6_.x + alternativa3d::mb * _loc6_.y + alternativa3d::mc * _loc6_.z + alternativa3d::md;
                  _loc6_.alternativa3d::cameraY = alternativa3d::me * _loc6_.x + alternativa3d::mf * _loc6_.y + alternativa3d::mg * _loc6_.z + alternativa3d::mh;
                  _loc6_.alternativa3d::cameraZ = alternativa3d::mi * _loc6_.x + alternativa3d::mj * _loc6_.y + alternativa3d::mk * _loc6_.z + alternativa3d::ml;
                  _loc5_ = _loc5_.alternativa3d::next;
               }
               param3.push(_loc4_);
               _loc4_ = _loc4_.alternativa3d::next;
            }
            if(param1.positive != null)
            {
               this.collectPlanesNode(param1.positive,param2,param3);
            }
            if(param1.negative != null)
            {
               this.collectPlanesNode(param1.negative,param2,param3);
            }
         }
      }
      
      override public function clone() : Object3D
      {
         var _loc1_:BSP = new BSP();
         _loc1_.clonePropertiesFrom(this);
         return _loc1_;
      }
      
      override protected function clonePropertiesFrom(param1:Object3D) : void
      {
         var _loc2_:Vertex = null;
         var _loc3_:Vertex = null;
         var _loc4_:Vertex = null;
         var _loc5_:Face = null;
         var _loc6_:Face = null;
         var _loc7_:Wrapper = null;
         var _loc8_:Wrapper = null;
         var _loc9_:Wrapper = null;
         super.clonePropertiesFrom(param1);
         var _loc10_:BSP = param1 as BSP;
         this.clipping = _loc10_.clipping;
         this.threshold = _loc10_.threshold;
         this.splitAnalysis = _loc10_.splitAnalysis;
         _loc2_ = _loc10_.alternativa3d::vertexList;
         while(_loc2_ != null)
         {
            (_loc4_ = new Vertex()).x = _loc2_.x;
            _loc4_.y = _loc2_.y;
            _loc4_.z = _loc2_.z;
            _loc4_.u = _loc2_.u;
            _loc4_.v = _loc2_.v;
            _loc4_.normalX = _loc2_.normalX;
            _loc4_.normalY = _loc2_.normalY;
            _loc4_.normalZ = _loc2_.normalZ;
            _loc2_.alternativa3d::value = _loc4_;
            if(_loc3_ != null)
            {
               _loc3_.alternativa3d::next = _loc4_;
            }
            else
            {
               this.alternativa3d::vertexList = _loc4_;
            }
            _loc3_ = _loc4_;
            _loc2_ = _loc2_.alternativa3d::next;
         }
         var _loc11_:Dictionary = new Dictionary();
         var _loc12_:int = int(_loc10_.alternativa3d::faces.length);
         var _loc13_:int = 0;
         while(_loc13_ < _loc12_)
         {
            _loc5_ = _loc10_.alternativa3d::faces[_loc13_];
            (_loc6_ = new Face()).material = _loc5_.material;
            _loc6_.smoothingGroups = _loc5_.smoothingGroups;
            _loc6_.alternativa3d::normalX = _loc5_.alternativa3d::normalX;
            _loc6_.alternativa3d::normalY = _loc5_.alternativa3d::normalY;
            _loc6_.alternativa3d::normalZ = _loc5_.alternativa3d::normalZ;
            _loc6_.alternativa3d::offset = _loc5_.alternativa3d::offset;
            _loc7_ = null;
            _loc8_ = _loc5_.alternativa3d::wrapper;
            while(_loc8_ != null)
            {
               (_loc9_ = new Wrapper()).alternativa3d::vertex = _loc8_.alternativa3d::vertex.alternativa3d::value;
               if(_loc7_ != null)
               {
                  _loc7_.alternativa3d::next = _loc9_;
               }
               else
               {
                  _loc6_.alternativa3d::wrapper = _loc9_;
               }
               _loc7_ = _loc9_;
               _loc8_ = _loc8_.alternativa3d::next;
            }
            this.alternativa3d::faces[_loc13_] = _loc6_;
            _loc11_[_loc5_] = _loc6_;
            _loc13_++;
         }
         if(_loc10_.alternativa3d::root != null)
         {
            this.alternativa3d::root = _loc10_.cloneNode(_loc10_.alternativa3d::root,_loc11_);
         }
         _loc2_ = _loc10_.alternativa3d::vertexList;
         while(_loc2_ != null)
         {
            _loc2_.alternativa3d::value = null;
            _loc2_ = _loc2_.alternativa3d::next;
         }
      }
      
      private function cloneNode(param1:Node, param2:Dictionary) : Node
      {
         var _loc3_:Face = null;
         var _loc4_:Face = null;
         var _loc5_:Wrapper = null;
         var _loc6_:Wrapper = null;
         var _loc7_:Wrapper = null;
         var _loc8_:Node = new Node();
         var _loc9_:Face = param1.faceList;
         while(_loc9_ != null)
         {
            _loc4_ = param2[_loc9_];
            if(_loc4_ == null)
            {
               (_loc4_ = new Face()).material = _loc9_.material;
               _loc4_.alternativa3d::normalX = _loc9_.alternativa3d::normalX;
               _loc4_.alternativa3d::normalY = _loc9_.alternativa3d::normalY;
               _loc4_.alternativa3d::normalZ = _loc9_.alternativa3d::normalZ;
               _loc4_.alternativa3d::offset = _loc9_.alternativa3d::offset;
               _loc5_ = null;
               _loc6_ = _loc9_.alternativa3d::wrapper;
               while(_loc6_ != null)
               {
                  (_loc7_ = new Wrapper()).alternativa3d::vertex = _loc6_.alternativa3d::vertex.alternativa3d::value;
                  if(_loc5_ != null)
                  {
                     _loc5_.alternativa3d::next = _loc7_;
                  }
                  else
                  {
                     _loc4_.alternativa3d::wrapper = _loc7_;
                  }
                  _loc5_ = _loc7_;
                  _loc6_ = _loc6_.alternativa3d::next;
               }
            }
            if(_loc8_.faceList != null)
            {
               _loc3_.alternativa3d::next = _loc4_;
            }
            else
            {
               _loc8_.faceList = _loc4_;
            }
            _loc3_ = _loc4_;
            _loc9_ = _loc9_.alternativa3d::next;
         }
         _loc8_.normalX = param1.normalX;
         _loc8_.normalY = param1.normalY;
         _loc8_.normalZ = param1.normalZ;
         _loc8_.offset = param1.offset;
         if(param1.negative != null)
         {
            _loc8_.negative = this.cloneNode(param1.negative,param2);
         }
         if(param1.positive != null)
         {
            _loc8_.positive = this.cloneNode(param1.positive,param2);
         }
         return _loc8_;
      }
      
      private function setMaterialToNode(param1:Node, param2:Material) : void
      {
         var _loc3_:Face = param1.faceList;
         while(_loc3_ != null)
         {
            _loc3_.material = param2;
            _loc3_ = _loc3_.alternativa3d::next;
         }
         if(param1.negative != null)
         {
            this.setMaterialToNode(param1.negative,param2);
         }
         if(param1.positive != null)
         {
            this.setMaterialToNode(param1.positive,param2);
         }
      }
      
      override alternativa3d function draw(param1:Camera3D) : void
      {
         var _loc2_:Face = null;
         var _loc3_:Face = null;
         var _loc4_:Face = null;
         var _loc5_:Face = null;
         var _loc6_:Vertex = null;
         if(this.alternativa3d::root == null)
         {
            return;
         }
         if(this.clipping == 0)
         {
            if(alternativa3d::culling & 1)
            {
               return;
            }
            alternativa3d::culling = 0;
         }
         this.alternativa3d::prepareResources();
         if(alternativa3d::useDepth = !param1.view.alternativa3d::constrained && (param1.softTransparency && param1.softTransparencyStrength > 0 || param1.ssao && param1.ssaoStrength > 0 || param1.deferredLighting && param1.deferredLightingStrength > 0) && alternativa3d::concatenatedAlpha >= depthMapAlphaThreshold)
         {
            param1.alternativa3d::depthObjects[param1.alternativa3d::depthCount] = this;
            ++param1.alternativa3d::depthCount;
         }
         var _loc7_:int = param1.debug ? int(param1.alternativa3d::checkInDebug(this)) : int(0);
         var _loc8_:Face = this.alternativa3d::faces[0];
         if(alternativa3d::concatenatedAlpha >= 1 && alternativa3d::concatenatedBlendMode == "normal" && _loc8_.material != null && (!_loc8_.material.alternativa3d::transparent || _loc8_.material.alphaTestThreshold > 0))
         {
            param1.alternativa3d::addOpaque(_loc8_.material,this.alternativa3d::vertexBuffer,this.alternativa3d::indexBuffer,0,this.alternativa3d::numTriangles,this);
            if(_loc7_ > 0)
            {
               if(_loc7_ & Debug.EDGES)
               {
                  Debug.alternativa3d::drawEdges(param1,null,16777215);
               }
               if(_loc7_ & Debug.BOUNDS)
               {
                  Debug.drawBounds(param1,this,boundMinX,boundMinY,boundMinZ,boundMaxX,boundMaxY,boundMaxZ);
               }
            }
         }
         else
         {
            if(alternativa3d::transformId > 500000000)
            {
               alternativa3d::transformId = 0;
               _loc6_ = this.alternativa3d::vertexList;
               while(_loc6_ != null)
               {
                  _loc6_.alternativa3d::transformId = 0;
                  _loc6_ = _loc6_.alternativa3d::next;
               }
            }
            ++alternativa3d::transformId;
            alternativa3d::calculateInverseMatrix();
            _loc2_ = this.collectNode(this.alternativa3d::root);
            if(_loc2_ == null)
            {
               return;
            }
            if(alternativa3d::culling > 0)
            {
               if(this.clipping == 1)
               {
                  _loc2_ = param1.alternativa3d::cull(_loc2_,alternativa3d::culling);
               }
               else
               {
                  _loc2_ = param1.alternativa3d::clip(_loc2_,alternativa3d::culling);
               }
               if(_loc2_ == null)
               {
                  return;
               }
            }
            if(_loc7_ > 0)
            {
               if(_loc7_ & Debug.EDGES)
               {
                  Debug.alternativa3d::drawEdges(param1,_loc2_,16777215);
               }
               if(_loc7_ & Debug.BOUNDS)
               {
                  Debug.drawBounds(param1,this,boundMinX,boundMinY,boundMinZ,boundMaxX,boundMaxY,boundMaxZ);
               }
            }
            _loc5_ = _loc2_;
            while(_loc5_ != null)
            {
               _loc3_ = _loc5_.alternativa3d::processNext;
               if(_loc3_ == null || _loc3_.material != _loc2_.material)
               {
                  _loc5_.alternativa3d::processNext = null;
                  if(_loc2_.material != null)
                  {
                     _loc2_.alternativa3d::processNegative = _loc4_;
                     _loc4_ = _loc2_;
                  }
                  else
                  {
                     while(_loc2_ != null)
                     {
                        _loc5_ = _loc2_.alternativa3d::processNext;
                        _loc2_.alternativa3d::processNext = null;
                        _loc2_ = _loc5_;
                     }
                  }
                  _loc2_ = _loc3_;
               }
               _loc5_ = _loc3_;
            }
            _loc2_ = _loc4_;
            while(_loc2_ != null)
            {
               _loc3_ = _loc2_.alternativa3d::processNegative;
               _loc2_.alternativa3d::processNegative = null;
               param1.alternativa3d::addTransparent(_loc2_,this);
               _loc2_ = _loc3_;
            }
         }
         alternativa3d::transformConst[0] = alternativa3d::ma;
         alternativa3d::transformConst[1] = alternativa3d::mb;
         alternativa3d::transformConst[2] = alternativa3d::mc;
         alternativa3d::transformConst[3] = alternativa3d::md;
         alternativa3d::transformConst[4] = alternativa3d::me;
         alternativa3d::transformConst[5] = alternativa3d::mf;
         alternativa3d::transformConst[6] = alternativa3d::mg;
         alternativa3d::transformConst[7] = alternativa3d::mh;
         alternativa3d::transformConst[8] = alternativa3d::mi;
         alternativa3d::transformConst[9] = alternativa3d::mj;
         alternativa3d::transformConst[10] = alternativa3d::mk;
         alternativa3d::transformConst[11] = alternativa3d::ml;
      }
      
      override alternativa3d function getVG(param1:Camera3D) : VG
      {
         var _loc2_:Face = null;
         var _loc3_:Vertex = null;
         if(this.alternativa3d::root == null)
         {
            return null;
         }
         if(this.clipping == 0)
         {
            if(alternativa3d::culling & 1)
            {
               return null;
            }
            alternativa3d::culling = 0;
         }
         this.alternativa3d::prepareResources();
         if(alternativa3d::useDepth = !param1.view.alternativa3d::constrained && (param1.softTransparency && param1.softTransparencyStrength > 0 || param1.ssao && param1.ssaoStrength > 0 || param1.deferredLighting && param1.deferredLightingStrength > 0) && alternativa3d::concatenatedAlpha >= depthMapAlphaThreshold)
         {
            param1.alternativa3d::depthObjects[param1.alternativa3d::depthCount] = this;
            ++param1.alternativa3d::depthCount;
         }
         var _loc4_:int = param1.debug ? int(param1.alternativa3d::checkInDebug(this)) : int(0);
         var _loc5_:Face = this.alternativa3d::faces[0];
         if(alternativa3d::concatenatedAlpha >= 1 && alternativa3d::concatenatedBlendMode == "normal" && _loc5_.material != null && (!_loc5_.material.alternativa3d::transparent || _loc5_.material.alphaTestThreshold > 0))
         {
            param1.alternativa3d::addOpaque(_loc5_.material,this.alternativa3d::vertexBuffer,this.alternativa3d::indexBuffer,0,this.alternativa3d::numTriangles,this);
            if(_loc4_ > 0)
            {
               if(_loc4_ & Debug.EDGES)
               {
                  Debug.alternativa3d::drawEdges(param1,null,16777215);
               }
               if(_loc4_ & Debug.BOUNDS)
               {
                  Debug.drawBounds(param1,this,boundMinX,boundMinY,boundMinZ,boundMaxX,boundMaxY,boundMaxZ);
               }
            }
            alternativa3d::transformConst[0] = alternativa3d::ma;
            alternativa3d::transformConst[1] = alternativa3d::mb;
            alternativa3d::transformConst[2] = alternativa3d::mc;
            alternativa3d::transformConst[3] = alternativa3d::md;
            alternativa3d::transformConst[4] = alternativa3d::me;
            alternativa3d::transformConst[5] = alternativa3d::mf;
            alternativa3d::transformConst[6] = alternativa3d::mg;
            alternativa3d::transformConst[7] = alternativa3d::mh;
            alternativa3d::transformConst[8] = alternativa3d::mi;
            alternativa3d::transformConst[9] = alternativa3d::mj;
            alternativa3d::transformConst[10] = alternativa3d::mk;
            alternativa3d::transformConst[11] = alternativa3d::ml;
            return null;
         }
         if(alternativa3d::transformId > 500000000)
         {
            alternativa3d::transformId = 0;
            _loc3_ = this.alternativa3d::vertexList;
            while(_loc3_ != null)
            {
               _loc3_.alternativa3d::transformId = 0;
               _loc3_ = _loc3_.alternativa3d::next;
            }
         }
         ++alternativa3d::transformId;
         alternativa3d::calculateInverseMatrix();
         alternativa3d::transformConst[0] = alternativa3d::ma;
         alternativa3d::transformConst[1] = alternativa3d::mb;
         alternativa3d::transformConst[2] = alternativa3d::mc;
         alternativa3d::transformConst[3] = alternativa3d::md;
         alternativa3d::transformConst[4] = alternativa3d::me;
         alternativa3d::transformConst[5] = alternativa3d::mf;
         alternativa3d::transformConst[6] = alternativa3d::mg;
         alternativa3d::transformConst[7] = alternativa3d::mh;
         alternativa3d::transformConst[8] = alternativa3d::mi;
         alternativa3d::transformConst[9] = alternativa3d::mj;
         alternativa3d::transformConst[10] = alternativa3d::mk;
         alternativa3d::transformConst[11] = alternativa3d::ml;
         _loc2_ = this.prepareNode(this.alternativa3d::root,alternativa3d::culling,param1);
         if(_loc2_ != null)
         {
            return VG.alternativa3d::create(this,_loc2_,3,_loc4_,false);
         }
         return null;
      }
      
      alternativa3d function prepareResources() : void
      {
         var _loc1_:Vector.<Number> = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Vertex = null;
         var _loc5_:Vector.<uint> = null;
         var _loc6_:int = 0;
         var _loc7_:Face = null;
         var _loc8_:Wrapper = null;
         var _loc9_:uint = 0;
         var _loc10_:uint = 0;
         var _loc11_:uint = 0;
         if(this.alternativa3d::vertexBuffer == null)
         {
            _loc1_ = new Vector.<Number>();
            _loc2_ = 0;
            _loc3_ = 0;
            _loc4_ = this.alternativa3d::vertexList;
            while(_loc4_ != null)
            {
               _loc1_[_loc2_] = _loc4_.x;
               _loc2_++;
               _loc1_[_loc2_] = _loc4_.y;
               _loc2_++;
               _loc1_[_loc2_] = _loc4_.z;
               _loc2_++;
               _loc1_[_loc2_] = _loc4_.u;
               _loc2_++;
               _loc1_[_loc2_] = _loc4_.v;
               _loc2_++;
               _loc1_[_loc2_] = _loc4_.normalX;
               _loc2_++;
               _loc1_[_loc2_] = _loc4_.normalY;
               _loc2_++;
               _loc1_[_loc2_] = _loc4_.normalZ;
               _loc2_++;
               _loc4_.alternativa3d::index = _loc3_;
               _loc3_++;
               _loc4_ = _loc4_.alternativa3d::next;
            }
            this.alternativa3d::vertexBuffer = new VertexBufferResource(_loc1_,8);
            _loc5_ = new Vector.<uint>();
            _loc6_ = 0;
            this.alternativa3d::numTriangles = 0;
            for each(_loc7_ in this.alternativa3d::faces)
            {
               _loc8_ = _loc7_.alternativa3d::wrapper;
               _loc9_ = uint(_loc8_.alternativa3d::vertex.alternativa3d::index);
               _loc8_ = _loc8_.alternativa3d::next;
               _loc10_ = uint(_loc8_.alternativa3d::vertex.alternativa3d::index);
               _loc8_ = _loc8_.alternativa3d::next;
               while(_loc8_ != null)
               {
                  _loc11_ = uint(_loc8_.alternativa3d::vertex.alternativa3d::index);
                  _loc5_[_loc6_] = _loc9_;
                  _loc6_++;
                  _loc5_[_loc6_] = _loc10_;
                  _loc6_++;
                  _loc5_[_loc6_] = _loc11_;
                  _loc6_++;
                  _loc10_ = _loc11_;
                  ++this.alternativa3d::numTriangles;
                  _loc8_ = _loc8_.alternativa3d::next;
               }
            }
            this.alternativa3d::indexBuffer = new IndexBufferResource(_loc5_);
         }
      }
      
      alternativa3d function deleteResources() : void
      {
         if(this.alternativa3d::vertexBuffer != null)
         {
            this.alternativa3d::vertexBuffer.dispose();
            this.alternativa3d::vertexBuffer = null;
            this.alternativa3d::indexBuffer.dispose();
            this.alternativa3d::indexBuffer = null;
            this.alternativa3d::numTriangles = 0;
         }
      }
      
      private function collectNode(param1:Node, param2:Face = null) : Face
      {
         var _loc3_:Face = null;
         var _loc4_:Wrapper = null;
         var _loc5_:Vertex = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         if(param1.normalX * alternativa3d::imd + param1.normalY * alternativa3d::imh + param1.normalZ * alternativa3d::iml > param1.offset)
         {
            if(param1.positive != null)
            {
               param2 = this.collectNode(param1.positive,param2);
            }
            _loc3_ = param1.faceList;
            while(_loc3_ != null)
            {
               _loc4_ = _loc3_.alternativa3d::wrapper;
               while(_loc4_ != null)
               {
                  _loc5_ = _loc4_.alternativa3d::vertex;
                  if(_loc5_.alternativa3d::transformId != alternativa3d::transformId)
                  {
                     _loc6_ = _loc5_.x;
                     _loc7_ = _loc5_.y;
                     _loc8_ = _loc5_.z;
                     _loc5_.alternativa3d::cameraX = alternativa3d::ma * _loc6_ + alternativa3d::mb * _loc7_ + alternativa3d::mc * _loc8_ + alternativa3d::md;
                     _loc5_.alternativa3d::cameraY = alternativa3d::me * _loc6_ + alternativa3d::mf * _loc7_ + alternativa3d::mg * _loc8_ + alternativa3d::mh;
                     _loc5_.alternativa3d::cameraZ = alternativa3d::mi * _loc6_ + alternativa3d::mj * _loc7_ + alternativa3d::mk * _loc8_ + alternativa3d::ml;
                     _loc5_.alternativa3d::transformId = alternativa3d::transformId;
                     _loc5_.alternativa3d::drawId = 0;
                  }
                  _loc4_ = _loc4_.alternativa3d::next;
               }
               _loc3_.alternativa3d::processNext = param2;
               param2 = _loc3_;
               _loc3_ = _loc3_.alternativa3d::next;
            }
            if(param1.negative != null)
            {
               param2 = this.collectNode(param1.negative,param2);
            }
         }
         else
         {
            if(param1.negative != null)
            {
               param2 = this.collectNode(param1.negative,param2);
            }
            if(param1.positive != null)
            {
               param2 = this.collectNode(param1.positive,param2);
            }
         }
         return param2;
      }
      
      private function prepareNode(param1:Node, param2:int, param3:Camera3D) : Face
      {
         var _loc4_:Face = null;
         var _loc5_:Wrapper = null;
         var _loc6_:Face = null;
         var _loc7_:Vertex = null;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Vertex = null;
         var _loc12_:Vertex = null;
         var _loc13_:Vertex = null;
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
         if(alternativa3d::imd * param1.normalX + alternativa3d::imh * param1.normalY + alternativa3d::iml * param1.normalZ > param1.offset)
         {
            _loc6_ = _loc4_ = param1.faceList;
            while(_loc6_ != null)
            {
               _loc5_ = _loc6_.alternativa3d::wrapper;
               while(_loc5_ != null)
               {
                  _loc7_ = _loc5_.alternativa3d::vertex;
                  if(_loc7_.alternativa3d::transformId != alternativa3d::transformId)
                  {
                     _loc8_ = _loc7_.x;
                     _loc9_ = _loc7_.y;
                     _loc10_ = _loc7_.z;
                     _loc7_.alternativa3d::cameraX = alternativa3d::ma * _loc8_ + alternativa3d::mb * _loc9_ + alternativa3d::mc * _loc10_ + alternativa3d::md;
                     _loc7_.alternativa3d::cameraY = alternativa3d::me * _loc8_ + alternativa3d::mf * _loc9_ + alternativa3d::mg * _loc10_ + alternativa3d::mh;
                     _loc7_.alternativa3d::cameraZ = alternativa3d::mi * _loc8_ + alternativa3d::mj * _loc9_ + alternativa3d::mk * _loc10_ + alternativa3d::ml;
                     _loc7_.alternativa3d::transformId = alternativa3d::transformId;
                     _loc7_.alternativa3d::drawId = 0;
                  }
                  _loc5_ = _loc5_.alternativa3d::next;
               }
               _loc6_.alternativa3d::processNext = _loc6_.alternativa3d::next;
               _loc6_ = _loc6_.alternativa3d::next;
            }
            if(param2 > 0)
            {
               if(this.clipping == 1)
               {
                  _loc4_ = param3.alternativa3d::cull(_loc4_,param2);
               }
               else
               {
                  _loc4_ = param3.alternativa3d::clip(_loc4_,param2);
               }
            }
         }
         var _loc24_:Face = param1.negative != null ? this.prepareNode(param1.negative,param2,param3) : null;
         var _loc25_:Face = param1.positive != null ? this.prepareNode(param1.positive,param2,param3) : null;
         if(_loc4_ != null || _loc24_ != null && _loc25_ != null)
         {
            if(_loc4_ == null)
            {
               _loc4_ = param1.faceList.alternativa3d::create();
               param3.alternativa3d::lastFace.alternativa3d::next = _loc4_;
               param3.alternativa3d::lastFace = _loc4_;
            }
            _loc5_ = param1.faceList.alternativa3d::wrapper;
            _loc11_ = _loc5_.alternativa3d::vertex;
            _loc5_ = _loc5_.alternativa3d::next;
            _loc12_ = _loc5_.alternativa3d::vertex;
            _loc5_ = _loc5_.alternativa3d::next;
            _loc13_ = _loc5_.alternativa3d::vertex;
            if(_loc11_.alternativa3d::transformId != alternativa3d::transformId)
            {
               _loc11_.alternativa3d::cameraX = alternativa3d::ma * _loc11_.x + alternativa3d::mb * _loc11_.y + alternativa3d::mc * _loc11_.z + alternativa3d::md;
               _loc11_.alternativa3d::cameraY = alternativa3d::me * _loc11_.x + alternativa3d::mf * _loc11_.y + alternativa3d::mg * _loc11_.z + alternativa3d::mh;
               _loc11_.alternativa3d::cameraZ = alternativa3d::mi * _loc11_.x + alternativa3d::mj * _loc11_.y + alternativa3d::mk * _loc11_.z + alternativa3d::ml;
               _loc11_.alternativa3d::transformId = alternativa3d::transformId;
               _loc11_.alternativa3d::drawId = 0;
            }
            if(_loc12_.alternativa3d::transformId != alternativa3d::transformId)
            {
               _loc12_.alternativa3d::cameraX = alternativa3d::ma * _loc12_.x + alternativa3d::mb * _loc12_.y + alternativa3d::mc * _loc12_.z + alternativa3d::md;
               _loc12_.alternativa3d::cameraY = alternativa3d::me * _loc12_.x + alternativa3d::mf * _loc12_.y + alternativa3d::mg * _loc12_.z + alternativa3d::mh;
               _loc12_.alternativa3d::cameraZ = alternativa3d::mi * _loc12_.x + alternativa3d::mj * _loc12_.y + alternativa3d::mk * _loc12_.z + alternativa3d::ml;
               _loc12_.alternativa3d::transformId = alternativa3d::transformId;
               _loc12_.alternativa3d::drawId = 0;
            }
            if(_loc13_.alternativa3d::transformId != alternativa3d::transformId)
            {
               _loc13_.alternativa3d::cameraX = alternativa3d::ma * _loc13_.x + alternativa3d::mb * _loc13_.y + alternativa3d::mc * _loc13_.z + alternativa3d::md;
               _loc13_.alternativa3d::cameraY = alternativa3d::me * _loc13_.x + alternativa3d::mf * _loc13_.y + alternativa3d::mg * _loc13_.z + alternativa3d::mh;
               _loc13_.alternativa3d::cameraZ = alternativa3d::mi * _loc13_.x + alternativa3d::mj * _loc13_.y + alternativa3d::mk * _loc13_.z + alternativa3d::ml;
               _loc13_.alternativa3d::transformId = alternativa3d::transformId;
               _loc13_.alternativa3d::drawId = 0;
            }
            _loc14_ = _loc12_.alternativa3d::cameraX - _loc11_.alternativa3d::cameraX;
            _loc15_ = _loc12_.alternativa3d::cameraY - _loc11_.alternativa3d::cameraY;
            _loc16_ = _loc12_.alternativa3d::cameraZ - _loc11_.alternativa3d::cameraZ;
            _loc17_ = _loc13_.alternativa3d::cameraX - _loc11_.alternativa3d::cameraX;
            _loc18_ = _loc13_.alternativa3d::cameraY - _loc11_.alternativa3d::cameraY;
            _loc19_ = _loc13_.alternativa3d::cameraZ - _loc11_.alternativa3d::cameraZ;
            _loc20_ = _loc19_ * _loc15_ - _loc18_ * _loc16_;
            _loc21_ = _loc17_ * _loc16_ - _loc19_ * _loc14_;
            _loc22_ = _loc18_ * _loc14_ - _loc17_ * _loc15_;
            _loc23_ = _loc20_ * _loc20_ + _loc21_ * _loc21_ + _loc22_ * _loc22_;
            if(_loc23_ > 0)
            {
               _loc23_ = 1 / Math.sqrt(length);
               _loc20_ *= _loc23_;
               _loc21_ *= _loc23_;
               _loc22_ *= _loc23_;
            }
            _loc4_.alternativa3d::normalX = _loc20_;
            _loc4_.alternativa3d::normalY = _loc21_;
            _loc4_.alternativa3d::normalZ = _loc22_;
            _loc4_.alternativa3d::offset = _loc11_.alternativa3d::cameraX * _loc20_ + _loc11_.alternativa3d::cameraY * _loc21_ + _loc11_.alternativa3d::cameraZ * _loc22_;
            _loc4_.alternativa3d::processNegative = _loc24_;
            _loc4_.alternativa3d::processPositive = _loc25_;
         }
         else
         {
            _loc4_ = _loc24_ != null ? _loc24_ : _loc25_;
         }
         return _loc4_;
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
      
      override alternativa3d function split(param1:Vector3D, param2:Vector3D, param3:Vector3D, param4:Number) : Vector.<Object3D>
      {
         var _loc5_:Vertex = null;
         var _loc6_:Vertex = null;
         var _loc7_:Face = null;
         var _loc8_:Face = null;
         var _loc9_:Face = null;
         var _loc10_:Face = null;
         var _loc11_:Face = null;
         var _loc12_:Face = null;
         var _loc13_:Wrapper = null;
         var _loc14_:Vertex = null;
         var _loc15_:Vertex = null;
         var _loc16_:Vertex = null;
         var _loc17_:Boolean = false;
         var _loc18_:Boolean = false;
         var _loc19_:Face = null;
         var _loc20_:Face = null;
         var _loc21_:Wrapper = null;
         var _loc22_:Wrapper = null;
         var _loc23_:Wrapper = null;
         var _loc24_:Number = NaN;
         var _loc25_:Vertex = null;
         var _loc26_:Vector.<Object3D> = new Vector.<Object3D>(2);
         var _loc27_:Vector3D = alternativa3d::calculatePlane(param1,param2,param3);
         var _loc28_:Number = _loc27_.w - param4;
         var _loc29_:Number = _loc27_.w + param4;
         _loc5_ = this.alternativa3d::vertexList;
         while(_loc5_ != null)
         {
            _loc6_ = _loc5_.alternativa3d::next;
            _loc5_.alternativa3d::next = null;
            _loc5_.alternativa3d::offset = _loc5_.x * _loc27_.x + _loc5_.y * _loc27_.y + _loc5_.z * _loc27_.z;
            if(_loc5_.alternativa3d::offset >= _loc28_ && _loc5_.alternativa3d::offset <= _loc29_)
            {
               _loc5_.alternativa3d::value = new Vertex();
               _loc5_.alternativa3d::value.x = _loc5_.x;
               _loc5_.alternativa3d::value.y = _loc5_.y;
               _loc5_.alternativa3d::value.z = _loc5_.z;
               _loc5_.alternativa3d::value.u = _loc5_.u;
               _loc5_.alternativa3d::value.v = _loc5_.v;
               _loc5_.alternativa3d::value.normalX = _loc5_.normalX;
               _loc5_.alternativa3d::value.normalY = _loc5_.normalY;
               _loc5_.alternativa3d::value.normalZ = _loc5_.normalZ;
            }
            _loc5_.alternativa3d::transformId = 0;
            _loc5_ = _loc6_;
         }
         this.alternativa3d::vertexList = null;
         if(this.alternativa3d::root != null)
         {
            this.destroyNode(this.alternativa3d::root);
            this.alternativa3d::root = null;
         }
         var _loc30_:Vector.<Face> = this.alternativa3d::faces;
         this.alternativa3d::faces = new Vector.<Face>();
         var _loc31_:BSP = this.clone() as BSP;
         var _loc32_:BSP = this.clone() as BSP;
         var _loc33_:int = 0;
         var _loc34_:int = 0;
         var _loc35_:int = int(_loc30_.length);
         var _loc36_:int = 0;
         while(_loc36_ < _loc35_)
         {
            _loc11_ = _loc30_[_loc36_];
            _loc12_ = _loc11_.alternativa3d::next;
            _loc13_ = _loc11_.alternativa3d::wrapper;
            _loc14_ = _loc13_.alternativa3d::vertex;
            _loc13_ = _loc13_.alternativa3d::next;
            _loc15_ = _loc13_.alternativa3d::vertex;
            _loc13_ = _loc13_.alternativa3d::next;
            _loc16_ = _loc13_.alternativa3d::vertex;
            _loc17_ = _loc14_.alternativa3d::offset < _loc28_ || _loc15_.alternativa3d::offset < _loc28_ || _loc16_.alternativa3d::offset < _loc28_;
            _loc18_ = _loc14_.alternativa3d::offset > _loc29_ || _loc15_.alternativa3d::offset > _loc29_ || _loc16_.alternativa3d::offset > _loc29_;
            _loc13_ = _loc13_.alternativa3d::next;
            while(_loc13_ != null)
            {
               _loc5_ = _loc13_.alternativa3d::vertex;
               if(_loc5_.alternativa3d::offset < _loc28_)
               {
                  _loc17_ = true;
               }
               else if(_loc5_.alternativa3d::offset > _loc29_)
               {
                  _loc18_ = true;
               }
               _loc13_ = _loc13_.alternativa3d::next;
            }
            if(!_loc17_)
            {
               if(_loc10_ != null)
               {
                  _loc10_.alternativa3d::next = _loc11_;
               }
               else
               {
                  _loc9_ = _loc11_;
               }
               _loc10_ = _loc11_;
               _loc32_.alternativa3d::faces[_loc34_] = _loc11_;
               _loc34_++;
            }
            else if(!_loc18_)
            {
               if(_loc8_ != null)
               {
                  _loc8_.alternativa3d::next = _loc11_;
               }
               else
               {
                  _loc7_ = _loc11_;
               }
               _loc8_ = _loc11_;
               _loc31_.alternativa3d::faces[_loc33_] = _loc11_;
               _loc33_++;
               _loc13_ = _loc11_.alternativa3d::wrapper;
               while(_loc13_ != null)
               {
                  if(_loc13_.alternativa3d::vertex.alternativa3d::value != null)
                  {
                     _loc13_.alternativa3d::vertex = _loc13_.alternativa3d::vertex.alternativa3d::value;
                  }
                  _loc13_ = _loc13_.alternativa3d::next;
               }
            }
            else
            {
               _loc19_ = new Face();
               _loc20_ = new Face();
               _loc21_ = null;
               _loc22_ = null;
               _loc13_ = _loc11_.alternativa3d::wrapper.alternativa3d::next.alternativa3d::next;
               while(_loc13_.alternativa3d::next != null)
               {
                  _loc13_ = _loc13_.alternativa3d::next;
               }
               _loc14_ = _loc13_.alternativa3d::vertex;
               _loc13_ = _loc11_.alternativa3d::wrapper;
               while(_loc13_ != null)
               {
                  _loc15_ = _loc13_.alternativa3d::vertex;
                  if(_loc14_.alternativa3d::offset < _loc28_ && _loc15_.alternativa3d::offset > _loc29_ || _loc14_.alternativa3d::offset > _loc29_ && _loc15_.alternativa3d::offset < _loc28_)
                  {
                     _loc24_ = (_loc27_.w - _loc14_.alternativa3d::offset) / (_loc15_.alternativa3d::offset - _loc14_.alternativa3d::offset);
                     (_loc5_ = new Vertex()).x = _loc14_.x + (_loc15_.x - _loc14_.x) * _loc24_;
                     _loc5_.y = _loc14_.y + (_loc15_.y - _loc14_.y) * _loc24_;
                     _loc5_.z = _loc14_.z + (_loc15_.z - _loc14_.z) * _loc24_;
                     _loc5_.u = _loc14_.u + (_loc15_.u - _loc14_.u) * _loc24_;
                     _loc5_.v = _loc14_.v + (_loc15_.v - _loc14_.v) * _loc24_;
                     _loc5_.normalX = _loc14_.normalX + (_loc15_.normalX - _loc14_.normalX) * _loc24_;
                     _loc5_.normalY = _loc14_.normalY + (_loc15_.normalY - _loc14_.normalY) * _loc24_;
                     _loc5_.normalZ = _loc14_.normalZ + (_loc15_.normalZ - _loc14_.normalZ) * _loc24_;
                     (_loc23_ = new Wrapper()).alternativa3d::vertex = _loc5_;
                     if(_loc21_ != null)
                     {
                        _loc21_.alternativa3d::next = _loc23_;
                     }
                     else
                     {
                        _loc19_.alternativa3d::wrapper = _loc23_;
                     }
                     _loc21_ = _loc23_;
                     (_loc25_ = new Vertex()).x = _loc5_.x;
                     _loc25_.y = _loc5_.y;
                     _loc25_.z = _loc5_.z;
                     _loc25_.u = _loc5_.u;
                     _loc25_.v = _loc5_.v;
                     _loc25_.normalX = _loc5_.normalX;
                     _loc25_.normalY = _loc5_.normalY;
                     _loc25_.normalZ = _loc5_.normalZ;
                     (_loc23_ = new Wrapper()).alternativa3d::vertex = _loc25_;
                     if(_loc22_ != null)
                     {
                        _loc22_.alternativa3d::next = _loc23_;
                     }
                     else
                     {
                        _loc20_.alternativa3d::wrapper = _loc23_;
                     }
                     _loc22_ = _loc23_;
                  }
                  if(_loc15_.alternativa3d::offset < _loc28_)
                  {
                     (_loc23_ = _loc13_.alternativa3d::create()).alternativa3d::vertex = _loc15_;
                     if(_loc21_ != null)
                     {
                        _loc21_.alternativa3d::next = _loc23_;
                     }
                     else
                     {
                        _loc19_.alternativa3d::wrapper = _loc23_;
                     }
                     _loc21_ = _loc23_;
                  }
                  else if(_loc15_.alternativa3d::offset > _loc29_)
                  {
                     (_loc23_ = _loc13_.alternativa3d::create()).alternativa3d::vertex = _loc15_;
                     if(_loc22_ != null)
                     {
                        _loc22_.alternativa3d::next = _loc23_;
                     }
                     else
                     {
                        _loc20_.alternativa3d::wrapper = _loc23_;
                     }
                     _loc22_ = _loc23_;
                  }
                  else
                  {
                     (_loc23_ = _loc13_.alternativa3d::create()).alternativa3d::vertex = _loc15_.alternativa3d::value;
                     if(_loc21_ != null)
                     {
                        _loc21_.alternativa3d::next = _loc23_;
                     }
                     else
                     {
                        _loc19_.alternativa3d::wrapper = _loc23_;
                     }
                     _loc21_ = _loc23_;
                     (_loc23_ = _loc13_.alternativa3d::create()).alternativa3d::vertex = _loc15_;
                     if(_loc22_ != null)
                     {
                        _loc22_.alternativa3d::next = _loc23_;
                     }
                     else
                     {
                        _loc20_.alternativa3d::wrapper = _loc23_;
                     }
                     _loc22_ = _loc23_;
                  }
                  _loc14_ = _loc15_;
                  _loc13_ = _loc13_.alternativa3d::next;
               }
               _loc19_.material = _loc11_.material;
               _loc19_.alternativa3d::calculateBestSequenceAndNormal();
               if(_loc8_ != null)
               {
                  _loc8_.alternativa3d::next = _loc19_;
               }
               else
               {
                  _loc7_ = _loc19_;
               }
               _loc8_ = _loc19_;
               _loc31_.alternativa3d::faces[_loc33_] = _loc19_;
               _loc33_++;
               _loc20_.material = _loc11_.material;
               _loc20_.alternativa3d::calculateBestSequenceAndNormal();
               if(_loc10_ != null)
               {
                  _loc10_.alternativa3d::next = _loc20_;
               }
               else
               {
                  _loc9_ = _loc20_;
               }
               _loc10_ = _loc20_;
               _loc32_.alternativa3d::faces[_loc34_] = _loc20_;
               _loc34_++;
            }
            _loc36_++;
         }
         if(_loc8_ != null)
         {
            _loc8_.alternativa3d::next = null;
            ++_loc31_.alternativa3d::transformId;
            _loc31_.collectVertices();
            _loc31_.alternativa3d::root = _loc31_.createNode(_loc7_);
            _loc31_.calculateBounds();
            _loc26_[0] = _loc31_;
         }
         if(_loc10_ != null)
         {
            _loc10_.alternativa3d::next = null;
            ++_loc32_.alternativa3d::transformId;
            _loc32_.collectVertices();
            _loc32_.alternativa3d::root = _loc32_.createNode(_loc9_);
            _loc32_.calculateBounds();
            _loc26_[1] = _loc32_;
         }
         return _loc26_;
      }
      
      private function collectVertices() : void
      {
         var _loc1_:Face = null;
         var _loc2_:Wrapper = null;
         var _loc3_:Vertex = null;
         var _loc4_:int = int(this.alternativa3d::faces.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc1_ = this.alternativa3d::faces[_loc5_];
            _loc2_ = _loc1_.alternativa3d::wrapper;
            while(_loc2_ != null)
            {
               _loc3_ = _loc2_.alternativa3d::vertex;
               if(_loc3_.alternativa3d::transformId != alternativa3d::transformId)
               {
                  _loc3_.alternativa3d::next = this.alternativa3d::vertexList;
                  this.alternativa3d::vertexList = _loc3_;
                  _loc3_.alternativa3d::transformId = alternativa3d::transformId;
                  _loc3_.alternativa3d::value = null;
               }
               _loc2_ = _loc2_.alternativa3d::next;
            }
            _loc5_++;
         }
      }
      
      private function createNode(param1:Face) : Node
      {
         var _loc2_:Wrapper = null;
         var _loc3_:Vertex = null;
         var _loc4_:Vertex = null;
         var _loc5_:Vertex = null;
         var _loc6_:Vertex = null;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
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
         var _loc19_:Face = null;
         var _loc20_:Face = null;
         var _loc21_:Face = null;
         var _loc22_:Face = null;
         var _loc23_:int = 0;
         var _loc24_:Face = null;
         var _loc25_:int = 0;
         var _loc26_:Face = null;
         var _loc27_:Face = null;
         var _loc28_:Face = null;
         var _loc29_:Face = null;
         var _loc30_:Wrapper = null;
         var _loc31_:Wrapper = null;
         var _loc32_:Wrapper = null;
         var _loc33_:Number = NaN;
         var _loc34_:Node = new Node();
         var _loc35_:Face = param1;
         if(this.splitAnalysis && param1.alternativa3d::next != null)
         {
            _loc23_ = 2147483647;
            _loc24_ = param1;
            while(_loc24_ != null)
            {
               _loc13_ = _loc24_.alternativa3d::normalX;
               _loc14_ = _loc24_.alternativa3d::normalY;
               _loc15_ = _loc24_.alternativa3d::normalZ;
               _loc16_ = _loc24_.alternativa3d::offset;
               _loc17_ = _loc16_ - this.threshold;
               _loc18_ = _loc16_ + this.threshold;
               _loc25_ = 0;
               _loc26_ = param1;
               while(_loc26_ != null)
               {
                  if(_loc26_ != _loc24_)
                  {
                     _loc2_ = _loc26_.alternativa3d::wrapper;
                     _loc3_ = _loc2_.alternativa3d::vertex;
                     _loc2_ = _loc2_.alternativa3d::next;
                     _loc4_ = _loc2_.alternativa3d::vertex;
                     _loc2_ = _loc2_.alternativa3d::next;
                     _loc5_ = _loc2_.alternativa3d::vertex;
                     _loc2_ = _loc2_.alternativa3d::next;
                     _loc9_ = _loc3_.x * _loc13_ + _loc3_.y * _loc14_ + _loc3_.z * _loc15_;
                     _loc10_ = _loc4_.x * _loc13_ + _loc4_.y * _loc14_ + _loc4_.z * _loc15_;
                     _loc11_ = _loc5_.x * _loc13_ + _loc5_.y * _loc14_ + _loc5_.z * _loc15_;
                     _loc7_ = _loc9_ < _loc17_ || _loc10_ < _loc17_ || _loc11_ < _loc17_;
                     _loc8_ = _loc9_ > _loc18_ || _loc10_ > _loc18_ || _loc11_ > _loc18_;
                     while(_loc2_ != null)
                     {
                        _loc6_ = _loc2_.alternativa3d::vertex;
                        if((_loc12_ = _loc6_.x * _loc13_ + _loc6_.y * _loc14_ + _loc6_.z * _loc15_) < _loc17_)
                        {
                           _loc7_ = true;
                           if(_loc8_)
                           {
                              break;
                           }
                        }
                        else if(_loc12_ > _loc18_)
                        {
                           _loc8_ = true;
                           if(_loc7_)
                           {
                              break;
                           }
                        }
                        _loc2_ = _loc2_.alternativa3d::next;
                     }
                     if(_loc8_ && _loc7_)
                     {
                        _loc25_++;
                        if(_loc25_ >= _loc23_)
                        {
                           break;
                        }
                     }
                  }
                  _loc26_ = _loc26_.alternativa3d::next;
               }
               if(_loc25_ < _loc23_)
               {
                  _loc35_ = _loc24_;
                  _loc23_ = _loc25_;
                  if(_loc23_ == 0)
                  {
                     break;
                  }
               }
               _loc24_ = _loc24_.alternativa3d::next;
            }
         }
         var _loc36_:Face = _loc35_;
         var _loc37_:Face = _loc35_.alternativa3d::next;
         _loc13_ = _loc35_.alternativa3d::normalX;
         _loc14_ = _loc35_.alternativa3d::normalY;
         _loc15_ = _loc35_.alternativa3d::normalZ;
         _loc16_ = _loc35_.alternativa3d::offset;
         _loc17_ = _loc16_ - this.threshold;
         _loc18_ = _loc16_ + this.threshold;
         while(param1 != null)
         {
            if(param1 != _loc35_)
            {
               _loc27_ = param1.alternativa3d::next;
               _loc2_ = param1.alternativa3d::wrapper;
               _loc3_ = _loc2_.alternativa3d::vertex;
               _loc2_ = _loc2_.alternativa3d::next;
               _loc4_ = _loc2_.alternativa3d::vertex;
               _loc2_ = _loc2_.alternativa3d::next;
               _loc5_ = _loc2_.alternativa3d::vertex;
               _loc2_ = _loc2_.alternativa3d::next;
               _loc9_ = _loc3_.x * _loc13_ + _loc3_.y * _loc14_ + _loc3_.z * _loc15_;
               _loc10_ = _loc4_.x * _loc13_ + _loc4_.y * _loc14_ + _loc4_.z * _loc15_;
               _loc11_ = _loc5_.x * _loc13_ + _loc5_.y * _loc14_ + _loc5_.z * _loc15_;
               _loc7_ = _loc9_ < _loc17_ || _loc10_ < _loc17_ || _loc11_ < _loc17_;
               _loc8_ = _loc9_ > _loc18_ || _loc10_ > _loc18_ || _loc11_ > _loc18_;
               while(_loc2_ != null)
               {
                  _loc6_ = _loc2_.alternativa3d::vertex;
                  if((_loc12_ = _loc6_.x * _loc13_ + _loc6_.y * _loc14_ + _loc6_.z * _loc15_) < _loc17_)
                  {
                     _loc7_ = true;
                  }
                  else if(_loc12_ > _loc18_)
                  {
                     _loc8_ = true;
                  }
                  _loc6_.alternativa3d::offset = _loc12_;
                  _loc2_ = _loc2_.alternativa3d::next;
               }
               if(!_loc7_)
               {
                  if(!_loc8_)
                  {
                     if(param1.alternativa3d::normalX * _loc13_ + param1.alternativa3d::normalY * _loc14_ + param1.alternativa3d::normalZ * _loc15_ > 0)
                     {
                        _loc36_.alternativa3d::next = param1;
                        _loc36_ = param1;
                     }
                     else
                     {
                        if(_loc19_ != null)
                        {
                           _loc20_.alternativa3d::next = param1;
                        }
                        else
                        {
                           _loc19_ = param1;
                        }
                        _loc20_ = param1;
                     }
                  }
                  else
                  {
                     if(_loc21_ != null)
                     {
                        _loc22_.alternativa3d::next = param1;
                     }
                     else
                     {
                        _loc21_ = param1;
                     }
                     _loc22_ = param1;
                  }
               }
               else if(!_loc8_)
               {
                  if(_loc19_ != null)
                  {
                     _loc20_.alternativa3d::next = param1;
                  }
                  else
                  {
                     _loc19_ = param1;
                  }
                  _loc20_ = param1;
               }
               else
               {
                  _loc3_.alternativa3d::offset = _loc9_;
                  _loc4_.alternativa3d::offset = _loc10_;
                  _loc5_.alternativa3d::offset = _loc11_;
                  _loc28_ = new Face();
                  _loc29_ = new Face();
                  _loc30_ = null;
                  _loc31_ = null;
                  _loc2_ = param1.alternativa3d::wrapper.alternativa3d::next.alternativa3d::next;
                  while(_loc2_.alternativa3d::next != null)
                  {
                     _loc2_ = _loc2_.alternativa3d::next;
                  }
                  _loc3_ = _loc2_.alternativa3d::vertex;
                  _loc9_ = _loc3_.alternativa3d::offset;
                  _loc2_ = param1.alternativa3d::wrapper;
                  while(_loc2_ != null)
                  {
                     _loc4_ = _loc2_.alternativa3d::vertex;
                     _loc10_ = _loc4_.alternativa3d::offset;
                     if(_loc9_ < _loc17_ && _loc10_ > _loc18_ || _loc9_ > _loc18_ && _loc10_ < _loc17_)
                     {
                        _loc33_ = (_loc16_ - _loc9_) / (_loc10_ - _loc9_);
                        (_loc6_ = new Vertex()).alternativa3d::next = this.alternativa3d::vertexList;
                        this.alternativa3d::vertexList = _loc6_;
                        _loc6_.x = _loc3_.x + (_loc4_.x - _loc3_.x) * _loc33_;
                        _loc6_.y = _loc3_.y + (_loc4_.y - _loc3_.y) * _loc33_;
                        _loc6_.z = _loc3_.z + (_loc4_.z - _loc3_.z) * _loc33_;
                        _loc6_.u = _loc3_.u + (_loc4_.u - _loc3_.u) * _loc33_;
                        _loc6_.v = _loc3_.v + (_loc4_.v - _loc3_.v) * _loc33_;
                        _loc6_.normalX = _loc3_.normalX + (_loc4_.normalX - _loc3_.normalX) * _loc33_;
                        _loc6_.normalY = _loc3_.normalY + (_loc4_.normalY - _loc3_.normalY) * _loc33_;
                        _loc6_.normalZ = _loc3_.normalZ + (_loc4_.normalZ - _loc3_.normalZ) * _loc33_;
                        (_loc32_ = new Wrapper()).alternativa3d::vertex = _loc6_;
                        if(_loc30_ != null)
                        {
                           _loc30_.alternativa3d::next = _loc32_;
                        }
                        else
                        {
                           _loc28_.alternativa3d::wrapper = _loc32_;
                        }
                        _loc30_ = _loc32_;
                        (_loc32_ = new Wrapper()).alternativa3d::vertex = _loc6_;
                        if(_loc31_ != null)
                        {
                           _loc31_.alternativa3d::next = _loc32_;
                        }
                        else
                        {
                           _loc29_.alternativa3d::wrapper = _loc32_;
                        }
                        _loc31_ = _loc32_;
                     }
                     if(_loc10_ <= _loc18_)
                     {
                        (_loc32_ = new Wrapper()).alternativa3d::vertex = _loc4_;
                        if(_loc30_ != null)
                        {
                           _loc30_.alternativa3d::next = _loc32_;
                        }
                        else
                        {
                           _loc28_.alternativa3d::wrapper = _loc32_;
                        }
                        _loc30_ = _loc32_;
                     }
                     if(_loc10_ >= _loc17_)
                     {
                        (_loc32_ = new Wrapper()).alternativa3d::vertex = _loc4_;
                        if(_loc31_ != null)
                        {
                           _loc31_.alternativa3d::next = _loc32_;
                        }
                        else
                        {
                           _loc29_.alternativa3d::wrapper = _loc32_;
                        }
                        _loc31_ = _loc32_;
                     }
                     _loc3_ = _loc4_;
                     _loc9_ = _loc10_;
                     _loc2_ = _loc2_.alternativa3d::next;
                  }
                  _loc28_.material = param1.material;
                  _loc28_.smoothingGroups = param1.smoothingGroups;
                  _loc28_.alternativa3d::calculateBestSequenceAndNormal();
                  if(_loc19_ != null)
                  {
                     _loc20_.alternativa3d::next = _loc28_;
                  }
                  else
                  {
                     _loc19_ = _loc28_;
                  }
                  _loc20_ = _loc28_;
                  _loc29_.material = param1.material;
                  _loc29_.smoothingGroups = param1.smoothingGroups;
                  _loc29_.alternativa3d::calculateBestSequenceAndNormal();
                  if(_loc21_ != null)
                  {
                     _loc22_.alternativa3d::next = _loc29_;
                  }
                  else
                  {
                     _loc21_ = _loc29_;
                  }
                  _loc22_ = _loc29_;
               }
               param1 = _loc27_;
            }
            else
            {
               param1 = _loc37_;
            }
         }
         if(_loc19_ != null)
         {
            _loc20_.alternativa3d::next = null;
            _loc34_.negative = this.createNode(_loc19_);
         }
         _loc36_.alternativa3d::next = null;
         _loc34_.faceList = _loc35_;
         _loc34_.normalX = _loc13_;
         _loc34_.normalY = _loc14_;
         _loc34_.normalZ = _loc15_;
         _loc34_.offset = _loc16_;
         if(_loc21_ != null)
         {
            _loc22_.alternativa3d::next = null;
            _loc34_.positive = this.createNode(_loc21_);
         }
         return _loc34_;
      }
      
      private function destroyNode(param1:Node) : void
      {
         var _loc2_:Face = null;
         if(param1.negative != null)
         {
            this.destroyNode(param1.negative);
            param1.negative = null;
         }
         if(param1.positive != null)
         {
            this.destroyNode(param1.positive);
            param1.positive = null;
         }
         var _loc3_:Face = param1.faceList;
         while(_loc3_ != null)
         {
            _loc2_ = _loc3_.alternativa3d::next;
            _loc3_.alternativa3d::next = null;
            _loc3_ = _loc2_;
         }
      }
   }
}

import alternativa.engine3d.core.Face;

class Node
{
   public var negative:Node;
   
   public var positive:Node;
   
   public var faceList:Face;
   
   public var normalX:Number;
   
   public var normalY:Number;
   
   public var normalZ:Number;
   
   public var offset:Number;
   
   public function Node()
   {
      super();
   }
}

