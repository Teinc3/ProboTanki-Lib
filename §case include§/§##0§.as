package §case include§
{
   internal class §##0§ extends Mesh
   {
      private var §true var return§:Vector.<Vertex>;
      
      private var §with package class§:int = 0;
      
      private var direction:int = 1;
      
      private var width:Number;
      
      private var §finally var dynamic§:Number = 1;
      
      private var offset:Number = 0;
      
      private var §5![§:Number = 0;
      
      private var § #M§:Number = 0;
      
      public function §##0§()
      {
         var _loc1_:Vertex = null;
         var _loc2_:Vertex = null;
         this.§true var return§ = new Vector.<Vertex>();
         super();
         var _loc3_:Vertex = addVertex(-1,0,0);
         var _loc4_:Vertex = addVertex(1,0,0);
         this.§true var return§[this.§with package class§] = _loc3_;
         ++this.§with package class§;
         this.§true var return§[this.§with package class§] = _loc4_;
         ++this.§with package class§;
         var _loc5_:int = 0;
         while(_loc5_ < §<#]§.§in const get§)
         {
            _loc1_ = addVertex(-1,-_loc5_ - 1,0);
            _loc2_ = addVertex(1,-_loc5_ - 1,0);
            this.§true var return§[this.§with package class§] = _loc1_;
            ++this.§with package class§;
            this.§true var return§[this.§with package class§] = _loc2_;
            ++this.§with package class§;
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
         while(_loc6_ < this.§with package class§)
         {
            _loc3_ = this.§true var return§[_loc6_];
            _loc6_++;
            _loc4_ = this.§true var return§[_loc6_];
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
      
      public function §28§(param1:Material, param2:int) : void
      {
         this.direction = param2;
         setMaterialToAllFaces(param1);
         var _loc3_:TextureMaterial = param1 as TextureMaterial;
         if(_loc3_ != null && _loc3_.texture != null)
         {
            this.§finally var dynamic§ = this.width * _loc3_.texture.height / _loc3_.texture.width;
         }
         else
         {
            this.§finally var dynamic§ = this.width;
         }
         this.offset = 0;
         this.§5![§ = 0;
         this.§ #M§ = 0;
      }
      
      public function update(param1:int, param2:Number) : void
      {
         var _loc3_:Vertex = null;
         var _loc4_:Vertex = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = §<#]§.§const const throw§ / this.width;
         var _loc9_:Number = this.direction * §<#]§.§8p§;
         var _loc10_:Number = this.direction * §<#]§.§9#R§;
         var _loc11_:Number = this.direction * §<#]§.§true catch throw§ / this.§finally var dynamic§;
         this.§5![§ += _loc9_ * param1 / 1000;
         this.§ #M§ += _loc10_ * param1 / 1000;
         this.offset += _loc11_ * param1 / 1000;
         var _loc12_:Number = param2 / §<#]§.§in const get§;
         var _loc13_:Number = param2 / 2;
         var _loc14_:Number = 1;
         var _loc15_:int = 0;
         while(_loc15_ < this.§with package class§)
         {
            _loc3_ = this.§true var return§[_loc15_];
            _loc15_++;
            _loc4_ = this.§true var return§[_loc15_];
            _loc3_.y = param2 - (_loc15_ >> 1) * _loc12_;
            _loc4_.y = _loc3_.y;
            _loc5_ = _loc13_ - _loc3_.y;
            _loc3_.v = _loc5_ / this.§finally var dynamic§ + this.offset;
            _loc4_.v = _loc3_.v;
            if(_loc3_.y < _loc13_)
            {
               _loc14_ = _loc3_.y / §<#]§.§true set if§;
            }
            else
            {
               _loc14_ = (param2 - _loc3_.y) / §<#]§.§true set if§;
            }
            if(_loc14_ > 1)
            {
               _loc14_ = 1;
            }
            _loc6_ = Math.sin(Math.PI * 2 * (_loc5_ + this.§5![§) / §<#]§.§return package override§);
            _loc7_ = Math.sin(Math.PI * 2 * (_loc5_ + this.§ #M§) / §<#]§.§implements catch else§);
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

