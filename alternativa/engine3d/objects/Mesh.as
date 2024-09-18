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
   
   public class Mesh extends Object3D
   {
      public var clipping:int = 2;
      
      public var sorting:int = 1;
      
      public var threshold:Number = 0.01;
      
      alternativa3d var vertexList:Vertex;
      
      alternativa3d var faceList:Face;
      
      alternativa3d var vertexBuffer:VertexBufferResource;
      
      alternativa3d var indexBuffer:IndexBufferResource;
      
      alternativa3d var numOpaqueTriangles:int;
      
      alternativa3d var numTriangles:int;
      
      protected var opaqueMaterials:Vector.<Material>;
      
      protected var opaqueBegins:Vector.<int>;
      
      protected var opaqueNums:Vector.<int>;
      
      protected var opaqueLength:int = 0;
      
      private var transparentList:Face;
      
      private var material:Material;
      
      public function Mesh()
      {
         this.opaqueMaterials = new Vector.<Material>();
         this.opaqueBegins = new Vector.<int>();
         this.opaqueNums = new Vector.<int>();
         super();
      }
      
      public static function calculateVerticesNormalsBySmoothingGroupsForMeshList(param1:Vector.<Object3D>, param2:Number = 0) : void
      {
         var _loc20_:* = undefined;
         var _loc3_:int = 0;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:* = undefined;
         var _loc8_:Mesh = null;
         var _loc9_:Face = null;
         var _loc10_:Vertex = null;
         var _loc11_:Wrapper = null;
         var _loc12_:Object3D = null;
         var _loc13_:Vertex = null;
         var _loc14_:Number = NaN;
         var _loc15_:* = null;
         var _loc16_:Dictionary = new Dictionary();
         var _loc17_:int = int(param1.length);
         _loc3_ = 0;
         while(_loc3_ < _loc17_)
         {
            _loc8_ = param1[_loc3_] as Mesh;
            if(_loc8_ != null)
            {
               _loc8_.alternativa3d::deleteResources();
               _loc8_.alternativa3d::composeMatrix();
               _loc12_ = _loc8_;
               while(_loc12_.alternativa3d::_parent != null)
               {
                  _loc12_ = _loc12_.alternativa3d::_parent;
                  _loc12_.alternativa3d::composeMatrix();
                  _loc8_.alternativa3d::appendMatrix(_loc12_);
               }
               _loc10_ = _loc8_.alternativa3d::vertexList;
               while(_loc10_ != null)
               {
                  _loc4_ = _loc10_.x;
                  _loc5_ = _loc10_.y;
                  _loc6_ = _loc10_.z;
                  _loc10_.x = _loc8_.alternativa3d::ma * _loc4_ + _loc8_.alternativa3d::mb * _loc5_ + _loc8_.alternativa3d::mc * _loc6_ + _loc8_.alternativa3d::md;
                  _loc10_.y = _loc8_.alternativa3d::me * _loc4_ + _loc8_.alternativa3d::mf * _loc5_ + _loc8_.alternativa3d::mg * _loc6_ + _loc8_.alternativa3d::mh;
                  _loc10_.z = _loc8_.alternativa3d::mi * _loc4_ + _loc8_.alternativa3d::mj * _loc5_ + _loc8_.alternativa3d::mk * _loc6_ + _loc8_.alternativa3d::ml;
                  _loc10_ = _loc10_.alternativa3d::next;
               }
               _loc8_.calculateNormalsAndRemoveDegenerateFaces();
               _loc9_ = _loc8_.alternativa3d::faceList;
               while(_loc9_ != null)
               {
                  if(_loc9_.smoothingGroups > 0)
                  {
                     _loc11_ = _loc9_.alternativa3d::wrapper;
                     while(_loc11_ != null)
                     {
                        _loc10_ = _loc11_.alternativa3d::vertex;
                        if(!_loc16_[_loc10_])
                        {
                           _loc16_[_loc10_] = new Dictionary();
                        }
                        _loc16_[_loc10_][_loc9_] = true;
                        _loc11_ = _loc11_.alternativa3d::next;
                     }
                  }
                  _loc9_ = _loc9_.alternativa3d::next;
               }
            }
            _loc3_++;
         }
         var _loc18_:Vector.<Vertex> = new Vector.<Vertex>();
         var _loc19_:int = 0;
         for(_loc20_ in _loc16_)
         {
            _loc18_[_loc19_] = _loc20_;
            _loc19_++;
         }
         if(_loc19_ > 0)
         {
            shareFaces(_loc18_,0,_loc19_,0,param2,new Vector.<int>(),_loc16_);
         }
         _loc3_ = 0;
         while(_loc3_ < _loc17_)
         {
            _loc8_ = param1[_loc3_] as Mesh;
            if(_loc8_ != null)
            {
               _loc8_.alternativa3d::vertexList = null;
               _loc9_ = _loc8_.alternativa3d::faceList;
               while(_loc9_ != null)
               {
                  _loc11_ = _loc9_.alternativa3d::wrapper;
                  while(_loc11_ != null)
                  {
                     _loc10_ = _loc11_.alternativa3d::vertex;
                     (_loc13_ = new Vertex()).x = _loc10_.x;
                     _loc13_.y = _loc10_.y;
                     _loc13_.z = _loc10_.z;
                     _loc13_.u = _loc10_.u;
                     _loc13_.v = _loc10_.v;
                     _loc13_.id = _loc10_.id;
                     _loc13_.normalX = _loc9_.alternativa3d::normalX;
                     _loc13_.normalY = _loc9_.alternativa3d::normalY;
                     _loc13_.normalZ = _loc9_.alternativa3d::normalZ;
                     if(_loc9_.smoothingGroups > 0)
                     {
                        for(_loc15_ in _loc16_[_loc10_])
                        {
                           if(_loc9_ != _loc15_ && (_loc9_.smoothingGroups & _loc15_.smoothingGroups) > 0)
                           {
                              _loc13_.normalX += _loc15_.normalX;
                              _loc13_.normalY += _loc15_.normalY;
                              _loc13_.normalZ += _loc15_.normalZ;
                           }
                        }
                        _loc14_ = _loc13_.normalX * _loc13_.normalX + _loc13_.normalY * _loc13_.normalY + _loc13_.normalZ * _loc13_.normalZ;
                        if(_loc14_ > 0.001)
                        {
                           _loc14_ = 1 / Math.sqrt(_loc14_);
                           _loc13_.normalX *= _loc14_;
                           _loc13_.normalY *= _loc14_;
                           _loc13_.normalZ *= _loc14_;
                        }
                     }
                     _loc11_.alternativa3d::vertex = _loc13_;
                     _loc13_.alternativa3d::next = _loc8_.alternativa3d::vertexList;
                     _loc8_.alternativa3d::vertexList = _loc13_;
                     _loc11_ = _loc11_.alternativa3d::next;
                  }
                  _loc9_ = _loc9_.alternativa3d::next;
               }
            }
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < _loc17_)
         {
            _loc8_ = param1[_loc3_] as Mesh;
            if(_loc8_ != null)
            {
               _loc8_.alternativa3d::invertMatrix();
               _loc10_ = _loc8_.alternativa3d::vertexList;
               while(_loc10_ != null)
               {
                  _loc4_ = _loc10_.x;
                  _loc5_ = _loc10_.y;
                  _loc6_ = _loc10_.z;
                  _loc10_.x = _loc8_.alternativa3d::ma * _loc4_ + _loc8_.alternativa3d::mb * _loc5_ + _loc8_.alternativa3d::mc * _loc6_ + _loc8_.alternativa3d::md;
                  _loc10_.y = _loc8_.alternativa3d::me * _loc4_ + _loc8_.alternativa3d::mf * _loc5_ + _loc8_.alternativa3d::mg * _loc6_ + _loc8_.alternativa3d::mh;
                  _loc10_.z = _loc8_.alternativa3d::mi * _loc4_ + _loc8_.alternativa3d::mj * _loc5_ + _loc8_.alternativa3d::mk * _loc6_ + _loc8_.alternativa3d::ml;
                  _loc4_ = _loc10_.normalX;
                  _loc5_ = _loc10_.normalY;
                  _loc6_ = _loc10_.normalZ;
                  _loc10_.normalX = _loc8_.alternativa3d::ma * _loc4_ + _loc8_.alternativa3d::mb * _loc5_ + _loc8_.alternativa3d::mc * _loc6_;
                  _loc10_.normalY = _loc8_.alternativa3d::me * _loc4_ + _loc8_.alternativa3d::mf * _loc5_ + _loc8_.alternativa3d::mg * _loc6_;
                  _loc10_.normalZ = _loc8_.alternativa3d::mi * _loc4_ + _loc8_.alternativa3d::mj * _loc5_ + _loc8_.alternativa3d::mk * _loc6_;
                  _loc10_ = _loc10_.alternativa3d::next;
               }
               _loc9_ = _loc8_.alternativa3d::faceList;
               while(_loc9_ != null)
               {
                  _loc4_ = _loc9_.alternativa3d::normalX;
                  _loc5_ = _loc9_.alternativa3d::normalY;
                  _loc6_ = _loc9_.alternativa3d::normalZ;
                  _loc9_.alternativa3d::normalX = _loc8_.alternativa3d::ma * _loc4_ + _loc8_.alternativa3d::mb * _loc5_ + _loc8_.alternativa3d::mc * _loc6_;
                  _loc9_.alternativa3d::normalY = _loc8_.alternativa3d::me * _loc4_ + _loc8_.alternativa3d::mf * _loc5_ + _loc8_.alternativa3d::mg * _loc6_;
                  _loc9_.alternativa3d::normalZ = _loc8_.alternativa3d::mi * _loc4_ + _loc8_.alternativa3d::mj * _loc5_ + _loc8_.alternativa3d::mk * _loc6_;
                  _loc9_.alternativa3d::offset = _loc9_.alternativa3d::wrapper.alternativa3d::vertex.x * _loc9_.alternativa3d::normalX + _loc9_.alternativa3d::wrapper.alternativa3d::vertex.y * _loc9_.alternativa3d::normalY + _loc9_.alternativa3d::wrapper.alternativa3d::vertex.z * _loc9_.alternativa3d::normalZ;
                  _loc9_ = _loc9_.alternativa3d::next;
               }
            }
            _loc3_++;
         }
      }
      
      private static function shareFaces(param1:Vector.<Vertex>, param2:int, param3:int, param4:int, param5:Number, param6:Vector.<int>, param7:Dictionary) : void
      {
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:Vertex = null;
         var _loc12_:Vertex = null;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:Number = NaN;
         var _loc16_:Vertex = null;
         var _loc17_:Vertex = null;
         var _loc18_:* = undefined;
         switch(param4)
         {
            case 0:
               _loc8_ = param2;
               while(_loc8_ < param3)
               {
                  _loc11_ = param1[_loc8_];
                  _loc11_.alternativa3d::offset = _loc11_.x;
                  _loc8_++;
               }
               break;
            case 1:
               _loc8_ = param2;
               while(_loc8_ < param3)
               {
                  _loc11_ = param1[_loc8_];
                  _loc11_.alternativa3d::offset = _loc11_.y;
                  _loc8_++;
               }
               break;
            case 2:
               _loc8_ = param2;
               while(true)
               {
                  if(_loc8_ < param3)
                  {
                     _loc11_ = param1[_loc8_];
                     _loc11_.alternativa3d::offset = _loc11_.z;
                     _loc8_++;
                     continue;
                  }
               }
         }
         param6[0] = param2;
         param6[1] = param3 - 1;
         var _loc19_:int = 2;
         while(_loc19_ > 0)
         {
            _loc19_--;
            _loc9_ = _loc13_ = param6[_loc19_];
            _loc19_--;
            _loc8_ = _loc14_ = param6[_loc19_];
            _loc11_ = param1[_loc13_ + _loc14_ >> 1];
            _loc15_ = _loc11_.alternativa3d::offset;
            while(_loc8_ <= _loc9_)
            {
               _loc16_ = param1[_loc8_];
               while(_loc16_.alternativa3d::offset > _loc15_)
               {
                  _loc8_++;
                  _loc16_ = param1[_loc8_];
               }
               _loc17_ = param1[_loc9_];
               while(_loc17_.alternativa3d::offset < _loc15_)
               {
                  _loc9_--;
                  _loc17_ = param1[_loc9_];
               }
               if(_loc8_ <= _loc9_)
               {
                  param1[_loc8_] = _loc17_;
                  param1[_loc9_] = _loc16_;
                  _loc8_++;
                  _loc9_--;
               }
            }
            if(_loc14_ < _loc9_)
            {
               param6[_loc19_] = _loc14_;
               _loc19_++;
               param6[_loc19_] = _loc9_;
               _loc19_++;
            }
            if(_loc8_ < _loc13_)
            {
               param6[_loc19_] = _loc8_;
               _loc19_++;
               param6[_loc19_] = _loc13_;
               _loc19_++;
            }
         }
         _loc8_ = param2;
         _loc11_ = param1[_loc8_];
         _loc9_ = _loc8_ + 1;
         while(_loc9_ <= param3)
         {
            if(_loc9_ < param3)
            {
               _loc12_ = param1[_loc9_];
            }
            if(_loc9_ == param3 || _loc11_.alternativa3d::offset - _loc12_.alternativa3d::offset > param5)
            {
               if(_loc9_ - _loc8_ > 1)
               {
                  if(param4 < 2)
                  {
                     shareFaces(param1,_loc8_,_loc9_,param4 + 1,param5,param6,param7);
                  }
                  else
                  {
                     _loc10_ = _loc8_ + 1;
                     while(_loc10_ < _loc9_)
                     {
                        _loc12_ = param1[_loc10_];
                        for(_loc18_ in param7[_loc12_])
                        {
                           param7[_loc11_][_loc18_] = true;
                        }
                        _loc10_++;
                     }
                     _loc10_ = _loc8_ + 1;
                     while(_loc10_ < _loc9_)
                     {
                        _loc12_ = param1[_loc10_];
                        for(_loc18_ in param7[_loc11_])
                        {
                           param7[_loc12_][_loc18_] = true;
                        }
                        _loc10_++;
                     }
                  }
               }
               if(_loc9_ < param3)
               {
                  _loc8_ = _loc9_;
                  _loc11_ = param1[_loc8_];
               }
            }
            _loc9_++;
         }
      }
      
      public function addVertex(param1:Number, param2:Number, param3:Number, param4:Number = 0, param5:Number = 0, param6:Object = null) : Vertex
      {
         var _loc7_:Vertex = null;
         this.alternativa3d::deleteResources();
         var _loc8_:Vertex;
         (_loc8_ = new Vertex()).x = param1;
         _loc8_.y = param2;
         _loc8_.z = param3;
         _loc8_.u = param4;
         _loc8_.v = param5;
         _loc8_.id = param6;
         if(this.alternativa3d::vertexList != null)
         {
            _loc7_ = this.alternativa3d::vertexList;
            while(_loc7_.alternativa3d::next != null)
            {
               _loc7_ = _loc7_.alternativa3d::next;
            }
            _loc7_.alternativa3d::next = _loc8_;
         }
         else
         {
            this.alternativa3d::vertexList = _loc8_;
         }
         return _loc8_;
      }
      
      public function removeVertex(param1:Vertex) : Vertex
      {
         var _loc2_:Vertex = null;
         var _loc3_:Face = null;
         var _loc4_:Face = null;
         var _loc5_:Wrapper = null;
         this.alternativa3d::deleteResources();
         if(param1 == null)
         {
            throw new TypeError("Parameter vertex must be non-null.");
         }
         var _loc6_:Vertex = this.alternativa3d::vertexList;
         while(_loc6_ != null)
         {
            if(_loc6_ == param1)
            {
               if(_loc2_ != null)
               {
                  _loc2_.alternativa3d::next = _loc6_.alternativa3d::next;
               }
               else
               {
                  this.alternativa3d::vertexList = _loc6_.alternativa3d::next;
               }
               _loc6_.alternativa3d::next = null;
               break;
            }
            _loc2_ = _loc6_;
            _loc6_ = _loc6_.alternativa3d::next;
         }
         if(_loc6_ == null)
         {
            throw new ArgumentError("Vertex not found.");
         }
         var _loc7_:Face = this.alternativa3d::faceList;
         while(_loc7_ != null)
         {
            _loc4_ = _loc7_.alternativa3d::next;
            _loc5_ = _loc7_.alternativa3d::wrapper;
            while(_loc5_ != null)
            {
               if(_loc5_.alternativa3d::vertex == _loc6_)
               {
                  break;
               }
               _loc5_ = _loc5_.alternativa3d::next;
            }
            if(_loc5_ != null)
            {
               if(_loc3_ != null)
               {
                  _loc3_.alternativa3d::next = _loc4_;
               }
               else
               {
                  this.alternativa3d::faceList = _loc4_;
               }
               _loc7_.alternativa3d::next = null;
            }
            else
            {
               _loc3_ = _loc7_;
            }
            _loc7_ = _loc4_;
         }
         return _loc6_;
      }
      
      public function removeVertexById(param1:Object) : Vertex
      {
         var _loc2_:Vertex = null;
         var _loc3_:Face = null;
         var _loc4_:Face = null;
         var _loc5_:Wrapper = null;
         this.alternativa3d::deleteResources();
         if(param1 == null)
         {
            throw new TypeError("Parameter id must be non-null.");
         }
         var _loc6_:Vertex = this.alternativa3d::vertexList;
         while(_loc6_ != null)
         {
            if(_loc6_.id == param1)
            {
               if(_loc2_ != null)
               {
                  _loc2_.alternativa3d::next = _loc6_.alternativa3d::next;
               }
               else
               {
                  this.alternativa3d::vertexList = _loc6_.alternativa3d::next;
               }
               _loc6_.alternativa3d::next = null;
               break;
            }
            _loc2_ = _loc6_;
            _loc6_ = _loc6_.alternativa3d::next;
         }
         if(_loc6_ == null)
         {
            throw new ArgumentError("Vertex not found.");
         }
         var _loc7_:Face = this.alternativa3d::faceList;
         while(_loc7_ != null)
         {
            _loc4_ = _loc7_.alternativa3d::next;
            _loc5_ = _loc7_.alternativa3d::wrapper;
            while(_loc5_ != null)
            {
               if(_loc5_.alternativa3d::vertex == _loc6_)
               {
                  break;
               }
               _loc5_ = _loc5_.alternativa3d::next;
            }
            if(_loc5_ != null)
            {
               if(_loc3_ != null)
               {
                  _loc3_.alternativa3d::next = _loc4_;
               }
               else
               {
                  this.alternativa3d::faceList = _loc4_;
               }
               _loc7_.alternativa3d::next = null;
            }
            else
            {
               _loc3_ = _loc7_;
            }
            _loc7_ = _loc4_;
         }
         return _loc6_;
      }
      
      public function containsVertex(param1:Vertex) : Boolean
      {
         if(param1 == null)
         {
            throw new TypeError("Parameter vertex must be non-null.");
         }
         var _loc2_:Vertex = this.alternativa3d::vertexList;
         while(_loc2_ != null)
         {
            if(_loc2_ == param1)
            {
               return true;
            }
            _loc2_ = _loc2_.alternativa3d::next;
         }
         return false;
      }
      
      public function containsVertexWithId(param1:Object) : Boolean
      {
         if(param1 == null)
         {
            throw new TypeError("Parameter id must be non-null.");
         }
         var _loc2_:Vertex = this.alternativa3d::vertexList;
         while(_loc2_ != null)
         {
            if(_loc2_.id == param1)
            {
               return true;
            }
            _loc2_ = _loc2_.alternativa3d::next;
         }
         return false;
      }
      
      public function getVertexById(param1:Object) : Vertex
      {
         if(param1 == null)
         {
            throw new TypeError("Parameter id must be non-null.");
         }
         var _loc2_:Vertex = this.alternativa3d::vertexList;
         while(_loc2_ != null)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
            _loc2_ = _loc2_.alternativa3d::next;
         }
         return null;
      }
      
      public function addFace(param1:Vector.<Vertex>, param2:Material = null, param3:Object = null) : Face
      {
         var _loc4_:Wrapper = null;
         var _loc5_:Vertex = null;
         var _loc6_:Face = null;
         this.alternativa3d::deleteResources();
         if(param1 == null)
         {
            throw new TypeError("Parameter vertices must be non-null.");
         }
         var _loc7_:int = int(param1.length);
         if(_loc7_ < 3)
         {
            throw new ArgumentError(_loc7_ + " vertices not enough.");
         }
         var _loc8_:Face;
         (_loc8_ = new Face()).material = param2;
         _loc8_.id = param3;
         var _loc9_:Wrapper = null;
         var _loc10_:int = 0;
         while(_loc10_ < _loc7_)
         {
            _loc4_ = new Wrapper();
            _loc5_ = param1[_loc10_];
            if(_loc5_ == null)
            {
               throw new ArgumentError("Null vertex in vector.");
            }
            if(!this.containsVertex(_loc5_))
            {
               throw new ArgumentError("Vertex not found.");
            }
            _loc4_.alternativa3d::vertex = _loc5_;
            if(_loc9_ != null)
            {
               _loc9_.alternativa3d::next = _loc4_;
            }
            else
            {
               _loc8_.alternativa3d::wrapper = _loc4_;
            }
            _loc9_ = _loc4_;
            _loc10_++;
         }
         if(this.alternativa3d::faceList != null)
         {
            _loc6_ = this.alternativa3d::faceList;
            while(_loc6_.alternativa3d::next != null)
            {
               _loc6_ = _loc6_.alternativa3d::next;
            }
            _loc6_.alternativa3d::next = _loc8_;
         }
         else
         {
            this.alternativa3d::faceList = _loc8_;
         }
         return _loc8_;
      }
      
      public function addFaceByIds(param1:Array, param2:Material = null, param3:Object = null) : Face
      {
         var _loc4_:Wrapper = null;
         var _loc5_:Vertex = null;
         var _loc6_:Face = null;
         this.alternativa3d::deleteResources();
         if(param1 == null)
         {
            throw new TypeError("Parameter vertices must be non-null.");
         }
         var _loc7_:int = int(param1.length);
         if(_loc7_ < 3)
         {
            throw new ArgumentError(_loc7_ + " vertices not enough.");
         }
         var _loc8_:Face;
         (_loc8_ = new Face()).material = param2;
         _loc8_.id = param3;
         var _loc9_:Wrapper = null;
         var _loc10_:int = 0;
         while(_loc10_ < _loc7_)
         {
            _loc4_ = new Wrapper();
            _loc5_ = this.getVertexById(param1[_loc10_]);
            if(_loc5_ == null)
            {
               throw new ArgumentError("Vertex not found.");
            }
            _loc4_.alternativa3d::vertex = _loc5_;
            if(_loc9_ != null)
            {
               _loc9_.alternativa3d::next = _loc4_;
            }
            else
            {
               _loc8_.alternativa3d::wrapper = _loc4_;
            }
            _loc9_ = _loc4_;
            _loc10_++;
         }
         if(this.alternativa3d::faceList != null)
         {
            _loc6_ = this.alternativa3d::faceList;
            while(_loc6_.alternativa3d::next != null)
            {
               _loc6_ = _loc6_.alternativa3d::next;
            }
            _loc6_.alternativa3d::next = _loc8_;
         }
         else
         {
            this.alternativa3d::faceList = _loc8_;
         }
         return _loc8_;
      }
      
      public function addTriFace(param1:Vertex, param2:Vertex, param3:Vertex, param4:Material = null, param5:Object = null) : Face
      {
         var _loc6_:Face = null;
         this.alternativa3d::deleteResources();
         if(param1 == null)
         {
            throw new TypeError("Parameter v1 must be non-null.");
         }
         if(param2 == null)
         {
            throw new TypeError("Parameter v2 must be non-null.");
         }
         if(param3 == null)
         {
            throw new TypeError("Parameter v3 must be non-null.");
         }
         if(!this.containsVertex(param1))
         {
            throw new ArgumentError("Vertex not found.");
         }
         if(!this.containsVertex(param2))
         {
            throw new ArgumentError("Vertex not found.");
         }
         if(!this.containsVertex(param3))
         {
            throw new ArgumentError("Vertex not found.");
         }
         var _loc7_:Face;
         (_loc7_ = new Face()).material = param4;
         _loc7_.id = param5;
         _loc7_.alternativa3d::wrapper = new Wrapper();
         _loc7_.alternativa3d::wrapper.alternativa3d::vertex = param1;
         _loc7_.alternativa3d::wrapper.alternativa3d::next = new Wrapper();
         _loc7_.alternativa3d::wrapper.alternativa3d::next.alternativa3d::vertex = param2;
         _loc7_.alternativa3d::wrapper.alternativa3d::next.alternativa3d::next = new Wrapper();
         _loc7_.alternativa3d::wrapper.alternativa3d::next.alternativa3d::next.alternativa3d::vertex = param3;
         if(this.alternativa3d::faceList != null)
         {
            _loc6_ = this.alternativa3d::faceList;
            while(_loc6_.alternativa3d::next != null)
            {
               _loc6_ = _loc6_.alternativa3d::next;
            }
            _loc6_.alternativa3d::next = _loc7_;
         }
         else
         {
            this.alternativa3d::faceList = _loc7_;
         }
         return _loc7_;
      }
      
      public function addQuadFace(param1:Vertex, param2:Vertex, param3:Vertex, param4:Vertex, param5:Material = null, param6:Object = null) : Face
      {
         var _loc7_:Face = null;
         this.alternativa3d::deleteResources();
         if(param1 == null)
         {
            throw new TypeError("Parameter v1 must be non-null.");
         }
         if(param2 == null)
         {
            throw new TypeError("Parameter v2 must be non-null.");
         }
         if(param3 == null)
         {
            throw new TypeError("Parameter v3 must be non-null.");
         }
         if(param4 == null)
         {
            throw new TypeError("Parameter v4 must be non-null.");
         }
         if(!this.containsVertex(param1))
         {
            throw new ArgumentError("Vertex not found.");
         }
         if(!this.containsVertex(param2))
         {
            throw new ArgumentError("Vertex not found.");
         }
         if(!this.containsVertex(param3))
         {
            throw new ArgumentError("Vertex not found.");
         }
         if(!this.containsVertex(param4))
         {
            throw new ArgumentError("Vertex not found.");
         }
         var _loc8_:Face;
         (_loc8_ = new Face()).material = param5;
         _loc8_.id = param6;
         _loc8_.alternativa3d::wrapper = new Wrapper();
         _loc8_.alternativa3d::wrapper.alternativa3d::vertex = param1;
         _loc8_.alternativa3d::wrapper.alternativa3d::next = new Wrapper();
         _loc8_.alternativa3d::wrapper.alternativa3d::next.alternativa3d::vertex = param2;
         _loc8_.alternativa3d::wrapper.alternativa3d::next.alternativa3d::next = new Wrapper();
         _loc8_.alternativa3d::wrapper.alternativa3d::next.alternativa3d::next.alternativa3d::vertex = param3;
         _loc8_.alternativa3d::wrapper.alternativa3d::next.alternativa3d::next.alternativa3d::next = new Wrapper();
         _loc8_.alternativa3d::wrapper.alternativa3d::next.alternativa3d::next.alternativa3d::next.alternativa3d::vertex = param4;
         if(this.alternativa3d::faceList != null)
         {
            _loc7_ = this.alternativa3d::faceList;
            while(_loc7_.alternativa3d::next != null)
            {
               _loc7_ = _loc7_.alternativa3d::next;
            }
            _loc7_.alternativa3d::next = _loc8_;
         }
         else
         {
            this.alternativa3d::faceList = _loc8_;
         }
         return _loc8_;
      }
      
      public function removeFace(param1:Face) : Face
      {
         var _loc2_:Face = null;
         this.alternativa3d::deleteResources();
         if(param1 == null)
         {
            throw new TypeError("Parameter face must be non-null.");
         }
         var _loc3_:Face = this.alternativa3d::faceList;
         while(_loc3_ != null)
         {
            if(_loc3_ == param1)
            {
               if(_loc2_ != null)
               {
                  _loc2_.alternativa3d::next = _loc3_.alternativa3d::next;
               }
               else
               {
                  this.alternativa3d::faceList = _loc3_.alternativa3d::next;
               }
               _loc3_.alternativa3d::next = null;
               break;
            }
            _loc2_ = _loc3_;
            _loc3_ = _loc3_.alternativa3d::next;
         }
         if(_loc3_ == null)
         {
            throw new ArgumentError("Face not found.");
         }
         return _loc3_;
      }
      
      public function removeFaceById(param1:Object) : Face
      {
         var _loc2_:Face = null;
         this.alternativa3d::deleteResources();
         if(param1 == null)
         {
            throw new TypeError("Parameter id must be non-null.");
         }
         var _loc3_:Face = this.alternativa3d::faceList;
         while(_loc3_ != null)
         {
            if(_loc3_.id == param1)
            {
               if(_loc2_ != null)
               {
                  _loc2_.alternativa3d::next = _loc3_.alternativa3d::next;
               }
               else
               {
                  this.alternativa3d::faceList = _loc3_.alternativa3d::next;
               }
               _loc3_.alternativa3d::next = null;
               break;
            }
            _loc2_ = _loc3_;
            _loc3_ = _loc3_.alternativa3d::next;
         }
         if(_loc3_ == null)
         {
            throw new ArgumentError("Face not found.");
         }
         return _loc3_;
      }
      
      public function containsFace(param1:Face) : Boolean
      {
         if(param1 == null)
         {
            throw new TypeError("Parameter face must be non-null.");
         }
         var _loc2_:Face = this.alternativa3d::faceList;
         while(_loc2_ != null)
         {
            if(_loc2_ == param1)
            {
               return true;
            }
            _loc2_ = _loc2_.alternativa3d::next;
         }
         return false;
      }
      
      public function containsFaceWithId(param1:Object) : Boolean
      {
         if(param1 == null)
         {
            throw new TypeError("Parameter id must be non-null.");
         }
         var _loc2_:Face = this.alternativa3d::faceList;
         while(_loc2_ != null)
         {
            if(_loc2_.id == param1)
            {
               return true;
            }
            _loc2_ = _loc2_.alternativa3d::next;
         }
         return false;
      }
      
      public function getFaceById(param1:Object) : Face
      {
         if(param1 == null)
         {
            throw new TypeError("Parameter id must be non-null.");
         }
         var _loc2_:Face = this.alternativa3d::faceList;
         while(_loc2_ != null)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
            _loc2_ = _loc2_.alternativa3d::next;
         }
         return null;
      }
      
      public function addVerticesAndFaces(param1:Vector.<Number>, param2:Vector.<Number>, param3:Vector.<int>, param4:Boolean = false, param5:Material = null) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Vertex = null;
         var _loc10_:Face = null;
         var _loc11_:Face = null;
         var _loc12_:Wrapper = null;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:Vertex = null;
         var _loc16_:Wrapper = null;
         this.alternativa3d::deleteResources();
         if(param1 == null)
         {
            throw new TypeError("Parameter vertices must be non-null.");
         }
         if(param2 == null)
         {
            throw new TypeError("Parameter uvs must be non-null.");
         }
         if(param3 == null)
         {
            throw new TypeError("Parameter indices must be non-null.");
         }
         var _loc17_:int = param1.length / 3;
         if(_loc17_ != param2.length / 2)
         {
            throw new ArgumentError("Vertices count and uvs count doesn\'t match.");
         }
         var _loc18_:int = int(param3.length);
         if(!param4 && Boolean(_loc18_ % 3))
         {
            throw new ArgumentError("Incorrect indices.");
         }
         _loc6_ = 0;
         _loc8_ = 0;
         while(_loc6_ < _loc18_)
         {
            if(_loc6_ == _loc8_)
            {
               _loc14_ = param4 ? int(param3[_loc6_]) : int(3);
               if(_loc14_ < 3)
               {
                  throw new ArgumentError(_loc14_ + " vertices not enough.");
               }
               _loc8_ = param4 ? int(_loc14_ + ++_loc6_) : int(_loc6_ + _loc14_);
               if(_loc8_ > _loc18_)
               {
                  throw new ArgumentError("Incorrect indices.");
               }
            }
            _loc13_ = param3[_loc6_];
            if(_loc13_ < 0 || _loc13_ >= _loc17_)
            {
               throw new RangeError("Index is out of bounds.");
            }
            _loc6_++;
         }
         if(this.alternativa3d::vertexList != null)
         {
            _loc9_ = this.alternativa3d::vertexList;
            while(_loc9_.alternativa3d::next != null)
            {
               _loc9_ = _loc9_.alternativa3d::next;
            }
         }
         var _loc19_:Vector.<Vertex> = new Vector.<Vertex>(_loc17_);
         _loc6_ = 0;
         _loc7_ = 0;
         _loc8_ = 0;
         while(_loc6_ < _loc17_)
         {
            (_loc15_ = new Vertex()).x = param1[_loc7_];
            _loc7_++;
            _loc15_.y = param1[_loc7_];
            _loc7_++;
            _loc15_.z = param1[_loc7_];
            _loc7_++;
            _loc15_.u = param2[_loc8_];
            _loc8_++;
            _loc15_.v = param2[_loc8_];
            _loc8_++;
            _loc19_[_loc6_] = _loc15_;
            if(_loc9_ != null)
            {
               _loc9_.alternativa3d::next = _loc15_;
            }
            else
            {
               this.alternativa3d::vertexList = _loc15_;
            }
            _loc9_ = _loc15_;
            _loc6_++;
         }
         if(this.alternativa3d::faceList != null)
         {
            _loc10_ = this.alternativa3d::faceList;
            while(_loc10_.alternativa3d::next != null)
            {
               _loc10_ = _loc10_.alternativa3d::next;
            }
         }
         _loc6_ = 0;
         _loc8_ = 0;
         while(_loc6_ < _loc18_)
         {
            if(_loc6_ == _loc8_)
            {
               _loc8_ = param4 ? int(param3[_loc6_] + ++_loc6_) : int(_loc6_ + 3);
               _loc12_ = null;
               (_loc11_ = new Face()).material = param5;
               if(_loc10_ != null)
               {
                  _loc10_.alternativa3d::next = _loc11_;
               }
               else
               {
                  this.alternativa3d::faceList = _loc11_;
               }
               _loc10_ = _loc11_;
            }
            (_loc16_ = new Wrapper()).alternativa3d::vertex = _loc19_[param3[_loc6_]];
            if(_loc12_ != null)
            {
               _loc12_.alternativa3d::next = _loc16_;
            }
            else
            {
               _loc11_.alternativa3d::wrapper = _loc16_;
            }
            _loc12_ = _loc16_;
            _loc6_++;
         }
      }
      
      public function get vertices() : Vector.<Vertex>
      {
         var _loc1_:Vector.<Vertex> = new Vector.<Vertex>();
         var _loc2_:int = 0;
         var _loc3_:Vertex = this.alternativa3d::vertexList;
         while(_loc3_ != null)
         {
            _loc1_[_loc2_] = _loc3_;
            _loc2_++;
            _loc3_ = _loc3_.alternativa3d::next;
         }
         return _loc1_;
      }
      
      public function get faces() : Vector.<Face>
      {
         var _loc1_:Vector.<Face> = new Vector.<Face>();
         var _loc2_:int = 0;
         var _loc3_:Face = this.alternativa3d::faceList;
         while(_loc3_ != null)
         {
            _loc1_[_loc2_] = _loc3_;
            _loc2_++;
            _loc3_ = _loc3_.alternativa3d::next;
         }
         return _loc1_;
      }
      
      public function weldVertices(param1:Number = 0, param2:Number = 0) : void
      {
         var _loc3_:Vertex = null;
         var _loc4_:Vertex = null;
         var _loc5_:Wrapper = null;
         this.alternativa3d::deleteResources();
         var _loc6_:Vector.<Vertex> = new Vector.<Vertex>();
         var _loc7_:int = 0;
         _loc3_ = this.alternativa3d::vertexList;
         while(_loc3_ != null)
         {
            _loc4_ = _loc3_.alternativa3d::next;
            _loc3_.alternativa3d::next = null;
            _loc6_[_loc7_] = _loc3_;
            _loc7_++;
            _loc3_ = _loc4_;
         }
         this.alternativa3d::vertexList = null;
         this.group(_loc6_,0,_loc7_,0,param1,param2,new Vector.<int>());
         var _loc8_:Face = this.alternativa3d::faceList;
         while(_loc8_ != null)
         {
            _loc5_ = _loc8_.alternativa3d::wrapper;
            while(_loc5_ != null)
            {
               if(_loc5_.alternativa3d::vertex.alternativa3d::value != null)
               {
                  _loc5_.alternativa3d::vertex = _loc5_.alternativa3d::vertex.alternativa3d::value;
               }
               _loc5_ = _loc5_.alternativa3d::next;
            }
            _loc8_ = _loc8_.alternativa3d::next;
         }
         var _loc9_:int = 0;
         while(_loc9_ < _loc7_)
         {
            _loc3_ = _loc6_[_loc9_];
            if(_loc3_.alternativa3d::value == null)
            {
               _loc3_.alternativa3d::next = this.alternativa3d::vertexList;
               this.alternativa3d::vertexList = _loc3_;
            }
            _loc9_++;
         }
      }
      
      public function weldFaces(param1:Number = 0, param2:Number = 0, param3:Number = 0, param4:Boolean = false) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:* = undefined;
         var _loc8_:Face = null;
         var _loc9_:Face = null;
         var _loc10_:Wrapper = null;
         var _loc11_:Wrapper = null;
         var _loc12_:Wrapper = null;
         var _loc13_:Wrapper = null;
         var _loc14_:Wrapper = null;
         var _loc15_:Wrapper = null;
         var _loc16_:Wrapper = null;
         var _loc17_:Wrapper = null;
         var _loc18_:Vertex = null;
         var _loc19_:Vertex = null;
         var _loc20_:Vertex = null;
         var _loc21_:Vertex = null;
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
         var _loc37_:Dictionary = null;
         var _loc41_:Vector.<Face> = null;
         var _loc42_:Dictionary = null;
         var _loc43_:Dictionary = null;
         var _loc44_:int = 0;
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
         var _loc64_:Boolean = false;
         var _loc65_:Face = null;
         var _loc38_:Number = 0.001;
         param1 = Math.cos(param1) - _loc38_;
         param2 += _loc38_;
         param3 = Math.cos(Math.PI - param3) - _loc38_;
         var _loc39_:Dictionary = new Dictionary();
         var _loc40_:Dictionary = new Dictionary();
         for each(_loc9_ in this.faces)
         {
            _loc19_ = _loc9_.alternativa3d::wrapper.alternativa3d::vertex;
            _loc20_ = _loc9_.alternativa3d::wrapper.alternativa3d::next.alternativa3d::vertex;
            _loc21_ = _loc9_.alternativa3d::wrapper.alternativa3d::next.alternativa3d::next.alternativa3d::vertex;
            _loc22_ = _loc20_.x - _loc19_.x;
            _loc23_ = _loc20_.y - _loc19_.y;
            _loc24_ = _loc20_.z - _loc19_.z;
            _loc27_ = _loc21_.x - _loc19_.x;
            _loc28_ = _loc21_.y - _loc19_.y;
            _loc29_ = _loc21_.z - _loc19_.z;
            _loc32_ = _loc29_ * _loc23_ - _loc28_ * _loc24_;
            _loc33_ = _loc27_ * _loc24_ - _loc29_ * _loc22_;
            _loc34_ = _loc28_ * _loc22_ - _loc27_ * _loc23_;
            _loc35_ = _loc32_ * _loc32_ + _loc33_ * _loc33_ + _loc34_ * _loc34_;
            if(_loc35_ > _loc38_)
            {
               _loc35_ = 1 / Math.sqrt(_loc35_);
               _loc32_ *= _loc35_;
               _loc33_ *= _loc35_;
               _loc34_ *= _loc35_;
               _loc9_.alternativa3d::normalX = _loc32_;
               _loc9_.alternativa3d::normalY = _loc33_;
               _loc9_.alternativa3d::normalZ = _loc34_;
               _loc9_.alternativa3d::offset = _loc19_.x * _loc32_ + _loc19_.y * _loc33_ + _loc19_.z * _loc34_;
               _loc39_[_loc9_] = true;
               _loc14_ = _loc9_.alternativa3d::wrapper;
               while(_loc14_ != null)
               {
                  _loc18_ = _loc14_.alternativa3d::vertex;
                  _loc37_ = _loc40_[_loc18_];
                  if(_loc37_ == null)
                  {
                     _loc37_ = new Dictionary();
                     _loc40_[_loc18_] = _loc37_;
                  }
                  _loc37_[_loc9_] = true;
                  _loc14_ = _loc14_.alternativa3d::next;
               }
            }
         }
         _loc39_ = new Dictionary();
         _loc36_ = 0;
         _loc41_ = new Vector.<Face>();
         _loc42_ = new Dictionary();
         _loc43_ = new Dictionary();
         while(true)
         {
            _loc9_ = null;
            var _loc66_:int = 0;
            var _loc67_:* = _loc39_;
            for(_loc7_ in _loc67_)
            {
               _loc9_ = _loc7_;
               delete _loc39_[_loc7_];
            }
            if(_loc9_ == null)
            {
               break;
            }
            _loc44_ = 0;
            _loc41_[_loc44_] = _loc9_;
            _loc44_++;
            _loc19_ = _loc9_.alternativa3d::wrapper.alternativa3d::vertex;
            _loc20_ = _loc9_.alternativa3d::wrapper.alternativa3d::next.alternativa3d::vertex;
            _loc21_ = _loc9_.alternativa3d::wrapper.alternativa3d::next.alternativa3d::next.alternativa3d::vertex;
            _loc22_ = _loc20_.x - _loc19_.x;
            _loc23_ = _loc20_.y - _loc19_.y;
            _loc24_ = _loc20_.z - _loc19_.z;
            _loc25_ = _loc20_.u - _loc19_.u;
            _loc26_ = _loc20_.v - _loc19_.v;
            _loc27_ = _loc21_.x - _loc19_.x;
            _loc28_ = _loc21_.y - _loc19_.y;
            _loc29_ = _loc21_.z - _loc19_.z;
            _loc30_ = _loc21_.u - _loc19_.u;
            _loc31_ = _loc21_.v - _loc19_.v;
            _loc32_ = _loc9_.alternativa3d::normalX;
            _loc33_ = _loc9_.alternativa3d::normalY;
            _loc34_ = _loc9_.alternativa3d::normalZ;
            _loc45_ = -_loc32_ * _loc28_ * _loc24_ + _loc27_ * _loc33_ * _loc24_ + _loc32_ * _loc23_ * _loc29_ - _loc22_ * _loc33_ * _loc29_ - _loc27_ * _loc23_ * _loc34_ + _loc22_ * _loc28_ * _loc34_;
            _loc46_ = (-_loc33_ * _loc29_ + _loc28_ * _loc34_) / _loc45_;
            _loc47_ = (_loc32_ * _loc29_ - _loc27_ * _loc34_) / _loc45_;
            _loc48_ = (-_loc32_ * _loc28_ + _loc27_ * _loc33_) / _loc45_;
            _loc49_ = (_loc19_.x * _loc33_ * _loc29_ - _loc32_ * _loc19_.y * _loc29_ - _loc19_.x * _loc28_ * _loc34_ + _loc27_ * _loc19_.y * _loc34_ + _loc32_ * _loc28_ * _loc19_.z - _loc27_ * _loc33_ * _loc19_.z) / _loc45_;
            _loc50_ = (_loc33_ * _loc24_ - _loc23_ * _loc34_) / _loc45_;
            _loc51_ = (-_loc32_ * _loc24_ + _loc22_ * _loc34_) / _loc45_;
            _loc52_ = (_loc32_ * _loc23_ - _loc22_ * _loc33_) / _loc45_;
            _loc53_ = (_loc32_ * _loc19_.y * _loc24_ - _loc19_.x * _loc33_ * _loc24_ + _loc19_.x * _loc23_ * _loc34_ - _loc22_ * _loc19_.y * _loc34_ - _loc32_ * _loc23_ * _loc19_.z + _loc22_ * _loc33_ * _loc19_.z) / _loc45_;
            _loc54_ = _loc25_ * _loc46_ + _loc30_ * _loc50_;
            _loc55_ = _loc25_ * _loc47_ + _loc30_ * _loc51_;
            _loc56_ = _loc25_ * _loc48_ + _loc30_ * _loc52_;
            _loc57_ = _loc25_ * _loc49_ + _loc30_ * _loc53_ + _loc19_.u;
            _loc58_ = _loc26_ * _loc46_ + _loc31_ * _loc50_;
            _loc59_ = _loc26_ * _loc47_ + _loc31_ * _loc51_;
            _loc60_ = _loc26_ * _loc48_ + _loc31_ * _loc52_;
            _loc61_ = _loc26_ * _loc49_ + _loc31_ * _loc53_ + _loc19_.v;
            for(_loc7_ in _loc43_)
            {
               delete _loc43_[_loc7_];
            }
            _loc5_ = 0;
            while(_loc5_ < _loc44_)
            {
               _loc9_ = _loc41_[_loc5_];
               for(_loc7_ in _loc42_)
               {
                  delete _loc42_[_loc7_];
               }
               _loc12_ = _loc9_.alternativa3d::wrapper;
               while(_loc12_ != null)
               {
                  for(_loc7_ in _loc40_[_loc12_.alternativa3d::vertex])
                  {
                     if(Boolean(_loc39_[_loc7_]) && !_loc43_[_loc7_])
                     {
                        _loc42_[_loc7_] = true;
                     }
                  }
                  _loc12_ = _loc12_.alternativa3d::next;
               }
               for(_loc7_ in _loc42_)
               {
                  _loc8_ = _loc7_;
                  if(_loc32_ * _loc8_.alternativa3d::normalX + _loc33_ * _loc8_.alternativa3d::normalY + _loc34_ * _loc8_.alternativa3d::normalZ >= param1)
                  {
                     _loc13_ = _loc8_.alternativa3d::wrapper;
                     while(_loc13_ != null)
                     {
                        _loc18_ = _loc13_.alternativa3d::vertex;
                        _loc62_ = _loc54_ * _loc18_.x + _loc55_ * _loc18_.y + _loc56_ * _loc18_.z + _loc57_ - _loc18_.u;
                        _loc63_ = _loc58_ * _loc18_.x + _loc59_ * _loc18_.y + _loc60_ * _loc18_.z + _loc61_ - _loc18_.v;
                        if(_loc62_ > param2 || _loc62_ < -param2 || _loc63_ > param2 || _loc63_ < -param2)
                        {
                           break;
                        }
                        _loc13_ = _loc13_.alternativa3d::next;
                     }
                     if(_loc13_ == null)
                     {
                        _loc12_ = _loc9_.alternativa3d::wrapper;
                        while(_loc12_ != null)
                        {
                           _loc14_ = _loc12_.alternativa3d::next != null ? _loc12_.alternativa3d::next : _loc9_.alternativa3d::wrapper;
                           _loc13_ = _loc8_.alternativa3d::wrapper;
                           while(_loc13_ != null)
                           {
                              _loc15_ = _loc13_.alternativa3d::next != null ? _loc13_.alternativa3d::next : _loc8_.alternativa3d::wrapper;
                              if(_loc12_.alternativa3d::vertex == _loc15_.alternativa3d::vertex && _loc14_.alternativa3d::vertex == _loc13_.alternativa3d::vertex)
                              {
                                 break;
                              }
                              _loc13_ = _loc13_.alternativa3d::next;
                           }
                           if(_loc13_ != null)
                           {
                              break;
                           }
                           _loc12_ = _loc12_.alternativa3d::next;
                        }
                        if(_loc12_ != null)
                        {
                           _loc41_[_loc44_] = _loc8_;
                           _loc44_++;
                           delete _loc39_[_loc8_];
                        }
                     }
                     else
                     {
                        _loc43_[_loc8_] = true;
                     }
                  }
                  else
                  {
                     _loc43_[_loc8_] = true;
                  }
               }
               _loc5_++;
            }
            if(_loc44_ == 1)
            {
               _loc39_[_loc36_] = _loc41_[0];
               _loc36_++;
            }
            else
            {
               do
               {
                  _loc64_ = false;
                  _loc5_ = 0;
                  while(_loc5_ < _loc44_ - 1)
                  {
                     _loc9_ = _loc41_[_loc5_];
                     if(_loc9_ != null)
                     {
                        _loc6_ = 1;
                        for(; _loc6_ < _loc44_; _loc6_++)
                        {
                           _loc8_ = _loc41_[_loc6_];
                           if(_loc8_ != null)
                           {
                              _loc12_ = _loc9_.alternativa3d::wrapper;
                              while(_loc12_ != null)
                              {
                                 _loc14_ = _loc12_.alternativa3d::next != null ? _loc12_.alternativa3d::next : _loc9_.alternativa3d::wrapper;
                                 _loc13_ = _loc8_.alternativa3d::wrapper;
                                 while(_loc13_ != null)
                                 {
                                    _loc15_ = _loc13_.alternativa3d::next != null ? _loc13_.alternativa3d::next : _loc8_.alternativa3d::wrapper;
                                    if(_loc12_.alternativa3d::vertex == _loc15_.alternativa3d::vertex && _loc14_.alternativa3d::vertex == _loc13_.alternativa3d::vertex)
                                    {
                                       break;
                                    }
                                    _loc13_ = _loc13_.alternativa3d::next;
                                 }
                                 if(_loc13_ != null)
                                 {
                                    break;
                                 }
                                 _loc12_ = _loc12_.alternativa3d::next;
                              }
                              if(_loc12_ != null)
                              {
                                 while(true)
                                 {
                                    _loc16_ = _loc14_.alternativa3d::next != null ? _loc14_.alternativa3d::next : _loc9_.alternativa3d::wrapper;
                                    _loc11_ = _loc8_.alternativa3d::wrapper;
                                    while(_loc11_.alternativa3d::next != _loc13_ && _loc11_.alternativa3d::next != null)
                                    {
                                       _loc11_ = _loc11_.alternativa3d::next;
                                    }
                                    if(_loc16_.alternativa3d::vertex != _loc11_.alternativa3d::vertex)
                                    {
                                       break;
                                    }
                                    _loc14_ = _loc16_;
                                    _loc13_ = _loc11_;
                                 }
                                 while(true)
                                 {
                                    _loc10_ = _loc9_.alternativa3d::wrapper;
                                    while(_loc10_.alternativa3d::next != _loc12_ && _loc10_.alternativa3d::next != null)
                                    {
                                       _loc10_ = _loc10_.alternativa3d::next;
                                    }
                                    _loc17_ = _loc15_.alternativa3d::next != null ? _loc15_.alternativa3d::next : _loc8_.alternativa3d::wrapper;
                                    if(_loc10_.alternativa3d::vertex != _loc17_.alternativa3d::vertex)
                                    {
                                       break;
                                    }
                                    _loc12_ = _loc10_;
                                    _loc15_ = _loc17_;
                                 }
                                 _loc19_ = _loc12_.alternativa3d::vertex;
                                 _loc20_ = _loc17_.alternativa3d::vertex;
                                 _loc21_ = _loc10_.alternativa3d::vertex;
                                 _loc22_ = _loc20_.x - _loc19_.x;
                                 _loc23_ = _loc20_.y - _loc19_.y;
                                 _loc24_ = _loc20_.z - _loc19_.z;
                                 _loc27_ = _loc21_.x - _loc19_.x;
                                 _loc28_ = _loc21_.y - _loc19_.y;
                                 _loc29_ = _loc21_.z - _loc19_.z;
                                 _loc32_ = _loc29_ * _loc23_ - _loc28_ * _loc24_;
                                 _loc33_ = _loc27_ * _loc24_ - _loc29_ * _loc22_;
                                 _loc34_ = _loc28_ * _loc22_ - _loc27_ * _loc23_;
                                 if(_loc32_ < _loc38_ && _loc32_ > -_loc38_ && _loc33_ < _loc38_ && _loc33_ > -_loc38_ && _loc34_ < _loc38_ && _loc34_ > -_loc38_)
                                 {
                                    if(_loc22_ * _loc27_ + _loc23_ * _loc28_ + _loc24_ * _loc29_ > 0)
                                    {
                                       continue;
                                    }
                                 }
                                 else if(_loc9_.alternativa3d::normalX * _loc32_ + _loc9_.alternativa3d::normalY * _loc33_ + _loc9_.alternativa3d::normalZ * _loc34_ < 0)
                                 {
                                    continue;
                                 }
                                 _loc35_ = 1 / Math.sqrt(_loc22_ * _loc22_ + _loc23_ * _loc23_ + _loc24_ * _loc24_);
                                 _loc22_ *= _loc35_;
                                 _loc23_ *= _loc35_;
                                 _loc24_ *= _loc35_;
                                 _loc35_ = 1 / Math.sqrt(_loc27_ * _loc27_ + _loc28_ * _loc28_ + _loc29_ * _loc29_);
                                 _loc27_ *= _loc35_;
                                 _loc28_ *= _loc35_;
                                 _loc29_ *= _loc35_;
                                 if(_loc22_ * _loc27_ + _loc23_ * _loc28_ + _loc24_ * _loc29_ >= param3)
                                 {
                                    _loc19_ = _loc13_.alternativa3d::vertex;
                                    _loc20_ = _loc16_.alternativa3d::vertex;
                                    _loc21_ = _loc11_.alternativa3d::vertex;
                                    _loc22_ = _loc20_.x - _loc19_.x;
                                    _loc23_ = _loc20_.y - _loc19_.y;
                                    _loc24_ = _loc20_.z - _loc19_.z;
                                    _loc27_ = _loc21_.x - _loc19_.x;
                                    _loc28_ = _loc21_.y - _loc19_.y;
                                    _loc29_ = _loc21_.z - _loc19_.z;
                                    _loc32_ = _loc29_ * _loc23_ - _loc28_ * _loc24_;
                                    _loc33_ = _loc27_ * _loc24_ - _loc29_ * _loc22_;
                                    _loc34_ = _loc28_ * _loc22_ - _loc27_ * _loc23_;
                                    if(_loc32_ < _loc38_ && _loc32_ > -_loc38_ && _loc33_ < _loc38_ && _loc33_ > -_loc38_ && _loc34_ < _loc38_ && _loc34_ > -_loc38_)
                                    {
                                       if(_loc22_ * _loc27_ + _loc23_ * _loc28_ + _loc24_ * _loc29_ > 0)
                                       {
                                          continue;
                                       }
                                    }
                                    else if(_loc9_.alternativa3d::normalX * _loc32_ + _loc9_.alternativa3d::normalY * _loc33_ + _loc9_.alternativa3d::normalZ * _loc34_ < 0)
                                    {
                                       continue;
                                    }
                                    _loc35_ = 1 / Math.sqrt(_loc22_ * _loc22_ + _loc23_ * _loc23_ + _loc24_ * _loc24_);
                                    _loc22_ *= _loc35_;
                                    _loc23_ *= _loc35_;
                                    _loc24_ *= _loc35_;
                                    _loc35_ = 1 / Math.sqrt(_loc27_ * _loc27_ + _loc28_ * _loc28_ + _loc29_ * _loc29_);
                                    _loc27_ *= _loc35_;
                                    _loc28_ *= _loc35_;
                                    _loc29_ *= _loc35_;
                                    if(_loc22_ * _loc27_ + _loc23_ * _loc28_ + _loc24_ * _loc29_ >= param3)
                                    {
                                       _loc64_ = true;
                                       (_loc65_ = new Face()).material = _loc9_.material;
                                       _loc65_.alternativa3d::normalX = _loc9_.alternativa3d::normalX;
                                       _loc65_.alternativa3d::normalY = _loc9_.alternativa3d::normalY;
                                       _loc65_.alternativa3d::normalZ = _loc9_.alternativa3d::normalZ;
                                       _loc65_.alternativa3d::offset = _loc9_.alternativa3d::offset;
                                       _loc16_ = null;
                                       while(_loc14_ != _loc12_)
                                       {
                                          (_loc17_ = new Wrapper()).alternativa3d::vertex = _loc14_.alternativa3d::vertex;
                                          if(_loc16_ != null)
                                          {
                                             _loc16_.alternativa3d::next = _loc17_;
                                          }
                                          else
                                          {
                                             _loc65_.alternativa3d::wrapper = _loc17_;
                                          }
                                          _loc16_ = _loc17_;
                                          _loc14_ = _loc14_.alternativa3d::next != null ? _loc14_.alternativa3d::next : _loc9_.alternativa3d::wrapper;
                                       }
                                       while(_loc15_ != _loc13_)
                                       {
                                          (_loc17_ = new Wrapper()).alternativa3d::vertex = _loc15_.alternativa3d::vertex;
                                          if(_loc16_ != null)
                                          {
                                             _loc16_.alternativa3d::next = _loc17_;
                                          }
                                          else
                                          {
                                             _loc65_.alternativa3d::wrapper = _loc17_;
                                          }
                                          _loc16_ = _loc17_;
                                          _loc15_ = _loc15_.alternativa3d::next != null ? _loc15_.alternativa3d::next : _loc8_.alternativa3d::wrapper;
                                       }
                                       _loc41_[_loc5_] = _loc65_;
                                       _loc41_[_loc6_] = null;
                                       _loc9_ = _loc65_;
                                       if(param4)
                                       {
                                          break;
                                       }
                                    }
                                 }
                              }
                           }
                        }
                     }
                     _loc5_++;
                  }
               }
               while(_loc64_);
               
               _loc5_ = 0;
               while(_loc5_ < _loc44_)
               {
                  _loc9_ = _loc41_[_loc5_];
                  if(_loc9_ != null)
                  {
                     _loc9_.alternativa3d::calculateBestSequenceAndNormal();
                     _loc39_[_loc36_] = _loc9_;
                     _loc36_++;
                  }
                  _loc5_++;
               }
            }
         }
      }
      
      private function group(param1:Vector.<Vertex>, param2:int, param3:int, param4:int, param5:Number, param6:Number, param7:Vector.<int>) : void
      {
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Vertex = null;
         var _loc11_:Number = NaN;
         var _loc12_:Vertex = null;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:Number = NaN;
         var _loc16_:Vertex = null;
         var _loc17_:Vertex = null;
         switch(param4)
         {
            case 0:
               _loc8_ = param2;
               while(_loc8_ < param3)
               {
                  _loc10_ = param1[_loc8_];
                  _loc10_.alternativa3d::offset = _loc10_.x;
                  _loc8_++;
               }
               _loc11_ = param5;
               break;
            case 1:
               _loc8_ = param2;
               while(_loc8_ < param3)
               {
                  _loc10_ = param1[_loc8_];
                  _loc10_.alternativa3d::offset = _loc10_.y;
                  _loc8_++;
               }
               _loc11_ = param5;
               break;
            case 2:
               _loc8_ = param2;
               while(_loc8_ < param3)
               {
                  _loc10_ = param1[_loc8_];
                  _loc10_.alternativa3d::offset = _loc10_.z;
                  _loc8_++;
               }
               _loc11_ = param5;
               break;
            case 3:
               _loc8_ = param2;
               while(_loc8_ < param3)
               {
                  _loc10_ = param1[_loc8_];
                  _loc10_.alternativa3d::offset = _loc10_.u;
                  _loc8_++;
               }
               _loc11_ = param6;
               break;
            case 4:
               _loc8_ = param2;
               while(_loc8_ < param3)
               {
                  _loc10_ = param1[_loc8_];
                  _loc10_.alternativa3d::offset = _loc10_.v;
                  _loc8_++;
               }
               _loc11_ = param6;
         }
         param7[0] = param2;
         param7[1] = param3 - 1;
         var _loc18_:int = 2;
         while(_loc18_ > 0)
         {
            _loc18_--;
            _loc9_ = _loc13_ = param7[_loc18_];
            _loc18_--;
            _loc8_ = _loc14_ = param7[_loc18_];
            _loc10_ = param1[_loc13_ + _loc14_ >> 1];
            _loc15_ = _loc10_.alternativa3d::offset;
            while(_loc8_ <= _loc9_)
            {
               _loc16_ = param1[_loc8_];
               while(_loc16_.alternativa3d::offset > _loc15_)
               {
                  _loc8_++;
                  _loc16_ = param1[_loc8_];
               }
               _loc17_ = param1[_loc9_];
               while(_loc17_.alternativa3d::offset < _loc15_)
               {
                  _loc9_--;
                  _loc17_ = param1[_loc9_];
               }
               if(_loc8_ <= _loc9_)
               {
                  param1[_loc8_] = _loc17_;
                  param1[_loc9_] = _loc16_;
                  _loc8_++;
                  _loc9_--;
               }
            }
            if(_loc14_ < _loc9_)
            {
               param7[_loc18_] = _loc14_;
               _loc18_++;
               param7[_loc18_] = _loc9_;
               _loc18_++;
            }
            if(_loc8_ < _loc13_)
            {
               param7[_loc18_] = _loc8_;
               _loc18_++;
               param7[_loc18_] = _loc13_;
               _loc18_++;
            }
         }
         _loc8_ = param2;
         _loc10_ = param1[_loc8_];
         _loc9_ = _loc8_ + 1;
         while(_loc9_ <= param3)
         {
            if(_loc9_ < param3)
            {
               _loc12_ = param1[_loc9_];
            }
            if(_loc9_ == param3 || _loc10_.alternativa3d::offset - _loc12_.alternativa3d::offset > _loc11_)
            {
               if(param4 < 4 && _loc9_ - _loc8_ > 1)
               {
                  this.group(param1,_loc8_,_loc9_,param4 + 1,param5,param6,param7);
               }
               if(_loc9_ < param3)
               {
                  _loc8_ = _loc9_;
                  _loc10_ = param1[_loc8_];
               }
            }
            else if(param4 == 4)
            {
               _loc12_.alternativa3d::value = _loc10_;
            }
            _loc9_++;
         }
      }
      
      public function setMaterialToAllFaces(param1:Material) : void
      {
         var _loc2_:Material = null;
         this.alternativa3d::deleteResources();
         this.material = param1;
         var _loc3_:Face = this.alternativa3d::faceList;
         while(_loc3_ != null)
         {
            if(!(param1 != null && _loc3_.material != null && _loc3_.material.name == "track"))
            {
               _loc3_.material = param1;
            }
            _loc3_ = _loc3_.alternativa3d::next;
         }
      }
      
      public function calculateFacesNormals(param1:Boolean = true) : void
      {
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
         this.alternativa3d::deleteResources();
         var _loc16_:Face = this.alternativa3d::faceList;
         while(_loc16_ != null)
         {
            _loc2_ = _loc16_.alternativa3d::wrapper;
            _loc3_ = _loc2_.alternativa3d::vertex;
            _loc2_ = _loc2_.alternativa3d::next;
            _loc4_ = _loc2_.alternativa3d::vertex;
            _loc2_ = _loc2_.alternativa3d::next;
            _loc5_ = _loc2_.alternativa3d::vertex;
            _loc6_ = _loc4_.x - _loc3_.x;
            _loc7_ = _loc4_.y - _loc3_.y;
            _loc8_ = _loc4_.z - _loc3_.z;
            _loc9_ = _loc5_.x - _loc3_.x;
            _loc10_ = _loc5_.y - _loc3_.y;
            _loc11_ = _loc5_.z - _loc3_.z;
            _loc12_ = _loc11_ * _loc7_ - _loc10_ * _loc8_;
            _loc13_ = _loc9_ * _loc8_ - _loc11_ * _loc6_;
            _loc14_ = _loc10_ * _loc6_ - _loc9_ * _loc7_;
            if(param1)
            {
               _loc15_ = _loc12_ * _loc12_ + _loc13_ * _loc13_ + _loc14_ * _loc14_;
               if(_loc15_ > 0.001)
               {
                  _loc15_ = 1 / Math.sqrt(_loc15_);
                  _loc12_ *= _loc15_;
                  _loc13_ *= _loc15_;
                  _loc14_ *= _loc15_;
               }
            }
            _loc16_.alternativa3d::normalX = _loc12_;
            _loc16_.alternativa3d::normalY = _loc13_;
            _loc16_.alternativa3d::normalZ = _loc14_;
            _loc16_.alternativa3d::offset = _loc3_.x * _loc12_ + _loc3_.y * _loc13_ + _loc3_.z * _loc14_;
            _loc16_ = _loc16_.alternativa3d::next;
         }
      }
      
      public function calculateVerticesNormals(param1:Boolean = false, param2:Number = 0) : void
      {
         var _loc3_:Vertex = null;
         var _loc4_:Number = NaN;
         var _loc5_:Wrapper = null;
         var _loc6_:Vertex = null;
         var _loc7_:Vertex = null;
         var _loc8_:Vertex = null;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Vector.<Vertex> = null;
         this.alternativa3d::deleteResources();
         _loc3_ = this.alternativa3d::vertexList;
         while(_loc3_ != null)
         {
            _loc3_.normalX = 0;
            _loc3_.normalY = 0;
            _loc3_.normalZ = 0;
            _loc3_ = _loc3_.alternativa3d::next;
         }
         var _loc19_:Face = this.alternativa3d::faceList;
         while(_loc19_ != null)
         {
            _loc5_ = _loc19_.alternativa3d::wrapper;
            _loc6_ = _loc5_.alternativa3d::vertex;
            _loc5_ = _loc5_.alternativa3d::next;
            _loc7_ = _loc5_.alternativa3d::vertex;
            _loc5_ = _loc5_.alternativa3d::next;
            _loc8_ = _loc5_.alternativa3d::vertex;
            _loc9_ = _loc7_.x - _loc6_.x;
            _loc10_ = _loc7_.y - _loc6_.y;
            _loc11_ = _loc7_.z - _loc6_.z;
            _loc12_ = _loc8_.x - _loc6_.x;
            _loc13_ = _loc8_.y - _loc6_.y;
            _loc14_ = _loc8_.z - _loc6_.z;
            _loc15_ = _loc14_ * _loc10_ - _loc13_ * _loc11_;
            _loc16_ = _loc12_ * _loc11_ - _loc14_ * _loc9_;
            _loc17_ = _loc13_ * _loc9_ - _loc12_ * _loc10_;
            _loc4_ = _loc15_ * _loc15_ + _loc16_ * _loc16_ + _loc17_ * _loc17_;
            if(_loc4_ > 0.001)
            {
               _loc4_ = 1 / Math.sqrt(_loc4_);
               _loc15_ *= _loc4_;
               _loc16_ *= _loc4_;
               _loc17_ *= _loc4_;
            }
            _loc5_ = _loc19_.alternativa3d::wrapper;
            while(_loc5_ != null)
            {
               _loc3_ = _loc5_.alternativa3d::vertex;
               _loc3_.normalX += _loc15_;
               _loc3_.normalY += _loc16_;
               _loc3_.normalZ += _loc17_;
               _loc5_ = _loc5_.alternativa3d::next;
            }
            _loc19_ = _loc19_.alternativa3d::next;
         }
         if(param1)
         {
            _loc18_ = this.vertices;
            this.alternativa3d::weldNormals(_loc18_,0,_loc18_.length,0,param2,new Vector.<int>());
         }
         _loc3_ = this.alternativa3d::vertexList;
         while(_loc3_ != null)
         {
            _loc4_ = _loc3_.normalX * _loc3_.normalX + _loc3_.normalY * _loc3_.normalY + _loc3_.normalZ * _loc3_.normalZ;
            if(_loc4_ > 0.001)
            {
               _loc4_ = 1 / Math.sqrt(_loc4_);
               _loc3_.normalX *= _loc4_;
               _loc3_.normalY *= _loc4_;
               _loc3_.normalZ *= _loc4_;
            }
            _loc3_ = _loc3_.alternativa3d::next;
         }
      }
      
      alternativa3d function weldNormals(param1:Vector.<Vertex>, param2:int, param3:int, param4:int, param5:Number, param6:Vector.<int>) : void
      {
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Vertex = null;
         var _loc11_:Vertex = null;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:Number = NaN;
         var _loc15_:Vertex = null;
         var _loc16_:Vertex = null;
         switch(param4)
         {
            case 0:
               _loc7_ = param2;
               while(_loc7_ < param3)
               {
                  _loc10_ = param1[_loc7_];
                  _loc10_.alternativa3d::offset = _loc10_.x;
                  _loc7_++;
               }
               break;
            case 1:
               _loc7_ = param2;
               while(_loc7_ < param3)
               {
                  _loc10_ = param1[_loc7_];
                  _loc10_.alternativa3d::offset = _loc10_.y;
                  _loc7_++;
               }
               break;
            case 2:
               _loc7_ = param2;
               while(true)
               {
                  if(_loc7_ < param3)
                  {
                     _loc10_ = param1[_loc7_];
                     _loc10_.alternativa3d::offset = _loc10_.z;
                     _loc7_++;
                     continue;
                  }
               }
         }
         param6[0] = param2;
         param6[1] = param3 - 1;
         var _loc17_:int = 2;
         while(_loc17_ > 0)
         {
            _loc17_--;
            _loc8_ = _loc12_ = param6[_loc17_];
            _loc17_--;
            _loc7_ = _loc13_ = param6[_loc17_];
            _loc10_ = param1[_loc12_ + _loc13_ >> 1];
            _loc14_ = _loc10_.alternativa3d::offset;
            while(_loc7_ <= _loc8_)
            {
               _loc15_ = param1[_loc7_];
               while(_loc15_.alternativa3d::offset > _loc14_)
               {
                  _loc7_++;
                  _loc15_ = param1[_loc7_];
               }
               _loc16_ = param1[_loc8_];
               while(_loc16_.alternativa3d::offset < _loc14_)
               {
                  _loc8_--;
                  _loc16_ = param1[_loc8_];
               }
               if(_loc7_ <= _loc8_)
               {
                  param1[_loc7_] = _loc16_;
                  param1[_loc8_] = _loc15_;
                  _loc7_++;
                  _loc8_--;
               }
            }
            if(_loc13_ < _loc8_)
            {
               param6[_loc17_] = _loc13_;
               _loc17_++;
               param6[_loc17_] = _loc8_;
               _loc17_++;
            }
            if(_loc7_ < _loc12_)
            {
               param6[_loc17_] = _loc7_;
               _loc17_++;
               param6[_loc17_] = _loc12_;
               _loc17_++;
            }
         }
         _loc7_ = param2;
         _loc10_ = param1[_loc7_];
         _loc8_ = _loc7_ + 1;
         while(_loc8_ <= param3)
         {
            if(_loc8_ < param3)
            {
               _loc11_ = param1[_loc8_];
            }
            if(_loc8_ == param3 || _loc10_.alternativa3d::offset - _loc11_.alternativa3d::offset > param5)
            {
               if(_loc8_ - _loc7_ > 1)
               {
                  if(param4 < 2)
                  {
                     this.alternativa3d::weldNormals(param1,_loc7_,_loc8_,param4 + 1,param5,param6);
                  }
                  else
                  {
                     _loc9_ = _loc7_ + 1;
                     while(_loc9_ < _loc8_)
                     {
                        _loc11_ = param1[_loc9_];
                        _loc10_.normalX += _loc11_.normalX;
                        _loc10_.normalY += _loc11_.normalY;
                        _loc10_.normalZ += _loc11_.normalZ;
                        _loc9_++;
                     }
                     _loc9_ = _loc7_ + 1;
                     while(_loc9_ < _loc8_)
                     {
                        (_loc11_ = param1[_loc9_]).normalX = _loc10_.normalX;
                        _loc11_.normalY = _loc10_.normalY;
                        _loc11_.normalZ = _loc10_.normalZ;
                        _loc9_++;
                     }
                  }
               }
               if(_loc8_ < param3)
               {
                  _loc7_ = _loc8_;
                  _loc10_ = param1[_loc7_];
               }
            }
            _loc8_++;
         }
      }
      
      public function calculateVerticesNormalsByAngle(param1:Number, param2:Number = 0) : void
      {
         var _loc3_:Face = null;
         var _loc4_:Wrapper = null;
         var _loc5_:Vertex = null;
         var _loc6_:Vertex = null;
         var _loc7_:* = undefined;
         var _loc8_:Number = NaN;
         var _loc9_:* = null;
         this.alternativa3d::deleteResources();
         this.calculateNormalsAndRemoveDegenerateFaces();
         var _loc10_:Dictionary = new Dictionary();
         _loc5_ = this.alternativa3d::vertexList;
         while(_loc5_ != null)
         {
            _loc10_[_loc5_] = new Dictionary();
            _loc5_ = _loc5_.alternativa3d::next;
         }
         _loc3_ = this.alternativa3d::faceList;
         while(_loc3_ != null)
         {
            _loc4_ = _loc3_.alternativa3d::wrapper;
            while(_loc4_ != null)
            {
               _loc5_ = _loc4_.alternativa3d::vertex;
               _loc10_[_loc5_][_loc3_] = true;
               _loc4_ = _loc4_.alternativa3d::next;
            }
            _loc3_ = _loc3_.alternativa3d::next;
         }
         var _loc11_:Vector.<Vertex> = this.vertices;
         shareFaces(_loc11_,0,_loc11_.length,0,param2,new Vector.<int>(),_loc10_);
         this.alternativa3d::vertexList = null;
         param1 = Math.cos(param1);
         _loc3_ = this.alternativa3d::faceList;
         while(_loc3_ != null)
         {
            _loc4_ = _loc3_.alternativa3d::wrapper;
            while(_loc4_ != null)
            {
               _loc5_ = _loc4_.alternativa3d::vertex;
               (_loc6_ = new Vertex()).x = _loc5_.x;
               _loc6_.y = _loc5_.y;
               _loc6_.z = _loc5_.z;
               _loc6_.u = _loc5_.u;
               _loc6_.v = _loc5_.v;
               _loc6_.id = _loc5_.id;
               _loc6_.normalX = _loc3_.alternativa3d::normalX;
               _loc6_.normalY = _loc3_.alternativa3d::normalY;
               _loc6_.normalZ = _loc3_.alternativa3d::normalZ;
               for(_loc9_ in _loc10_[_loc5_])
               {
                  if(_loc3_ != _loc9_ && _loc3_.alternativa3d::normalX * _loc9_.normalX + _loc3_.alternativa3d::normalY * _loc9_.normalY + _loc3_.alternativa3d::normalZ * _loc9_.normalZ >= param1)
                  {
                     _loc6_.normalX += _loc9_.normalX;
                     _loc6_.normalY += _loc9_.normalY;
                     _loc6_.normalZ += _loc9_.normalZ;
                  }
               }
               _loc8_ = _loc6_.normalX * _loc6_.normalX + _loc6_.normalY * _loc6_.normalY + _loc6_.normalZ * _loc6_.normalZ;
               if(_loc8_ > 0.001)
               {
                  _loc8_ = 1 / Math.sqrt(_loc8_);
                  _loc6_.normalX *= _loc8_;
                  _loc6_.normalY *= _loc8_;
                  _loc6_.normalZ *= _loc8_;
               }
               _loc4_.alternativa3d::vertex = _loc6_;
               _loc6_.alternativa3d::next = this.alternativa3d::vertexList;
               this.alternativa3d::vertexList = _loc6_;
               _loc4_ = _loc4_.alternativa3d::next;
            }
            _loc3_ = _loc3_.alternativa3d::next;
         }
      }
      
      public function calculateVerticesNormalsBySmoothingGroups(param1:Number = 0) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:Face = null;
         var _loc4_:Vertex = null;
         var _loc5_:Wrapper = null;
         var _loc6_:Vertex = null;
         var _loc7_:Number = NaN;
         var _loc8_:* = null;
         this.alternativa3d::deleteResources();
         this.calculateNormalsAndRemoveDegenerateFaces();
         var _loc9_:Dictionary = new Dictionary();
         _loc3_ = this.alternativa3d::faceList;
         while(_loc3_ != null)
         {
            if(_loc3_.smoothingGroups > 0)
            {
               _loc5_ = _loc3_.alternativa3d::wrapper;
               while(_loc5_ != null)
               {
                  _loc4_ = _loc5_.alternativa3d::vertex;
                  if(!_loc9_[_loc4_])
                  {
                     _loc9_[_loc4_] = new Dictionary();
                  }
                  _loc9_[_loc4_][_loc3_] = true;
                  _loc5_ = _loc5_.alternativa3d::next;
               }
            }
            _loc3_ = _loc3_.alternativa3d::next;
         }
         var _loc10_:Vector.<Vertex> = new Vector.<Vertex>();
         var _loc11_:int = 0;
         for(_loc2_ in _loc9_)
         {
            _loc10_[_loc11_] = _loc2_;
            _loc11_++;
         }
         if(_loc11_ > 0)
         {
            shareFaces(_loc10_,0,_loc11_,0,param1,new Vector.<int>(),_loc9_);
         }
         this.alternativa3d::vertexList = null;
         _loc3_ = this.alternativa3d::faceList;
         while(_loc3_ != null)
         {
            _loc5_ = _loc3_.alternativa3d::wrapper;
            while(_loc5_ != null)
            {
               _loc4_ = _loc5_.alternativa3d::vertex;
               (_loc6_ = new Vertex()).x = _loc4_.x;
               _loc6_.y = _loc4_.y;
               _loc6_.z = _loc4_.z;
               _loc6_.u = _loc4_.u;
               _loc6_.v = _loc4_.v;
               _loc6_.id = _loc4_.id;
               _loc6_.normalX = _loc3_.alternativa3d::normalX;
               _loc6_.normalY = _loc3_.alternativa3d::normalY;
               _loc6_.normalZ = _loc3_.alternativa3d::normalZ;
               if(_loc3_.smoothingGroups > 0)
               {
                  for(_loc8_ in _loc9_[_loc4_])
                  {
                     if(_loc3_ != _loc8_ && (_loc3_.smoothingGroups & _loc8_.smoothingGroups) > 0)
                     {
                        _loc6_.normalX += _loc8_.normalX;
                        _loc6_.normalY += _loc8_.normalY;
                        _loc6_.normalZ += _loc8_.normalZ;
                     }
                  }
                  _loc7_ = _loc6_.normalX * _loc6_.normalX + _loc6_.normalY * _loc6_.normalY + _loc6_.normalZ * _loc6_.normalZ;
                  if(_loc7_ > 0.001)
                  {
                     _loc7_ = 1 / Math.sqrt(_loc7_);
                     _loc6_.normalX *= _loc7_;
                     _loc6_.normalY *= _loc7_;
                     _loc6_.normalZ *= _loc7_;
                  }
               }
               _loc5_.alternativa3d::vertex = _loc6_;
               _loc6_.alternativa3d::next = this.alternativa3d::vertexList;
               this.alternativa3d::vertexList = _loc6_;
               _loc5_ = _loc5_.alternativa3d::next;
            }
            _loc3_ = _loc3_.alternativa3d::next;
         }
      }
      
      private function calculateNormalsAndRemoveDegenerateFaces() : void
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
         var _loc13_:Face = this.alternativa3d::faceList;
         this.alternativa3d::faceList = null;
         while(_loc13_ != null)
         {
            _loc1_ = _loc13_.alternativa3d::next;
            _loc2_ = _loc13_.alternativa3d::wrapper;
            _loc3_ = _loc2_.alternativa3d::vertex;
            _loc2_ = _loc2_.alternativa3d::next;
            _loc4_ = _loc2_.alternativa3d::vertex;
            _loc2_ = _loc2_.alternativa3d::next;
            _loc5_ = _loc2_.alternativa3d::vertex;
            _loc6_ = _loc4_.x - _loc3_.x;
            _loc7_ = _loc4_.y - _loc3_.y;
            _loc8_ = _loc4_.z - _loc3_.z;
            _loc9_ = _loc5_.x - _loc3_.x;
            _loc10_ = _loc5_.y - _loc3_.y;
            _loc11_ = _loc5_.z - _loc3_.z;
            _loc13_.alternativa3d::normalX = _loc11_ * _loc7_ - _loc10_ * _loc8_;
            _loc13_.alternativa3d::normalY = _loc9_ * _loc8_ - _loc11_ * _loc6_;
            _loc13_.alternativa3d::normalZ = _loc10_ * _loc6_ - _loc9_ * _loc7_;
            _loc12_ = _loc13_.alternativa3d::normalX * _loc13_.alternativa3d::normalX + _loc13_.alternativa3d::normalY * _loc13_.alternativa3d::normalY + _loc13_.alternativa3d::normalZ * _loc13_.alternativa3d::normalZ;
            if(_loc12_ > 0.001)
            {
               _loc12_ = 1 / Math.sqrt(_loc12_);
               _loc13_.alternativa3d::normalX *= _loc12_;
               _loc13_.alternativa3d::normalY *= _loc12_;
               _loc13_.alternativa3d::normalZ *= _loc12_;
               _loc13_.alternativa3d::offset = _loc3_.x * _loc13_.alternativa3d::normalX + _loc3_.y * _loc13_.alternativa3d::normalY + _loc3_.z * _loc13_.alternativa3d::normalZ;
               _loc13_.alternativa3d::next = this.alternativa3d::faceList;
               this.alternativa3d::faceList = _loc13_;
            }
            else
            {
               _loc13_.alternativa3d::next = null;
            }
            _loc13_ = _loc1_;
         }
      }
      
      public function optimizeForDynamicBSP(param1:int = 1) : void
      {
         var _loc2_:Face = null;
         var _loc3_:Face = null;
         var _loc4_:Face = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:int = 0;
         var _loc12_:Face = null;
         var _loc13_:Wrapper = null;
         var _loc14_:Vertex = null;
         var _loc15_:Vertex = null;
         var _loc16_:Vertex = null;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Boolean = false;
         var _loc21_:Boolean = false;
         var _loc22_:Vertex = null;
         var _loc23_:Number = NaN;
         this.alternativa3d::deleteResources();
         var _loc24_:Face = this.alternativa3d::faceList;
         var _loc25_:int = 0;
         while(_loc25_ < param1)
         {
            _loc3_ = null;
            _loc4_ = _loc24_;
            while(_loc4_ != null)
            {
               _loc5_ = _loc4_.alternativa3d::normalX;
               _loc6_ = _loc4_.alternativa3d::normalY;
               _loc7_ = _loc4_.alternativa3d::normalZ;
               _loc8_ = _loc4_.alternativa3d::offset;
               _loc9_ = _loc8_ - this.threshold;
               _loc10_ = _loc8_ + this.threshold;
               _loc11_ = 0;
               _loc12_ = _loc24_;
               while(_loc12_ != null)
               {
                  if(_loc12_ != _loc4_)
                  {
                     _loc13_ = _loc12_.alternativa3d::wrapper;
                     _loc14_ = _loc13_.alternativa3d::vertex;
                     _loc13_ = _loc13_.alternativa3d::next;
                     _loc15_ = _loc13_.alternativa3d::vertex;
                     _loc13_ = _loc13_.alternativa3d::next;
                     _loc16_ = _loc13_.alternativa3d::vertex;
                     _loc13_ = _loc13_.alternativa3d::next;
                     _loc17_ = _loc14_.x * _loc5_ + _loc14_.y * _loc6_ + _loc14_.z * _loc7_;
                     _loc18_ = _loc15_.x * _loc5_ + _loc15_.y * _loc6_ + _loc15_.z * _loc7_;
                     _loc19_ = _loc16_.x * _loc5_ + _loc16_.y * _loc6_ + _loc16_.z * _loc7_;
                     _loc20_ = _loc17_ < _loc9_ || _loc18_ < _loc9_ || _loc19_ < _loc9_;
                     _loc21_ = _loc17_ > _loc10_ || _loc18_ > _loc10_ || _loc19_ > _loc10_;
                     while(_loc13_ != null)
                     {
                        _loc22_ = _loc13_.alternativa3d::vertex;
                        if((_loc23_ = _loc22_.x * _loc5_ + _loc22_.y * _loc6_ + _loc22_.z * _loc7_) < _loc9_)
                        {
                           _loc20_ = true;
                           if(_loc21_)
                           {
                              break;
                           }
                        }
                        else if(_loc23_ > _loc10_)
                        {
                           _loc21_ = true;
                           if(_loc20_)
                           {
                              break;
                           }
                        }
                        _loc13_ = _loc13_.alternativa3d::next;
                     }
                     if(_loc21_ && _loc20_)
                     {
                        _loc11_++;
                        if(_loc11_ > _loc25_)
                        {
                           break;
                        }
                     }
                  }
                  _loc12_ = _loc12_.alternativa3d::next;
               }
               if(_loc12_ == null)
               {
                  if(_loc3_ != null)
                  {
                     _loc3_.alternativa3d::next = _loc4_.alternativa3d::next;
                  }
                  else
                  {
                     _loc24_ = _loc4_.alternativa3d::next;
                  }
                  if(_loc2_ != null)
                  {
                     _loc2_.alternativa3d::next = _loc4_;
                  }
                  else
                  {
                     this.alternativa3d::faceList = _loc4_;
                  }
                  _loc2_ = _loc4_;
               }
               else
               {
                  _loc3_ = _loc4_;
               }
               _loc4_ = _loc4_.alternativa3d::next;
            }
            if(_loc24_ == null)
            {
               break;
            }
            _loc25_++;
         }
         if(_loc2_ != null)
         {
            _loc2_.alternativa3d::next = _loc24_;
         }
      }
      
      override public function intersectRay(param1:Vector3D, param2:Vector3D, param3:Dictionary = null, param4:Camera3D = null) : RayIntersectionData
      {
         var _loc5_:Vector3D = null;
         var _loc6_:Face = null;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Wrapper = null;
         var _loc17_:Vertex = null;
         var _loc18_:Vertex = null;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc24_:Number = NaN;
         var _loc25_:RayIntersectionData = null;
         if(param3 != null && Boolean(param3[this]))
         {
            return null;
         }
         if(!alternativa3d::boundIntersectRay(param1,param2,boundMinX,boundMinY,boundMinZ,boundMaxX,boundMaxY,boundMaxZ))
         {
            return null;
         }
         var _loc26_:Number = param1.x;
         var _loc27_:Number = param1.y;
         var _loc28_:Number = param1.z;
         var _loc29_:Number = param2.x;
         var _loc30_:Number = param2.y;
         var _loc31_:Number = param2.z;
         var _loc32_:Number = 1e+22;
         var _loc33_:Face = this.alternativa3d::faceList;
         while(_loc33_ != null)
         {
            _loc7_ = _loc33_.alternativa3d::normalX;
            _loc8_ = _loc33_.alternativa3d::normalY;
            _loc9_ = _loc33_.alternativa3d::normalZ;
            _loc10_ = _loc29_ * _loc7_ + _loc30_ * _loc8_ + _loc31_ * _loc9_;
            if(_loc10_ < 0)
            {
               _loc11_ = _loc26_ * _loc7_ + _loc27_ * _loc8_ + _loc28_ * _loc9_ - _loc33_.alternativa3d::offset;
               if(_loc11_ > 0)
               {
                  _loc12_ = -_loc11_ / _loc10_;
                  if(_loc5_ == null || _loc12_ < _loc32_)
                  {
                     _loc13_ = _loc26_ + _loc29_ * _loc12_;
                     _loc14_ = _loc27_ + _loc30_ * _loc12_;
                     _loc15_ = _loc28_ + _loc31_ * _loc12_;
                     _loc16_ = _loc33_.alternativa3d::wrapper;
                     while(_loc16_ != null)
                     {
                        _loc17_ = _loc16_.alternativa3d::vertex;
                        _loc18_ = _loc16_.alternativa3d::next != null ? _loc16_.alternativa3d::next.alternativa3d::vertex : _loc33_.alternativa3d::wrapper.alternativa3d::vertex;
                        _loc19_ = _loc18_.x - _loc17_.x;
                        _loc20_ = _loc18_.y - _loc17_.y;
                        _loc21_ = _loc18_.z - _loc17_.z;
                        _loc22_ = _loc13_ - _loc17_.x;
                        _loc23_ = _loc14_ - _loc17_.y;
                        _loc24_ = _loc15_ - _loc17_.z;
                        if((_loc24_ * _loc20_ - _loc23_ * _loc21_) * _loc7_ + (_loc22_ * _loc21_ - _loc24_ * _loc19_) * _loc8_ + (_loc23_ * _loc19_ - _loc22_ * _loc20_) * _loc9_ < 0)
                        {
                           break;
                        }
                        _loc16_ = _loc16_.alternativa3d::next;
                     }
                     if(_loc16_ == null)
                     {
                        if(_loc12_ < _loc32_)
                        {
                           _loc32_ = _loc12_;
                           if(_loc5_ == null)
                           {
                              _loc5_ = new Vector3D();
                           }
                           _loc5_.x = _loc13_;
                           _loc5_.y = _loc14_;
                           _loc5_.z = _loc15_;
                           _loc6_ = _loc33_;
                        }
                     }
                  }
               }
            }
            _loc33_ = _loc33_.alternativa3d::next;
         }
         if(_loc5_ != null)
         {
            (_loc25_ = new RayIntersectionData()).object = this;
            _loc25_.face = _loc6_;
            _loc25_.point = _loc5_;
            _loc25_.uv = _loc6_.getUV(_loc5_);
            _loc25_.time = _loc32_;
            return _loc25_;
         }
         return null;
      }
      
      override alternativa3d function checkIntersection(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Dictionary) : Boolean
      {
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Wrapper = null;
         var _loc19_:Vertex = null;
         var _loc20_:Vertex = null;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc24_:Number = NaN;
         var _loc25_:Number = NaN;
         var _loc26_:Number = NaN;
         var _loc27_:Face = null;
         _loc9_ = NaN;
         _loc10_ = NaN;
         _loc11_ = NaN;
         _loc12_ = NaN;
         _loc13_ = NaN;
         _loc14_ = NaN;
         _loc15_ = NaN;
         _loc16_ = NaN;
         _loc17_ = NaN;
         _loc18_ = null;
         _loc19_ = null;
         _loc20_ = null;
         _loc21_ = NaN;
         _loc22_ = NaN;
         _loc23_ = NaN;
         _loc24_ = NaN;
         _loc25_ = NaN;
         _loc26_ = NaN;
         _loc27_ = this.alternativa3d::faceList;
         while(true)
         {
            if(_loc27_ == null)
            {
               return false;
            }
            _loc9_ = _loc27_.alternativa3d::normalX;
            _loc10_ = _loc27_.alternativa3d::normalY;
            _loc11_ = _loc27_.alternativa3d::normalZ;
            _loc12_ = param4 * _loc9_ + param5 * _loc10_ + param6 * _loc11_;
            if(_loc12_ < 0)
            {
               _loc13_ = param1 * _loc9_ + param2 * _loc10_ + param3 * _loc11_ - _loc27_.alternativa3d::offset;
               if(_loc13_ > 0)
               {
                  _loc14_ = -_loc13_ / _loc12_;
                  if(_loc14_ < param7)
                  {
                     _loc15_ = param1 + param4 * _loc14_;
                     _loc16_ = param2 + param5 * _loc14_;
                     _loc17_ = param3 + param6 * _loc14_;
                     _loc18_ = _loc27_.alternativa3d::wrapper;
                     while(_loc18_ != null)
                     {
                        _loc19_ = _loc18_.alternativa3d::vertex;
                        _loc20_ = _loc18_.alternativa3d::next != null ? _loc18_.alternativa3d::next.alternativa3d::vertex : _loc27_.alternativa3d::wrapper.alternativa3d::vertex;
                        _loc21_ = _loc20_.x - _loc19_.x;
                        _loc22_ = _loc20_.y - _loc19_.y;
                        _loc23_ = _loc20_.z - _loc19_.z;
                        _loc24_ = _loc15_ - _loc19_.x;
                        _loc25_ = _loc16_ - _loc19_.y;
                        _loc26_ = _loc17_ - _loc19_.z;
                        if((_loc26_ * _loc22_ - _loc25_ * _loc23_) * _loc9_ + (_loc24_ * _loc23_ - _loc26_ * _loc21_) * _loc10_ + (_loc25_ * _loc21_ - _loc24_ * _loc22_) * _loc11_ < 0)
                        {
                           break;
                        }
                        _loc18_ = _loc18_.alternativa3d::next;
                     }
                     if(_loc18_ == null)
                     {
                        break;
                     }
                  }
               }
            }
            _loc27_ = _loc27_.alternativa3d::next;
         }
         return true;
      }
      
      override alternativa3d function collectPlanes(param1:Vector3D, param2:Vector3D, param3:Vector3D, param4:Vector3D, param5:Vector3D, param6:Vector.<Face>, param7:Dictionary = null) : void
      {
         var _loc8_:Vertex = null;
         var _loc9_:Number = NaN;
         var _loc10_:Wrapper = null;
         var _loc11_:Vector3D = null;
         var _loc12_:Face = null;
         _loc8_ = null;
         _loc9_ = NaN;
         _loc10_ = null;
         if(param7 != null && Boolean(param7[this]))
         {
            return;
         }
         _loc11_ = alternativa3d::calculateSphere(param1,param2,param3,param4,param5);
         if(!alternativa3d::boundIntersectSphere(_loc11_,boundMinX,boundMinY,boundMinZ,boundMaxX,boundMaxY,boundMaxZ))
         {
            return;
         }
         if(alternativa3d::transformId > 500000000)
         {
            alternativa3d::transformId = 0;
            _loc8_ = this.alternativa3d::vertexList;
            while(_loc8_ != null)
            {
               _loc8_.alternativa3d::transformId = 0;
               _loc8_ = _loc8_.alternativa3d::next;
            }
         }
         ++alternativa3d::transformId;
         _loc12_ = this.alternativa3d::faceList;
         while(_loc12_ != null)
         {
            _loc9_ = _loc11_.x * _loc12_.alternativa3d::normalX + _loc11_.y * _loc12_.alternativa3d::normalY + _loc11_.z * _loc12_.alternativa3d::normalZ - _loc12_.alternativa3d::offset;
            if(_loc9_ < _loc11_.w && _loc9_ > -_loc11_.w)
            {
               _loc10_ = _loc12_.alternativa3d::wrapper;
               while(_loc10_ != null)
               {
                  _loc8_ = _loc10_.alternativa3d::vertex;
                  if(_loc8_.alternativa3d::transformId != alternativa3d::transformId)
                  {
                     _loc8_.alternativa3d::cameraX = alternativa3d::ma * _loc8_.x + alternativa3d::mb * _loc8_.y + alternativa3d::mc * _loc8_.z + alternativa3d::md;
                     _loc8_.alternativa3d::cameraY = alternativa3d::me * _loc8_.x + alternativa3d::mf * _loc8_.y + alternativa3d::mg * _loc8_.z + alternativa3d::mh;
                     _loc8_.alternativa3d::cameraZ = alternativa3d::mi * _loc8_.x + alternativa3d::mj * _loc8_.y + alternativa3d::mk * _loc8_.z + alternativa3d::ml;
                     _loc8_.alternativa3d::transformId = alternativa3d::transformId;
                  }
                  _loc10_ = _loc10_.alternativa3d::next;
               }
               param6.push(_loc12_);
            }
            _loc12_ = _loc12_.alternativa3d::next;
         }
      }
      
      override public function clone() : Object3D
      {
         var _loc1_:Mesh = null;
         _loc1_ = new Mesh();
         _loc1_.clonePropertiesFrom(this);
         return _loc1_;
      }
      
      override protected function clonePropertiesFrom(param1:Object3D) : void
      {
         var _loc2_:Vertex = null;
         var _loc3_:Vertex = null;
         var _loc4_:Face = null;
         var _loc5_:Vertex = null;
         var _loc6_:Face = null;
         var _loc7_:Wrapper = null;
         var _loc8_:Wrapper = null;
         var _loc9_:Wrapper = null;
         var _loc10_:Mesh = null;
         var _loc11_:Face = null;
         _loc2_ = null;
         _loc3_ = null;
         _loc4_ = null;
         _loc5_ = null;
         _loc6_ = null;
         _loc7_ = null;
         _loc8_ = null;
         _loc9_ = null;
         super.clonePropertiesFrom(param1);
         _loc10_ = param1 as Mesh;
         this.clipping = _loc10_.clipping;
         this.sorting = _loc10_.sorting;
         this.threshold = _loc10_.threshold;
         _loc2_ = _loc10_.alternativa3d::vertexList;
         while(_loc2_ != null)
         {
            (_loc5_ = new Vertex()).x = _loc2_.x;
            _loc5_.y = _loc2_.y;
            _loc5_.z = _loc2_.z;
            _loc5_.u = _loc2_.u;
            _loc5_.v = _loc2_.v;
            _loc5_.normalX = _loc2_.normalX;
            _loc5_.normalY = _loc2_.normalY;
            _loc5_.normalZ = _loc2_.normalZ;
            _loc5_.alternativa3d::offset = _loc2_.alternativa3d::offset;
            _loc5_.id = _loc2_.id;
            _loc2_.alternativa3d::value = _loc5_;
            if(_loc3_ != null)
            {
               _loc3_.alternativa3d::next = _loc5_;
            }
            else
            {
               this.alternativa3d::vertexList = _loc5_;
            }
            _loc3_ = _loc5_;
            _loc2_ = _loc2_.alternativa3d::next;
         }
         _loc11_ = _loc10_.alternativa3d::faceList;
         while(_loc11_ != null)
         {
            (_loc6_ = new Face()).material = _loc11_.material;
            _loc6_.smoothingGroups = _loc11_.smoothingGroups;
            _loc6_.id = _loc11_.id;
            _loc6_.alternativa3d::normalX = _loc11_.alternativa3d::normalX;
            _loc6_.alternativa3d::normalY = _loc11_.alternativa3d::normalY;
            _loc6_.alternativa3d::normalZ = _loc11_.alternativa3d::normalZ;
            _loc6_.alternativa3d::offset = _loc11_.alternativa3d::offset;
            _loc7_ = null;
            _loc8_ = _loc11_.alternativa3d::wrapper;
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
            if(_loc4_ != null)
            {
               _loc4_.alternativa3d::next = _loc6_;
            }
            else
            {
               this.alternativa3d::faceList = _loc6_;
            }
            _loc4_ = _loc6_;
            _loc11_ = _loc11_.alternativa3d::next;
         }
         _loc2_ = _loc10_.alternativa3d::vertexList;
         while(_loc2_ != null)
         {
            _loc2_.alternativa3d::value = null;
            _loc2_ = _loc2_.alternativa3d::next;
         }
      }
      
      override alternativa3d function draw(param1:Camera3D) : void
      {
         var _loc2_:Face = null;
         var _loc3_:Vertex = null;
         var _loc4_:int = 0;
         _loc2_ = null;
         _loc3_ = null;
         if(this.alternativa3d::faceList == null)
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
         if(alternativa3d::concatenatedAlpha >= 1 && alternativa3d::concatenatedBlendMode == "normal")
         {
            this.alternativa3d::addOpaque(param1);
            _loc2_ = this.transparentList;
         }
         else
         {
            _loc2_ = this.alternativa3d::faceList;
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
         _loc4_ = param1.debug ? int(param1.alternativa3d::checkInDebug(this)) : int(0);
         if(_loc4_ & Debug.BOUNDS)
         {
            Debug.drawBounds(param1,this,boundMinX,boundMinY,boundMinZ,boundMaxX,boundMaxY,boundMaxZ);
         }
         if(_loc2_ == null)
         {
            return;
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
         _loc2_ = this.alternativa3d::prepareFaces(param1,_loc2_);
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
         if(_loc2_.alternativa3d::processNext != null)
         {
            if(this.sorting == 1)
            {
               _loc2_ = param1.alternativa3d::sortByAverageZ(_loc2_);
            }
            else if(this.sorting == 2)
            {
               _loc2_ = param1.alternativa3d::sortByDynamicBSP(_loc2_,this.threshold);
            }
         }
         if(_loc4_ & Debug.EDGES)
         {
            Debug.alternativa3d::drawEdges(param1,_loc2_,16777215);
         }
         this.alternativa3d::drawFaces(param1,_loc2_);
      }
      
      override alternativa3d function getVG(param1:Camera3D) : VG
      {
         var _loc2_:Face = null;
         var _loc3_:Vertex = null;
         var _loc4_:int = 0;
         _loc2_ = null;
         _loc3_ = null;
         if(this.alternativa3d::faceList == null)
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
         if(alternativa3d::concatenatedAlpha >= 1 && alternativa3d::concatenatedBlendMode == "normal")
         {
            this.alternativa3d::addOpaque(param1);
            _loc2_ = this.transparentList;
         }
         else
         {
            _loc2_ = this.alternativa3d::faceList;
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
         _loc4_ = param1.debug ? int(param1.alternativa3d::checkInDebug(this)) : int(0);
         if(_loc4_ & Debug.BOUNDS)
         {
            Debug.drawBounds(param1,this,boundMinX,boundMinY,boundMinZ,boundMaxX,boundMaxY,boundMaxZ);
         }
         if(_loc2_ == null)
         {
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
         _loc2_ = this.alternativa3d::prepareFaces(param1,_loc2_);
         if(_loc2_ == null)
         {
            return null;
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
               return null;
            }
         }
         return VG.alternativa3d::create(this,_loc2_,this.sorting,_loc4_,false);
      }
      
      alternativa3d function prepareResources() : void
      {
         var _loc1_:Vector.<Number> = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Vertex = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Face = null;
         var _loc9_:Face = null;
         var _loc10_:Face = null;
         var _loc11_:Wrapper = null;
         var _loc12_:Dictionary = null;
         var _loc13_:Vector.<uint> = null;
         var _loc14_:int = 0;
         var _loc15_:* = undefined;
         var _loc16_:Face = null;
         _loc1_ = null;
         _loc2_ = 0;
         _loc3_ = 0;
         _loc4_ = null;
         _loc5_ = 0;
         _loc6_ = 0;
         _loc7_ = 0;
         _loc8_ = null;
         _loc9_ = null;
         _loc10_ = null;
         _loc11_ = null;
         _loc12_ = null;
         _loc13_ = null;
         _loc14_ = 0;
         _loc15_ = undefined;
         _loc16_ = null;
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
            if(_loc3_ > 0)
            {
               this.alternativa3d::vertexBuffer = new VertexBufferResource(_loc1_,8);
            }
            _loc12_ = new Dictionary();
            _loc8_ = this.alternativa3d::faceList;
            while(_loc8_ != null)
            {
               _loc9_ = _loc8_.alternativa3d::next;
               _loc8_.alternativa3d::next = null;
               if(_loc8_.material != null && (!_loc8_.material.alternativa3d::transparent || _loc8_.material.alphaTestThreshold > 0))
               {
                  _loc8_.alternativa3d::next = _loc12_[_loc8_.material];
                  _loc12_[_loc8_.material] = _loc8_;
               }
               else
               {
                  if(_loc10_ != null)
                  {
                     _loc10_.alternativa3d::next = _loc8_;
                  }
                  else
                  {
                     this.transparentList = _loc8_;
                  }
                  _loc10_ = _loc8_;
               }
               _loc8_ = _loc9_;
            }
            this.alternativa3d::faceList = this.transparentList;
            _loc13_ = new Vector.<uint>();
            _loc14_ = 0;
            for(_loc15_ in _loc12_)
            {
               _loc16_ = _loc12_[_loc15_];
               this.opaqueMaterials[this.opaqueLength] = _loc16_.material;
               this.opaqueBegins[this.opaqueLength] = this.alternativa3d::numTriangles * 3;
               _loc8_ = _loc16_;
               while(_loc8_ != null)
               {
                  _loc11_ = _loc8_.alternativa3d::wrapper;
                  _loc5_ = _loc11_.alternativa3d::vertex.alternativa3d::index;
                  _loc11_ = _loc11_.alternativa3d::next;
                  _loc6_ = _loc11_.alternativa3d::vertex.alternativa3d::index;
                  _loc11_ = _loc11_.alternativa3d::next;
                  while(_loc11_ != null)
                  {
                     _loc7_ = _loc11_.alternativa3d::vertex.alternativa3d::index;
                     _loc13_[_loc14_] = _loc5_;
                     _loc14_++;
                     _loc13_[_loc14_] = _loc6_;
                     _loc14_++;
                     _loc13_[_loc14_] = _loc7_;
                     _loc14_++;
                     _loc6_ = _loc7_;
                     ++this.alternativa3d::numTriangles;
                     _loc11_ = _loc11_.alternativa3d::next;
                  }
                  if(_loc8_.alternativa3d::next == null)
                  {
                     _loc10_ = _loc8_;
                  }
                  _loc8_ = _loc8_.alternativa3d::next;
               }
               this.opaqueNums[this.opaqueLength] = this.alternativa3d::numTriangles - this.opaqueBegins[this.opaqueLength] / 3;
               ++this.opaqueLength;
               _loc10_.alternativa3d::next = this.alternativa3d::faceList;
               this.alternativa3d::faceList = _loc16_;
            }
            this.alternativa3d::numOpaqueTriangles = this.alternativa3d::numTriangles;
            _loc8_ = this.transparentList;
            while(_loc8_ != null)
            {
               _loc11_ = _loc8_.alternativa3d::wrapper;
               _loc5_ = _loc11_.alternativa3d::vertex.alternativa3d::index;
               _loc11_ = _loc11_.alternativa3d::next;
               _loc6_ = _loc11_.alternativa3d::vertex.alternativa3d::index;
               _loc11_ = _loc11_.alternativa3d::next;
               while(_loc11_ != null)
               {
                  _loc7_ = _loc11_.alternativa3d::vertex.alternativa3d::index;
                  _loc13_[_loc14_] = _loc5_;
                  _loc14_++;
                  _loc13_[_loc14_] = _loc6_;
                  _loc14_++;
                  _loc13_[_loc14_] = _loc7_;
                  _loc14_++;
                  _loc6_ = _loc7_;
                  ++this.alternativa3d::numTriangles;
                  _loc11_ = _loc11_.alternativa3d::next;
               }
               _loc8_ = _loc8_.alternativa3d::next;
            }
            if(_loc14_ > 0)
            {
               this.alternativa3d::indexBuffer = new IndexBufferResource(_loc13_);
            }
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
            this.alternativa3d::numOpaqueTriangles = 0;
            this.opaqueMaterials.length = 0;
            this.opaqueBegins.length = 0;
            this.opaqueNums.length = 0;
            this.opaqueLength = 0;
            this.transparentList = null;
         }
      }
      
      alternativa3d function addOpaque(param1:Camera3D) : void
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < this.opaqueLength)
         {
            param1.alternativa3d::addOpaque(this.opaqueMaterials[_loc2_],this.alternativa3d::vertexBuffer,this.alternativa3d::indexBuffer,this.opaqueBegins[_loc2_],this.opaqueNums[_loc2_],this);
            _loc2_++;
         }
      }
      
      alternativa3d function prepareFaces(param1:Camera3D, param2:Face) : Face
      {
         var _loc3_:Face = null;
         var _loc4_:Face = null;
         var _loc5_:Face = null;
         var _loc6_:Wrapper = null;
         var _loc7_:Vertex = null;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         _loc3_ = null;
         _loc4_ = null;
         _loc5_ = null;
         _loc6_ = null;
         _loc7_ = null;
         _loc8_ = NaN;
         _loc9_ = NaN;
         _loc10_ = NaN;
         _loc5_ = param2;
         while(_loc5_ != null)
         {
            if(_loc5_.alternativa3d::normalX * alternativa3d::imd + _loc5_.alternativa3d::normalY * alternativa3d::imh + _loc5_.alternativa3d::normalZ * alternativa3d::iml > _loc5_.alternativa3d::offset)
            {
               _loc6_ = _loc5_.alternativa3d::wrapper;
               while(_loc6_ != null)
               {
                  _loc7_ = _loc6_.alternativa3d::vertex;
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
                  _loc6_ = _loc6_.alternativa3d::next;
               }
               if(_loc3_ != null)
               {
                  _loc4_.alternativa3d::processNext = _loc5_;
               }
               else
               {
                  _loc3_ = _loc5_;
               }
               _loc4_ = _loc5_;
            }
            _loc5_ = _loc5_.alternativa3d::next;
         }
         if(_loc4_ != null)
         {
            _loc4_.alternativa3d::processNext = null;
         }
         return _loc3_;
      }
      
      alternativa3d function drawFaces(param1:Camera3D, param2:Face) : void
      {
         var _loc3_:Face = null;
         var _loc4_:Face = null;
         var _loc5_:Face = null;
         _loc3_ = null;
         _loc4_ = null;
         _loc5_ = null;
         _loc5_ = param2;
         while(_loc5_ != null)
         {
            _loc3_ = _loc5_.alternativa3d::processNext;
            if(_loc3_ == null || _loc3_.material != param2.material)
            {
               _loc5_.alternativa3d::processNext = null;
               if(param2.material != null)
               {
                  param2.alternativa3d::processNegative = _loc4_;
                  _loc4_ = param2;
               }
               else
               {
                  while(param2 != null)
                  {
                     _loc5_ = param2.alternativa3d::processNext;
                     param2.alternativa3d::processNext = null;
                     param2 = _loc5_;
                  }
               }
               param2 = _loc3_;
            }
            _loc5_ = _loc3_;
         }
         param2 = _loc4_;
         while(param2 != null)
         {
            _loc3_ = param2.alternativa3d::processNegative;
            param2.alternativa3d::processNegative = null;
            param1.alternativa3d::addTransparent(param2,this);
            param2 = _loc3_;
         }
      }
      
      override alternativa3d function updateBounds(param1:Object3D, param2:Object3D = null) : void
      {
         var _loc3_:Vertex = null;
         _loc3_ = null;
         _loc3_ = this.alternativa3d::vertexList;
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
         var _loc5_:Vector.<Object3D> = null;
         var _loc6_:Vector3D = null;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Vertex = null;
         var _loc10_:Vertex = null;
         var _loc11_:Face = null;
         var _loc12_:Mesh = null;
         var _loc13_:Mesh = null;
         var _loc14_:Face = null;
         var _loc15_:Face = null;
         var _loc16_:Face = null;
         var _loc17_:Face = null;
         var _loc18_:Wrapper = null;
         var _loc19_:Vertex = null;
         var _loc20_:Vertex = null;
         var _loc21_:Vertex = null;
         var _loc22_:Boolean = false;
         var _loc23_:Boolean = false;
         var _loc24_:Face = null;
         var _loc25_:Face = null;
         var _loc26_:Wrapper = null;
         var _loc27_:Wrapper = null;
         var _loc28_:Wrapper = null;
         var _loc29_:Number = NaN;
         var _loc30_:Vertex = null;
         _loc5_ = null;
         _loc6_ = null;
         _loc7_ = NaN;
         _loc8_ = NaN;
         _loc9_ = null;
         _loc10_ = null;
         _loc11_ = null;
         _loc12_ = null;
         _loc13_ = null;
         _loc14_ = null;
         _loc15_ = null;
         _loc16_ = null;
         _loc17_ = null;
         _loc18_ = null;
         _loc19_ = null;
         _loc20_ = null;
         _loc21_ = null;
         _loc22_ = false;
         _loc23_ = false;
         _loc24_ = null;
         _loc25_ = null;
         _loc26_ = null;
         _loc27_ = null;
         _loc28_ = null;
         _loc29_ = NaN;
         _loc30_ = null;
         this.alternativa3d::deleteResources();
         _loc5_ = new Vector.<Object3D>(2);
         _loc6_ = alternativa3d::calculatePlane(param1,param2,param3);
         _loc7_ = _loc6_.w - param4;
         _loc8_ = _loc6_.w + param4;
         _loc9_ = this.alternativa3d::vertexList;
         while(_loc9_ != null)
         {
            _loc10_ = _loc9_.alternativa3d::next;
            _loc9_.alternativa3d::next = null;
            _loc9_.alternativa3d::offset = _loc9_.x * _loc6_.x + _loc9_.y * _loc6_.y + _loc9_.z * _loc6_.z;
            if(_loc9_.alternativa3d::offset >= _loc7_ && _loc9_.alternativa3d::offset <= _loc8_)
            {
               _loc9_.alternativa3d::value = new Vertex();
               _loc9_.alternativa3d::value.x = _loc9_.x;
               _loc9_.alternativa3d::value.y = _loc9_.y;
               _loc9_.alternativa3d::value.z = _loc9_.z;
               _loc9_.alternativa3d::value.u = _loc9_.u;
               _loc9_.alternativa3d::value.v = _loc9_.v;
               _loc9_.alternativa3d::value.normalX = _loc9_.normalX;
               _loc9_.alternativa3d::value.normalY = _loc9_.normalY;
               _loc9_.alternativa3d::value.normalZ = _loc9_.normalZ;
            }
            _loc9_.alternativa3d::transformId = 0;
            _loc9_ = _loc10_;
         }
         this.alternativa3d::vertexList = null;
         _loc11_ = this.alternativa3d::faceList;
         this.alternativa3d::faceList = null;
         _loc12_ = this.clone() as Mesh;
         _loc13_ = this.clone() as Mesh;
         _loc16_ = _loc11_;
         while(_loc16_ != null)
         {
            _loc17_ = _loc16_.alternativa3d::next;
            _loc18_ = _loc16_.alternativa3d::wrapper;
            _loc19_ = _loc18_.alternativa3d::vertex;
            _loc18_ = _loc18_.alternativa3d::next;
            _loc20_ = _loc18_.alternativa3d::vertex;
            _loc18_ = _loc18_.alternativa3d::next;
            _loc21_ = _loc18_.alternativa3d::vertex;
            _loc22_ = _loc19_.alternativa3d::offset < _loc7_ || _loc20_.alternativa3d::offset < _loc7_ || _loc21_.alternativa3d::offset < _loc7_;
            _loc23_ = _loc19_.alternativa3d::offset > _loc8_ || _loc20_.alternativa3d::offset > _loc8_ || _loc21_.alternativa3d::offset > _loc8_;
            _loc18_ = _loc18_.alternativa3d::next;
            while(_loc18_ != null)
            {
               _loc9_ = _loc18_.alternativa3d::vertex;
               if(_loc9_.alternativa3d::offset < _loc7_)
               {
                  _loc22_ = true;
               }
               else if(_loc9_.alternativa3d::offset > _loc8_)
               {
                  _loc23_ = true;
               }
               _loc18_ = _loc18_.alternativa3d::next;
            }
            if(!_loc22_)
            {
               if(_loc15_ != null)
               {
                  _loc15_.alternativa3d::next = _loc16_;
               }
               else
               {
                  _loc13_.alternativa3d::faceList = _loc16_;
               }
               _loc15_ = _loc16_;
            }
            else if(!_loc23_)
            {
               if(_loc14_ != null)
               {
                  _loc14_.alternativa3d::next = _loc16_;
               }
               else
               {
                  _loc12_.alternativa3d::faceList = _loc16_;
               }
               _loc14_ = _loc16_;
               _loc18_ = _loc16_.alternativa3d::wrapper;
               while(_loc18_ != null)
               {
                  if(_loc18_.alternativa3d::vertex.alternativa3d::value != null)
                  {
                     _loc18_.alternativa3d::vertex = _loc18_.alternativa3d::vertex.alternativa3d::value;
                  }
                  _loc18_ = _loc18_.alternativa3d::next;
               }
            }
            else
            {
               _loc24_ = new Face();
               _loc25_ = new Face();
               _loc26_ = null;
               _loc27_ = null;
               _loc18_ = _loc16_.alternativa3d::wrapper.alternativa3d::next.alternativa3d::next;
               while(_loc18_.alternativa3d::next != null)
               {
                  _loc18_ = _loc18_.alternativa3d::next;
               }
               _loc19_ = _loc18_.alternativa3d::vertex;
               _loc18_ = _loc16_.alternativa3d::wrapper;
               while(_loc18_ != null)
               {
                  _loc20_ = _loc18_.alternativa3d::vertex;
                  if(_loc19_.alternativa3d::offset < _loc7_ && _loc20_.alternativa3d::offset > _loc8_ || _loc19_.alternativa3d::offset > _loc8_ && _loc20_.alternativa3d::offset < _loc7_)
                  {
                     _loc29_ = (_loc6_.w - _loc19_.alternativa3d::offset) / (_loc20_.alternativa3d::offset - _loc19_.alternativa3d::offset);
                     (_loc9_ = new Vertex()).x = _loc19_.x + (_loc20_.x - _loc19_.x) * _loc29_;
                     _loc9_.y = _loc19_.y + (_loc20_.y - _loc19_.y) * _loc29_;
                     _loc9_.z = _loc19_.z + (_loc20_.z - _loc19_.z) * _loc29_;
                     _loc9_.u = _loc19_.u + (_loc20_.u - _loc19_.u) * _loc29_;
                     _loc9_.v = _loc19_.v + (_loc20_.v - _loc19_.v) * _loc29_;
                     _loc9_.normalX = _loc19_.normalX + (_loc20_.normalX - _loc19_.normalX) * _loc29_;
                     _loc9_.normalY = _loc19_.normalY + (_loc20_.normalY - _loc19_.normalY) * _loc29_;
                     _loc9_.normalZ = _loc19_.normalZ + (_loc20_.normalZ - _loc19_.normalZ) * _loc29_;
                     (_loc28_ = new Wrapper()).alternativa3d::vertex = _loc9_;
                     if(_loc26_ != null)
                     {
                        _loc26_.alternativa3d::next = _loc28_;
                     }
                     else
                     {
                        _loc24_.alternativa3d::wrapper = _loc28_;
                     }
                     _loc26_ = _loc28_;
                     (_loc30_ = new Vertex()).x = _loc9_.x;
                     _loc30_.y = _loc9_.y;
                     _loc30_.z = _loc9_.z;
                     _loc30_.u = _loc9_.u;
                     _loc30_.v = _loc9_.v;
                     _loc30_.normalX = _loc9_.normalX;
                     _loc30_.normalY = _loc9_.normalY;
                     _loc30_.normalZ = _loc9_.normalZ;
                     (_loc28_ = new Wrapper()).alternativa3d::vertex = _loc30_;
                     if(_loc27_ != null)
                     {
                        _loc27_.alternativa3d::next = _loc28_;
                     }
                     else
                     {
                        _loc25_.alternativa3d::wrapper = _loc28_;
                     }
                     _loc27_ = _loc28_;
                  }
                  if(_loc20_.alternativa3d::offset < _loc7_)
                  {
                     (_loc28_ = _loc18_.alternativa3d::create()).alternativa3d::vertex = _loc20_;
                     if(_loc26_ != null)
                     {
                        _loc26_.alternativa3d::next = _loc28_;
                     }
                     else
                     {
                        _loc24_.alternativa3d::wrapper = _loc28_;
                     }
                     _loc26_ = _loc28_;
                  }
                  else if(_loc20_.alternativa3d::offset > _loc8_)
                  {
                     (_loc28_ = _loc18_.alternativa3d::create()).alternativa3d::vertex = _loc20_;
                     if(_loc27_ != null)
                     {
                        _loc27_.alternativa3d::next = _loc28_;
                     }
                     else
                     {
                        _loc25_.alternativa3d::wrapper = _loc28_;
                     }
                     _loc27_ = _loc28_;
                  }
                  else
                  {
                     (_loc28_ = _loc18_.alternativa3d::create()).alternativa3d::vertex = _loc20_.alternativa3d::value;
                     if(_loc26_ != null)
                     {
                        _loc26_.alternativa3d::next = _loc28_;
                     }
                     else
                     {
                        _loc24_.alternativa3d::wrapper = _loc28_;
                     }
                     _loc26_ = _loc28_;
                     (_loc28_ = _loc18_.alternativa3d::create()).alternativa3d::vertex = _loc20_;
                     if(_loc27_ != null)
                     {
                        _loc27_.alternativa3d::next = _loc28_;
                     }
                     else
                     {
                        _loc25_.alternativa3d::wrapper = _loc28_;
                     }
                     _loc27_ = _loc28_;
                  }
                  _loc19_ = _loc20_;
                  _loc18_ = _loc18_.alternativa3d::next;
               }
               _loc24_.material = _loc16_.material;
               _loc24_.alternativa3d::calculateBestSequenceAndNormal();
               if(_loc14_ != null)
               {
                  _loc14_.alternativa3d::next = _loc24_;
               }
               else
               {
                  _loc12_.alternativa3d::faceList = _loc24_;
               }
               _loc14_ = _loc24_;
               _loc25_.material = _loc16_.material;
               _loc25_.alternativa3d::calculateBestSequenceAndNormal();
               if(_loc15_ != null)
               {
                  _loc15_.alternativa3d::next = _loc25_;
               }
               else
               {
                  _loc13_.alternativa3d::faceList = _loc25_;
               }
               _loc15_ = _loc25_;
            }
            _loc16_ = _loc17_;
         }
         if(_loc14_ != null)
         {
            _loc14_.alternativa3d::next = null;
            ++_loc12_.alternativa3d::transformId;
            _loc12_.collectVertices();
            _loc12_.calculateBounds();
            _loc5_[0] = _loc12_;
         }
         if(_loc15_ != null)
         {
            _loc15_.alternativa3d::next = null;
            ++_loc13_.alternativa3d::transformId;
            _loc13_.collectVertices();
            _loc13_.calculateBounds();
            _loc5_[1] = _loc13_;
         }
         return _loc5_;
      }
      
      private function collectVertices() : void
      {
         var _loc1_:Face = null;
         var _loc2_:Wrapper = null;
         var _loc3_:Vertex = null;
         _loc1_ = null;
         _loc2_ = null;
         _loc3_ = null;
         _loc1_ = this.alternativa3d::faceList;
         while(_loc1_ != null)
         {
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
            _loc1_ = _loc1_.alternativa3d::next;
         }
      }
   }
}

