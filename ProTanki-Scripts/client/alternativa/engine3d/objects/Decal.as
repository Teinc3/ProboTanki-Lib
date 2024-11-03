package alternativa.engine3d.objects
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.Debug;
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.VG;
   import alternativa.engine3d.core.Vertex;
   import alternativa.engine3d.core.Wrapper;
   import alternativa.gfx.core.IndexBufferResource;
   import alternativa.gfx.core.VertexBufferResource;
   
   use namespace alternativa3d;
   
   public class Decal extends Mesh
   {
      public var attenuation:Number = 1000000;
      
      public function Decal()
      {
         super();
         shadowMapAlphaThreshold = 100;
      }
      
      public function createGeometry(param1:Mesh, param2:Boolean = false) : void
      {
         if(!param2)
         {
            param1 = param1.clone() as Mesh;
         }
         alternativa3d::faceList = param1.alternativa3d::faceList;
         alternativa3d::vertexList = param1.alternativa3d::vertexList;
         param1.alternativa3d::faceList = null;
         param1.alternativa3d::vertexList = null;
         var _loc3_:Vertex = alternativa3d::vertexList;
         while(_loc3_ != null)
         {
            _loc3_.alternativa3d::transformId = 0;
            _loc3_.id = null;
            _loc3_ = _loc3_.alternativa3d::next;
         }
         var _loc4_:Face = alternativa3d::faceList;
         while(_loc4_ != null)
         {
            _loc4_.id = null;
            _loc4_ = _loc4_.alternativa3d::next;
         }
         calculateBounds();
      }
      
      override public function clone() : Object3D
      {
         var _loc1_:Decal = new Decal();
         _loc1_.clonePropertiesFrom(this);
         return _loc1_;
      }
      
      override protected function clonePropertiesFrom(param1:Object3D) : void
      {
         super.clonePropertiesFrom(param1);
         var _loc2_:Decal = param1 as Decal;
         this.attenuation = _loc2_.attenuation;
      }
      
      override alternativa3d function draw(param1:Camera3D) : void
      {
         var _loc2_:Face = null;
         var _loc3_:Vertex = null;
         if(alternativa3d::faceList == null)
         {
            return;
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
         alternativa3d::useDepth = true;
         if(alternativa3d::faceList.material != null)
         {
            param1.alternativa3d::addDecal(this);
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
         var _loc4_:int = param1.debug ? int(param1.alternativa3d::checkInDebug(this)) : int(0);
         if(_loc4_ & Debug.BOUNDS)
         {
            Debug.drawBounds(param1,this,boundMinX,boundMinY,boundMinZ,boundMaxX,boundMaxY,boundMaxZ);
         }
         if(_loc4_ & Debug.EDGES)
         {
            if(alternativa3d::transformId > 500000000)
            {
               alternativa3d::transformId = 0;
               _loc3_ = alternativa3d::vertexList;
               while(_loc3_ != null)
               {
                  _loc3_.alternativa3d::transformId = 0;
                  _loc3_ = _loc3_.alternativa3d::next;
               }
            }
            ++alternativa3d::transformId;
            alternativa3d::calculateInverseMatrix();
            _loc2_ = alternativa3d::prepareFaces(param1,alternativa3d::faceList);
            if(_loc2_ == null)
            {
               return;
            }
            Debug.alternativa3d::drawEdges(param1,_loc2_,16777215);
         }
      }
      
      override alternativa3d function getVG(param1:Camera3D) : VG
      {
         this.alternativa3d::draw(param1);
         return null;
      }
      
      override alternativa3d function prepareResources() : void
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
            alternativa3d::vertexBuffer = new VertexBufferResource(_loc1_,8);
            _loc5_ = new Vector.<uint>();
            _loc6_ = 0;
            alternativa3d::numTriangles = 0;
            _loc7_ = alternativa3d::faceList;
            while(_loc7_ != null)
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
                  ++alternativa3d::numTriangles;
                  _loc8_ = _loc8_.alternativa3d::next;
               }
               _loc7_ = _loc7_.alternativa3d::next;
            }
            alternativa3d::indexBuffer = new IndexBufferResource(_loc5_);
         }
      }
   }
}

