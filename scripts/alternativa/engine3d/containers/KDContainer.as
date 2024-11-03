package alternativa.engine3d.containers
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.Debug;
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.Object3DContainer;
   import alternativa.engine3d.core.RayIntersectionData;
   import alternativa.engine3d.core.ShadowAtlas;
   import alternativa.engine3d.core.VG;
   import alternativa.engine3d.core.Vertex;
   import alternativa.engine3d.materials.Material;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.BSP;
   import alternativa.engine3d.objects.Decal;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.engine3d.objects.Occluder;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.gfx.core.Device;
   import alternativa.gfx.core.IndexBufferResource;
   import alternativa.gfx.core.VertexBufferResource;
   import flash.geom.Matrix3D;
   import flash.geom.Vector3D;
   import flash.utils.Dictionary;
   
   use namespace alternativa3d;
   
   public class KDContainer extends ConflictContainer
   {
      private static const treeSphere:Vector3D = new Vector3D();
      
      private static const splitCoordsX:Vector.<Number> = new Vector.<Number>();
      
      private static const splitCoordsY:Vector.<Number> = new Vector.<Number>();
      
      private static const splitCoordsZ:Vector.<Number> = new Vector.<Number>();
      
      public var debugAlphaFade:Number = 0.8;
      
      public var ignoreChildrenInCollider:Boolean = false;
      
      alternativa3d var root:KDNode;
      
      private var nearPlaneX:Number;
      
      private var nearPlaneY:Number;
      
      private var nearPlaneZ:Number;
      
      private var nearPlaneOffset:Number;
      
      private var farPlaneX:Number;
      
      private var farPlaneY:Number;
      
      private var farPlaneZ:Number;
      
      private var farPlaneOffset:Number;
      
      private var leftPlaneX:Number;
      
      private var leftPlaneY:Number;
      
      private var leftPlaneZ:Number;
      
      private var leftPlaneOffset:Number;
      
      private var rightPlaneX:Number;
      
      private var rightPlaneY:Number;
      
      private var rightPlaneZ:Number;
      
      private var rightPlaneOffset:Number;
      
      private var topPlaneX:Number;
      
      private var topPlaneY:Number;
      
      private var topPlaneZ:Number;
      
      private var topPlaneOffset:Number;
      
      private var bottomPlaneX:Number;
      
      private var bottomPlaneY:Number;
      
      private var bottomPlaneZ:Number;
      
      private var bottomPlaneOffset:Number;
      
      private var occluders:Vector.<Vertex>;
      
      private var numOccluders:int;
      
      private var materials:Dictionary;
      
      private var opaqueList:Object3D;
      
      private var transparent:Vector.<Object3D>;
      
      private var transparentLength:int = 0;
      
      private var receiversVertexBuffers:Vector.<VertexBufferResource>;
      
      private var receiversIndexBuffers:Vector.<IndexBufferResource>;
      
      private var isCreated:Boolean = false;
      
      public var batched:Boolean = true;
      
      public function KDContainer()
      {
         this.occluders = new Vector.<Vertex>();
         this.materials = new Dictionary();
         this.transparent = new Vector.<Object3D>();
         this.receiversVertexBuffers = new Vector.<VertexBufferResource>();
         this.receiversIndexBuffers = new Vector.<IndexBufferResource>();
         super();
      }
      
      public function createTree(param1:Vector.<Object3D>, param2:Vector.<Occluder> = null) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Object3D = null;
         var _loc5_:Object3D = null;
         var _loc6_:Object3D = null;
         var _loc7_:Object3D = null;
         var _loc8_:Object3D = null;
         var _loc9_:Object3D = null;
         var _loc10_:Material = null;
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
         var _loc23_:Vertex = null;
         var _loc24_:Face = null;
         var _loc25_:Vertex = null;
         var _loc26_:Mesh = null;
         var _loc27_:Mesh = null;
         var _loc28_:BSP = null;
         var _loc29_:Vector.<Vector.<Number>> = null;
         var _loc30_:Vector.<Vector.<uint>> = null;
         this.destroyTree();
         var _loc31_:int = int(param1.length);
         var _loc32_:int = param2 != null ? int(param2.length) : int(0);
         var _loc33_:Dictionary = new Dictionary();
         _loc3_ = 0;
         while(_loc3_ < _loc31_)
         {
            _loc4_ = param1[_loc3_];
            if((_loc10_ = _loc4_ is Mesh ? (_loc4_ as Mesh).alternativa3d::faceList.material : (_loc4_ is BSP ? ((_loc4_ as BSP).alternativa3d::faces.length > 0 ? (_loc4_ as BSP).alternativa3d::faces[0].material : null) : null)) != null)
            {
               this.materials[_loc10_] = true;
               if(_loc10_.alternativa3d::transparent)
               {
                  this.transparent[this.transparentLength] = _loc4_;
                  ++this.transparentLength;
               }
               else
               {
                  _loc26_ = _loc33_[_loc10_];
                  if(_loc26_ == null)
                  {
                     _loc26_ = new Mesh();
                     _loc33_[_loc10_] = _loc26_;
                     _loc26_.alternativa3d::next = this.opaqueList;
                     this.opaqueList = _loc26_;
                     _loc26_.alternativa3d::setParent(this);
                  }
                  _loc4_ = _loc4_.clone();
                  _loc4_.alternativa3d::composeMatrix();
                  if(_loc4_ is Mesh)
                  {
                     _loc27_ = _loc4_ as Mesh;
                     if(_loc27_.alternativa3d::faceList != null)
                     {
                        _loc23_ = _loc27_.alternativa3d::vertexList;
                        while(_loc23_ != null)
                        {
                           _loc17_ = _loc23_.x;
                           _loc18_ = _loc23_.y;
                           _loc19_ = _loc23_.z;
                           _loc23_.x = _loc4_.alternativa3d::ma * _loc17_ + _loc4_.alternativa3d::mb * _loc18_ + _loc4_.alternativa3d::mc * _loc19_ + _loc4_.alternativa3d::md;
                           _loc23_.y = _loc4_.alternativa3d::me * _loc17_ + _loc4_.alternativa3d::mf * _loc18_ + _loc4_.alternativa3d::mg * _loc19_ + _loc4_.alternativa3d::mh;
                           _loc23_.z = _loc4_.alternativa3d::mi * _loc17_ + _loc4_.alternativa3d::mj * _loc18_ + _loc4_.alternativa3d::mk * _loc19_ + _loc4_.alternativa3d::ml;
                           _loc20_ = _loc23_.normalX;
                           _loc21_ = _loc23_.normalY;
                           _loc22_ = _loc23_.normalZ;
                           _loc23_.normalX = _loc4_.alternativa3d::ma * _loc20_ + _loc4_.alternativa3d::mb * _loc21_ + _loc4_.alternativa3d::mc * _loc22_;
                           _loc23_.normalY = _loc4_.alternativa3d::me * _loc20_ + _loc4_.alternativa3d::mf * _loc21_ + _loc4_.alternativa3d::mg * _loc22_;
                           _loc23_.normalZ = _loc4_.alternativa3d::mi * _loc20_ + _loc4_.alternativa3d::mj * _loc21_ + _loc4_.alternativa3d::mk * _loc22_;
                           _loc23_.alternativa3d::transformId = 0;
                           if(_loc23_.alternativa3d::next == null)
                           {
                              _loc25_ = _loc23_;
                           }
                           _loc23_ = _loc23_.alternativa3d::next;
                        }
                        _loc25_.alternativa3d::next = _loc26_.alternativa3d::vertexList;
                        _loc26_.alternativa3d::vertexList = _loc27_.alternativa3d::vertexList;
                        _loc27_.alternativa3d::vertexList = null;
                        _loc24_ = _loc27_.alternativa3d::faceList;
                        while(_loc24_.alternativa3d::next != null)
                        {
                           _loc24_ = _loc24_.alternativa3d::next;
                        }
                        _loc24_.alternativa3d::next = _loc26_.alternativa3d::faceList;
                        _loc26_.alternativa3d::faceList = _loc27_.alternativa3d::faceList;
                        _loc27_.alternativa3d::faceList = null;
                     }
                  }
                  else if(_loc4_ is BSP)
                  {
                     _loc28_ = _loc4_ as BSP;
                     if(_loc28_.alternativa3d::root != null)
                     {
                        _loc23_ = _loc28_.alternativa3d::vertexList;
                        while(_loc23_ != null)
                        {
                           _loc17_ = _loc23_.x;
                           _loc18_ = _loc23_.y;
                           _loc19_ = _loc23_.z;
                           _loc23_.x = _loc4_.alternativa3d::ma * _loc17_ + _loc4_.alternativa3d::mb * _loc18_ + _loc4_.alternativa3d::mc * _loc19_ + _loc4_.alternativa3d::md;
                           _loc23_.y = _loc4_.alternativa3d::me * _loc17_ + _loc4_.alternativa3d::mf * _loc18_ + _loc4_.alternativa3d::mg * _loc19_ + _loc4_.alternativa3d::mh;
                           _loc23_.z = _loc4_.alternativa3d::mi * _loc17_ + _loc4_.alternativa3d::mj * _loc18_ + _loc4_.alternativa3d::mk * _loc19_ + _loc4_.alternativa3d::ml;
                           _loc20_ = _loc23_.normalX;
                           _loc21_ = _loc23_.normalY;
                           _loc22_ = _loc23_.normalZ;
                           _loc23_.normalX = _loc4_.alternativa3d::ma * _loc20_ + _loc4_.alternativa3d::mb * _loc21_ + _loc4_.alternativa3d::mc * _loc22_;
                           _loc23_.normalY = _loc4_.alternativa3d::me * _loc20_ + _loc4_.alternativa3d::mf * _loc21_ + _loc4_.alternativa3d::mg * _loc22_;
                           _loc23_.normalZ = _loc4_.alternativa3d::mi * _loc20_ + _loc4_.alternativa3d::mj * _loc21_ + _loc4_.alternativa3d::mk * _loc22_;
                           _loc23_.alternativa3d::transformId = 0;
                           if(_loc23_.alternativa3d::next == null)
                           {
                              _loc25_ = _loc23_;
                           }
                           _loc23_ = _loc23_.alternativa3d::next;
                        }
                        _loc25_.alternativa3d::next = _loc26_.alternativa3d::vertexList;
                        _loc26_.alternativa3d::vertexList = _loc28_.alternativa3d::vertexList;
                        _loc28_.alternativa3d::vertexList = null;
                        for each(_loc24_ in _loc28_.alternativa3d::faces)
                        {
                           _loc24_.alternativa3d::next = _loc26_.alternativa3d::faceList;
                           _loc26_.alternativa3d::faceList = _loc24_;
                        }
                        _loc28_.alternativa3d::faces.length = 0;
                        _loc28_.alternativa3d::root = null;
                     }
                  }
               }
            }
            _loc3_++;
         }
         for each(_loc26_ in _loc33_)
         {
            _loc26_.calculateFacesNormals(true);
            _loc26_.calculateBounds();
         }
         _loc11_ = 1e+22;
         _loc12_ = 1e+22;
         _loc13_ = 1e+22;
         _loc14_ = -1e+22;
         _loc15_ = -1e+22;
         _loc16_ = -1e+22;
         _loc3_ = 0;
         while(_loc3_ < _loc31_)
         {
            _loc4_ = param1[_loc3_];
            _loc5_ = this.createObjectBounds(_loc4_);
            if(_loc5_.boundMinX <= _loc5_.boundMaxX)
            {
               if(_loc4_.alternativa3d::_parent != null)
               {
                  _loc4_.alternativa3d::_parent.removeChild(_loc4_);
               }
               _loc4_.alternativa3d::setParent(this);
               _loc4_.alternativa3d::next = _loc6_;
               _loc6_ = _loc4_;
               _loc5_.alternativa3d::next = _loc7_;
               _loc7_ = _loc5_;
               if(_loc5_.boundMinX < _loc11_)
               {
                  _loc11_ = _loc5_.boundMinX;
               }
               if(_loc5_.boundMaxX > _loc14_)
               {
                  _loc14_ = _loc5_.boundMaxX;
               }
               if(_loc5_.boundMinY < _loc12_)
               {
                  _loc12_ = _loc5_.boundMinY;
               }
               if(_loc5_.boundMaxY > _loc15_)
               {
                  _loc15_ = _loc5_.boundMaxY;
               }
               if(_loc5_.boundMinZ < _loc13_)
               {
                  _loc13_ = _loc5_.boundMinZ;
               }
               if(_loc5_.boundMaxZ > _loc16_)
               {
                  _loc16_ = _loc5_.boundMaxZ;
               }
            }
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < _loc32_)
         {
            _loc4_ = param2[_loc3_];
            _loc5_ = this.createObjectBounds(_loc4_);
            if(_loc5_.boundMinX <= _loc5_.boundMaxX)
            {
               if(!(_loc5_.boundMinX < _loc11_ || _loc5_.boundMaxX > _loc14_ || _loc5_.boundMinY < _loc12_ || _loc5_.boundMaxY > _loc15_ || _loc5_.boundMinZ < _loc13_ || _loc5_.boundMaxZ > _loc16_))
               {
                  if(_loc4_.alternativa3d::_parent != null)
                  {
                     _loc4_.alternativa3d::_parent.removeChild(_loc4_);
                  }
                  _loc4_.alternativa3d::setParent(this);
                  _loc4_.alternativa3d::next = _loc8_;
                  _loc8_ = _loc4_;
                  _loc5_.alternativa3d::next = _loc9_;
                  _loc9_ = _loc5_;
               }
            }
            _loc3_++;
         }
         if(_loc6_ != null)
         {
            this.alternativa3d::root = this.createNode(_loc6_,_loc7_,_loc8_,_loc9_,_loc11_,_loc12_,_loc13_,_loc14_,_loc15_,_loc16_);
            _loc29_ = new Vector.<Vector.<Number>>();
            _loc30_ = new Vector.<Vector.<uint>>();
            _loc29_[0] = new Vector.<Number>();
            _loc30_[0] = new Vector.<uint>();
            this.alternativa3d::root.createReceivers(_loc29_,_loc30_);
            _loc3_ = 0;
            while(_loc3_ < _loc29_.length)
            {
               this.receiversVertexBuffers[_loc3_] = new VertexBufferResource(_loc29_[_loc3_],3);
               this.receiversIndexBuffers[_loc3_] = new IndexBufferResource(_loc30_[_loc3_]);
               _loc3_++;
            }
         }
      }
      
      public function destroyTree() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = undefined;
         var _loc3_:Object3D = null;
         var _loc4_:Mesh = null;
         var _loc5_:BSP = null;
         var _loc6_:TextureMaterial = null;
         for(_loc2_ in this.materials)
         {
            _loc6_ = _loc2_ as TextureMaterial;
            if(_loc6_.texture != null)
            {
               _loc6_.alternativa3d::textureResource.reset();
            }
            if(_loc6_.alternativa3d::_textureATF != null)
            {
               _loc6_.alternativa3d::textureATFResource.reset();
            }
            if(_loc6_.alternativa3d::_textureATFAlpha != null)
            {
               _loc6_.alternativa3d::textureATFAlphaResource.reset();
            }
         }
         _loc3_ = this.opaqueList;
         while(_loc3_ != null)
         {
            if(_loc3_ is Mesh)
            {
               _loc4_ = _loc3_ as Mesh;
               if(_loc4_.alternativa3d::vertexBuffer != null)
               {
                  _loc4_.alternativa3d::vertexBuffer.reset();
               }
               if(_loc4_.alternativa3d::indexBuffer != null)
               {
                  _loc4_.alternativa3d::indexBuffer.reset();
               }
            }
            else if(_loc3_ is BSP)
            {
               _loc5_ = _loc3_ as BSP;
               if(_loc5_.alternativa3d::vertexBuffer != null)
               {
                  _loc5_.alternativa3d::vertexBuffer.reset();
               }
               if(_loc5_.alternativa3d::indexBuffer != null)
               {
                  _loc5_.alternativa3d::indexBuffer.reset();
               }
            }
            _loc3_ = _loc3_.alternativa3d::next;
         }
         _loc1_ = 0;
         while(_loc1_ < this.transparentLength)
         {
            _loc3_ = this.transparent[_loc1_];
            if(_loc3_ is Mesh)
            {
               _loc4_ = _loc3_ as Mesh;
               if(_loc4_.alternativa3d::vertexBuffer != null)
               {
                  _loc4_.alternativa3d::vertexBuffer.reset();
               }
               if(_loc4_.alternativa3d::indexBuffer != null)
               {
                  _loc4_.alternativa3d::indexBuffer.reset();
               }
            }
            else if(_loc3_ is BSP)
            {
               _loc5_ = _loc3_ as BSP;
               if(_loc5_.alternativa3d::vertexBuffer != null)
               {
                  _loc5_.alternativa3d::vertexBuffer.reset();
               }
               if(_loc5_.alternativa3d::indexBuffer != null)
               {
                  _loc5_.alternativa3d::indexBuffer.reset();
               }
            }
            _loc1_++;
         }
         this.materials = new Dictionary();
         this.opaqueList = null;
         this.transparent.length = 0;
         this.transparentLength = 0;
         if(this.alternativa3d::root != null)
         {
            this.destroyNode(this.alternativa3d::root);
            this.alternativa3d::root = null;
         }
         _loc1_ = 0;
         while(_loc1_ < this.receiversVertexBuffers.length)
         {
            VertexBufferResource(this.receiversVertexBuffers[_loc1_]).dispose();
            IndexBufferResource(this.receiversIndexBuffers[_loc1_]).dispose();
            _loc1_++;
         }
         this.receiversVertexBuffers.length = 0;
         this.receiversIndexBuffers.length = 0;
         this.isCreated = false;
      }
      
      override public function intersectRay(param1:Vector3D, param2:Vector3D, param3:Dictionary = null, param4:Camera3D = null) : RayIntersectionData
      {
         var _loc5_:RayIntersectionData = null;
         if(param3 != null && Boolean(param3[this]))
         {
            return null;
         }
         if(!alternativa3d::boundIntersectRay(param1,param2,boundMinX,boundMinY,boundMinZ,boundMaxX,boundMaxY,boundMaxZ))
         {
            return null;
         }
         var _loc6_:RayIntersectionData = super.intersectRay(param1,param2,param3,param4);
         if(this.alternativa3d::root != null && Boolean(alternativa3d::boundIntersectRay(param1,param2,this.alternativa3d::root.boundMinX,this.alternativa3d::root.boundMinY,this.alternativa3d::root.boundMinZ,this.alternativa3d::root.boundMaxX,this.alternativa3d::root.boundMaxY,this.alternativa3d::root.boundMaxZ)))
         {
            _loc5_ = this.intersectRayNode(this.alternativa3d::root,param1,param2,param3,param4);
            if(_loc5_ != null && (_loc6_ == null || _loc5_.time < _loc6_.time))
            {
               _loc6_ = _loc5_;
            }
         }
         return _loc6_;
      }
      
      private function intersectRayNode(param1:KDNode, param2:Vector3D, param3:Vector3D, param4:Dictionary, param5:Camera3D) : RayIntersectionData
      {
         var _loc6_:RayIntersectionData = null;
         var _loc7_:Number = NaN;
         var _loc8_:Object3D = null;
         var _loc9_:Object3D = null;
         var _loc10_:Vector3D = null;
         var _loc11_:Vector3D = null;
         var _loc12_:* = false;
         var _loc13_:* = false;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:RayIntersectionData = null;
         if(param1.negative != null)
         {
            _loc12_ = param1.axis == 0;
            _loc13_ = param1.axis == 1;
            _loc14_ = (_loc12_ ? param2.x : (_loc13_ ? param2.y : param2.z)) - param1.coord;
            if(_loc14_ > 0)
            {
               if(alternativa3d::boundIntersectRay(param2,param3,param1.positive.boundMinX,param1.positive.boundMinY,param1.positive.boundMinZ,param1.positive.boundMaxX,param1.positive.boundMaxY,param1.positive.boundMaxZ))
               {
                  _loc6_ = this.intersectRayNode(param1.positive,param2,param3,param4,param5);
                  if(_loc6_ != null)
                  {
                     return _loc6_;
                  }
               }
               _loc7_ = _loc12_ ? Number(param3.x) : (_loc13_ ? Number(param3.y) : Number(param3.z));
               if(_loc7_ < 0)
               {
                  _loc8_ = param1.objectList;
                  _loc9_ = param1.objectBoundList;
                  while(_loc8_ != null)
                  {
                     if(alternativa3d::boundIntersectRay(param2,param3,_loc9_.boundMinX,_loc9_.boundMinY,_loc9_.boundMinZ,_loc9_.boundMaxX,_loc9_.boundMaxY,_loc9_.boundMaxZ))
                     {
                        _loc8_.alternativa3d::composeMatrix();
                        _loc8_.alternativa3d::invertMatrix();
                        if(_loc10_ == null)
                        {
                           _loc10_ = new Vector3D();
                           _loc11_ = new Vector3D();
                        }
                        _loc10_.x = _loc8_.alternativa3d::ma * param2.x + _loc8_.alternativa3d::mb * param2.y + _loc8_.alternativa3d::mc * param2.z + _loc8_.alternativa3d::md;
                        _loc10_.y = _loc8_.alternativa3d::me * param2.x + _loc8_.alternativa3d::mf * param2.y + _loc8_.alternativa3d::mg * param2.z + _loc8_.alternativa3d::mh;
                        _loc10_.z = _loc8_.alternativa3d::mi * param2.x + _loc8_.alternativa3d::mj * param2.y + _loc8_.alternativa3d::mk * param2.z + _loc8_.alternativa3d::ml;
                        _loc11_.x = _loc8_.alternativa3d::ma * param3.x + _loc8_.alternativa3d::mb * param3.y + _loc8_.alternativa3d::mc * param3.z;
                        _loc11_.y = _loc8_.alternativa3d::me * param3.x + _loc8_.alternativa3d::mf * param3.y + _loc8_.alternativa3d::mg * param3.z;
                        _loc11_.z = _loc8_.alternativa3d::mi * param3.x + _loc8_.alternativa3d::mj * param3.y + _loc8_.alternativa3d::mk * param3.z;
                        _loc6_ = _loc8_.intersectRay(_loc10_,_loc11_,param4,param5);
                        if(_loc6_ != null)
                        {
                           return _loc6_;
                        }
                     }
                     _loc8_ = _loc8_.alternativa3d::next;
                     _loc9_ = _loc9_.alternativa3d::next;
                  }
                  if(alternativa3d::boundIntersectRay(param2,param3,param1.negative.boundMinX,param1.negative.boundMinY,param1.negative.boundMinZ,param1.negative.boundMaxX,param1.negative.boundMaxY,param1.negative.boundMaxZ))
                  {
                     return this.intersectRayNode(param1.negative,param2,param3,param4,param5);
                  }
               }
            }
            else
            {
               if(alternativa3d::boundIntersectRay(param2,param3,param1.negative.boundMinX,param1.negative.boundMinY,param1.negative.boundMinZ,param1.negative.boundMaxX,param1.negative.boundMaxY,param1.negative.boundMaxZ))
               {
                  _loc6_ = this.intersectRayNode(param1.negative,param2,param3,param4,param5);
                  if(_loc6_ != null)
                  {
                     return _loc6_;
                  }
               }
               _loc7_ = _loc12_ ? Number(param3.x) : (_loc13_ ? Number(param3.y) : Number(param3.z));
               if(_loc7_ > 0)
               {
                  _loc8_ = param1.objectList;
                  _loc9_ = param1.objectBoundList;
                  while(_loc8_ != null)
                  {
                     if(alternativa3d::boundIntersectRay(param2,param3,_loc9_.boundMinX,_loc9_.boundMinY,_loc9_.boundMinZ,_loc9_.boundMaxX,_loc9_.boundMaxY,_loc9_.boundMaxZ))
                     {
                        _loc8_.alternativa3d::composeMatrix();
                        _loc8_.alternativa3d::invertMatrix();
                        if(_loc10_ == null)
                        {
                           _loc10_ = new Vector3D();
                           _loc11_ = new Vector3D();
                        }
                        _loc10_.x = _loc8_.alternativa3d::ma * param2.x + _loc8_.alternativa3d::mb * param2.y + _loc8_.alternativa3d::mc * param2.z + _loc8_.alternativa3d::md;
                        _loc10_.y = _loc8_.alternativa3d::me * param2.x + _loc8_.alternativa3d::mf * param2.y + _loc8_.alternativa3d::mg * param2.z + _loc8_.alternativa3d::mh;
                        _loc10_.z = _loc8_.alternativa3d::mi * param2.x + _loc8_.alternativa3d::mj * param2.y + _loc8_.alternativa3d::mk * param2.z + _loc8_.alternativa3d::ml;
                        _loc11_.x = _loc8_.alternativa3d::ma * param3.x + _loc8_.alternativa3d::mb * param3.y + _loc8_.alternativa3d::mc * param3.z;
                        _loc11_.y = _loc8_.alternativa3d::me * param3.x + _loc8_.alternativa3d::mf * param3.y + _loc8_.alternativa3d::mg * param3.z;
                        _loc11_.z = _loc8_.alternativa3d::mi * param3.x + _loc8_.alternativa3d::mj * param3.y + _loc8_.alternativa3d::mk * param3.z;
                        _loc6_ = _loc8_.intersectRay(_loc10_,_loc11_,param4,param5);
                        if(_loc6_ != null)
                        {
                           return _loc6_;
                        }
                     }
                     _loc8_ = _loc8_.alternativa3d::next;
                     _loc9_ = _loc9_.alternativa3d::next;
                  }
                  if(alternativa3d::boundIntersectRay(param2,param3,param1.positive.boundMinX,param1.positive.boundMinY,param1.positive.boundMinZ,param1.positive.boundMaxX,param1.positive.boundMaxY,param1.positive.boundMaxZ))
                  {
                     return this.intersectRayNode(param1.positive,param2,param3,param4,param5);
                  }
               }
            }
            return null;
         }
         _loc15_ = 1e+22;
         _loc8_ = param1.objectList;
         while(_loc8_ != null)
         {
            _loc8_.alternativa3d::composeMatrix();
            _loc8_.alternativa3d::invertMatrix();
            if(_loc10_ == null)
            {
               _loc10_ = new Vector3D();
               _loc11_ = new Vector3D();
            }
            _loc10_.x = _loc8_.alternativa3d::ma * param2.x + _loc8_.alternativa3d::mb * param2.y + _loc8_.alternativa3d::mc * param2.z + _loc8_.alternativa3d::md;
            _loc10_.y = _loc8_.alternativa3d::me * param2.x + _loc8_.alternativa3d::mf * param2.y + _loc8_.alternativa3d::mg * param2.z + _loc8_.alternativa3d::mh;
            _loc10_.z = _loc8_.alternativa3d::mi * param2.x + _loc8_.alternativa3d::mj * param2.y + _loc8_.alternativa3d::mk * param2.z + _loc8_.alternativa3d::ml;
            _loc11_.x = _loc8_.alternativa3d::ma * param3.x + _loc8_.alternativa3d::mb * param3.y + _loc8_.alternativa3d::mc * param3.z;
            _loc11_.y = _loc8_.alternativa3d::me * param3.x + _loc8_.alternativa3d::mf * param3.y + _loc8_.alternativa3d::mg * param3.z;
            _loc11_.z = _loc8_.alternativa3d::mi * param3.x + _loc8_.alternativa3d::mj * param3.y + _loc8_.alternativa3d::mk * param3.z;
            _loc6_ = _loc8_.intersectRay(_loc10_,_loc11_,param4,param5);
            if(_loc6_ != null && _loc6_.time < _loc15_)
            {
               _loc15_ = _loc6_.time;
               _loc16_ = _loc6_;
            }
            _loc8_ = _loc8_.alternativa3d::next;
         }
         return _loc16_;
      }
      
      override alternativa3d function checkIntersection(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Dictionary) : Boolean
      {
         if(super.alternativa3d::checkIntersection(param1,param2,param3,param4,param5,param6,param7,param8))
         {
            return true;
         }
         if(this.alternativa3d::root != null && Boolean(alternativa3d::boundCheckIntersection(param1,param2,param3,param4,param5,param6,param7,this.alternativa3d::root.boundMinX,this.alternativa3d::root.boundMinY,this.alternativa3d::root.boundMinZ,this.alternativa3d::root.boundMaxX,this.alternativa3d::root.boundMaxY,this.alternativa3d::root.boundMaxZ)))
         {
            return this.checkIntersectionNode(this.alternativa3d::root,param1,param2,param3,param4,param5,param6,param7,param8);
         }
         return false;
      }
      
      private function checkIntersectionNode(param1:KDNode, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Dictionary) : Boolean
      {
         var _loc10_:Object3D = null;
         var _loc11_:Object3D = null;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:* = false;
         var _loc20_:* = false;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         if(param1.negative != null)
         {
            _loc19_ = param1.axis == 0;
            _loc20_ = param1.axis == 1;
            _loc21_ = (_loc19_ ? param2 : (_loc20_ ? param3 : param4)) - param1.coord;
            _loc22_ = _loc19_ ? Number(param5) : (_loc20_ ? Number(param6) : Number(param7));
            if(_loc21_ > 0)
            {
               if(_loc22_ < 0)
               {
                  _loc18_ = -_loc21_ / _loc22_;
                  if(_loc18_ < param8)
                  {
                     _loc10_ = param1.objectList;
                     _loc11_ = param1.objectBoundList;
                     while(_loc10_ != null)
                     {
                        if(alternativa3d::boundCheckIntersection(param2,param3,param4,param5,param6,param7,param8,_loc11_.boundMinX,_loc11_.boundMinY,_loc11_.boundMinZ,_loc11_.boundMaxX,_loc11_.boundMaxY,_loc11_.boundMaxZ))
                        {
                           _loc10_.alternativa3d::composeMatrix();
                           _loc10_.alternativa3d::invertMatrix();
                           _loc12_ = _loc10_.alternativa3d::ma * param2 + _loc10_.alternativa3d::mb * param3 + _loc10_.alternativa3d::mc * param4 + _loc10_.alternativa3d::md;
                           _loc13_ = _loc10_.alternativa3d::me * param2 + _loc10_.alternativa3d::mf * param3 + _loc10_.alternativa3d::mg * param4 + _loc10_.alternativa3d::mh;
                           _loc14_ = _loc10_.alternativa3d::mi * param2 + _loc10_.alternativa3d::mj * param3 + _loc10_.alternativa3d::mk * param4 + _loc10_.alternativa3d::ml;
                           _loc15_ = _loc10_.alternativa3d::ma * param5 + _loc10_.alternativa3d::mb * param6 + _loc10_.alternativa3d::mc * param7;
                           _loc16_ = _loc10_.alternativa3d::me * param5 + _loc10_.alternativa3d::mf * param6 + _loc10_.alternativa3d::mg * param7;
                           _loc17_ = _loc10_.alternativa3d::mi * param5 + _loc10_.alternativa3d::mj * param6 + _loc10_.alternativa3d::mk * param7;
                           if(_loc10_.alternativa3d::checkIntersection(_loc12_,_loc13_,_loc14_,_loc15_,_loc16_,_loc17_,param8,param9))
                           {
                              return true;
                           }
                        }
                        _loc10_ = _loc10_.alternativa3d::next;
                        _loc11_ = _loc11_.alternativa3d::next;
                     }
                     if(Boolean(alternativa3d::boundCheckIntersection(param2,param3,param4,param5,param6,param7,param8,param1.negative.boundMinX,param1.negative.boundMinY,param1.negative.boundMinZ,param1.negative.boundMaxX,param1.negative.boundMaxY,param1.negative.boundMaxZ)) && this.checkIntersectionNode(param1.negative,param2,param3,param4,param5,param6,param7,param8,param9))
                     {
                        return true;
                     }
                  }
               }
               return Boolean(alternativa3d::boundCheckIntersection(param2,param3,param4,param5,param6,param7,param8,param1.positive.boundMinX,param1.positive.boundMinY,param1.positive.boundMinZ,param1.positive.boundMaxX,param1.positive.boundMaxY,param1.positive.boundMaxZ)) && this.checkIntersectionNode(param1.positive,param2,param3,param4,param5,param6,param7,param8,param9);
            }
            if(_loc22_ > 0)
            {
               _loc18_ = -_loc21_ / _loc22_;
               if(_loc18_ < param8)
               {
                  _loc10_ = param1.objectList;
                  _loc11_ = param1.objectBoundList;
                  while(_loc10_ != null)
                  {
                     if(alternativa3d::boundCheckIntersection(param2,param3,param4,param5,param6,param7,param8,_loc11_.boundMinX,_loc11_.boundMinY,_loc11_.boundMinZ,_loc11_.boundMaxX,_loc11_.boundMaxY,_loc11_.boundMaxZ))
                     {
                        _loc10_.alternativa3d::composeMatrix();
                        _loc10_.alternativa3d::invertMatrix();
                        _loc12_ = _loc10_.alternativa3d::ma * param2 + _loc10_.alternativa3d::mb * param3 + _loc10_.alternativa3d::mc * param4 + _loc10_.alternativa3d::md;
                        _loc13_ = _loc10_.alternativa3d::me * param2 + _loc10_.alternativa3d::mf * param3 + _loc10_.alternativa3d::mg * param4 + _loc10_.alternativa3d::mh;
                        _loc14_ = _loc10_.alternativa3d::mi * param2 + _loc10_.alternativa3d::mj * param3 + _loc10_.alternativa3d::mk * param4 + _loc10_.alternativa3d::ml;
                        _loc15_ = _loc10_.alternativa3d::ma * param5 + _loc10_.alternativa3d::mb * param6 + _loc10_.alternativa3d::mc * param7;
                        _loc16_ = _loc10_.alternativa3d::me * param5 + _loc10_.alternativa3d::mf * param6 + _loc10_.alternativa3d::mg * param7;
                        _loc17_ = _loc10_.alternativa3d::mi * param5 + _loc10_.alternativa3d::mj * param6 + _loc10_.alternativa3d::mk * param7;
                        if(_loc10_.alternativa3d::checkIntersection(_loc12_,_loc13_,_loc14_,_loc15_,_loc16_,_loc17_,param8,param9))
                        {
                           return true;
                        }
                     }
                     _loc10_ = _loc10_.alternativa3d::next;
                     _loc11_ = _loc11_.alternativa3d::next;
                  }
                  if(Boolean(alternativa3d::boundCheckIntersection(param2,param3,param4,param5,param6,param7,param8,param1.positive.boundMinX,param1.positive.boundMinY,param1.positive.boundMinZ,param1.positive.boundMaxX,param1.positive.boundMaxY,param1.positive.boundMaxZ)) && this.checkIntersectionNode(param1.positive,param2,param3,param4,param5,param6,param7,param8,param9))
                  {
                     return true;
                  }
               }
            }
            return Boolean(alternativa3d::boundCheckIntersection(param2,param3,param4,param5,param6,param7,param8,param1.negative.boundMinX,param1.negative.boundMinY,param1.negative.boundMinZ,param1.negative.boundMaxX,param1.negative.boundMaxY,param1.negative.boundMaxZ)) && this.checkIntersectionNode(param1.negative,param2,param3,param4,param5,param6,param7,param8,param9);
         }
         _loc10_ = param1.objectList;
         while(_loc10_ != null)
         {
            _loc10_.alternativa3d::composeMatrix();
            _loc10_.alternativa3d::invertMatrix();
            _loc12_ = _loc10_.alternativa3d::ma * param2 + _loc10_.alternativa3d::mb * param3 + _loc10_.alternativa3d::mc * param4 + _loc10_.alternativa3d::md;
            _loc13_ = _loc10_.alternativa3d::me * param2 + _loc10_.alternativa3d::mf * param3 + _loc10_.alternativa3d::mg * param4 + _loc10_.alternativa3d::mh;
            _loc14_ = _loc10_.alternativa3d::mi * param2 + _loc10_.alternativa3d::mj * param3 + _loc10_.alternativa3d::mk * param4 + _loc10_.alternativa3d::ml;
            _loc15_ = _loc10_.alternativa3d::ma * param5 + _loc10_.alternativa3d::mb * param6 + _loc10_.alternativa3d::mc * param7;
            _loc16_ = _loc10_.alternativa3d::me * param5 + _loc10_.alternativa3d::mf * param6 + _loc10_.alternativa3d::mg * param7;
            _loc17_ = _loc10_.alternativa3d::mi * param5 + _loc10_.alternativa3d::mj * param6 + _loc10_.alternativa3d::mk * param7;
            if(_loc10_.alternativa3d::checkIntersection(_loc12_,_loc13_,_loc14_,_loc15_,_loc16_,_loc17_,param8,param9))
            {
               return true;
            }
            _loc10_ = _loc10_.alternativa3d::next;
         }
         return false;
      }
      
      override alternativa3d function collectPlanes(param1:Vector3D, param2:Vector3D, param3:Vector3D, param4:Vector3D, param5:Vector3D, param6:Vector.<Face>, param7:Dictionary = null) : void
      {
         var _loc8_:Object3D = null;
         if(param7 != null && Boolean(param7[this]))
         {
            return;
         }
         var _loc9_:Vector3D = alternativa3d::calculateSphere(param1,param2,param3,param4,param5,treeSphere);
         if(!this.ignoreChildrenInCollider)
         {
            if(!alternativa3d::boundIntersectSphere(_loc9_,boundMinX,boundMinY,boundMinZ,boundMaxX,boundMaxY,boundMaxZ))
            {
               _loc9_ = null;
               return;
            }
            _loc9_ = null;
            _loc8_ = alternativa3d::childrenList;
            while(_loc8_ != null)
            {
               _loc8_.alternativa3d::composeAndAppend(this);
               _loc8_.alternativa3d::collectPlanes(param1,param2,param3,param4,param5,param6,param7);
               _loc8_ = _loc8_.alternativa3d::next;
            }
         }
         if(this.alternativa3d::root != null && Boolean(alternativa3d::boundIntersectSphere(_loc9_,this.alternativa3d::root.boundMinX,this.alternativa3d::root.boundMinY,this.alternativa3d::root.boundMinZ,this.alternativa3d::root.boundMaxX,this.alternativa3d::root.boundMaxY,this.alternativa3d::root.boundMaxZ)))
         {
            this.collectPlanesNode(this.alternativa3d::root,_loc9_,param1,param2,param3,param4,param5,param6,param7);
         }
      }
      
      private function collectPlanesNode(param1:KDNode, param2:Vector3D, param3:Vector3D, param4:Vector3D, param5:Vector3D, param6:Vector3D, param7:Vector3D, param8:Vector.<Face>, param9:Dictionary = null) : void
      {
         var _loc10_:Object3D = null;
         var _loc11_:Object3D = null;
         var _loc12_:* = false;
         var _loc13_:* = false;
         var _loc14_:Number = NaN;
         if(param1.negative != null)
         {
            _loc12_ = param1.axis == 0;
            _loc13_ = param1.axis == 1;
            _loc14_ = (_loc12_ ? param2.x : (_loc13_ ? param2.y : param2.z)) - param1.coord;
            if(_loc14_ >= param2.w)
            {
               if(alternativa3d::boundIntersectSphere(param2,param1.positive.boundMinX,param1.positive.boundMinY,param1.positive.boundMinZ,param1.positive.boundMaxX,param1.positive.boundMaxY,param1.positive.boundMaxZ))
               {
                  this.collectPlanesNode(param1.positive,param2,param3,param4,param5,param6,param7,param8,param9);
               }
            }
            else if(_loc14_ <= -param2.w)
            {
               if(alternativa3d::boundIntersectSphere(param2,param1.negative.boundMinX,param1.negative.boundMinY,param1.negative.boundMinZ,param1.negative.boundMaxX,param1.negative.boundMaxY,param1.negative.boundMaxZ))
               {
                  this.collectPlanesNode(param1.negative,param2,param3,param4,param5,param6,param7,param8,param9);
               }
            }
            else
            {
               _loc10_ = param1.objectList;
               _loc11_ = param1.objectBoundList;
               while(_loc10_ != null)
               {
                  if(alternativa3d::boundIntersectSphere(param2,_loc11_.boundMinX,_loc11_.boundMinY,_loc11_.boundMinZ,_loc11_.boundMaxX,_loc11_.boundMaxY,_loc11_.boundMaxZ))
                  {
                     _loc10_.alternativa3d::composeAndAppend(this);
                     _loc10_.alternativa3d::collectPlanes(param3,param4,param5,param6,param7,param8,param9);
                  }
                  _loc10_ = _loc10_.alternativa3d::next;
                  _loc11_ = _loc11_.alternativa3d::next;
               }
               if(alternativa3d::boundIntersectSphere(param2,param1.positive.boundMinX,param1.positive.boundMinY,param1.positive.boundMinZ,param1.positive.boundMaxX,param1.positive.boundMaxY,param1.positive.boundMaxZ))
               {
                  this.collectPlanesNode(param1.positive,param2,param3,param4,param5,param6,param7,param8,param9);
               }
               if(alternativa3d::boundIntersectSphere(param2,param1.negative.boundMinX,param1.negative.boundMinY,param1.negative.boundMinZ,param1.negative.boundMaxX,param1.negative.boundMaxY,param1.negative.boundMaxZ))
               {
                  this.collectPlanesNode(param1.negative,param2,param3,param4,param5,param6,param7,param8,param9);
               }
            }
         }
         else
         {
            _loc10_ = param1.objectList;
            while(_loc10_ != null)
            {
               _loc10_.alternativa3d::composeAndAppend(this);
               _loc10_.alternativa3d::collectPlanes(param3,param4,param5,param6,param7,param8,param9);
               _loc10_ = _loc10_.alternativa3d::next;
            }
         }
      }
      
      public function createDecal(param1:Vector3D, param2:Vector3D, param3:Number, param4:Number, param5:Number, param6:Number, param7:Material) : Decal
      {
         var _loc8_:Decal;
         (_loc8_ = new Decal()).attenuation = param6;
         var _loc9_:Matrix3D = new Matrix3D();
         _loc9_.appendRotation(param4 * 180 / Math.PI,Vector3D.Z_AXIS);
         _loc9_.appendRotation(Math.atan2(-param2.z,Math.sqrt(param2.x * param2.x + param2.y * param2.y)) * 180 / Math.PI - 90,Vector3D.X_AXIS);
         _loc9_.appendRotation(-Math.atan2(-param2.x,-param2.y) * 180 / Math.PI,Vector3D.Z_AXIS);
         _loc9_.appendTranslation(param1.x,param1.y,param1.z);
         _loc8_.matrix = _loc9_;
         _loc8_.alternativa3d::composeMatrix();
         _loc8_.boundMinX = -param3;
         _loc8_.boundMaxX = param3;
         _loc8_.boundMinY = -param3;
         _loc8_.boundMaxY = param3;
         _loc8_.boundMinZ = -param6;
         _loc8_.boundMaxZ = param6;
         var _loc10_:Number = 1e+22;
         var _loc11_:Number = 1e+22;
         var _loc12_:Number = 1e+22;
         var _loc13_:Number = -1e+22;
         var _loc14_:Number = -1e+22;
         var _loc15_:Number = -1e+22;
         var _loc16_:Vertex;
         (_loc16_ = alternativa3d::boundVertexList).x = _loc8_.boundMinX;
         _loc16_.y = _loc8_.boundMinY;
         _loc16_.z = _loc8_.boundMinZ;
         (_loc16_ = _loc16_.alternativa3d::next).x = _loc8_.boundMaxX;
         _loc16_.y = _loc8_.boundMinY;
         _loc16_.z = _loc8_.boundMinZ;
         (_loc16_ = _loc16_.alternativa3d::next).x = _loc8_.boundMinX;
         _loc16_.y = _loc8_.boundMaxY;
         _loc16_.z = _loc8_.boundMinZ;
         (_loc16_ = _loc16_.alternativa3d::next).x = _loc8_.boundMaxX;
         _loc16_.y = _loc8_.boundMaxY;
         _loc16_.z = _loc8_.boundMinZ;
         (_loc16_ = _loc16_.alternativa3d::next).x = _loc8_.boundMinX;
         _loc16_.y = _loc8_.boundMinY;
         _loc16_.z = _loc8_.boundMaxZ;
         (_loc16_ = _loc16_.alternativa3d::next).x = _loc8_.boundMaxX;
         _loc16_.y = _loc8_.boundMinY;
         _loc16_.z = _loc8_.boundMaxZ;
         (_loc16_ = _loc16_.alternativa3d::next).x = _loc8_.boundMinX;
         _loc16_.y = _loc8_.boundMaxY;
         _loc16_.z = _loc8_.boundMaxZ;
         (_loc16_ = _loc16_.alternativa3d::next).x = _loc8_.boundMaxX;
         _loc16_.y = _loc8_.boundMaxY;
         _loc16_.z = _loc8_.boundMaxZ;
         _loc16_ = alternativa3d::boundVertexList;
         while(_loc16_ != null)
         {
            _loc16_.alternativa3d::cameraX = _loc8_.alternativa3d::ma * _loc16_.x + _loc8_.alternativa3d::mb * _loc16_.y + _loc8_.alternativa3d::mc * _loc16_.z + _loc8_.alternativa3d::md;
            _loc16_.alternativa3d::cameraY = _loc8_.alternativa3d::me * _loc16_.x + _loc8_.alternativa3d::mf * _loc16_.y + _loc8_.alternativa3d::mg * _loc16_.z + _loc8_.alternativa3d::mh;
            _loc16_.alternativa3d::cameraZ = _loc8_.alternativa3d::mi * _loc16_.x + _loc8_.alternativa3d::mj * _loc16_.y + _loc8_.alternativa3d::mk * _loc16_.z + _loc8_.alternativa3d::ml;
            if(_loc16_.alternativa3d::cameraX < _loc10_)
            {
               _loc10_ = _loc16_.alternativa3d::cameraX;
            }
            if(_loc16_.alternativa3d::cameraX > _loc13_)
            {
               _loc13_ = _loc16_.alternativa3d::cameraX;
            }
            if(_loc16_.alternativa3d::cameraY < _loc11_)
            {
               _loc11_ = _loc16_.alternativa3d::cameraY;
            }
            if(_loc16_.alternativa3d::cameraY > _loc14_)
            {
               _loc14_ = _loc16_.alternativa3d::cameraY;
            }
            if(_loc16_.alternativa3d::cameraZ < _loc12_)
            {
               _loc12_ = _loc16_.alternativa3d::cameraZ;
            }
            if(_loc16_.alternativa3d::cameraZ > _loc15_)
            {
               _loc15_ = _loc16_.alternativa3d::cameraZ;
            }
            _loc16_ = _loc16_.alternativa3d::next;
         }
         _loc8_.alternativa3d::invertMatrix();
         if(param5 > Math.PI / 2)
         {
            param5 = Math.PI / 2;
         }
         if(this.alternativa3d::root != null)
         {
            this.alternativa3d::root.collectPolygons(_loc8_,Math.sqrt(param3 * param3 + param3 * param3 + param6 * param6),Math.cos(param5) - 0.001,_loc10_,_loc13_,_loc11_,_loc14_,_loc12_,_loc15_);
         }
         if(_loc8_.alternativa3d::faceList != null)
         {
            _loc8_.calculateBounds();
         }
         else
         {
            _loc8_.boundMinX = -1;
            _loc8_.boundMinY = -1;
            _loc8_.boundMinZ = -1;
            _loc8_.boundMaxX = 1;
            _loc8_.boundMaxY = 1;
            _loc8_.boundMaxZ = 1;
         }
         _loc8_.setMaterialToAllFaces(param7);
         return _loc8_;
      }
      
      override public function clone() : Object3D
      {
         var _loc1_:KDContainer = new KDContainer();
         _loc1_.clonePropertiesFrom(this);
         return _loc1_;
      }
      
      override protected function clonePropertiesFrom(param1:Object3D) : void
      {
         super.clonePropertiesFrom(param1);
         var _loc2_:KDContainer = param1 as KDContainer;
         this.debugAlphaFade = _loc2_.debugAlphaFade;
         if(_loc2_.alternativa3d::root != null)
         {
            this.alternativa3d::root = _loc2_.cloneNode(_loc2_.alternativa3d::root,this);
         }
      }
      
      private function cloneNode(param1:KDNode, param2:Object3DContainer) : KDNode
      {
         var _loc3_:Object3D = null;
         var _loc4_:Object3D = null;
         var _loc5_:Object3D = null;
         var _loc6_:KDNode;
         (_loc6_ = new KDNode()).axis = param1.axis;
         _loc6_.coord = param1.coord;
         _loc6_.minCoord = param1.minCoord;
         _loc6_.maxCoord = param1.maxCoord;
         _loc6_.boundMinX = param1.boundMinX;
         _loc6_.boundMinY = param1.boundMinY;
         _loc6_.boundMinZ = param1.boundMinZ;
         _loc6_.boundMaxX = param1.boundMaxX;
         _loc6_.boundMaxY = param1.boundMaxY;
         _loc6_.boundMaxZ = param1.boundMaxZ;
         _loc3_ = param1.objectList;
         _loc4_ = null;
         while(_loc3_ != null)
         {
            _loc5_ = _loc3_.clone();
            if(_loc6_.objectList != null)
            {
               _loc4_.alternativa3d::next = _loc5_;
            }
            else
            {
               _loc6_.objectList = _loc5_;
            }
            _loc4_ = _loc5_;
            _loc5_.alternativa3d::setParent(param2);
            _loc3_ = _loc3_.alternativa3d::next;
         }
         _loc3_ = param1.objectBoundList;
         _loc4_ = null;
         while(_loc3_ != null)
         {
            _loc5_ = _loc3_.clone();
            if(_loc6_.objectBoundList != null)
            {
               _loc4_.alternativa3d::next = _loc5_;
            }
            else
            {
               _loc6_.objectBoundList = _loc5_;
            }
            _loc4_ = _loc5_;
            _loc3_ = _loc3_.alternativa3d::next;
         }
         _loc3_ = param1.occluderList;
         _loc4_ = null;
         while(_loc3_ != null)
         {
            _loc5_ = _loc3_.clone();
            if(_loc6_.occluderList != null)
            {
               _loc4_.alternativa3d::next = _loc5_;
            }
            else
            {
               _loc6_.occluderList = _loc5_;
            }
            _loc4_ = _loc5_;
            _loc5_.alternativa3d::setParent(param2);
            _loc3_ = _loc3_.alternativa3d::next;
         }
         _loc3_ = param1.occluderBoundList;
         _loc4_ = null;
         while(_loc3_ != null)
         {
            _loc5_ = _loc3_.clone();
            if(_loc6_.occluderBoundList != null)
            {
               _loc4_.alternativa3d::next = _loc5_;
            }
            else
            {
               _loc6_.occluderBoundList = _loc5_;
            }
            _loc4_ = _loc5_;
            _loc3_ = _loc3_.alternativa3d::next;
         }
         if(param1.negative != null)
         {
            _loc6_.negative = this.cloneNode(param1.negative,param2);
         }
         if(param1.positive != null)
         {
            _loc6_.positive = this.cloneNode(param1.positive,param2);
         }
         return _loc6_;
      }
      
      override alternativa3d function draw(param1:Camera3D) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Object3D = null;
         var _loc4_:VG = null;
         var _loc5_:VG = null;
         var _loc6_:Boolean = false;
         var _loc7_:Object3D = null;
         var _loc8_:VG = null;
         var _loc9_:int = 0;
         var _loc10_:Vertex = null;
         var _loc11_:Vertex = null;
         var _loc12_:ShadowAtlas = null;
         this.uploadResources(param1.alternativa3d::device);
         alternativa3d::calculateInverseMatrix();
         var _loc13_:int = param1.debug ? int(param1.alternativa3d::checkInDebug(this)) : int(0);
         if(_loc13_ & Debug.BOUNDS)
         {
            Debug.drawBounds(param1,this,boundMinX,boundMinY,boundMinZ,boundMaxX,boundMaxY,boundMaxZ);
         }
         if(this.batched)
         {
            _loc6_ = param1.debug;
            if(Boolean(_loc13_) && Boolean(_loc13_ & Debug.NODES))
            {
               param1.debug = false;
            }
            _loc3_ = this.opaqueList;
            while(_loc3_ != null)
            {
               _loc3_.alternativa3d::ma = alternativa3d::ma;
               _loc3_.alternativa3d::mb = alternativa3d::mb;
               _loc3_.alternativa3d::mc = alternativa3d::mc;
               _loc3_.alternativa3d::md = alternativa3d::md;
               _loc3_.alternativa3d::me = alternativa3d::me;
               _loc3_.alternativa3d::mf = alternativa3d::mf;
               _loc3_.alternativa3d::mg = alternativa3d::mg;
               _loc3_.alternativa3d::mh = alternativa3d::mh;
               _loc3_.alternativa3d::mi = alternativa3d::mi;
               _loc3_.alternativa3d::mj = alternativa3d::mj;
               _loc3_.alternativa3d::mk = alternativa3d::mk;
               _loc3_.alternativa3d::ml = alternativa3d::ml;
               _loc3_.alternativa3d::concat(this);
               _loc3_.alternativa3d::draw(param1);
               if(!param1.view.alternativa3d::constrained && param1.shadowMap != null && param1.shadowMapStrength > 0 && _loc3_.alternativa3d::concatenatedAlpha >= _loc3_.shadowMapAlphaThreshold)
               {
                  param1.alternativa3d::casterObjects[param1.alternativa3d::casterCount] = _loc3_;
                  ++param1.alternativa3d::casterCount;
               }
               _loc3_ = _loc3_.alternativa3d::next;
            }
            param1.debug = _loc6_;
            _loc5_ = super.alternativa3d::getVG(param1);
            if(!param1.view.alternativa3d::constrained && param1.shadowMap != null && param1.shadowMapStrength > 0)
            {
               _loc3_ = alternativa3d::childrenList;
               while(_loc3_ != null)
               {
                  if(_loc3_.visible)
                  {
                     if(_loc3_ is Mesh || _loc3_ is BSP || _loc3_ is Sprite3D)
                     {
                        if(_loc3_.alternativa3d::concatenatedAlpha >= _loc3_.shadowMapAlphaThreshold)
                        {
                           param1.alternativa3d::casterObjects[param1.alternativa3d::casterCount] = _loc3_;
                           ++param1.alternativa3d::casterCount;
                        }
                     }
                     else if(_loc3_ is Object3DContainer)
                     {
                        _loc7_ = Object3DContainer(_loc3_).alternativa3d::childrenList;
                        while(_loc7_ != null)
                        {
                           if((_loc7_ is Mesh || _loc7_ is BSP || _loc7_ is Sprite3D) && _loc7_.alternativa3d::concatenatedAlpha >= _loc7_.shadowMapAlphaThreshold)
                           {
                              param1.alternativa3d::casterObjects[param1.alternativa3d::casterCount] = _loc7_;
                              ++param1.alternativa3d::casterCount;
                           }
                           _loc7_ = _loc7_.alternativa3d::next;
                        }
                     }
                  }
                  _loc3_ = _loc3_.alternativa3d::next;
               }
            }
            _loc2_ = 0;
            while(_loc2_ < this.transparentLength)
            {
               _loc3_ = this.transparent[_loc2_];
               _loc3_.alternativa3d::composeAndAppend(this);
               if(_loc3_.alternativa3d::cullingInCamera(param1,alternativa3d::culling) >= 0)
               {
                  _loc3_.alternativa3d::concat(this);
                  _loc8_ = _loc3_.alternativa3d::getVG(param1);
                  if(_loc8_ != null)
                  {
                     _loc8_.alternativa3d::next = _loc5_;
                     _loc5_ = _loc8_;
                  }
               }
               if(!param1.view.alternativa3d::constrained && param1.shadowMap != null && param1.shadowMapStrength > 0 && _loc3_.alternativa3d::concatenatedAlpha >= _loc3_.shadowMapAlphaThreshold)
               {
                  param1.alternativa3d::casterObjects[param1.alternativa3d::casterCount] = _loc3_;
                  ++param1.alternativa3d::casterCount;
               }
               _loc2_++;
            }
            if(_loc5_ != null)
            {
               if(_loc5_.alternativa3d::next != null)
               {
                  if(resolveByAABB)
                  {
                     _loc4_ = _loc5_;
                     while(_loc4_ != null)
                     {
                        _loc4_.alternativa3d::calculateAABB(alternativa3d::ima,alternativa3d::imb,alternativa3d::imc,alternativa3d::imd,alternativa3d::ime,alternativa3d::imf,alternativa3d::img,alternativa3d::imh,alternativa3d::imi,alternativa3d::imj,alternativa3d::imk,alternativa3d::iml);
                        _loc4_ = _loc4_.alternativa3d::next;
                     }
                     alternativa3d::drawAABBGeometry(param1,_loc5_);
                  }
                  else if(resolveByOOBB)
                  {
                     _loc4_ = _loc5_;
                     while(_loc4_ != null)
                     {
                        _loc4_.alternativa3d::calculateOOBB(this);
                        _loc4_ = _loc4_.alternativa3d::next;
                     }
                     alternativa3d::drawOOBBGeometry(param1,_loc5_);
                  }
                  else
                  {
                     alternativa3d::drawConflictGeometry(param1,_loc5_);
                  }
               }
               else
               {
                  _loc5_.alternativa3d::draw(param1,threshold,this);
                  _loc5_.alternativa3d::destroy();
               }
            }
         }
         else if(this.alternativa3d::root != null)
         {
            this.calculateCameraPlanes(param1.nearClipping,param1.farClipping);
            _loc9_ = this.cullingInContainer(alternativa3d::culling,this.alternativa3d::root.boundMinX,this.alternativa3d::root.boundMinY,this.alternativa3d::root.boundMinZ,this.alternativa3d::root.boundMaxX,this.alternativa3d::root.boundMaxY,this.alternativa3d::root.boundMaxZ);
            if(_loc9_ >= 0)
            {
               this.numOccluders = 0;
               if(param1.alternativa3d::numOccluders > 0)
               {
                  this.updateOccluders(param1);
               }
               _loc4_ = _loc5_ = super.alternativa3d::getVG(param1);
               while(_loc4_ != null)
               {
                  _loc4_.alternativa3d::calculateAABB(alternativa3d::ima,alternativa3d::imb,alternativa3d::imc,alternativa3d::imd,alternativa3d::ime,alternativa3d::imf,alternativa3d::img,alternativa3d::imh,alternativa3d::imi,alternativa3d::imj,alternativa3d::imk,alternativa3d::iml);
                  _loc4_ = _loc4_.alternativa3d::next;
               }
               this.drawNode(this.alternativa3d::root,_loc9_,param1,_loc5_);
               _loc2_ = 0;
               while(_loc2_ < this.numOccluders)
               {
                  _loc11_ = _loc10_ = this.occluders[_loc2_];
                  while(_loc11_.alternativa3d::next != null)
                  {
                     _loc11_ = _loc11_.alternativa3d::next;
                  }
                  _loc11_.alternativa3d::next = Vertex.alternativa3d::collector;
                  Vertex.alternativa3d::collector = _loc10_;
                  this.occluders[_loc2_] = null;
                  _loc2_++;
               }
               this.numOccluders = 0;
            }
            else
            {
               super.alternativa3d::draw(param1);
            }
         }
         else
         {
            super.alternativa3d::draw(param1);
         }
         if(this.alternativa3d::root != null && Boolean(_loc13_ & Debug.NODES))
         {
            this.debugNode(this.alternativa3d::root,_loc9_,param1,1);
            Debug.drawBounds(param1,this,this.alternativa3d::root.boundMinX,this.alternativa3d::root.boundMinY,this.alternativa3d::root.boundMinZ,this.alternativa3d::root.boundMaxX,this.alternativa3d::root.boundMaxY,this.alternativa3d::root.boundMaxZ,14496733);
         }
         if(this.alternativa3d::root != null)
         {
            param1.alternativa3d::receiversVertexBuffers = this.receiversVertexBuffers;
            param1.alternativa3d::receiversIndexBuffers = this.receiversIndexBuffers;
            for each(_loc12_ in param1.alternativa3d::shadowAtlases)
            {
               _loc2_ = 0;
               while(_loc2_ < _loc12_.alternativa3d::shadowsCount)
               {
                  this.alternativa3d::root.collectReceivers(_loc12_.alternativa3d::shadows[_loc2_]);
                  _loc2_++;
               }
            }
         }
      }
      
      override alternativa3d function getVG(param1:Camera3D) : VG
      {
         var _loc2_:int = 0;
         var _loc3_:VG = super.alternativa3d::getVG(param1);
         if(this.alternativa3d::root != null)
         {
            this.numOccluders = 0;
            alternativa3d::calculateInverseMatrix();
            this.calculateCameraPlanes(param1.nearClipping,param1.farClipping);
            _loc2_ = this.cullingInContainer(alternativa3d::culling,this.alternativa3d::root.boundMinX,this.alternativa3d::root.boundMinY,this.alternativa3d::root.boundMinZ,this.alternativa3d::root.boundMaxX,this.alternativa3d::root.boundMaxY,this.alternativa3d::root.boundMaxZ);
            if(_loc2_ >= 0)
            {
               _loc3_ = this.collectVGNode(this.alternativa3d::root,_loc2_,param1,_loc3_);
            }
         }
         return _loc3_;
      }
      
      private function collectVGNode(param1:KDNode, param2:int, param3:Camera3D, param4:VG = null) : VG
      {
         var _loc5_:VG = null;
         var _loc6_:VG = null;
         var _loc7_:VG = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Object3D = param1.objectList;
         var _loc11_:Object3D = param1.objectBoundList;
         while(_loc10_ != null)
         {
            if(_loc10_.visible && ((_loc10_.alternativa3d::culling = param2) == 0 || (_loc10_.alternativa3d::culling = this.cullingInContainer(param2,_loc11_.boundMinX,_loc11_.boundMinY,_loc11_.boundMinZ,_loc11_.boundMaxX,_loc11_.boundMaxY,_loc11_.boundMaxZ)) >= 0))
            {
               _loc10_.alternativa3d::composeAndAppend(this);
               _loc10_.alternativa3d::concat(this);
               _loc7_ = _loc10_.alternativa3d::getVG(param3);
               if(_loc7_ != null)
               {
                  if(_loc5_ != null)
                  {
                     _loc6_.alternativa3d::next = _loc7_;
                  }
                  else
                  {
                     _loc5_ = _loc7_;
                     _loc6_ = _loc7_;
                  }
                  while(_loc6_.alternativa3d::next != null)
                  {
                     _loc6_ = _loc6_.alternativa3d::next;
                  }
               }
            }
            _loc10_ = _loc10_.alternativa3d::next;
            _loc11_ = _loc11_.alternativa3d::next;
         }
         if(_loc5_ != null)
         {
            _loc6_.alternativa3d::next = param4;
            param4 = _loc5_;
         }
         if(param1.negative != null)
         {
            _loc8_ = param2 > 0 ? int(this.cullingInContainer(param2,param1.negative.boundMinX,param1.negative.boundMinY,param1.negative.boundMinZ,param1.negative.boundMaxX,param1.negative.boundMaxY,param1.negative.boundMaxZ)) : int(0);
            _loc9_ = param2 > 0 ? int(this.cullingInContainer(param2,param1.positive.boundMinX,param1.positive.boundMinY,param1.positive.boundMinZ,param1.positive.boundMaxX,param1.positive.boundMaxY,param1.positive.boundMaxZ)) : int(0);
            if(_loc8_ >= 0)
            {
               param4 = this.collectVGNode(param1.negative,_loc8_,param3,param4);
            }
            if(_loc9_ >= 0)
            {
               param4 = this.collectVGNode(param1.positive,_loc9_,param3,param4);
            }
         }
         return param4;
      }
      
      private function uploadResources(param1:Device) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:Object3D = null;
         var _loc4_:Mesh = null;
         var _loc5_:BSP = null;
         var _loc6_:TextureMaterial = null;
         if(this.isCreated)
         {
            return;
         }
         this.isCreated = true;
         for(_loc2_ in this.materials)
         {
            _loc6_ = _loc2_ as TextureMaterial;
            if(_loc6_.texture != null)
            {
               param1.uploadResource(_loc6_.alternativa3d::textureResource);
            }
            if(_loc6_.alternativa3d::_textureATF != null)
            {
               param1.uploadResource(_loc6_.alternativa3d::textureATFResource);
            }
            if(_loc6_.alternativa3d::_textureATFAlpha != null)
            {
               param1.uploadResource(_loc6_.alternativa3d::textureATFAlphaResource);
            }
         }
         _loc3_ = this.opaqueList;
         while(_loc3_ != null)
         {
            if(_loc3_ is Mesh)
            {
               _loc4_ = _loc3_ as Mesh;
               _loc4_.alternativa3d::prepareResources();
               param1.uploadResource(_loc4_.alternativa3d::vertexBuffer);
               param1.uploadResource(_loc4_.alternativa3d::indexBuffer);
            }
            else if(_loc3_ is BSP)
            {
               _loc5_ = _loc3_ as BSP;
               _loc5_.alternativa3d::prepareResources();
               param1.uploadResource(_loc5_.alternativa3d::vertexBuffer);
               param1.uploadResource(_loc5_.alternativa3d::indexBuffer);
            }
            _loc3_ = _loc3_.alternativa3d::next;
         }
         var _loc7_:int = 0;
         while(_loc7_ < this.transparentLength)
         {
            _loc3_ = this.transparent[_loc7_];
            if(_loc3_ is Mesh)
            {
               _loc4_ = _loc3_ as Mesh;
               _loc4_.alternativa3d::prepareResources();
               param1.uploadResource(_loc4_.alternativa3d::vertexBuffer);
               param1.uploadResource(_loc4_.alternativa3d::indexBuffer);
            }
            else if(_loc3_ is BSP)
            {
               _loc5_ = _loc3_ as BSP;
               _loc5_.alternativa3d::prepareResources();
               param1.uploadResource(_loc5_.alternativa3d::vertexBuffer);
               param1.uploadResource(_loc5_.alternativa3d::indexBuffer);
            }
            _loc7_++;
         }
         _loc7_ = 0;
         while(_loc7_ < this.receiversVertexBuffers.length)
         {
            param1.uploadResource(this.receiversVertexBuffers[_loc7_]);
            param1.uploadResource(this.receiversIndexBuffers[_loc7_]);
            _loc7_++;
         }
      }
      
      override alternativa3d function updateBounds(param1:Object3D, param2:Object3D = null) : void
      {
         super.alternativa3d::updateBounds(param1,param2);
         if(this.alternativa3d::root != null)
         {
            if(param2 != null)
            {
               this.updateBoundsNode(this.alternativa3d::root,param1,param2);
            }
            else
            {
               if(this.alternativa3d::root.boundMinX < param1.boundMinX)
               {
                  param1.boundMinX = this.alternativa3d::root.boundMinX;
               }
               if(this.alternativa3d::root.boundMaxX > param1.boundMaxX)
               {
                  param1.boundMaxX = this.alternativa3d::root.boundMaxX;
               }
               if(this.alternativa3d::root.boundMinY < param1.boundMinY)
               {
                  param1.boundMinY = this.alternativa3d::root.boundMinY;
               }
               if(this.alternativa3d::root.boundMaxY > param1.boundMaxY)
               {
                  param1.boundMaxY = this.alternativa3d::root.boundMaxY;
               }
               if(this.alternativa3d::root.boundMinZ < param1.boundMinZ)
               {
                  param1.boundMinZ = this.alternativa3d::root.boundMinZ;
               }
               if(this.alternativa3d::root.boundMaxZ > param1.boundMaxZ)
               {
                  param1.boundMaxZ = this.alternativa3d::root.boundMaxZ;
               }
            }
         }
      }
      
      private function updateBoundsNode(param1:KDNode, param2:Object3D, param3:Object3D) : void
      {
         var _loc4_:Object3D = param1.objectList;
         while(_loc4_ != null)
         {
            if(param3 != null)
            {
               _loc4_.alternativa3d::composeAndAppend(param3);
            }
            else
            {
               _loc4_.alternativa3d::composeMatrix();
            }
            _loc4_.alternativa3d::updateBounds(param2,_loc4_);
            _loc4_ = _loc4_.alternativa3d::next;
         }
         if(param1.negative != null)
         {
            this.updateBoundsNode(param1.negative,param2,param3);
            this.updateBoundsNode(param1.positive,param2,param3);
         }
      }
      
      private function debugNode(param1:KDNode, param2:int, param3:Camera3D, param4:Number) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(param1 != null && param1.negative != null)
         {
            _loc5_ = param2 > 0 ? int(this.cullingInContainer(param2,param1.negative.boundMinX,param1.negative.boundMinY,param1.negative.boundMinZ,param1.negative.boundMaxX,param1.negative.boundMaxY,param1.negative.boundMaxZ)) : int(0);
            _loc6_ = param2 > 0 ? int(this.cullingInContainer(param2,param1.positive.boundMinX,param1.positive.boundMinY,param1.positive.boundMinZ,param1.positive.boundMaxX,param1.positive.boundMaxY,param1.positive.boundMaxZ)) : int(0);
            if(_loc5_ >= 0)
            {
               this.debugNode(param1.negative,_loc5_,param3,param4 * this.debugAlphaFade);
            }
            Debug.alternativa3d::drawKDNode(param3,this,param1.axis,param1.coord,param1.boundMinX,param1.boundMinY,param1.boundMinZ,param1.boundMaxX,param1.boundMaxY,param1.boundMaxZ,param4);
            if(_loc6_ >= 0)
            {
               this.debugNode(param1.positive,_loc6_,param3,param4 * this.debugAlphaFade);
            }
         }
      }
      
      private function drawNode(param1:KDNode, param2:int, param3:Camera3D, param4:VG) : void
      {
         var _loc5_:int = 0;
         var _loc6_:VG = null;
         var _loc7_:VG = null;
         var _loc8_:VG = null;
         var _loc9_:VG = null;
         var _loc10_:Object3D = null;
         var _loc11_:Object3D = null;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:* = false;
         var _loc15_:* = false;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         if(param3.alternativa3d::occludedAll)
         {
            while(param4 != null)
            {
               _loc6_ = param4.alternativa3d::next;
               param4.alternativa3d::destroy();
               param4 = _loc6_;
            }
            return;
         }
         if(param1.negative != null)
         {
            _loc12_ = param2 > 0 || this.numOccluders > 0 ? int(this.cullingInContainer(param2,param1.negative.boundMinX,param1.negative.boundMinY,param1.negative.boundMinZ,param1.negative.boundMaxX,param1.negative.boundMaxY,param1.negative.boundMaxZ)) : int(0);
            _loc13_ = param2 > 0 || this.numOccluders > 0 ? int(this.cullingInContainer(param2,param1.positive.boundMinX,param1.positive.boundMinY,param1.positive.boundMinZ,param1.positive.boundMaxX,param1.positive.boundMaxY,param1.positive.boundMaxZ)) : int(0);
            _loc14_ = param1.axis == 0;
            _loc15_ = param1.axis == 1;
            if(_loc12_ >= 0 && _loc13_ >= 0)
            {
               while(param4 != null)
               {
                  _loc6_ = param4.alternativa3d::next;
                  if(param4.alternativa3d::numOccluders < this.numOccluders && this.occludeGeometry(param3,param4))
                  {
                     param4.alternativa3d::destroy();
                  }
                  else
                  {
                     _loc16_ = _loc14_ ? Number(param4.alternativa3d::boundMinX) : (_loc15_ ? Number(param4.alternativa3d::boundMinY) : Number(param4.alternativa3d::boundMinZ));
                     _loc17_ = _loc14_ ? Number(param4.alternativa3d::boundMaxX) : (_loc15_ ? Number(param4.alternativa3d::boundMaxY) : Number(param4.alternativa3d::boundMaxZ));
                     if(_loc17_ <= param1.maxCoord)
                     {
                        if(_loc16_ < param1.minCoord)
                        {
                           param4.alternativa3d::next = _loc7_;
                           _loc7_ = param4;
                        }
                        else
                        {
                           param4.alternativa3d::next = _loc8_;
                           _loc8_ = param4;
                        }
                     }
                     else if(_loc16_ >= param1.minCoord)
                     {
                        param4.alternativa3d::next = _loc9_;
                        _loc9_ = param4;
                     }
                     else
                     {
                        param4.alternativa3d::split(param3,param1.axis == 0 ? Number(1) : Number(0),param1.axis == 1 ? Number(1) : Number(0),param1.axis == 2 ? Number(1) : Number(0),param1.coord,threshold);
                        if(param4.alternativa3d::next != null)
                        {
                           param4.alternativa3d::next.alternativa3d::next = _loc7_;
                           _loc7_ = param4.alternativa3d::next;
                        }
                        if(param4.alternativa3d::faceStruct != null)
                        {
                           param4.alternativa3d::next = _loc9_;
                           _loc9_ = param4;
                        }
                        else
                        {
                           param4.alternativa3d::destroy();
                        }
                     }
                  }
                  param4 = _loc6_;
               }
               if(_loc14_ && alternativa3d::imd > param1.coord || _loc15_ && alternativa3d::imh > param1.coord || !_loc14_ && !_loc15_ && alternativa3d::iml > param1.coord)
               {
                  this.drawNode(param1.positive,_loc13_,param3,_loc9_);
                  while(_loc8_ != null)
                  {
                     _loc6_ = _loc8_.alternativa3d::next;
                     if(_loc8_.alternativa3d::numOccluders >= this.numOccluders || !this.occludeGeometry(param3,_loc8_))
                     {
                        _loc8_.alternativa3d::draw(param3,threshold,this);
                     }
                     _loc8_.alternativa3d::destroy();
                     _loc8_ = _loc6_;
                  }
                  _loc10_ = param1.objectList;
                  _loc11_ = param1.objectBoundList;
                  while(_loc10_ != null)
                  {
                     if(_loc10_.visible && ((_loc10_.alternativa3d::culling = param2) == 0 && this.numOccluders == 0 || (_loc10_.alternativa3d::culling = this.cullingInContainer(param2,_loc11_.boundMinX,_loc11_.boundMinY,_loc11_.boundMinZ,_loc11_.boundMaxX,_loc11_.boundMaxY,_loc11_.boundMaxZ)) >= 0))
                     {
                        _loc10_.alternativa3d::copyAndAppend(_loc11_,this);
                        _loc10_.alternativa3d::concat(this);
                        _loc10_.alternativa3d::draw(param3);
                     }
                     _loc10_ = _loc10_.alternativa3d::next;
                     _loc11_ = _loc11_.alternativa3d::next;
                  }
                  _loc10_ = param1.occluderList;
                  _loc11_ = param1.occluderBoundList;
                  while(_loc10_ != null)
                  {
                     if(_loc10_.visible && ((_loc10_.alternativa3d::culling = param2) == 0 && this.numOccluders == 0 || (_loc10_.alternativa3d::culling = this.cullingInContainer(param2,_loc11_.boundMinX,_loc11_.boundMinY,_loc11_.boundMinZ,_loc11_.boundMaxX,_loc11_.boundMaxY,_loc11_.boundMaxZ)) >= 0))
                     {
                        _loc10_.alternativa3d::copyAndAppend(_loc11_,this);
                        _loc10_.alternativa3d::concat(this);
                        _loc10_.alternativa3d::draw(param3);
                     }
                     _loc10_ = _loc10_.alternativa3d::next;
                     _loc11_ = _loc11_.alternativa3d::next;
                  }
                  if(param1.occluderList != null)
                  {
                     this.updateOccluders(param3);
                  }
                  this.drawNode(param1.negative,_loc12_,param3,_loc7_);
               }
               else
               {
                  this.drawNode(param1.negative,_loc12_,param3,_loc7_);
                  while(_loc8_ != null)
                  {
                     _loc6_ = _loc8_.alternativa3d::next;
                     if(_loc8_.alternativa3d::numOccluders >= this.numOccluders || !this.occludeGeometry(param3,_loc8_))
                     {
                        _loc8_.alternativa3d::draw(param3,threshold,this);
                     }
                     _loc8_.alternativa3d::destroy();
                     _loc8_ = _loc6_;
                  }
                  _loc10_ = param1.objectList;
                  _loc11_ = param1.objectBoundList;
                  while(_loc10_ != null)
                  {
                     if(_loc10_.visible && ((_loc10_.alternativa3d::culling = param2) == 0 && this.numOccluders == 0 || (_loc10_.alternativa3d::culling = this.cullingInContainer(param2,_loc11_.boundMinX,_loc11_.boundMinY,_loc11_.boundMinZ,_loc11_.boundMaxX,_loc11_.boundMaxY,_loc11_.boundMaxZ)) >= 0))
                     {
                        _loc10_.alternativa3d::copyAndAppend(_loc11_,this);
                        _loc10_.alternativa3d::concat(this);
                        _loc10_.alternativa3d::draw(param3);
                     }
                     _loc10_ = _loc10_.alternativa3d::next;
                     _loc11_ = _loc11_.alternativa3d::next;
                  }
                  _loc10_ = param1.occluderList;
                  _loc11_ = param1.occluderBoundList;
                  while(_loc10_ != null)
                  {
                     if(_loc10_.visible && ((_loc10_.alternativa3d::culling = param2) == 0 && this.numOccluders == 0 || (_loc10_.alternativa3d::culling = this.cullingInContainer(param2,_loc11_.boundMinX,_loc11_.boundMinY,_loc11_.boundMinZ,_loc11_.boundMaxX,_loc11_.boundMaxY,_loc11_.boundMaxZ)) >= 0))
                     {
                        _loc10_.alternativa3d::copyAndAppend(_loc11_,this);
                        _loc10_.alternativa3d::concat(this);
                        _loc10_.alternativa3d::draw(param3);
                     }
                     _loc10_ = _loc10_.alternativa3d::next;
                     _loc11_ = _loc11_.alternativa3d::next;
                  }
                  if(param1.occluderList != null)
                  {
                     this.updateOccluders(param3);
                  }
                  this.drawNode(param1.positive,_loc13_,param3,_loc9_);
               }
            }
            else if(_loc12_ >= 0)
            {
               while(param4 != null)
               {
                  _loc6_ = param4.alternativa3d::next;
                  if(param4.alternativa3d::numOccluders < this.numOccluders && this.occludeGeometry(param3,param4))
                  {
                     param4.alternativa3d::destroy();
                  }
                  else
                  {
                     _loc16_ = _loc14_ ? Number(param4.alternativa3d::boundMinX) : (_loc15_ ? Number(param4.alternativa3d::boundMinY) : Number(param4.alternativa3d::boundMinZ));
                     _loc17_ = _loc14_ ? Number(param4.alternativa3d::boundMaxX) : (_loc15_ ? Number(param4.alternativa3d::boundMaxY) : Number(param4.alternativa3d::boundMaxZ));
                     if(_loc17_ <= param1.maxCoord)
                     {
                        param4.alternativa3d::next = _loc7_;
                        _loc7_ = param4;
                     }
                     else if(_loc16_ >= param1.minCoord)
                     {
                        param4.alternativa3d::destroy();
                     }
                     else
                     {
                        param4.alternativa3d::crop(param3,param1.axis == 0 ? Number(-1) : Number(0),param1.axis == 1 ? Number(-1) : Number(0),param1.axis == 2 ? Number(-1) : Number(0),-param1.coord,threshold);
                        if(param4.alternativa3d::faceStruct != null)
                        {
                           param4.alternativa3d::next = _loc7_;
                           _loc7_ = param4;
                        }
                        else
                        {
                           param4.alternativa3d::destroy();
                        }
                     }
                  }
                  param4 = _loc6_;
               }
               this.drawNode(param1.negative,_loc12_,param3,_loc7_);
            }
            else if(_loc13_ >= 0)
            {
               while(param4 != null)
               {
                  _loc6_ = param4.alternativa3d::next;
                  if(param4.alternativa3d::numOccluders < this.numOccluders && this.occludeGeometry(param3,param4))
                  {
                     param4.alternativa3d::destroy();
                  }
                  else
                  {
                     _loc16_ = _loc14_ ? Number(param4.alternativa3d::boundMinX) : (_loc15_ ? Number(param4.alternativa3d::boundMinY) : Number(param4.alternativa3d::boundMinZ));
                     _loc17_ = _loc14_ ? Number(param4.alternativa3d::boundMaxX) : (_loc15_ ? Number(param4.alternativa3d::boundMaxY) : Number(param4.alternativa3d::boundMaxZ));
                     if(_loc17_ <= param1.maxCoord)
                     {
                        param4.alternativa3d::destroy();
                     }
                     else if(_loc16_ >= param1.minCoord)
                     {
                        param4.alternativa3d::next = _loc9_;
                        _loc9_ = param4;
                     }
                     else
                     {
                        param4.alternativa3d::crop(param3,param1.axis == 0 ? Number(1) : Number(0),param1.axis == 1 ? Number(1) : Number(0),param1.axis == 2 ? Number(1) : Number(0),param1.coord,threshold);
                        if(param4.alternativa3d::faceStruct != null)
                        {
                           param4.alternativa3d::next = _loc9_;
                           _loc9_ = param4;
                        }
                        else
                        {
                           param4.alternativa3d::destroy();
                        }
                     }
                  }
                  param4 = _loc6_;
               }
               this.drawNode(param1.positive,_loc13_,param3,_loc9_);
            }
            else
            {
               while(param4 != null)
               {
                  _loc6_ = param4.alternativa3d::next;
                  param4.alternativa3d::destroy();
                  param4 = _loc6_;
               }
            }
         }
         else
         {
            if(param1.objectList != null)
            {
               if(param1.objectList.alternativa3d::next != null || param4 != null)
               {
                  while(param4 != null)
                  {
                     _loc6_ = param4.alternativa3d::next;
                     if(param4.alternativa3d::numOccluders < this.numOccluders && this.occludeGeometry(param3,param4))
                     {
                        param4.alternativa3d::destroy();
                     }
                     else
                     {
                        param4.alternativa3d::next = _loc8_;
                        _loc8_ = param4;
                     }
                     param4 = _loc6_;
                  }
                  _loc10_ = param1.objectList;
                  _loc11_ = param1.objectBoundList;
                  while(_loc10_ != null)
                  {
                     if(_loc10_.visible && ((_loc10_.alternativa3d::culling = param2) == 0 && this.numOccluders == 0 || (_loc10_.alternativa3d::culling = this.cullingInContainer(param2,_loc11_.boundMinX,_loc11_.boundMinY,_loc11_.boundMinZ,_loc11_.boundMaxX,_loc11_.boundMaxY,_loc11_.boundMaxZ)) >= 0))
                     {
                        _loc10_.alternativa3d::copyAndAppend(_loc11_,this);
                        _loc10_.alternativa3d::concat(this);
                        param4 = _loc10_.alternativa3d::getVG(param3);
                        while(param4 != null)
                        {
                           _loc6_ = param4.alternativa3d::next;
                           param4.alternativa3d::next = _loc8_;
                           _loc8_ = param4;
                           param4 = _loc6_;
                        }
                     }
                     _loc10_ = _loc10_.alternativa3d::next;
                     _loc11_ = _loc11_.alternativa3d::next;
                  }
                  if(_loc8_ != null)
                  {
                     if(_loc8_.alternativa3d::next != null)
                     {
                        alternativa3d::drawConflictGeometry(param3,_loc8_);
                     }
                     else
                     {
                        _loc8_.alternativa3d::draw(param3,threshold,this);
                        _loc8_.alternativa3d::destroy();
                     }
                  }
               }
               else
               {
                  _loc10_ = param1.objectList;
                  if(_loc10_.visible)
                  {
                     _loc10_.alternativa3d::copyAndAppend(param1.objectBoundList,this);
                     _loc10_.alternativa3d::culling = param2;
                     _loc10_.alternativa3d::concat(this);
                     _loc10_.alternativa3d::draw(param3);
                  }
               }
            }
            else if(param4 != null)
            {
               if(param4.alternativa3d::next != null)
               {
                  if(this.numOccluders > 0)
                  {
                     while(param4 != null)
                     {
                        _loc6_ = param4.alternativa3d::next;
                        if(param4.alternativa3d::numOccluders < this.numOccluders && this.occludeGeometry(param3,param4))
                        {
                           param4.alternativa3d::destroy();
                        }
                        else
                        {
                           param4.alternativa3d::next = _loc8_;
                           _loc8_ = param4;
                        }
                        param4 = _loc6_;
                     }
                     if(_loc8_ != null)
                     {
                        if(_loc8_.alternativa3d::next != null)
                        {
                           if(resolveByAABB)
                           {
                              alternativa3d::drawAABBGeometry(param3,_loc8_);
                           }
                           else if(resolveByOOBB)
                           {
                              param4 = _loc8_;
                              while(param4 != null)
                              {
                                 param4.alternativa3d::calculateOOBB(this);
                                 param4 = param4.alternativa3d::next;
                              }
                              alternativa3d::drawOOBBGeometry(param3,_loc8_);
                           }
                           else
                           {
                              alternativa3d::drawConflictGeometry(param3,_loc8_);
                           }
                        }
                        else
                        {
                           _loc8_.alternativa3d::draw(param3,threshold,this);
                           _loc8_.alternativa3d::destroy();
                        }
                     }
                  }
                  else
                  {
                     _loc8_ = param4;
                     if(resolveByAABB)
                     {
                        alternativa3d::drawAABBGeometry(param3,_loc8_);
                     }
                     else if(resolveByOOBB)
                     {
                        param4 = _loc8_;
                        while(param4 != null)
                        {
                           param4.alternativa3d::calculateOOBB(this);
                           param4 = param4.alternativa3d::next;
                        }
                        alternativa3d::drawOOBBGeometry(param3,_loc8_);
                     }
                     else
                     {
                        alternativa3d::drawConflictGeometry(param3,_loc8_);
                     }
                  }
               }
               else
               {
                  if(param4.alternativa3d::numOccluders >= this.numOccluders || !this.occludeGeometry(param3,param4))
                  {
                     param4.alternativa3d::draw(param3,threshold,this);
                  }
                  param4.alternativa3d::destroy();
               }
            }
            _loc10_ = param1.occluderList;
            _loc11_ = param1.occluderBoundList;
            while(_loc10_ != null)
            {
               if(_loc10_.visible && ((_loc10_.alternativa3d::culling = param2) == 0 && this.numOccluders == 0 || (_loc10_.alternativa3d::culling = this.cullingInContainer(param2,_loc11_.boundMinX,_loc11_.boundMinY,_loc11_.boundMinZ,_loc11_.boundMaxX,_loc11_.boundMaxY,_loc11_.boundMaxZ)) >= 0))
               {
                  _loc10_.alternativa3d::copyAndAppend(_loc11_,this);
                  _loc10_.alternativa3d::concat(this);
                  _loc10_.alternativa3d::draw(param3);
               }
               _loc10_ = _loc10_.alternativa3d::next;
               _loc11_ = _loc11_.alternativa3d::next;
            }
            if(param1.occluderList != null)
            {
               this.updateOccluders(param3);
            }
         }
      }
      
      private function createObjectBounds(param1:Object3D) : Object3D
      {
         var _loc2_:Object3D = new Object3D();
         _loc2_.boundMinX = 1e+22;
         _loc2_.boundMinY = 1e+22;
         _loc2_.boundMinZ = 1e+22;
         _loc2_.boundMaxX = -1e+22;
         _loc2_.boundMaxY = -1e+22;
         _loc2_.boundMaxZ = -1e+22;
         param1.alternativa3d::composeMatrix();
         param1.alternativa3d::updateBounds(_loc2_,param1);
         _loc2_.alternativa3d::ma = param1.alternativa3d::ma;
         _loc2_.alternativa3d::mb = param1.alternativa3d::mb;
         _loc2_.alternativa3d::mc = param1.alternativa3d::mc;
         _loc2_.alternativa3d::md = param1.alternativa3d::md;
         _loc2_.alternativa3d::me = param1.alternativa3d::me;
         _loc2_.alternativa3d::mf = param1.alternativa3d::mf;
         _loc2_.alternativa3d::mg = param1.alternativa3d::mg;
         _loc2_.alternativa3d::mh = param1.alternativa3d::mh;
         _loc2_.alternativa3d::mi = param1.alternativa3d::mi;
         _loc2_.alternativa3d::mj = param1.alternativa3d::mj;
         _loc2_.alternativa3d::mk = param1.alternativa3d::mk;
         _loc2_.alternativa3d::ml = param1.alternativa3d::ml;
         return _loc2_;
      }
      
      private function createNode(param1:Object3D, param2:Object3D, param3:Object3D, param4:Object3D, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number, param10:Number) : KDNode
      {
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:Object3D = null;
         var _loc14_:Object3D = null;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc23_:Object3D = null;
         var _loc24_:Object3D = null;
         var _loc25_:Object3D = null;
         var _loc26_:Object3D = null;
         var _loc27_:Object3D = null;
         var _loc28_:Object3D = null;
         var _loc29_:Object3D = null;
         var _loc30_:Object3D = null;
         var _loc31_:Number = NaN;
         var _loc32_:Number = NaN;
         var _loc33_:Object3D = null;
         var _loc34_:Object3D = null;
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
         var _loc47_:KDNode;
         (_loc47_ = new KDNode()).boundMinX = param5;
         _loc47_.boundMinY = param6;
         _loc47_.boundMinZ = param7;
         _loc47_.boundMaxX = param8;
         _loc47_.boundMaxY = param9;
         _loc47_.boundMaxZ = param10;
         if(param1 == null)
         {
            if(param3 != null)
            {
            }
            return _loc47_;
         }
         var _loc48_:int = 0;
         var _loc49_:int = 0;
         var _loc50_:int = 0;
         _loc14_ = param2;
         while(_loc14_ != null)
         {
            if(_loc14_.boundMinX > param5 + threshold)
            {
               _loc12_ = 0;
               while(_loc12_ < _loc48_)
               {
                  if(_loc14_.boundMinX >= splitCoordsX[_loc12_] - threshold && _loc14_.boundMinX <= splitCoordsX[_loc12_] + threshold)
                  {
                     break;
                  }
                  _loc12_++;
               }
               if(_loc12_ == _loc48_)
               {
                  var _loc53_:*;
                  splitCoordsX[_loc53_ = _loc48_++] = _loc14_.boundMinX;
               }
            }
            if(_loc14_.boundMaxX < param8 - threshold)
            {
               _loc12_ = 0;
               while(_loc12_ < _loc48_)
               {
                  if(_loc14_.boundMaxX >= splitCoordsX[_loc12_] - threshold && _loc14_.boundMaxX <= splitCoordsX[_loc12_] + threshold)
                  {
                     break;
                  }
                  _loc12_++;
               }
               if(_loc12_ == _loc48_)
               {
                  splitCoordsX[_loc53_ = _loc48_++] = _loc14_.boundMaxX;
               }
            }
            if(_loc14_.boundMinY > param6 + threshold)
            {
               _loc12_ = 0;
               while(_loc12_ < _loc49_)
               {
                  if(_loc14_.boundMinY >= splitCoordsY[_loc12_] - threshold && _loc14_.boundMinY <= splitCoordsY[_loc12_] + threshold)
                  {
                     break;
                  }
                  _loc12_++;
               }
               if(_loc12_ == _loc49_)
               {
                  splitCoordsY[_loc53_ = _loc49_++] = _loc14_.boundMinY;
               }
            }
            if(_loc14_.boundMaxY < param9 - threshold)
            {
               _loc12_ = 0;
               while(_loc12_ < _loc49_)
               {
                  if(_loc14_.boundMaxY >= splitCoordsY[_loc12_] - threshold && _loc14_.boundMaxY <= splitCoordsY[_loc12_] + threshold)
                  {
                     break;
                  }
                  _loc12_++;
               }
               if(_loc12_ == _loc49_)
               {
                  splitCoordsY[_loc53_ = _loc49_++] = _loc14_.boundMaxY;
               }
            }
            if(_loc14_.boundMinZ > param7 + threshold)
            {
               _loc12_ = 0;
               while(_loc12_ < _loc50_)
               {
                  if(_loc14_.boundMinZ >= splitCoordsZ[_loc12_] - threshold && _loc14_.boundMinZ <= splitCoordsZ[_loc12_] + threshold)
                  {
                     break;
                  }
                  _loc12_++;
               }
               if(_loc12_ == _loc50_)
               {
                  splitCoordsZ[_loc53_ = _loc50_++] = _loc14_.boundMinZ;
               }
            }
            if(_loc14_.boundMaxZ < param10 - threshold)
            {
               _loc12_ = 0;
               while(_loc12_ < _loc50_)
               {
                  if(_loc14_.boundMaxZ >= splitCoordsZ[_loc12_] - threshold && _loc14_.boundMaxZ <= splitCoordsZ[_loc12_] + threshold)
                  {
                     break;
                  }
                  _loc12_++;
               }
               if(_loc12_ == _loc50_)
               {
                  splitCoordsZ[_loc53_ = _loc50_++] = _loc14_.boundMaxZ;
               }
            }
            _loc14_ = _loc14_.alternativa3d::next;
         }
         var _loc51_:int = -1;
         var _loc52_:Number = 1e+22;
         _loc19_ = (param9 - param6) * (param10 - param7);
         _loc11_ = 0;
         while(_loc11_ < _loc48_)
         {
            _loc15_ = splitCoordsX[_loc11_];
            _loc20_ = _loc19_ * (_loc15_ - param5);
            _loc21_ = _loc19_ * (param8 - _loc15_);
            _loc17_ = 0;
            _loc18_ = 0;
            _loc14_ = param2;
            while(_loc14_ != null)
            {
               if(_loc14_.boundMaxX <= _loc15_ + threshold)
               {
                  if(_loc14_.boundMinX < _loc15_ - threshold)
                  {
                     _loc17_++;
                  }
               }
               else
               {
                  if(_loc14_.boundMinX < _loc15_ - threshold)
                  {
                     break;
                  }
                  _loc18_++;
               }
               _loc14_ = _loc14_.alternativa3d::next;
            }
            if(_loc14_ == null)
            {
               _loc22_ = _loc20_ * _loc17_ + _loc21_ * _loc18_;
               if(_loc22_ < _loc52_)
               {
                  _loc52_ = _loc22_;
                  _loc51_ = 0;
                  _loc16_ = _loc15_;
               }
            }
            _loc11_++;
         }
         _loc19_ = (param8 - param5) * (param10 - param7);
         _loc11_ = 0;
         while(_loc11_ < _loc49_)
         {
            _loc15_ = splitCoordsY[_loc11_];
            _loc20_ = _loc19_ * (_loc15_ - param6);
            _loc21_ = _loc19_ * (param9 - _loc15_);
            _loc17_ = 0;
            _loc18_ = 0;
            _loc14_ = param2;
            while(_loc14_ != null)
            {
               if(_loc14_.boundMaxY <= _loc15_ + threshold)
               {
                  if(_loc14_.boundMinY < _loc15_ - threshold)
                  {
                     _loc17_++;
                  }
               }
               else
               {
                  if(_loc14_.boundMinY < _loc15_ - threshold)
                  {
                     break;
                  }
                  _loc18_++;
               }
               _loc14_ = _loc14_.alternativa3d::next;
            }
            if(_loc14_ == null)
            {
               _loc22_ = _loc20_ * _loc17_ + _loc21_ * _loc18_;
               if(_loc22_ < _loc52_)
               {
                  _loc52_ = _loc22_;
                  _loc51_ = 1;
                  _loc16_ = _loc15_;
               }
            }
            _loc11_++;
         }
         _loc19_ = (param8 - param5) * (param9 - param6);
         _loc11_ = 0;
         while(_loc11_ < _loc50_)
         {
            _loc15_ = splitCoordsZ[_loc11_];
            _loc20_ = _loc19_ * (_loc15_ - param7);
            _loc21_ = _loc19_ * (param10 - _loc15_);
            _loc17_ = 0;
            _loc18_ = 0;
            _loc14_ = param2;
            while(_loc14_ != null)
            {
               if(_loc14_.boundMaxZ <= _loc15_ + threshold)
               {
                  if(_loc14_.boundMinZ < _loc15_ - threshold)
                  {
                     _loc17_++;
                  }
               }
               else
               {
                  if(_loc14_.boundMinZ < _loc15_ - threshold)
                  {
                     break;
                  }
                  _loc18_++;
               }
               _loc14_ = _loc14_.alternativa3d::next;
            }
            if(_loc14_ == null)
            {
               _loc22_ = _loc20_ * _loc17_ + _loc21_ * _loc18_;
               if(_loc22_ < _loc52_)
               {
                  _loc52_ = _loc22_;
                  _loc51_ = 2;
                  _loc16_ = _loc15_;
               }
            }
            _loc11_++;
         }
         if(_loc51_ < 0)
         {
            _loc47_.objectList = param1;
            _loc47_.objectBoundList = param2;
            _loc47_.occluderList = param3;
            _loc47_.occluderBoundList = param4;
         }
         else
         {
            _loc47_.axis = _loc51_;
            _loc47_.coord = _loc16_;
            _loc47_.minCoord = _loc16_ - threshold;
            _loc47_.maxCoord = _loc16_ + threshold;
            _loc13_ = param1;
            _loc14_ = param2;
            while(_loc13_ != null)
            {
               _loc33_ = _loc13_.alternativa3d::next;
               _loc34_ = _loc14_.alternativa3d::next;
               _loc13_.alternativa3d::next = null;
               _loc14_.alternativa3d::next = null;
               _loc31_ = _loc51_ == 0 ? Number(_loc14_.boundMinX) : (_loc51_ == 1 ? Number(_loc14_.boundMinY) : Number(_loc14_.boundMinZ));
               _loc32_ = _loc51_ == 0 ? Number(_loc14_.boundMaxX) : (_loc51_ == 1 ? Number(_loc14_.boundMaxY) : Number(_loc14_.boundMaxZ));
               if(_loc32_ <= _loc16_ + threshold)
               {
                  if(_loc31_ < _loc16_ - threshold)
                  {
                     _loc13_.alternativa3d::next = _loc23_;
                     _loc23_ = _loc13_;
                     _loc14_.alternativa3d::next = _loc24_;
                     _loc24_ = _loc14_;
                  }
                  else
                  {
                     _loc13_.alternativa3d::next = _loc47_.objectList;
                     _loc47_.objectList = _loc13_;
                     _loc14_.alternativa3d::next = _loc47_.objectBoundList;
                     _loc47_.objectBoundList = _loc14_;
                  }
               }
               else if(_loc31_ >= _loc16_ - threshold)
               {
                  _loc13_.alternativa3d::next = _loc27_;
                  _loc27_ = _loc13_;
                  _loc14_.alternativa3d::next = _loc28_;
                  _loc28_ = _loc14_;
               }
               _loc13_ = _loc33_;
               _loc14_ = _loc34_;
            }
            _loc13_ = param3;
            _loc14_ = param4;
            while(_loc13_ != null)
            {
               _loc33_ = _loc13_.alternativa3d::next;
               _loc34_ = _loc14_.alternativa3d::next;
               _loc13_.alternativa3d::next = null;
               _loc14_.alternativa3d::next = null;
               _loc31_ = _loc51_ == 0 ? Number(_loc14_.boundMinX) : (_loc51_ == 1 ? Number(_loc14_.boundMinY) : Number(_loc14_.boundMinZ));
               _loc32_ = _loc51_ == 0 ? Number(_loc14_.boundMaxX) : (_loc51_ == 1 ? Number(_loc14_.boundMaxY) : Number(_loc14_.boundMaxZ));
               if(_loc32_ <= _loc16_ + threshold)
               {
                  if(_loc31_ < _loc16_ - threshold)
                  {
                     _loc13_.alternativa3d::next = _loc25_;
                     _loc25_ = _loc13_;
                     _loc14_.alternativa3d::next = _loc26_;
                     _loc26_ = _loc14_;
                  }
                  else
                  {
                     _loc13_.alternativa3d::next = _loc47_.occluderList;
                     _loc47_.occluderList = _loc13_;
                     _loc14_.alternativa3d::next = _loc47_.occluderBoundList;
                     _loc47_.occluderBoundList = _loc14_;
                  }
               }
               else if(_loc31_ >= _loc16_ - threshold)
               {
                  _loc13_.alternativa3d::next = _loc29_;
                  _loc29_ = _loc13_;
                  _loc14_.alternativa3d::next = _loc30_;
                  _loc30_ = _loc14_;
               }
               _loc13_ = _loc33_;
               _loc14_ = _loc34_;
            }
            _loc35_ = _loc47_.boundMinX;
            _loc36_ = _loc47_.boundMinY;
            _loc37_ = _loc47_.boundMinZ;
            _loc38_ = _loc47_.boundMaxX;
            _loc39_ = _loc47_.boundMaxY;
            _loc40_ = _loc47_.boundMaxZ;
            _loc41_ = _loc47_.boundMinX;
            _loc42_ = _loc47_.boundMinY;
            _loc43_ = _loc47_.boundMinZ;
            _loc44_ = _loc47_.boundMaxX;
            _loc45_ = _loc47_.boundMaxY;
            _loc46_ = _loc47_.boundMaxZ;
            if(_loc51_ == 0)
            {
               _loc38_ = _loc16_;
               _loc41_ = _loc16_;
            }
            else if(_loc51_ == 1)
            {
               _loc39_ = _loc16_;
               _loc42_ = _loc16_;
            }
            else
            {
               _loc40_ = _loc16_;
               _loc43_ = _loc16_;
            }
            _loc47_.negative = this.createNode(_loc23_,_loc24_,_loc25_,_loc26_,_loc35_,_loc36_,_loc37_,_loc38_,_loc39_,_loc40_);
            _loc47_.positive = this.createNode(_loc27_,_loc28_,_loc29_,_loc30_,_loc41_,_loc42_,_loc43_,_loc44_,_loc45_,_loc46_);
         }
         return _loc47_;
      }
      
      private function destroyNode(param1:KDNode) : void
      {
         var _loc2_:Object3D = null;
         var _loc3_:Object3D = null;
         var _loc4_:Receiver = null;
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
         _loc2_ = param1.objectList;
         while(_loc2_ != null)
         {
            _loc3_ = _loc2_.alternativa3d::next;
            _loc2_.alternativa3d::setParent(null);
            _loc2_.alternativa3d::next = null;
            _loc2_ = _loc3_;
         }
         _loc2_ = param1.objectBoundList;
         while(_loc2_ != null)
         {
            _loc3_ = _loc2_.alternativa3d::next;
            _loc2_.alternativa3d::next = null;
            _loc2_ = _loc3_;
         }
         _loc2_ = param1.occluderList;
         while(_loc2_ != null)
         {
            _loc3_ = _loc2_.alternativa3d::next;
            _loc2_.alternativa3d::setParent(null);
            _loc2_.alternativa3d::next = null;
            _loc2_ = _loc3_;
         }
         _loc2_ = param1.occluderBoundList;
         while(_loc2_ != null)
         {
            _loc3_ = _loc2_.alternativa3d::next;
            _loc2_.alternativa3d::next = null;
            _loc2_ = _loc3_;
         }
         var _loc5_:Receiver = param1.receiverList;
         while(_loc5_ != null)
         {
            _loc4_ = _loc5_.next;
            _loc5_.next = null;
            _loc5_ = _loc4_;
         }
         param1.objectList = null;
         param1.objectBoundList = null;
         param1.occluderList = null;
         param1.occluderBoundList = null;
         param1.receiverList = null;
      }
      
      private function calculateCameraPlanes(param1:Number, param2:Number) : void
      {
         this.nearPlaneX = alternativa3d::imc;
         this.nearPlaneY = alternativa3d::img;
         this.nearPlaneZ = alternativa3d::imk;
         this.nearPlaneOffset = (alternativa3d::imc * param1 + alternativa3d::imd) * this.nearPlaneX + (alternativa3d::img * param1 + alternativa3d::imh) * this.nearPlaneY + (alternativa3d::imk * param1 + alternativa3d::iml) * this.nearPlaneZ;
         this.farPlaneX = -alternativa3d::imc;
         this.farPlaneY = -alternativa3d::img;
         this.farPlaneZ = -alternativa3d::imk;
         this.farPlaneOffset = (alternativa3d::imc * param2 + alternativa3d::imd) * this.farPlaneX + (alternativa3d::img * param2 + alternativa3d::imh) * this.farPlaneY + (alternativa3d::imk * param2 + alternativa3d::iml) * this.farPlaneZ;
         var _loc3_:Number = -alternativa3d::ima - alternativa3d::imb + alternativa3d::imc;
         var _loc4_:Number = -alternativa3d::ime - alternativa3d::imf + alternativa3d::img;
         var _loc5_:Number = -alternativa3d::imi - alternativa3d::imj + alternativa3d::imk;
         var _loc6_:Number = alternativa3d::ima - alternativa3d::imb + alternativa3d::imc;
         var _loc7_:Number = alternativa3d::ime - alternativa3d::imf + alternativa3d::img;
         var _loc8_:Number = alternativa3d::imi - alternativa3d::imj + alternativa3d::imk;
         this.topPlaneX = _loc8_ * _loc4_ - _loc7_ * _loc5_;
         this.topPlaneY = _loc6_ * _loc5_ - _loc8_ * _loc3_;
         this.topPlaneZ = _loc7_ * _loc3_ - _loc6_ * _loc4_;
         this.topPlaneOffset = alternativa3d::imd * this.topPlaneX + alternativa3d::imh * this.topPlaneY + alternativa3d::iml * this.topPlaneZ;
         _loc3_ = _loc6_;
         _loc4_ = _loc7_;
         _loc5_ = _loc8_;
         _loc6_ = alternativa3d::ima + alternativa3d::imb + alternativa3d::imc;
         _loc7_ = alternativa3d::ime + alternativa3d::imf + alternativa3d::img;
         _loc8_ = alternativa3d::imi + alternativa3d::imj + alternativa3d::imk;
         this.rightPlaneX = _loc8_ * _loc4_ - _loc7_ * _loc5_;
         this.rightPlaneY = _loc6_ * _loc5_ - _loc8_ * _loc3_;
         this.rightPlaneZ = _loc7_ * _loc3_ - _loc6_ * _loc4_;
         this.rightPlaneOffset = alternativa3d::imd * this.rightPlaneX + alternativa3d::imh * this.rightPlaneY + alternativa3d::iml * this.rightPlaneZ;
         _loc3_ = _loc6_;
         _loc4_ = _loc7_;
         _loc5_ = _loc8_;
         _loc6_ = -alternativa3d::ima + alternativa3d::imb + alternativa3d::imc;
         _loc7_ = -alternativa3d::ime + alternativa3d::imf + alternativa3d::img;
         _loc8_ = -alternativa3d::imi + alternativa3d::imj + alternativa3d::imk;
         this.bottomPlaneX = _loc8_ * _loc4_ - _loc7_ * _loc5_;
         this.bottomPlaneY = _loc6_ * _loc5_ - _loc8_ * _loc3_;
         this.bottomPlaneZ = _loc7_ * _loc3_ - _loc6_ * _loc4_;
         this.bottomPlaneOffset = alternativa3d::imd * this.bottomPlaneX + alternativa3d::imh * this.bottomPlaneY + alternativa3d::iml * this.bottomPlaneZ;
         _loc3_ = _loc6_;
         _loc4_ = _loc7_;
         _loc5_ = _loc8_;
         _loc6_ = -alternativa3d::ima - alternativa3d::imb + alternativa3d::imc;
         _loc7_ = -alternativa3d::ime - alternativa3d::imf + alternativa3d::img;
         _loc8_ = -alternativa3d::imi - alternativa3d::imj + alternativa3d::imk;
         this.leftPlaneX = _loc8_ * _loc4_ - _loc7_ * _loc5_;
         this.leftPlaneY = _loc6_ * _loc5_ - _loc8_ * _loc3_;
         this.leftPlaneZ = _loc7_ * _loc3_ - _loc6_ * _loc4_;
         this.leftPlaneOffset = alternativa3d::imd * this.leftPlaneX + alternativa3d::imh * this.leftPlaneY + alternativa3d::iml * this.leftPlaneZ;
      }
      
      private function updateOccluders(param1:Camera3D) : void
      {
         var _loc2_:Vertex = null;
         var _loc3_:Vertex = null;
         var _loc4_:Vertex = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:int = this.numOccluders;
         while(_loc11_ < param1.alternativa3d::numOccluders)
         {
            _loc2_ = null;
            _loc3_ = param1.alternativa3d::occluders[_loc11_];
            while(_loc3_ != null)
            {
               (_loc4_ = _loc3_.alternativa3d::create()).alternativa3d::next = _loc2_;
               _loc2_ = _loc4_;
               _loc5_ = alternativa3d::ima * _loc3_.x + alternativa3d::imb * _loc3_.y + alternativa3d::imc * _loc3_.z;
               _loc6_ = alternativa3d::ime * _loc3_.x + alternativa3d::imf * _loc3_.y + alternativa3d::img * _loc3_.z;
               _loc7_ = alternativa3d::imi * _loc3_.x + alternativa3d::imj * _loc3_.y + alternativa3d::imk * _loc3_.z;
               _loc8_ = alternativa3d::ima * _loc3_.u + alternativa3d::imb * _loc3_.v + alternativa3d::imc * _loc3_.alternativa3d::offset;
               _loc9_ = alternativa3d::ime * _loc3_.u + alternativa3d::imf * _loc3_.v + alternativa3d::img * _loc3_.alternativa3d::offset;
               _loc10_ = alternativa3d::imi * _loc3_.u + alternativa3d::imj * _loc3_.v + alternativa3d::imk * _loc3_.alternativa3d::offset;
               _loc2_.x = _loc10_ * _loc6_ - _loc9_ * _loc7_;
               _loc2_.y = _loc8_ * _loc7_ - _loc10_ * _loc5_;
               _loc2_.z = _loc9_ * _loc5_ - _loc8_ * _loc6_;
               _loc2_.alternativa3d::offset = alternativa3d::imd * _loc2_.x + alternativa3d::imh * _loc2_.y + alternativa3d::iml * _loc2_.z;
               _loc3_ = _loc3_.alternativa3d::next;
            }
            this.occluders[this.numOccluders] = _loc2_;
            ++this.numOccluders;
            _loc11_++;
         }
      }
      
      private function cullingInContainer(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number) : int
      {
         var _loc8_:Vertex = null;
         if(param1 > 0)
         {
            if(param1 & 1)
            {
               if(this.nearPlaneX >= 0)
               {
                  if(this.nearPlaneY >= 0)
                  {
                     if(this.nearPlaneZ >= 0)
                     {
                        if(param5 * this.nearPlaneX + param6 * this.nearPlaneY + param7 * this.nearPlaneZ <= this.nearPlaneOffset)
                        {
                           return -1;
                        }
                        if(param2 * this.nearPlaneX + param3 * this.nearPlaneY + param4 * this.nearPlaneZ > this.nearPlaneOffset)
                        {
                           param1 &= 62;
                        }
                     }
                     else
                     {
                        if(param5 * this.nearPlaneX + param6 * this.nearPlaneY + param4 * this.nearPlaneZ <= this.nearPlaneOffset)
                        {
                           return -1;
                        }
                        if(param2 * this.nearPlaneX + param3 * this.nearPlaneY + param7 * this.nearPlaneZ > this.nearPlaneOffset)
                        {
                           param1 &= 62;
                        }
                     }
                  }
                  else if(this.nearPlaneZ >= 0)
                  {
                     if(param5 * this.nearPlaneX + param3 * this.nearPlaneY + param7 * this.nearPlaneZ <= this.nearPlaneOffset)
                     {
                        return -1;
                     }
                     if(param2 * this.nearPlaneX + param6 * this.nearPlaneY + param4 * this.nearPlaneZ > this.nearPlaneOffset)
                     {
                        param1 &= 62;
                     }
                  }
                  else
                  {
                     if(param5 * this.nearPlaneX + param3 * this.nearPlaneY + param4 * this.nearPlaneZ <= this.nearPlaneOffset)
                     {
                        return -1;
                     }
                     if(param2 * this.nearPlaneX + param6 * this.nearPlaneY + param7 * this.nearPlaneZ > this.nearPlaneOffset)
                     {
                        param1 &= 62;
                     }
                  }
               }
               else if(this.nearPlaneY >= 0)
               {
                  if(this.nearPlaneZ >= 0)
                  {
                     if(param2 * this.nearPlaneX + param6 * this.nearPlaneY + param7 * this.nearPlaneZ <= this.nearPlaneOffset)
                     {
                        return -1;
                     }
                     if(param5 * this.nearPlaneX + param3 * this.nearPlaneY + param4 * this.nearPlaneZ > this.nearPlaneOffset)
                     {
                        param1 &= 62;
                     }
                  }
                  else
                  {
                     if(param2 * this.nearPlaneX + param6 * this.nearPlaneY + param4 * this.nearPlaneZ <= this.nearPlaneOffset)
                     {
                        return -1;
                     }
                     if(param5 * this.nearPlaneX + param3 * this.nearPlaneY + param7 * this.nearPlaneZ > this.nearPlaneOffset)
                     {
                        param1 &= 62;
                     }
                  }
               }
               else if(this.nearPlaneZ >= 0)
               {
                  if(param2 * this.nearPlaneX + param3 * this.nearPlaneY + param7 * this.nearPlaneZ <= this.nearPlaneOffset)
                  {
                     return -1;
                  }
                  if(param5 * this.nearPlaneX + param6 * this.nearPlaneY + param4 * this.nearPlaneZ > this.nearPlaneOffset)
                  {
                     param1 &= 62;
                  }
               }
               else
               {
                  if(param2 * this.nearPlaneX + param3 * this.nearPlaneY + param4 * this.nearPlaneZ <= this.nearPlaneOffset)
                  {
                     return -1;
                  }
                  if(param5 * this.nearPlaneX + param6 * this.nearPlaneY + param7 * this.nearPlaneZ > this.nearPlaneOffset)
                  {
                     param1 &= 62;
                  }
               }
            }
            if(param1 & 2)
            {
               if(this.farPlaneX >= 0)
               {
                  if(this.farPlaneY >= 0)
                  {
                     if(this.farPlaneZ >= 0)
                     {
                        if(param5 * this.farPlaneX + param6 * this.farPlaneY + param7 * this.farPlaneZ <= this.farPlaneOffset)
                        {
                           return -1;
                        }
                        if(param2 * this.farPlaneX + param3 * this.farPlaneY + param4 * this.farPlaneZ > this.farPlaneOffset)
                        {
                           param1 &= 61;
                        }
                     }
                     else
                     {
                        if(param5 * this.farPlaneX + param6 * this.farPlaneY + param4 * this.farPlaneZ <= this.farPlaneOffset)
                        {
                           return -1;
                        }
                        if(param2 * this.farPlaneX + param3 * this.farPlaneY + param7 * this.farPlaneZ > this.farPlaneOffset)
                        {
                           param1 &= 61;
                        }
                     }
                  }
                  else if(this.farPlaneZ >= 0)
                  {
                     if(param5 * this.farPlaneX + param3 * this.farPlaneY + param7 * this.farPlaneZ <= this.farPlaneOffset)
                     {
                        return -1;
                     }
                     if(param2 * this.farPlaneX + param6 * this.farPlaneY + param4 * this.farPlaneZ > this.farPlaneOffset)
                     {
                        param1 &= 61;
                     }
                  }
                  else
                  {
                     if(param5 * this.farPlaneX + param3 * this.farPlaneY + param4 * this.farPlaneZ <= this.farPlaneOffset)
                     {
                        return -1;
                     }
                     if(param2 * this.farPlaneX + param6 * this.farPlaneY + param7 * this.farPlaneZ > this.farPlaneOffset)
                     {
                        param1 &= 61;
                     }
                  }
               }
               else if(this.farPlaneY >= 0)
               {
                  if(this.farPlaneZ >= 0)
                  {
                     if(param2 * this.farPlaneX + param6 * this.farPlaneY + param7 * this.farPlaneZ <= this.farPlaneOffset)
                     {
                        return -1;
                     }
                     if(param5 * this.farPlaneX + param3 * this.farPlaneY + param4 * this.farPlaneZ > this.farPlaneOffset)
                     {
                        param1 &= 61;
                     }
                  }
                  else
                  {
                     if(param2 * this.farPlaneX + param6 * this.farPlaneY + param4 * this.farPlaneZ <= this.farPlaneOffset)
                     {
                        return -1;
                     }
                     if(param5 * this.farPlaneX + param3 * this.farPlaneY + param7 * this.farPlaneZ > this.farPlaneOffset)
                     {
                        param1 &= 61;
                     }
                  }
               }
               else if(this.farPlaneZ >= 0)
               {
                  if(param2 * this.farPlaneX + param3 * this.farPlaneY + param7 * this.farPlaneZ <= this.farPlaneOffset)
                  {
                     return -1;
                  }
                  if(param5 * this.farPlaneX + param6 * this.farPlaneY + param4 * this.farPlaneZ > this.farPlaneOffset)
                  {
                     param1 &= 61;
                  }
               }
               else
               {
                  if(param2 * this.farPlaneX + param3 * this.farPlaneY + param4 * this.farPlaneZ <= this.farPlaneOffset)
                  {
                     return -1;
                  }
                  if(param5 * this.farPlaneX + param6 * this.farPlaneY + param7 * this.farPlaneZ > this.farPlaneOffset)
                  {
                     param1 &= 61;
                  }
               }
            }
            if(param1 & 4)
            {
               if(this.leftPlaneX >= 0)
               {
                  if(this.leftPlaneY >= 0)
                  {
                     if(this.leftPlaneZ >= 0)
                     {
                        if(param5 * this.leftPlaneX + param6 * this.leftPlaneY + param7 * this.leftPlaneZ <= this.leftPlaneOffset)
                        {
                           return -1;
                        }
                        if(param2 * this.leftPlaneX + param3 * this.leftPlaneY + param4 * this.leftPlaneZ > this.leftPlaneOffset)
                        {
                           param1 &= 59;
                        }
                     }
                     else
                     {
                        if(param5 * this.leftPlaneX + param6 * this.leftPlaneY + param4 * this.leftPlaneZ <= this.leftPlaneOffset)
                        {
                           return -1;
                        }
                        if(param2 * this.leftPlaneX + param3 * this.leftPlaneY + param7 * this.leftPlaneZ > this.leftPlaneOffset)
                        {
                           param1 &= 59;
                        }
                     }
                  }
                  else if(this.leftPlaneZ >= 0)
                  {
                     if(param5 * this.leftPlaneX + param3 * this.leftPlaneY + param7 * this.leftPlaneZ <= this.leftPlaneOffset)
                     {
                        return -1;
                     }
                     if(param2 * this.leftPlaneX + param6 * this.leftPlaneY + param4 * this.leftPlaneZ > this.leftPlaneOffset)
                     {
                        param1 &= 59;
                     }
                  }
                  else
                  {
                     if(param5 * this.leftPlaneX + param3 * this.leftPlaneY + param4 * this.leftPlaneZ <= this.leftPlaneOffset)
                     {
                        return -1;
                     }
                     if(param2 * this.leftPlaneX + param6 * this.leftPlaneY + param7 * this.leftPlaneZ > this.leftPlaneOffset)
                     {
                        param1 &= 59;
                     }
                  }
               }
               else if(this.leftPlaneY >= 0)
               {
                  if(this.leftPlaneZ >= 0)
                  {
                     if(param2 * this.leftPlaneX + param6 * this.leftPlaneY + param7 * this.leftPlaneZ <= this.leftPlaneOffset)
                     {
                        return -1;
                     }
                     if(param5 * this.leftPlaneX + param3 * this.leftPlaneY + param4 * this.leftPlaneZ > this.leftPlaneOffset)
                     {
                        param1 &= 59;
                     }
                  }
                  else
                  {
                     if(param2 * this.leftPlaneX + param6 * this.leftPlaneY + param4 * this.leftPlaneZ <= this.leftPlaneOffset)
                     {
                        return -1;
                     }
                     if(param5 * this.leftPlaneX + param3 * this.leftPlaneY + param7 * this.leftPlaneZ > this.leftPlaneOffset)
                     {
                        param1 &= 59;
                     }
                  }
               }
               else if(this.leftPlaneZ >= 0)
               {
                  if(param2 * this.leftPlaneX + param3 * this.leftPlaneY + param7 * this.leftPlaneZ <= this.leftPlaneOffset)
                  {
                     return -1;
                  }
                  if(param5 * this.leftPlaneX + param6 * this.leftPlaneY + param4 * this.leftPlaneZ > this.leftPlaneOffset)
                  {
                     param1 &= 59;
                  }
               }
               else
               {
                  if(param2 * this.leftPlaneX + param3 * this.leftPlaneY + param4 * this.leftPlaneZ <= this.leftPlaneOffset)
                  {
                     return -1;
                  }
                  if(param5 * this.leftPlaneX + param6 * this.leftPlaneY + param7 * this.leftPlaneZ > this.leftPlaneOffset)
                  {
                     param1 &= 59;
                  }
               }
            }
            if(param1 & 8)
            {
               if(this.rightPlaneX >= 0)
               {
                  if(this.rightPlaneY >= 0)
                  {
                     if(this.rightPlaneZ >= 0)
                     {
                        if(param5 * this.rightPlaneX + param6 * this.rightPlaneY + param7 * this.rightPlaneZ <= this.rightPlaneOffset)
                        {
                           return -1;
                        }
                        if(param2 * this.rightPlaneX + param3 * this.rightPlaneY + param4 * this.rightPlaneZ > this.rightPlaneOffset)
                        {
                           param1 &= 55;
                        }
                     }
                     else
                     {
                        if(param5 * this.rightPlaneX + param6 * this.rightPlaneY + param4 * this.rightPlaneZ <= this.rightPlaneOffset)
                        {
                           return -1;
                        }
                        if(param2 * this.rightPlaneX + param3 * this.rightPlaneY + param7 * this.rightPlaneZ > this.rightPlaneOffset)
                        {
                           param1 &= 55;
                        }
                     }
                  }
                  else if(this.rightPlaneZ >= 0)
                  {
                     if(param5 * this.rightPlaneX + param3 * this.rightPlaneY + param7 * this.rightPlaneZ <= this.rightPlaneOffset)
                     {
                        return -1;
                     }
                     if(param2 * this.rightPlaneX + param6 * this.rightPlaneY + param4 * this.rightPlaneZ > this.rightPlaneOffset)
                     {
                        param1 &= 55;
                     }
                  }
                  else
                  {
                     if(param5 * this.rightPlaneX + param3 * this.rightPlaneY + param4 * this.rightPlaneZ <= this.rightPlaneOffset)
                     {
                        return -1;
                     }
                     if(param2 * this.rightPlaneX + param6 * this.rightPlaneY + param7 * this.rightPlaneZ > this.rightPlaneOffset)
                     {
                        param1 &= 55;
                     }
                  }
               }
               else if(this.rightPlaneY >= 0)
               {
                  if(this.rightPlaneZ >= 0)
                  {
                     if(param2 * this.rightPlaneX + param6 * this.rightPlaneY + param7 * this.rightPlaneZ <= this.rightPlaneOffset)
                     {
                        return -1;
                     }
                     if(param5 * this.rightPlaneX + param3 * this.rightPlaneY + param4 * this.rightPlaneZ > this.rightPlaneOffset)
                     {
                        param1 &= 55;
                     }
                  }
                  else
                  {
                     if(param2 * this.rightPlaneX + param6 * this.rightPlaneY + param4 * this.rightPlaneZ <= this.rightPlaneOffset)
                     {
                        return -1;
                     }
                     if(param5 * this.rightPlaneX + param3 * this.rightPlaneY + param7 * this.rightPlaneZ > this.rightPlaneOffset)
                     {
                        param1 &= 55;
                     }
                  }
               }
               else if(this.rightPlaneZ >= 0)
               {
                  if(param2 * this.rightPlaneX + param3 * this.rightPlaneY + param7 * this.rightPlaneZ <= this.rightPlaneOffset)
                  {
                     return -1;
                  }
                  if(param5 * this.rightPlaneX + param6 * this.rightPlaneY + param4 * this.rightPlaneZ > this.rightPlaneOffset)
                  {
                     param1 &= 55;
                  }
               }
               else
               {
                  if(param2 * this.rightPlaneX + param3 * this.rightPlaneY + param4 * this.rightPlaneZ <= this.rightPlaneOffset)
                  {
                     return -1;
                  }
                  if(param5 * this.rightPlaneX + param6 * this.rightPlaneY + param7 * this.rightPlaneZ > this.rightPlaneOffset)
                  {
                     param1 &= 55;
                  }
               }
            }
            if(param1 & 0x10)
            {
               if(this.topPlaneX >= 0)
               {
                  if(this.topPlaneY >= 0)
                  {
                     if(this.topPlaneZ >= 0)
                     {
                        if(param5 * this.topPlaneX + param6 * this.topPlaneY + param7 * this.topPlaneZ <= this.topPlaneOffset)
                        {
                           return -1;
                        }
                        if(param2 * this.topPlaneX + param3 * this.topPlaneY + param4 * this.topPlaneZ > this.topPlaneOffset)
                        {
                           param1 &= 47;
                        }
                     }
                     else
                     {
                        if(param5 * this.topPlaneX + param6 * this.topPlaneY + param4 * this.topPlaneZ <= this.topPlaneOffset)
                        {
                           return -1;
                        }
                        if(param2 * this.topPlaneX + param3 * this.topPlaneY + param7 * this.topPlaneZ > this.topPlaneOffset)
                        {
                           param1 &= 47;
                        }
                     }
                  }
                  else if(this.topPlaneZ >= 0)
                  {
                     if(param5 * this.topPlaneX + param3 * this.topPlaneY + param7 * this.topPlaneZ <= this.topPlaneOffset)
                     {
                        return -1;
                     }
                     if(param2 * this.topPlaneX + param6 * this.topPlaneY + param4 * this.topPlaneZ > this.topPlaneOffset)
                     {
                        param1 &= 47;
                     }
                  }
                  else
                  {
                     if(param5 * this.topPlaneX + param3 * this.topPlaneY + param4 * this.topPlaneZ <= this.topPlaneOffset)
                     {
                        return -1;
                     }
                     if(param2 * this.topPlaneX + param6 * this.topPlaneY + param7 * this.topPlaneZ > this.topPlaneOffset)
                     {
                        param1 &= 47;
                     }
                  }
               }
               else if(this.topPlaneY >= 0)
               {
                  if(this.topPlaneZ >= 0)
                  {
                     if(param2 * this.topPlaneX + param6 * this.topPlaneY + param7 * this.topPlaneZ <= this.topPlaneOffset)
                     {
                        return -1;
                     }
                     if(param5 * this.topPlaneX + param3 * this.topPlaneY + param4 * this.topPlaneZ > this.topPlaneOffset)
                     {
                        param1 &= 47;
                     }
                  }
                  else
                  {
                     if(param2 * this.topPlaneX + param6 * this.topPlaneY + param4 * this.topPlaneZ <= this.topPlaneOffset)
                     {
                        return -1;
                     }
                     if(param5 * this.topPlaneX + param3 * this.topPlaneY + param7 * this.topPlaneZ > this.topPlaneOffset)
                     {
                        param1 &= 47;
                     }
                  }
               }
               else if(this.topPlaneZ >= 0)
               {
                  if(param2 * this.topPlaneX + param3 * this.topPlaneY + param7 * this.topPlaneZ <= this.topPlaneOffset)
                  {
                     return -1;
                  }
                  if(param5 * this.topPlaneX + param6 * this.topPlaneY + param4 * this.topPlaneZ > this.topPlaneOffset)
                  {
                     param1 &= 47;
                  }
               }
               else
               {
                  if(param2 * this.topPlaneX + param3 * this.topPlaneY + param4 * this.topPlaneZ <= this.topPlaneOffset)
                  {
                     return -1;
                  }
                  if(param5 * this.topPlaneX + param6 * this.topPlaneY + param7 * this.topPlaneZ > this.topPlaneOffset)
                  {
                     param1 &= 47;
                  }
               }
            }
            if(param1 & 0x20)
            {
               if(this.bottomPlaneX >= 0)
               {
                  if(this.bottomPlaneY >= 0)
                  {
                     if(this.bottomPlaneZ >= 0)
                     {
                        if(param5 * this.bottomPlaneX + param6 * this.bottomPlaneY + param7 * this.bottomPlaneZ <= this.bottomPlaneOffset)
                        {
                           return -1;
                        }
                        if(param2 * this.bottomPlaneX + param3 * this.bottomPlaneY + param4 * this.bottomPlaneZ > this.bottomPlaneOffset)
                        {
                           param1 &= 31;
                        }
                     }
                     else
                     {
                        if(param5 * this.bottomPlaneX + param6 * this.bottomPlaneY + param4 * this.bottomPlaneZ <= this.bottomPlaneOffset)
                        {
                           return -1;
                        }
                        if(param2 * this.bottomPlaneX + param3 * this.bottomPlaneY + param7 * this.bottomPlaneZ > this.bottomPlaneOffset)
                        {
                           param1 &= 31;
                        }
                     }
                  }
                  else if(this.bottomPlaneZ >= 0)
                  {
                     if(param5 * this.bottomPlaneX + param3 * this.bottomPlaneY + param7 * this.bottomPlaneZ <= this.bottomPlaneOffset)
                     {
                        return -1;
                     }
                     if(param2 * this.bottomPlaneX + param6 * this.bottomPlaneY + param4 * this.bottomPlaneZ > this.bottomPlaneOffset)
                     {
                        param1 &= 31;
                     }
                  }
                  else
                  {
                     if(param5 * this.bottomPlaneX + param3 * this.bottomPlaneY + param4 * this.bottomPlaneZ <= this.bottomPlaneOffset)
                     {
                        return -1;
                     }
                     if(param2 * this.bottomPlaneX + param6 * this.bottomPlaneY + param7 * this.bottomPlaneZ > this.bottomPlaneOffset)
                     {
                        param1 &= 31;
                     }
                  }
               }
               else if(this.bottomPlaneY >= 0)
               {
                  if(this.bottomPlaneZ >= 0)
                  {
                     if(param2 * this.bottomPlaneX + param6 * this.bottomPlaneY + param7 * this.bottomPlaneZ <= this.bottomPlaneOffset)
                     {
                        return -1;
                     }
                     if(param5 * this.bottomPlaneX + param3 * this.bottomPlaneY + param4 * this.bottomPlaneZ > this.bottomPlaneOffset)
                     {
                        param1 &= 31;
                     }
                  }
                  else
                  {
                     if(param2 * this.bottomPlaneX + param6 * this.bottomPlaneY + param4 * this.bottomPlaneZ <= this.bottomPlaneOffset)
                     {
                        return -1;
                     }
                     if(param5 * this.bottomPlaneX + param3 * this.bottomPlaneY + param7 * this.bottomPlaneZ > this.bottomPlaneOffset)
                     {
                        param1 &= 31;
                     }
                  }
               }
               else if(this.bottomPlaneZ >= 0)
               {
                  if(param2 * this.bottomPlaneX + param3 * this.bottomPlaneY + param7 * this.bottomPlaneZ <= this.bottomPlaneOffset)
                  {
                     return -1;
                  }
                  if(param5 * this.bottomPlaneX + param6 * this.bottomPlaneY + param4 * this.bottomPlaneZ > this.bottomPlaneOffset)
                  {
                     param1 &= 31;
                  }
               }
               else
               {
                  if(param2 * this.bottomPlaneX + param3 * this.bottomPlaneY + param4 * this.bottomPlaneZ <= this.bottomPlaneOffset)
                  {
                     return -1;
                  }
                  if(param5 * this.bottomPlaneX + param6 * this.bottomPlaneY + param7 * this.bottomPlaneZ > this.bottomPlaneOffset)
                  {
                     param1 &= 31;
                  }
               }
            }
         }
         var _loc9_:int = 0;
         while(true)
         {
            if(_loc9_ >= this.numOccluders)
            {
               return param1;
            }
            _loc8_ = this.occluders[_loc9_];
            while(_loc8_ != null)
            {
               if(_loc8_.x >= 0)
               {
                  if(_loc8_.y >= 0)
                  {
                     if(_loc8_.z >= 0)
                     {
                        if(param5 * _loc8_.x + param6 * _loc8_.y + param7 * _loc8_.z > _loc8_.alternativa3d::offset)
                        {
                           break;
                        }
                     }
                     else if(param5 * _loc8_.x + param6 * _loc8_.y + param4 * _loc8_.z > _loc8_.alternativa3d::offset)
                     {
                        break;
                     }
                  }
                  else if(_loc8_.z >= 0)
                  {
                     if(param5 * _loc8_.x + param3 * _loc8_.y + param7 * _loc8_.z > _loc8_.alternativa3d::offset)
                     {
                        break;
                     }
                  }
                  else if(param5 * _loc8_.x + param3 * _loc8_.y + param4 * _loc8_.z > _loc8_.alternativa3d::offset)
                  {
                     break;
                  }
               }
               else if(_loc8_.y >= 0)
               {
                  if(_loc8_.z >= 0)
                  {
                     if(param2 * _loc8_.x + param6 * _loc8_.y + param7 * _loc8_.z > _loc8_.alternativa3d::offset)
                     {
                        break;
                     }
                  }
                  else if(param2 * _loc8_.x + param6 * _loc8_.y + param4 * _loc8_.z > _loc8_.alternativa3d::offset)
                  {
                     break;
                  }
               }
               else if(_loc8_.z >= 0)
               {
                  if(param2 * _loc8_.x + param3 * _loc8_.y + param7 * _loc8_.z > _loc8_.alternativa3d::offset)
                  {
                     break;
                  }
               }
               else if(param2 * _loc8_.x + param3 * _loc8_.y + param4 * _loc8_.z > _loc8_.alternativa3d::offset)
               {
                  break;
               }
               _loc8_ = _loc8_.alternativa3d::next;
            }
            if(_loc8_ == null)
            {
               break;
            }
            _loc9_++;
         }
         return -1;
      }
      
      private function occludeGeometry(param1:Camera3D, param2:VG) : Boolean
      {
         var _loc3_:Vertex = null;
         var _loc4_:int = param2.alternativa3d::numOccluders;
         while(true)
         {
            if(_loc4_ >= this.numOccluders)
            {
               param2.alternativa3d::numOccluders = this.numOccluders;
               return false;
            }
            _loc3_ = this.occluders[_loc4_];
            while(_loc3_ != null)
            {
               if(_loc3_.x >= 0)
               {
                  if(_loc3_.y >= 0)
                  {
                     if(_loc3_.z >= 0)
                     {
                        if(param2.alternativa3d::boundMaxX * _loc3_.x + param2.alternativa3d::boundMaxY * _loc3_.y + param2.alternativa3d::boundMaxZ * _loc3_.z > _loc3_.alternativa3d::offset)
                        {
                           break;
                        }
                     }
                     else if(param2.alternativa3d::boundMaxX * _loc3_.x + param2.alternativa3d::boundMaxY * _loc3_.y + param2.alternativa3d::boundMinZ * _loc3_.z > _loc3_.alternativa3d::offset)
                     {
                        break;
                     }
                  }
                  else if(_loc3_.z >= 0)
                  {
                     if(param2.alternativa3d::boundMaxX * _loc3_.x + param2.alternativa3d::boundMinY * _loc3_.y + param2.alternativa3d::boundMaxZ * _loc3_.z > _loc3_.alternativa3d::offset)
                     {
                        break;
                     }
                  }
                  else if(param2.alternativa3d::boundMaxX * _loc3_.x + param2.alternativa3d::boundMinY * _loc3_.y + param2.alternativa3d::boundMinZ * _loc3_.z > _loc3_.alternativa3d::offset)
                  {
                     break;
                  }
               }
               else if(_loc3_.y >= 0)
               {
                  if(_loc3_.z >= 0)
                  {
                     if(param2.alternativa3d::boundMinX * _loc3_.x + param2.alternativa3d::boundMaxY * _loc3_.y + param2.alternativa3d::boundMaxZ * _loc3_.z > _loc3_.alternativa3d::offset)
                     {
                        break;
                     }
                  }
                  else if(param2.alternativa3d::boundMinX * _loc3_.x + param2.alternativa3d::boundMaxY * _loc3_.y + param2.alternativa3d::boundMinZ * _loc3_.z > _loc3_.alternativa3d::offset)
                  {
                     break;
                  }
               }
               else if(_loc3_.z >= 0)
               {
                  if(param2.alternativa3d::boundMinX * _loc3_.x + param2.alternativa3d::boundMinY * _loc3_.y + param2.alternativa3d::boundMaxZ * _loc3_.z > _loc3_.alternativa3d::offset)
                  {
                     break;
                  }
               }
               else if(param2.alternativa3d::boundMinX * _loc3_.x + param2.alternativa3d::boundMinY * _loc3_.y + param2.alternativa3d::boundMinZ * _loc3_.z > _loc3_.alternativa3d::offset)
               {
                  break;
               }
               _loc3_ = _loc3_.alternativa3d::next;
            }
            if(_loc3_ == null)
            {
               break;
            }
            _loc4_++;
         }
         return true;
      }
   }
}

import alternativa.engine3d.alternativa3d;
import alternativa.engine3d.core.Face;
import alternativa.engine3d.core.Object3D;
import alternativa.engine3d.core.Shadow;
import alternativa.engine3d.core.Vertex;
import alternativa.engine3d.core.Wrapper;
import alternativa.engine3d.materials.TextureMaterial;
import alternativa.engine3d.objects.BSP;
import alternativa.engine3d.objects.Decal;
import alternativa.engine3d.objects.Mesh;

use namespace alternativa3d;

class KDNode
{
   public var negative:KDNode;
   
   public var positive:KDNode;
   
   public var axis:int;
   
   public var coord:Number;
   
   public var minCoord:Number;
   
   public var maxCoord:Number;
   
   public var boundMinX:Number;
   
   public var boundMinY:Number;
   
   public var boundMinZ:Number;
   
   public var boundMaxX:Number;
   
   public var boundMaxY:Number;
   
   public var boundMaxZ:Number;
   
   public var objectList:Object3D;
   
   public var objectBoundList:Object3D;
   
   public var occluderList:Object3D;
   
   public var occluderBoundList:Object3D;
   
   public var receiverList:Receiver;
   
   public function KDNode()
   {
      super();
   }
   
   public function createReceivers(param1:Vector.<Vector.<Number>>, param2:Vector.<Vector.<uint>>) : void
   {
      var _loc3_:Receiver = null;
      var _loc4_:Receiver = null;
      var _loc5_:Vertex = null;
      var _loc6_:Vertex = null;
      var _loc7_:Vector.<Face> = null;
      var _loc8_:int = 0;
      var _loc9_:TextureMaterial = null;
      var _loc10_:int = 0;
      var _loc11_:int = 0;
      var _loc12_:Vector.<Number> = null;
      var _loc13_:Vector.<uint> = null;
      var _loc14_:int = 0;
      var _loc15_:int = 0;
      var _loc16_:int = 0;
      var _loc17_:int = 0;
      var _loc18_:Face = null;
      var _loc19_:Wrapper = null;
      var _loc20_:uint = 0;
      var _loc21_:uint = 0;
      var _loc22_:uint = 0;
      var _loc23_:Object3D = null;
      _loc3_ = null;
      _loc4_ = null;
      _loc5_ = null;
      _loc6_ = null;
      _loc7_ = null;
      _loc8_ = 0;
      _loc9_ = null;
      _loc10_ = 0;
      _loc11_ = 0;
      _loc12_ = null;
      _loc13_ = null;
      _loc14_ = 0;
      _loc15_ = 0;
      _loc16_ = 0;
      _loc17_ = 0;
      _loc18_ = null;
      _loc19_ = null;
      _loc20_ = 0;
      _loc21_ = 0;
      _loc22_ = 0;
      this.receiverList = null;
      _loc23_ = this.objectList;
      while(_loc23_ != null)
      {
         _loc23_.alternativa3d::composeMatrix();
         _loc4_ = new Receiver();
         if(_loc3_ != null)
         {
            _loc3_.next = _loc4_;
         }
         else
         {
            this.receiverList = _loc4_;
         }
         _loc3_ = _loc4_;
         if(_loc23_ is Mesh)
         {
            _loc6_ = (_loc23_ as Mesh).alternativa3d::vertexList;
            _loc7_ = (_loc23_ as Mesh).faces;
         }
         else if(_loc23_ is BSP)
         {
            _loc6_ = (_loc23_ as BSP).alternativa3d::vertexList;
            _loc7_ = (_loc23_ as BSP).alternativa3d::faces;
         }
         _loc8_ = int(_loc7_.length);
         _loc9_ = _loc7_[0].material as TextureMaterial;
         if(_loc8_ > 0 && _loc9_ != null)
         {
            _loc10_ = 0;
            _loc5_ = _loc6_;
            while(_loc5_ != null)
            {
               _loc10_++;
               _loc5_ = _loc5_.alternativa3d::next;
            }
            _loc11_ = int(param1.length - 1);
            _loc12_ = param1[_loc11_];
            if(_loc12_.length / 3 + _loc10_ > 65535)
            {
               _loc11_++;
               param1[_loc11_] = new Vector.<Number>();
               param2[_loc11_] = new Vector.<uint>();
               _loc12_ = param1[_loc11_];
            }
            _loc13_ = param2[_loc11_];
            _loc14_ = int(_loc12_.length);
            _loc15_ = _loc14_ / 3;
            _loc16_ = int(_loc13_.length);
            _loc4_.buffer = _loc11_;
            _loc4_.firstIndex = _loc16_;
            _loc4_.transparent = _loc9_.alternativa3d::transparent;
            _loc5_ = _loc6_;
            while(_loc5_ != null)
            {
               _loc12_[_loc14_] = _loc5_.x * _loc23_.alternativa3d::ma + _loc5_.y * _loc23_.alternativa3d::mb + _loc5_.z * _loc23_.alternativa3d::mc + _loc23_.alternativa3d::md;
               _loc14_++;
               _loc12_[_loc14_] = _loc5_.x * _loc23_.alternativa3d::me + _loc5_.y * _loc23_.alternativa3d::mf + _loc5_.z * _loc23_.alternativa3d::mg + _loc23_.alternativa3d::mh;
               _loc14_++;
               _loc12_[_loc14_] = _loc5_.x * _loc23_.alternativa3d::mi + _loc5_.y * _loc23_.alternativa3d::mj + _loc5_.z * _loc23_.alternativa3d::mk + _loc23_.alternativa3d::ml;
               _loc14_++;
               _loc5_.alternativa3d::index = _loc15_;
               _loc15_++;
               _loc5_ = _loc5_.alternativa3d::next;
            }
            _loc17_ = 0;
            while(_loc17_ < _loc8_)
            {
               _loc18_ = _loc7_[_loc17_];
               if(_loc18_.alternativa3d::normalX * _loc23_.alternativa3d::mi + _loc18_.alternativa3d::normalY * _loc23_.alternativa3d::mj + _loc18_.alternativa3d::normalZ * _loc23_.alternativa3d::mk >= -0.5)
               {
                  _loc19_ = _loc18_.alternativa3d::wrapper;
                  _loc20_ = uint(_loc19_.alternativa3d::vertex.alternativa3d::index);
                  _loc19_ = _loc19_.alternativa3d::next;
                  _loc21_ = uint(_loc19_.alternativa3d::vertex.alternativa3d::index);
                  _loc19_ = _loc19_.alternativa3d::next;
                  while(_loc19_ != null)
                  {
                     _loc22_ = uint(_loc19_.alternativa3d::vertex.alternativa3d::index);
                     _loc13_[_loc16_] = _loc20_;
                     _loc16_++;
                     _loc13_[_loc16_] = _loc21_;
                     _loc16_++;
                     _loc13_[_loc16_] = _loc22_;
                     _loc16_++;
                     ++_loc4_.numTriangles;
                     _loc21_ = _loc22_;
                     _loc19_ = _loc19_.alternativa3d::next;
                  }
               }
               _loc17_++;
            }
         }
         _loc23_ = _loc23_.alternativa3d::next;
      }
      if(this.negative != null)
      {
         this.negative.createReceivers(param1,param2);
      }
      if(this.positive != null)
      {
         this.positive.createReceivers(param1,param2);
      }
   }
   
   public function collectReceivers(param1:Shadow) : void
   {
      var _loc2_:Object3D = null;
      var _loc3_:Object3D = null;
      var _loc4_:Receiver = null;
      var _loc5_:* = false;
      var _loc6_:* = false;
      var _loc7_:Number = NaN;
      var _loc8_:Number = NaN;
      _loc2_ = null;
      _loc3_ = null;
      _loc4_ = null;
      _loc5_ = false;
      _loc6_ = false;
      _loc7_ = NaN;
      _loc8_ = NaN;
      if(this.negative != null)
      {
         _loc5_ = this.axis == 0;
         _loc6_ = this.axis == 1;
         _loc7_ = _loc5_ ? Number(param1.alternativa3d::boundMinX) : (_loc6_ ? Number(param1.alternativa3d::boundMinY) : Number(param1.alternativa3d::boundMinZ));
         _loc8_ = _loc5_ ? Number(param1.alternativa3d::boundMaxX) : (_loc6_ ? Number(param1.alternativa3d::boundMaxY) : Number(param1.alternativa3d::boundMaxZ));
         if(_loc8_ <= this.maxCoord)
         {
            this.negative.collectReceivers(param1);
         }
         else if(_loc7_ >= this.minCoord)
         {
            this.positive.collectReceivers(param1);
         }
         else
         {
            if(_loc5_)
            {
               _loc3_ = this.objectBoundList;
               _loc2_ = this.objectList;
               _loc4_ = this.receiverList;
               while(_loc3_ != null)
               {
                  if(_loc4_.numTriangles > 0 && param1.alternativa3d::boundMinY < _loc3_.boundMaxY && param1.alternativa3d::boundMaxY > _loc3_.boundMinY && param1.alternativa3d::boundMinZ < _loc3_.boundMaxZ && param1.alternativa3d::boundMaxZ > _loc3_.boundMinZ)
                  {
                     if(!_loc4_.transparent)
                     {
                        param1.alternativa3d::receiversBuffers[param1.alternativa3d::receiversCount] = _loc4_.buffer;
                        param1.alternativa3d::receiversFirstIndexes[param1.alternativa3d::receiversCount] = _loc4_.firstIndex;
                        param1.alternativa3d::receiversNumsTriangles[param1.alternativa3d::receiversCount] = _loc4_.numTriangles;
                        ++param1.alternativa3d::receiversCount;
                     }
                  }
                  _loc3_ = _loc3_.alternativa3d::next;
                  _loc2_ = _loc2_.alternativa3d::next;
                  _loc4_ = _loc4_.next;
               }
            }
            else if(_loc6_)
            {
               _loc3_ = this.objectBoundList;
               _loc2_ = this.objectList;
               _loc4_ = this.receiverList;
               while(_loc3_ != null)
               {
                  if(_loc4_.numTriangles > 0 && param1.alternativa3d::boundMinX < _loc3_.boundMaxX && param1.alternativa3d::boundMaxX > _loc3_.boundMinX && param1.alternativa3d::boundMinZ < _loc3_.boundMaxZ && param1.alternativa3d::boundMaxZ > _loc3_.boundMinZ)
                  {
                     if(!_loc4_.transparent)
                     {
                        param1.alternativa3d::receiversBuffers[param1.alternativa3d::receiversCount] = _loc4_.buffer;
                        param1.alternativa3d::receiversFirstIndexes[param1.alternativa3d::receiversCount] = _loc4_.firstIndex;
                        param1.alternativa3d::receiversNumsTriangles[param1.alternativa3d::receiversCount] = _loc4_.numTriangles;
                        ++param1.alternativa3d::receiversCount;
                     }
                  }
                  _loc3_ = _loc3_.alternativa3d::next;
                  _loc2_ = _loc2_.alternativa3d::next;
                  _loc4_ = _loc4_.next;
               }
            }
            else
            {
               _loc3_ = this.objectBoundList;
               _loc2_ = this.objectList;
               _loc4_ = this.receiverList;
               while(_loc3_ != null)
               {
                  if(_loc4_.numTriangles > 0 && param1.alternativa3d::boundMinX < _loc3_.boundMaxX && param1.alternativa3d::boundMaxX > _loc3_.boundMinX && param1.alternativa3d::boundMinY < _loc3_.boundMaxY && param1.alternativa3d::boundMaxY > _loc3_.boundMinY)
                  {
                     if(!_loc4_.transparent)
                     {
                        param1.alternativa3d::receiversBuffers[param1.alternativa3d::receiversCount] = _loc4_.buffer;
                        param1.alternativa3d::receiversFirstIndexes[param1.alternativa3d::receiversCount] = _loc4_.firstIndex;
                        param1.alternativa3d::receiversNumsTriangles[param1.alternativa3d::receiversCount] = _loc4_.numTriangles;
                        ++param1.alternativa3d::receiversCount;
                     }
                  }
                  _loc3_ = _loc3_.alternativa3d::next;
                  _loc2_ = _loc2_.alternativa3d::next;
                  _loc4_ = _loc4_.next;
               }
            }
            this.negative.collectReceivers(param1);
            this.positive.collectReceivers(param1);
         }
      }
      else
      {
         _loc2_ = this.objectList;
         _loc4_ = this.receiverList;
         while(_loc4_ != null)
         {
            if(_loc4_.numTriangles > 0)
            {
               if(!_loc4_.transparent)
               {
                  param1.alternativa3d::receiversBuffers[param1.alternativa3d::receiversCount] = _loc4_.buffer;
                  param1.alternativa3d::receiversFirstIndexes[param1.alternativa3d::receiversCount] = _loc4_.firstIndex;
                  param1.alternativa3d::receiversNumsTriangles[param1.alternativa3d::receiversCount] = _loc4_.numTriangles;
                  ++param1.alternativa3d::receiversCount;
               }
            }
            _loc2_ = _loc2_.alternativa3d::next;
            _loc4_ = _loc4_.next;
         }
      }
   }
   
   public function collectPolygons(param1:Decal, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number) : void
   {
      var _loc10_:Object3D = null;
      var _loc11_:Object3D = null;
      var _loc12_:* = false;
      var _loc13_:* = false;
      var _loc14_:Number = NaN;
      var _loc15_:Number = NaN;
      _loc10_ = null;
      _loc11_ = null;
      _loc12_ = false;
      _loc13_ = false;
      _loc14_ = NaN;
      _loc15_ = NaN;
      if(this.negative != null)
      {
         _loc12_ = this.axis == 0;
         _loc13_ = this.axis == 1;
         _loc14_ = _loc12_ ? Number(param4) : (_loc13_ ? Number(param6) : Number(param8));
         _loc15_ = _loc12_ ? Number(param5) : (_loc13_ ? Number(param7) : Number(param9));
         if(_loc15_ <= this.maxCoord)
         {
            this.negative.collectPolygons(param1,param2,param3,param4,param5,param6,param7,param8,param9);
         }
         else if(_loc14_ >= this.minCoord)
         {
            this.positive.collectPolygons(param1,param2,param3,param4,param5,param6,param7,param8,param9);
         }
         else
         {
            _loc11_ = this.objectBoundList;
            _loc10_ = this.objectList;
            while(_loc11_ != null)
            {
               if(_loc12_)
               {
                  if(param6 < _loc11_.boundMaxY && param7 > _loc11_.boundMinY && param8 < _loc11_.boundMaxZ && param9 > _loc11_.boundMinZ)
                  {
                     this.clip(param1,param2,param3,_loc10_);
                  }
               }
               else if(_loc13_)
               {
                  if(param4 < _loc11_.boundMaxX && param5 > _loc11_.boundMinX && param8 < _loc11_.boundMaxZ && param9 > _loc11_.boundMinZ)
                  {
                     this.clip(param1,param2,param3,_loc10_);
                  }
               }
               else if(param4 < _loc11_.boundMaxX && param5 > _loc11_.boundMinX && param6 < _loc11_.boundMaxY && param7 > _loc11_.boundMinY)
               {
                  this.clip(param1,param2,param3,_loc10_);
               }
               _loc11_ = _loc11_.alternativa3d::next;
               _loc10_ = _loc10_.alternativa3d::next;
            }
            this.negative.collectPolygons(param1,param2,param3,param4,param5,param6,param7,param8,param9);
            this.positive.collectPolygons(param1,param2,param3,param4,param5,param6,param7,param8,param9);
         }
      }
      else
      {
         _loc10_ = this.objectList;
         while(_loc10_ != null)
         {
            this.clip(param1,param2,param3,_loc10_);
            _loc10_ = _loc10_.alternativa3d::next;
         }
      }
   }
   
   private function clip(param1:Decal, param2:Number, param3:Number, param4:Object3D) : void
   {
      var _loc5_:Face = null;
      var _loc6_:Vertex = null;
      var _loc7_:Wrapper = null;
      var _loc9_:Vector.<Face> = null;
      var _loc10_:int = 0;
      var _loc11_:int = 0;
      var _loc12_:Number = NaN;
      var _loc13_:Number = NaN;
      var _loc14_:Vertex = null;
      var _loc15_:Vertex = null;
      var _loc16_:Vertex = null;
      var _loc17_:Vertex = null;
      var _loc18_:Vertex = null;
      var _loc19_:Vertex = null;
      var _loc20_:Wrapper = null;
      _loc5_ = null;
      _loc6_ = null;
      _loc7_ = null;
      var _loc8_:Vertex = null;
      _loc9_ = null;
      _loc10_ = 0;
      _loc11_ = 0;
      _loc12_ = NaN;
      _loc13_ = NaN;
      _loc14_ = null;
      _loc15_ = null;
      _loc16_ = null;
      _loc17_ = null;
      _loc18_ = null;
      _loc19_ = null;
      _loc20_ = null;
      if(param4 is Mesh)
      {
         _loc8_ = Mesh(param4).alternativa3d::vertexList;
         _loc5_ = Mesh(param4).alternativa3d::faceList;
         if(_loc5_.material == null || _loc5_.material.alternativa3d::transparent)
         {
            return;
         }
         _loc9_ = Mesh(param4).faces;
      }
      else if(param4 is BSP)
      {
         _loc8_ = BSP(param4).alternativa3d::vertexList;
         _loc9_ = BSP(param4).alternativa3d::faces;
         if((_loc5_ = _loc9_[0]).material == null || _loc5_.material.alternativa3d::transparent)
         {
            return;
         }
      }
      param4.alternativa3d::composeAndAppend(param1);
      param4.alternativa3d::calculateInverseMatrix();
      ++param4.alternativa3d::transformId;
      _loc10_ = int(_loc9_.length);
      _loc11_ = 0;
      while(_loc11_ < _loc10_)
      {
         _loc5_ = _loc9_[_loc11_];
         if(-_loc5_.alternativa3d::normalX * param4.alternativa3d::imc - _loc5_.alternativa3d::normalY * param4.alternativa3d::img - _loc5_.alternativa3d::normalZ * param4.alternativa3d::imk >= param3)
         {
            _loc12_ = _loc5_.alternativa3d::normalX * param4.alternativa3d::imd + _loc5_.alternativa3d::normalY * param4.alternativa3d::imh + _loc5_.alternativa3d::normalZ * param4.alternativa3d::iml;
            if(!(_loc12_ <= _loc5_.alternativa3d::offset - param2 || _loc12_ >= _loc5_.alternativa3d::offset + param2))
            {
               _loc7_ = _loc5_.alternativa3d::wrapper;
               while(_loc7_ != null)
               {
                  _loc6_ = _loc7_.alternativa3d::vertex;
                  if(_loc6_.alternativa3d::transformId != param4.alternativa3d::transformId)
                  {
                     _loc6_.alternativa3d::cameraX = param4.alternativa3d::ma * _loc6_.x + param4.alternativa3d::mb * _loc6_.y + param4.alternativa3d::mc * _loc6_.z + param4.alternativa3d::md;
                     _loc6_.alternativa3d::cameraY = param4.alternativa3d::me * _loc6_.x + param4.alternativa3d::mf * _loc6_.y + param4.alternativa3d::mg * _loc6_.z + param4.alternativa3d::mh;
                     _loc6_.alternativa3d::cameraZ = param4.alternativa3d::mi * _loc6_.x + param4.alternativa3d::mj * _loc6_.y + param4.alternativa3d::mk * _loc6_.z + param4.alternativa3d::ml;
                     _loc6_.alternativa3d::transformId = param4.alternativa3d::transformId;
                  }
                  _loc7_ = _loc7_.alternativa3d::next;
               }
               _loc7_ = _loc5_.alternativa3d::wrapper;
               while(_loc7_ != null)
               {
                  if(_loc7_.alternativa3d::vertex.alternativa3d::cameraX > param1.boundMinX)
                  {
                     break;
                  }
                  _loc7_ = _loc7_.alternativa3d::next;
               }
               if(_loc7_ != null)
               {
                  _loc7_ = _loc5_.alternativa3d::wrapper;
                  while(_loc7_ != null)
                  {
                     if(_loc7_.alternativa3d::vertex.alternativa3d::cameraX < param1.boundMaxX)
                     {
                        break;
                     }
                     _loc7_ = _loc7_.alternativa3d::next;
                  }
                  if(_loc7_ != null)
                  {
                     _loc7_ = _loc5_.alternativa3d::wrapper;
                     while(_loc7_ != null)
                     {
                        if(_loc7_.alternativa3d::vertex.alternativa3d::cameraY > param1.boundMinY)
                        {
                           break;
                        }
                        _loc7_ = _loc7_.alternativa3d::next;
                     }
                     if(_loc7_ != null)
                     {
                        _loc7_ = _loc5_.alternativa3d::wrapper;
                        while(_loc7_ != null)
                        {
                           if(_loc7_.alternativa3d::vertex.alternativa3d::cameraY < param1.boundMaxY)
                           {
                              break;
                           }
                           _loc7_ = _loc7_.alternativa3d::next;
                        }
                        if(_loc7_ != null)
                        {
                           _loc7_ = _loc5_.alternativa3d::wrapper;
                           while(_loc7_ != null)
                           {
                              if(_loc7_.alternativa3d::vertex.alternativa3d::cameraZ > param1.boundMinZ)
                              {
                                 break;
                              }
                              _loc7_ = _loc7_.alternativa3d::next;
                           }
                           if(_loc7_ != null)
                           {
                              _loc7_ = _loc5_.alternativa3d::wrapper;
                              while(_loc7_ != null)
                              {
                                 if(_loc7_.alternativa3d::vertex.alternativa3d::cameraZ < param1.boundMaxZ)
                                 {
                                    break;
                                 }
                                 _loc7_ = _loc7_.alternativa3d::next;
                              }
                              if(_loc7_ != null)
                              {
                                 _loc18_ = null;
                                 _loc19_ = null;
                                 _loc7_ = _loc5_.alternativa3d::wrapper;
                                 while(_loc7_ != null)
                                 {
                                    _loc6_ = _loc7_.alternativa3d::vertex;
                                    (_loc16_ = new Vertex()).x = _loc6_.alternativa3d::cameraX;
                                    _loc16_.y = _loc6_.alternativa3d::cameraY;
                                    _loc16_.z = _loc6_.alternativa3d::cameraZ;
                                    _loc16_.normalX = param4.alternativa3d::ma * _loc6_.normalX + param4.alternativa3d::mb * _loc6_.normalY + param4.alternativa3d::mc * _loc6_.normalZ;
                                    _loc16_.normalY = param4.alternativa3d::me * _loc6_.normalX + param4.alternativa3d::mf * _loc6_.normalY + param4.alternativa3d::mg * _loc6_.normalZ;
                                    _loc16_.normalZ = param4.alternativa3d::mi * _loc6_.normalX + param4.alternativa3d::mj * _loc6_.normalY + param4.alternativa3d::mk * _loc6_.normalZ;
                                    if(_loc19_ != null)
                                    {
                                       _loc19_.alternativa3d::next = _loc16_;
                                    }
                                    else
                                    {
                                       _loc18_ = _loc16_;
                                    }
                                    _loc19_ = _loc16_;
                                    _loc7_ = _loc7_.alternativa3d::next;
                                 }
                                 _loc14_ = _loc19_;
                                 _loc15_ = _loc18_;
                                 _loc18_ = null;
                                 _loc19_ = null;
                                 while(_loc15_ != null)
                                 {
                                    _loc17_ = _loc15_.alternativa3d::next;
                                    _loc15_.alternativa3d::next = null;
                                    if(_loc15_.z > param1.boundMinZ && _loc14_.z <= param1.boundMinZ || _loc15_.z <= param1.boundMinZ && _loc14_.z > param1.boundMinZ)
                                    {
                                       _loc13_ = (param1.boundMinZ - _loc14_.z) / (_loc15_.z - _loc14_.z);
                                       (_loc16_ = new Vertex()).x = _loc14_.x + (_loc15_.x - _loc14_.x) * _loc13_;
                                       _loc16_.y = _loc14_.y + (_loc15_.y - _loc14_.y) * _loc13_;
                                       _loc16_.z = _loc14_.z + (_loc15_.z - _loc14_.z) * _loc13_;
                                       _loc16_.normalX = _loc14_.normalX + (_loc15_.normalX - _loc14_.normalX) * _loc13_;
                                       _loc16_.normalY = _loc14_.normalY + (_loc15_.normalY - _loc14_.normalY) * _loc13_;
                                       _loc16_.normalZ = _loc14_.normalZ + (_loc15_.normalZ - _loc14_.normalZ) * _loc13_;
                                       if(_loc19_ != null)
                                       {
                                          _loc19_.alternativa3d::next = _loc16_;
                                       }
                                       else
                                       {
                                          _loc18_ = _loc16_;
                                       }
                                       _loc19_ = _loc16_;
                                    }
                                    if(_loc15_.z > param1.boundMinZ)
                                    {
                                       if(_loc19_ != null)
                                       {
                                          _loc19_.alternativa3d::next = _loc15_;
                                       }
                                       else
                                       {
                                          _loc18_ = _loc15_;
                                       }
                                       _loc19_ = _loc15_;
                                    }
                                    _loc14_ = _loc15_;
                                    _loc15_ = _loc17_;
                                 }
                                 if(_loc18_ != null)
                                 {
                                    _loc14_ = _loc19_;
                                    _loc15_ = _loc18_;
                                    _loc18_ = null;
                                    _loc19_ = null;
                                    while(_loc15_ != null)
                                    {
                                       _loc17_ = _loc15_.alternativa3d::next;
                                       _loc15_.alternativa3d::next = null;
                                       if(_loc15_.z < param1.boundMaxZ && _loc14_.z >= param1.boundMaxZ || _loc15_.z >= param1.boundMaxZ && _loc14_.z < param1.boundMaxZ)
                                       {
                                          _loc13_ = (param1.boundMaxZ - _loc14_.z) / (_loc15_.z - _loc14_.z);
                                          (_loc16_ = new Vertex()).x = _loc14_.x + (_loc15_.x - _loc14_.x) * _loc13_;
                                          _loc16_.y = _loc14_.y + (_loc15_.y - _loc14_.y) * _loc13_;
                                          _loc16_.z = _loc14_.z + (_loc15_.z - _loc14_.z) * _loc13_;
                                          _loc16_.normalX = _loc14_.normalX + (_loc15_.normalX - _loc14_.normalX) * _loc13_;
                                          _loc16_.normalY = _loc14_.normalY + (_loc15_.normalY - _loc14_.normalY) * _loc13_;
                                          _loc16_.normalZ = _loc14_.normalZ + (_loc15_.normalZ - _loc14_.normalZ) * _loc13_;
                                          if(_loc19_ != null)
                                          {
                                             _loc19_.alternativa3d::next = _loc16_;
                                          }
                                          else
                                          {
                                             _loc18_ = _loc16_;
                                          }
                                          _loc19_ = _loc16_;
                                       }
                                       if(_loc15_.z < param1.boundMaxZ)
                                       {
                                          if(_loc19_ != null)
                                          {
                                             _loc19_.alternativa3d::next = _loc15_;
                                          }
                                          else
                                          {
                                             _loc18_ = _loc15_;
                                          }
                                          _loc19_ = _loc15_;
                                       }
                                       _loc14_ = _loc15_;
                                       _loc15_ = _loc17_;
                                    }
                                    if(_loc18_ != null)
                                    {
                                       _loc14_ = _loc19_;
                                       _loc15_ = _loc18_;
                                       _loc18_ = null;
                                       _loc19_ = null;
                                       while(_loc15_ != null)
                                       {
                                          _loc17_ = _loc15_.alternativa3d::next;
                                          _loc15_.alternativa3d::next = null;
                                          if(_loc15_.x > param1.boundMinX && _loc14_.x <= param1.boundMinX || _loc15_.x <= param1.boundMinX && _loc14_.x > param1.boundMinX)
                                          {
                                             _loc13_ = (param1.boundMinX - _loc14_.x) / (_loc15_.x - _loc14_.x);
                                             (_loc16_ = new Vertex()).x = _loc14_.x + (_loc15_.x - _loc14_.x) * _loc13_;
                                             _loc16_.y = _loc14_.y + (_loc15_.y - _loc14_.y) * _loc13_;
                                             _loc16_.z = _loc14_.z + (_loc15_.z - _loc14_.z) * _loc13_;
                                             _loc16_.normalX = _loc14_.normalX + (_loc15_.normalX - _loc14_.normalX) * _loc13_;
                                             _loc16_.normalY = _loc14_.normalY + (_loc15_.normalY - _loc14_.normalY) * _loc13_;
                                             _loc16_.normalZ = _loc14_.normalZ + (_loc15_.normalZ - _loc14_.normalZ) * _loc13_;
                                             if(_loc19_ != null)
                                             {
                                                _loc19_.alternativa3d::next = _loc16_;
                                             }
                                             else
                                             {
                                                _loc18_ = _loc16_;
                                             }
                                             _loc19_ = _loc16_;
                                          }
                                          if(_loc15_.x > param1.boundMinX)
                                          {
                                             if(_loc19_ != null)
                                             {
                                                _loc19_.alternativa3d::next = _loc15_;
                                             }
                                             else
                                             {
                                                _loc18_ = _loc15_;
                                             }
                                             _loc19_ = _loc15_;
                                          }
                                          _loc14_ = _loc15_;
                                          _loc15_ = _loc17_;
                                       }
                                       if(_loc18_ != null)
                                       {
                                          _loc14_ = _loc19_;
                                          _loc15_ = _loc18_;
                                          _loc18_ = null;
                                          _loc19_ = null;
                                          while(_loc15_ != null)
                                          {
                                             _loc17_ = _loc15_.alternativa3d::next;
                                             _loc15_.alternativa3d::next = null;
                                             if(_loc15_.x < param1.boundMaxX && _loc14_.x >= param1.boundMaxX || _loc15_.x >= param1.boundMaxX && _loc14_.x < param1.boundMaxX)
                                             {
                                                _loc13_ = (param1.boundMaxX - _loc14_.x) / (_loc15_.x - _loc14_.x);
                                                (_loc16_ = new Vertex()).x = _loc14_.x + (_loc15_.x - _loc14_.x) * _loc13_;
                                                _loc16_.y = _loc14_.y + (_loc15_.y - _loc14_.y) * _loc13_;
                                                _loc16_.z = _loc14_.z + (_loc15_.z - _loc14_.z) * _loc13_;
                                                _loc16_.normalX = _loc14_.normalX + (_loc15_.normalX - _loc14_.normalX) * _loc13_;
                                                _loc16_.normalY = _loc14_.normalY + (_loc15_.normalY - _loc14_.normalY) * _loc13_;
                                                _loc16_.normalZ = _loc14_.normalZ + (_loc15_.normalZ - _loc14_.normalZ) * _loc13_;
                                                if(_loc19_ != null)
                                                {
                                                   _loc19_.alternativa3d::next = _loc16_;
                                                }
                                                else
                                                {
                                                   _loc18_ = _loc16_;
                                                }
                                                _loc19_ = _loc16_;
                                             }
                                             if(_loc15_.x < param1.boundMaxX)
                                             {
                                                if(_loc19_ != null)
                                                {
                                                   _loc19_.alternativa3d::next = _loc15_;
                                                }
                                                else
                                                {
                                                   _loc18_ = _loc15_;
                                                }
                                                _loc19_ = _loc15_;
                                             }
                                             _loc14_ = _loc15_;
                                             _loc15_ = _loc17_;
                                          }
                                          if(_loc18_ != null)
                                          {
                                             _loc14_ = _loc19_;
                                             _loc15_ = _loc18_;
                                             _loc18_ = null;
                                             _loc19_ = null;
                                             while(_loc15_ != null)
                                             {
                                                _loc17_ = _loc15_.alternativa3d::next;
                                                _loc15_.alternativa3d::next = null;
                                                if(_loc15_.y > param1.boundMinY && _loc14_.y <= param1.boundMinY || _loc15_.y <= param1.boundMinY && _loc14_.y > param1.boundMinY)
                                                {
                                                   _loc13_ = (param1.boundMinY - _loc14_.y) / (_loc15_.y - _loc14_.y);
                                                   (_loc16_ = new Vertex()).x = _loc14_.x + (_loc15_.x - _loc14_.x) * _loc13_;
                                                   _loc16_.y = _loc14_.y + (_loc15_.y - _loc14_.y) * _loc13_;
                                                   _loc16_.z = _loc14_.z + (_loc15_.z - _loc14_.z) * _loc13_;
                                                   _loc16_.normalX = _loc14_.normalX + (_loc15_.normalX - _loc14_.normalX) * _loc13_;
                                                   _loc16_.normalY = _loc14_.normalY + (_loc15_.normalY - _loc14_.normalY) * _loc13_;
                                                   _loc16_.normalZ = _loc14_.normalZ + (_loc15_.normalZ - _loc14_.normalZ) * _loc13_;
                                                   if(_loc19_ != null)
                                                   {
                                                      _loc19_.alternativa3d::next = _loc16_;
                                                   }
                                                   else
                                                   {
                                                      _loc18_ = _loc16_;
                                                   }
                                                   _loc19_ = _loc16_;
                                                }
                                                if(_loc15_.y > param1.boundMinY)
                                                {
                                                   if(_loc19_ != null)
                                                   {
                                                      _loc19_.alternativa3d::next = _loc15_;
                                                   }
                                                   else
                                                   {
                                                      _loc18_ = _loc15_;
                                                   }
                                                   _loc19_ = _loc15_;
                                                }
                                                _loc14_ = _loc15_;
                                                _loc15_ = _loc17_;
                                             }
                                             if(_loc18_ != null)
                                             {
                                                _loc14_ = _loc19_;
                                                _loc15_ = _loc18_;
                                                _loc18_ = null;
                                                _loc19_ = null;
                                                while(_loc15_ != null)
                                                {
                                                   _loc17_ = _loc15_.alternativa3d::next;
                                                   _loc15_.alternativa3d::next = null;
                                                   if(_loc15_.y < param1.boundMaxY && _loc14_.y >= param1.boundMaxY || _loc15_.y >= param1.boundMaxY && _loc14_.y < param1.boundMaxY)
                                                   {
                                                      _loc13_ = (param1.boundMaxY - _loc14_.y) / (_loc15_.y - _loc14_.y);
                                                      (_loc16_ = new Vertex()).x = _loc14_.x + (_loc15_.x - _loc14_.x) * _loc13_;
                                                      _loc16_.y = _loc14_.y + (_loc15_.y - _loc14_.y) * _loc13_;
                                                      _loc16_.z = _loc14_.z + (_loc15_.z - _loc14_.z) * _loc13_;
                                                      _loc16_.normalX = _loc14_.normalX + (_loc15_.normalX - _loc14_.normalX) * _loc13_;
                                                      _loc16_.normalY = _loc14_.normalY + (_loc15_.normalY - _loc14_.normalY) * _loc13_;
                                                      _loc16_.normalZ = _loc14_.normalZ + (_loc15_.normalZ - _loc14_.normalZ) * _loc13_;
                                                      if(_loc19_ != null)
                                                      {
                                                         _loc19_.alternativa3d::next = _loc16_;
                                                      }
                                                      else
                                                      {
                                                         _loc18_ = _loc16_;
                                                      }
                                                      _loc19_ = _loc16_;
                                                   }
                                                   if(_loc15_.y < param1.boundMaxY)
                                                   {
                                                      if(_loc19_ != null)
                                                      {
                                                         _loc19_.alternativa3d::next = _loc15_;
                                                      }
                                                      else
                                                      {
                                                         _loc18_ = _loc15_;
                                                      }
                                                      _loc19_ = _loc15_;
                                                   }
                                                   _loc14_ = _loc15_;
                                                   _loc15_ = _loc17_;
                                                }
                                                if(_loc18_ != null)
                                                {
                                                   _loc5_ = new Face();
                                                   _loc20_ = null;
                                                   _loc6_ = _loc18_;
                                                   while(_loc6_ != null)
                                                   {
                                                      _loc17_ = _loc6_.alternativa3d::next;
                                                      _loc6_.alternativa3d::next = param1.alternativa3d::vertexList;
                                                      param1.alternativa3d::vertexList = _loc6_;
                                                      _loc6_.u = (_loc6_.x - param1.boundMinX) / (param1.boundMaxX - param1.boundMinX);
                                                      _loc6_.v = (_loc6_.y - param1.boundMinY) / (param1.boundMaxY - param1.boundMinY);
                                                      if(_loc20_ != null)
                                                      {
                                                         _loc20_.alternativa3d::next = new Wrapper();
                                                         _loc20_ = _loc20_.alternativa3d::next;
                                                      }
                                                      else
                                                      {
                                                         _loc5_.alternativa3d::wrapper = new Wrapper();
                                                         _loc20_ = _loc5_.alternativa3d::wrapper;
                                                      }
                                                      _loc20_.alternativa3d::vertex = _loc6_;
                                                      _loc6_ = _loc17_;
                                                   }
                                                   _loc5_.alternativa3d::calculateBestSequenceAndNormal();
                                                   _loc5_.alternativa3d::next = param1.alternativa3d::faceList;
                                                   param1.alternativa3d::faceList = _loc5_;
                                                }
                                             }
                                          }
                                       }
                                    }
                                 }
                              }
                           }
                        }
                     }
                  }
               }
            }
         }
         _loc11_++;
      }
   }
}

class Receiver
{
   public var next:Receiver;
   
   public var transparent:Boolean = false;
   
   public var buffer:int = -1;
   
   public var firstIndex:int = -1;
   
   public var numTriangles:int = 0;
   
   public function Receiver()
   {
      super();
   }
}

