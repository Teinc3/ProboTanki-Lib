package Renamed50
{
   internal class Renamed9753 extends Mesh
   {
      private var Renamed5153:Vector.<Vertex>;
      
      private var Renamed9754:int = 0;
      
      private var direction:int = 1;
      
      private var width:Number;
      
      private var Renamed9268:Number = 1;
      
      private var offset:Number = 0;
      
      private var Renamed9755:Number = 0;
      
      private var Renamed9756:Number = 0;
      
      public function Renamed9753()
      {
         var _loc1_:Vertex = null;
         var _loc2_:Vertex = null;
         this.Renamed5153 = new Vector.<Vertex>();
         super();
         var _loc3_:Vertex = addVertex(-1,0,0);
         var _loc4_:Vertex = addVertex(1,0,0);
         this.Renamed5153[this.Renamed9754] = _loc3_;
         ++this.Renamed9754;
         this.Renamed5153[this.Renamed9754] = _loc4_;
         ++this.Renamed9754;
         var _loc5_:int = 0;
         while(_loc5_ < Renamed9757.Renamed9758)
         {
            _loc1_ = addVertex(-1,-_loc5_ - 1,0);
            _loc2_ = addVertex(1,-_loc5_ - 1,0);
            this.Renamed5153[this.Renamed9754] = _loc1_;
            ++this.Renamed9754;
            this.Renamed5153[this.Renamed9754] = _loc2_;
            ++this.Renamed9754;
            addQuadFace(_loc3_,_loc1_,_loc2_,_loc4_);
            _loc3_ = _loc1_;
            _loc4_ = _loc2_;
            _loc5_++;
         }
         calculateFacesNormals();
         sorting = Sorting.DYNAMIC_BSP;
         shadowMapAlphaThreshold = 2;
         depthMapAlphaThreshold = 2;
         useShadowMap = false;
         useLight = false;
      }
      
      public function init(param1:Number, param2:Number) : void
      {
         var _loc3_:Vertex = null;
         var _loc4_:Vertex = null;
         this.width = param1;
         var _loc5_:Number = param1 * 0.5;
         var _loc6_:int = 0;
         while(_loc6_ < this.Renamed9754)
         {
            _loc3_ = this.Renamed5153[_loc6_];
            _loc6_++;
            _loc4_ = this.Renamed5153[_loc6_];
            _loc3_.x = -_loc5_;
            _loc3_.u = 0;
            _loc4_.x = _loc5_;
            _loc4_.u = 1;
            _loc6_++;
         }
         boundMinX = -_loc5_;
         boundMaxX = _loc5_;
         boundMinY = 0;
         boundMinZ = 0;
         boundMaxZ = 0;
      }
      
      public function Renamed1179(param1:Material, param2:int) : void
      {
         this.direction = param2;
         setMaterialToAllFaces(param1);
         var _loc3_:TextureMaterial = param1 as TextureMaterial;
         if(_loc3_ != null && _loc3_.texture != null)
         {
            this.Renamed9268 = this.width * _loc3_.texture.height / _loc3_.texture.width;
         }
         else
         {
            this.Renamed9268 = this.width;
         }
         this.offset = 0;
         this.Renamed9755 = 0;
         this.Renamed9756 = 0;
      }
      
      public function update(param1:int, param2:Number) : void
      {
         var _loc3_:Vertex = null;
         var _loc4_:Vertex = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = Renamed9757.Renamed9759 / this.width;
         var _loc9_:Number = this.direction * Renamed9757.Renamed9760;
         var _loc10_:Number = this.direction * Renamed9757.Renamed9761;
         var _loc11_:Number = this.direction * Renamed9757.Renamed9762 / this.Renamed9268;
         this.Renamed9755 += _loc9_ * param1 / 1000;
         this.Renamed9756 += _loc10_ * param1 / 1000;
         this.offset += _loc11_ * param1 / 1000;
         var _loc12_:Number = param2 / Renamed9757.Renamed9758;
         var _loc13_:Number = param2 / 2;
         var _loc14_:Number = 1;
         var _loc15_:int = 0;
         while(_loc15_ < this.Renamed9754)
         {
            _loc3_ = this.Renamed5153[_loc15_];
            _loc15_++;
            _loc4_ = this.Renamed5153[_loc15_];
            _loc3_.y = param2 - (_loc15_ >> 1) * _loc12_;
            _loc4_.y = _loc3_.y;
            _loc5_ = _loc13_ - _loc3_.y;
            _loc3_.v = _loc5_ / this.Renamed9268 + this.offset;
            _loc4_.v = _loc3_.v;
            if(_loc3_.y < _loc13_)
            {
               _loc14_ = _loc3_.y / Renamed9757.Renamed9763;
            }
            else
            {
               _loc14_ = (param2 - _loc3_.y) / Renamed9757.Renamed9763;
            }
            if(_loc14_ > 1)
            {
               _loc14_ = 1;
            }
            _loc6_ = Math.sin(Math.PI * 2 * (_loc5_ + this.Renamed9755) / Renamed9757.Renamed9764);
            _loc7_ = Math.sin(Math.PI * 2 * (_loc5_ + this.Renamed9756) / Renamed9757.Renamed9765);
            _loc3_.u = (_loc6_ + _loc7_) * 0.5 * _loc8_ * _loc14_;
            _loc4_.u = 1 + _loc3_.u;
            _loc15_++;
         }
         boundMaxY = param2;
      }
      
      public function clear() : void
      {
         setMaterialToAllFaces(null);
      }
   }
}

