package alternativa.engine3d.objects
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.Clipping;
   import alternativa.engine3d.core.Debug;
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.Sorting;
   import alternativa.engine3d.core.VG;
   import alternativa.engine3d.core.Vertex;
   import alternativa.engine3d.core.Wrapper;
   import alternativa.engine3d.materials.Material;
   import alternativa.gfx.core.IndexBufferResource;
   import alternativa.gfx.core.VertexBufferResource;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   
   use namespace alternativa3d;
   
   public class SkyBox extends Mesh
   {
      public static const LEFT:String = "left";
      
      public static const RIGHT:String = "right";
      
      public static const BACK:String = "back";
      
      public static const FRONT:String = "front";
      
      public static const BOTTOM:String = "bottom";
      
      public static const TOP:String = "top";
      
      private var leftFace:Face;
      
      private var rightFace:Face;
      
      private var backFace:Face;
      
      private var frontFace:Face;
      
      private var bottomFace:Face;
      
      private var topFace:Face;
      
      public var autoSize:Boolean = true;
      
      alternativa3d var reduceConst:Vector.<Number>;
      
      public function SkyBox(param1:Number, param2:Material = null, param3:Material = null, param4:Material = null, param5:Material = null, param6:Material = null, param7:Material = null, param8:Number = 0)
      {
         this.alternativa3d::reduceConst = Vector.<Number>([0,0,0,1]);
         super();
         param1 *= 0.5;
         var _loc9_:Vertex = this.createVertex(-param1,-param1,param1,param8,param8);
         var _loc10_:Vertex = this.createVertex(-param1,-param1,-param1,param8,1 - param8);
         var _loc11_:Vertex = this.createVertex(-param1,param1,-param1,1 - param8,1 - param8);
         var _loc12_:Vertex = this.createVertex(-param1,param1,param1,1 - param8,param8);
         this.leftFace = this.createQuad(_loc9_,_loc10_,_loc11_,_loc12_,param2);
         _loc9_ = this.createVertex(param1,param1,param1,param8,param8);
         _loc10_ = this.createVertex(param1,param1,-param1,param8,1 - param8);
         _loc11_ = this.createVertex(param1,-param1,-param1,1 - param8,1 - param8);
         _loc12_ = this.createVertex(param1,-param1,param1,1 - param8,param8);
         this.rightFace = this.createQuad(_loc9_,_loc10_,_loc11_,_loc12_,param3);
         _loc9_ = this.createVertex(param1,-param1,param1,param8,param8);
         _loc10_ = this.createVertex(param1,-param1,-param1,param8,1 - param8);
         _loc11_ = this.createVertex(-param1,-param1,-param1,1 - param8,1 - param8);
         _loc12_ = this.createVertex(-param1,-param1,param1,1 - param8,param8);
         this.backFace = this.createQuad(_loc9_,_loc10_,_loc11_,_loc12_,param4);
         _loc9_ = this.createVertex(-param1,param1,param1,param8,param8);
         _loc10_ = this.createVertex(-param1,param1,-param1,param8,1 - param8);
         _loc11_ = this.createVertex(param1,param1,-param1,1 - param8,1 - param8);
         _loc12_ = this.createVertex(param1,param1,param1,1 - param8,param8);
         this.frontFace = this.createQuad(_loc9_,_loc10_,_loc11_,_loc12_,param5);
         _loc9_ = this.createVertex(-param1,param1,-param1,param8,param8);
         _loc10_ = this.createVertex(-param1,-param1,-param1,param8,1 - param8);
         _loc11_ = this.createVertex(param1,-param1,-param1,1 - param8,1 - param8);
         _loc12_ = this.createVertex(param1,param1,-param1,1 - param8,param8);
         this.bottomFace = this.createQuad(_loc9_,_loc10_,_loc11_,_loc12_,param6);
         _loc9_ = this.createVertex(-param1,-param1,param1,param8,param8);
         _loc10_ = this.createVertex(-param1,param1,param1,param8,1 - param8);
         _loc11_ = this.createVertex(param1,param1,param1,1 - param8,1 - param8);
         _loc12_ = this.createVertex(param1,-param1,param1,1 - param8,param8);
         this.topFace = this.createQuad(_loc9_,_loc10_,_loc11_,_loc12_,param7);
         calculateBounds();
         calculateFacesNormals(true);
         clipping = Clipping.FACE_CLIPPING;
         sorting = Sorting.NONE;
         shadowMapAlphaThreshold = 0.1;
         useLight = true;
      }
      
      public function getSide(param1:String) : Face
      {
         switch(param1)
         {
            case LEFT:
               return this.leftFace;
            case RIGHT:
               return this.rightFace;
            case BACK:
               return this.backFace;
            case FRONT:
               return this.frontFace;
            case BOTTOM:
               return this.bottomFace;
            case TOP:
               return this.topFace;
            default:
               return null;
         }
      }
      
      public function transformUV(param1:String, param2:Matrix) : void
      {
         var _loc3_:Wrapper = null;
         var _loc4_:Vertex = null;
         var _loc5_:Point = null;
         var _loc6_:Face = this.getSide(param1);
         if(_loc6_ != null)
         {
            _loc3_ = _loc6_.alternativa3d::wrapper;
            while(_loc3_ != null)
            {
               _loc4_ = _loc3_.alternativa3d::vertex;
               _loc5_ = param2.transformPoint(new Point(_loc4_.u,_loc4_.v));
               _loc4_.u = _loc5_.x;
               _loc4_.v = _loc5_.y;
               _loc3_ = _loc3_.alternativa3d::next;
            }
         }
      }
      
      override public function clone() : Object3D
      {
         var _loc1_:SkyBox = new SkyBox(0);
         _loc1_.clonePropertiesFrom(this);
         return _loc1_;
      }
      
      override protected function clonePropertiesFrom(param1:Object3D) : void
      {
         super.clonePropertiesFrom(param1);
         var _loc2_:SkyBox = param1 as SkyBox;
         this.autoSize = _loc2_.autoSize;
         var _loc3_:Face = _loc2_.alternativa3d::faceList;
         var _loc4_:Face = alternativa3d::faceList;
         while(_loc3_ != null)
         {
            if(_loc3_ == _loc2_.leftFace)
            {
               this.leftFace = _loc4_;
            }
            else if(_loc3_ == _loc2_.rightFace)
            {
               this.rightFace = _loc4_;
            }
            else if(_loc3_ == _loc2_.backFace)
            {
               this.backFace = _loc4_;
            }
            else if(_loc3_ == _loc2_.frontFace)
            {
               this.frontFace = _loc4_;
            }
            else if(_loc3_ == _loc2_.bottomFace)
            {
               this.bottomFace = _loc4_;
            }
            else if(_loc3_ == _loc2_.topFace)
            {
               this.topFace = _loc4_;
            }
            _loc3_ = _loc3_.alternativa3d::next;
            _loc4_ = _loc4_.alternativa3d::next;
         }
      }
      
      private function createVertex(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : Vertex
      {
         var _loc6_:Vertex;
         (_loc6_ = new Vertex()).alternativa3d::next = alternativa3d::vertexList;
         alternativa3d::vertexList = _loc6_;
         _loc6_.x = param1;
         _loc6_.y = param2;
         _loc6_.z = param3;
         _loc6_.u = param4;
         _loc6_.v = param5;
         return _loc6_;
      }
      
      private function createQuad(param1:Vertex, param2:Vertex, param3:Vertex, param4:Vertex, param5:Material) : Face
      {
         var _loc6_:Face;
         (_loc6_ = new Face()).material = param5;
         _loc6_.alternativa3d::next = alternativa3d::faceList;
         alternativa3d::faceList = _loc6_;
         _loc6_.alternativa3d::wrapper = new Wrapper();
         _loc6_.alternativa3d::wrapper.alternativa3d::vertex = param1;
         _loc6_.alternativa3d::wrapper.alternativa3d::next = new Wrapper();
         _loc6_.alternativa3d::wrapper.alternativa3d::next.alternativa3d::vertex = param2;
         _loc6_.alternativa3d::wrapper.alternativa3d::next.alternativa3d::next = new Wrapper();
         _loc6_.alternativa3d::wrapper.alternativa3d::next.alternativa3d::next.alternativa3d::vertex = param3;
         _loc6_.alternativa3d::wrapper.alternativa3d::next.alternativa3d::next.alternativa3d::next = new Wrapper();
         _loc6_.alternativa3d::wrapper.alternativa3d::next.alternativa3d::next.alternativa3d::next.alternativa3d::vertex = param4;
         return _loc6_;
      }
      
      override alternativa3d function draw(param1:Camera3D) : void
      {
         if(alternativa3d::faceList == null)
         {
            return;
         }
         if(this.autoSize)
         {
            this.calculateTransform(param1);
         }
         if(clipping == 0)
         {
            if(alternativa3d::culling & 1)
            {
               return;
            }
            alternativa3d::culling = 0;
         }
         this.alternativa3d::prepareResources();
         this.alternativa3d::addOpaque(param1);
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
         var _loc2_:int = param1.debug ? int(param1.alternativa3d::checkInDebug(this)) : int(0);
         if(_loc2_ & Debug.BOUNDS)
         {
            Debug.drawBounds(param1,this,boundMinX,boundMinY,boundMinZ,boundMaxX,boundMaxY,boundMaxZ);
         }
      }
      
      override alternativa3d function prepareResources() : void
      {
         var _loc1_:Vector.<Number> = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Vertex = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Face = null;
         var _loc9_:Array = null;
         var _loc10_:Wrapper = null;
         var _loc11_:Dictionary = null;
         var _loc12_:Vector.<uint> = null;
         var _loc13_:int = 0;
         var _loc14_:* = undefined;
         if(alternativa3d::vertexBuffer == null)
         {
            _loc1_ = new Vector.<Number>();
            _loc2_ = 0;
            _loc3_ = 0;
            _loc4_ = alternativa3d::vertexList;
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
               alternativa3d::vertexBuffer = new VertexBufferResource(_loc1_,8);
            }
            _loc11_ = new Dictionary();
            _loc8_ = alternativa3d::faceList;
            while(_loc8_ != null)
            {
               if(_loc8_.material != null)
               {
                  _loc9_ = _loc11_[_loc8_.material];
                  if(_loc9_ == null)
                  {
                     _loc9_ = new Array();
                     _loc11_[_loc8_.material] = _loc9_;
                  }
                  _loc9_.push(_loc8_);
               }
               _loc8_ = _loc8_.alternativa3d::next;
            }
            _loc12_ = new Vector.<uint>();
            _loc13_ = 0;
            for(_loc14_ in _loc11_)
            {
               _loc9_ = _loc11_[_loc14_];
               opaqueMaterials[opaqueLength] = _loc14_;
               opaqueBegins[opaqueLength] = alternativa3d::numTriangles * 3;
               for each(_loc8_ in _loc9_)
               {
                  _loc10_ = _loc8_.alternativa3d::wrapper;
                  _loc5_ = _loc10_.alternativa3d::vertex.alternativa3d::index;
                  _loc10_ = _loc10_.alternativa3d::next;
                  _loc6_ = _loc10_.alternativa3d::vertex.alternativa3d::index;
                  _loc10_ = _loc10_.alternativa3d::next;
                  while(_loc10_ != null)
                  {
                     _loc7_ = _loc10_.alternativa3d::vertex.alternativa3d::index;
                     _loc12_[_loc13_] = _loc5_;
                     _loc13_++;
                     _loc12_[_loc13_] = _loc6_;
                     _loc13_++;
                     _loc12_[_loc13_] = _loc7_;
                     _loc13_++;
                     _loc6_ = _loc7_;
                     ++alternativa3d::numTriangles;
                     _loc10_ = _loc10_.alternativa3d::next;
                  }
               }
               opaqueNums[opaqueLength] = alternativa3d::numTriangles - opaqueBegins[opaqueLength] / 3;
               ++opaqueLength;
            }
            if(_loc13_ > 0)
            {
               alternativa3d::indexBuffer = new IndexBufferResource(_loc12_);
            }
         }
      }
      
      override alternativa3d function addOpaque(param1:Camera3D) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < opaqueLength)
         {
            param1.alternativa3d::addSky(opaqueMaterials[_loc2_],alternativa3d::vertexBuffer,alternativa3d::indexBuffer,opaqueBegins[_loc2_],opaqueNums[_loc2_],this);
            _loc2_++;
         }
      }
      
      override alternativa3d function getVG(param1:Camera3D) : VG
      {
         this.alternativa3d::draw(param1);
         return null;
      }
      
      override alternativa3d function cullingInCamera(param1:Camera3D, param2:int) : int
      {
         return super.alternativa3d::cullingInCamera(param1,param2 = int(param2 & ~3));
      }
      
      private function calculateTransform(param1:Camera3D) : void
      {
         var _loc2_:Number = alternativa3d::mi * boundMinX + alternativa3d::mj * boundMinY + alternativa3d::mk * boundMinZ + alternativa3d::ml;
         var _loc3_:Number = _loc2_;
         _loc2_ = alternativa3d::mi * boundMaxX + alternativa3d::mj * boundMinY + alternativa3d::mk * boundMinZ + alternativa3d::ml;
         if(_loc2_ > _loc3_)
         {
            _loc3_ = _loc2_;
         }
         _loc2_ = alternativa3d::mi * boundMaxX + alternativa3d::mj * boundMaxY + alternativa3d::mk * boundMinZ + alternativa3d::ml;
         if(_loc2_ > _loc3_)
         {
            _loc3_ = _loc2_;
         }
         _loc2_ = alternativa3d::mi * boundMinX + alternativa3d::mj * boundMaxY + alternativa3d::mk * boundMinZ + alternativa3d::ml;
         if(_loc2_ > _loc3_)
         {
            _loc3_ = _loc2_;
         }
         _loc2_ = alternativa3d::mi * boundMinX + alternativa3d::mj * boundMinY + alternativa3d::mk * boundMaxZ + alternativa3d::ml;
         if(_loc2_ > _loc3_)
         {
            _loc3_ = _loc2_;
         }
         _loc2_ = alternativa3d::mi * boundMaxX + alternativa3d::mj * boundMinY + alternativa3d::mk * boundMaxZ + alternativa3d::ml;
         if(_loc2_ > _loc3_)
         {
            _loc3_ = _loc2_;
         }
         _loc2_ = alternativa3d::mi * boundMaxX + alternativa3d::mj * boundMaxY + alternativa3d::mk * boundMaxZ + alternativa3d::ml;
         if(_loc2_ > _loc3_)
         {
            _loc3_ = _loc2_;
         }
         _loc2_ = alternativa3d::mi * boundMinX + alternativa3d::mj * boundMaxY + alternativa3d::mk * boundMaxZ + alternativa3d::ml;
         if(_loc2_ > _loc3_)
         {
            _loc3_ = _loc2_;
         }
         var _loc4_:Number = 1;
         if(_loc3_ > param1.farClipping)
         {
            _loc4_ = param1.farClipping / _loc3_;
         }
         this.alternativa3d::reduceConst[0] = _loc4_;
         this.alternativa3d::reduceConst[1] = _loc4_;
         this.alternativa3d::reduceConst[2] = _loc4_;
      }
   }
}

