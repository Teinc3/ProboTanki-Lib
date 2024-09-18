package §class for§
{
   internal class §#!u§ extends Mesh
   {
      private static const GAP:Number = 10;
      
      private static const §<!x§:Number = 5;
      
      private var a:Vertex;
      
      private var b:Vertex;
      
      private var c:Vertex;
      
      private var d:Vertex;
      
      private var §static package override§:Face;
      
      private var e:Vertex;
      
      private var f:Vertex;
      
      private var g:Vertex;
      
      private var h:Vertex;
      
      private var §%P§:Face;
      
      private var length:Number;
      
      private var middle:Number;
      
      private var §finally var dynamic§:Number;
      
      private var §7#]§:Number;
      
      private var material:Material;
      
      public function §#!u§()
      {
         super();
         this.a = addVertex(-1,1,-GAP);
         this.b = addVertex(-1,0,-GAP);
         this.c = addVertex(1,0,-GAP);
         this.d = addVertex(1,1,-GAP);
         this.§static package override§ = addQuadFace(this.a,this.b,this.c,this.d);
         this.e = addVertex(-1,1,-GAP);
         this.f = addVertex(-1,0,-GAP);
         this.g = addVertex(1,0,-GAP);
         this.h = addVertex(1,1,-GAP);
         this.§%P§ = addQuadFace(this.e,this.f,this.g,this.h);
         calculateFacesNormals();
         sorting = Sorting.DYNAMIC_BSP;
         softAttenuation = 80;
         shadowMapAlphaThreshold = 2;
         depthMapAlphaThreshold = 2;
         useShadowMap = false;
         useLight = false;
      }
      
      public function init(param1:Number, param2:Number, param3:Material, param4:Number) : void
      {
         var _loc6_:Number = NaN;
         this.length = param2;
         this.material = param3;
         this.§7#]§ = param4;
         var _loc5_:TextureMaterial = param3 as TextureMaterial;
         if(_loc5_ != null && _loc5_.texture != null)
         {
            this.§finally var dynamic§ = param1 * _loc5_.texture.height * 2 / _loc5_.texture.width;
            this.middle = param2 - this.§finally var dynamic§;
         }
         else
         {
            this.§finally var dynamic§ = param1 / 2;
            this.middle = 0;
         }
         this.§finally var dynamic§ *= 1.25;
         _loc6_ = param1 * 0.5;
         this.a.x = -_loc6_;
         this.a.y = param2;
         this.a.u = 0;
         this.b.x = -_loc6_;
         this.b.u = 0;
         this.c.x = _loc6_;
         this.c.u = 0.5;
         this.d.x = _loc6_;
         this.d.y = param2;
         this.d.u = 0.5;
         this.e.x = -_loc6_;
         this.e.u = 0.5;
         this.e.v = 0;
         this.f.x = -_loc6_;
         this.f.y = 0;
         this.f.u = 0.5;
         this.g.x = _loc6_;
         this.g.y = 0;
         this.g.u = 1;
         this.h.x = _loc6_;
         this.h.u = 1;
         this.h.v = 0;
         boundMinX = -_loc6_;
         boundMinY = 0;
         boundMinZ = 0;
         boundMaxX = _loc6_;
         boundMaxY = param2;
         boundMaxZ = 0;
      }
      
      public function clear() : void
      {
         this.§static package override§.material = null;
         this.§%P§.material = null;
         this.material = null;
      }
      
      public function update(param1:Number) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = this.middle + this.§7#]§ * param1;
         if(_loc3_ < §<!x§)
         {
            _loc2_ = _loc3_ < 0 ? Number(0) : Number(_loc3_);
            this.b.y = _loc2_;
            this.c.y = _loc2_;
            this.a.v = 1 - (this.length - _loc3_) / this.§finally var dynamic§;
            this.d.v = this.a.v;
            this.b.v = this.a.v + (this.length - _loc2_) / this.§finally var dynamic§;
            this.c.v = this.b.v;
            this.e.y = §<!x§;
            this.h.y = §<!x§;
            this.§static package override§.material = this.material;
            this.§%P§.material = null;
         }
         else if(_loc3_ > this.length - §<!x§)
         {
            _loc2_ = _loc3_ > this.length ? Number(this.length) : Number(_loc3_);
            this.e.y = _loc2_;
            this.h.y = _loc2_;
            this.e.v = -(_loc3_ - _loc2_) / this.§finally var dynamic§;
            this.h.v = this.e.v;
            this.f.v = this.e.v + _loc3_ / this.§finally var dynamic§;
            this.g.v = this.f.v;
            this.b.y = this.length - §<!x§;
            this.b.y = this.length - §<!x§;
            this.§static package override§.material = null;
            this.§%P§.material = this.material;
         }
         else
         {
            this.a.v = 1 - (this.length - _loc3_) / this.§finally var dynamic§;
            this.d.v = this.a.v;
            this.b.y = _loc3_;
            this.c.y = _loc3_;
            this.e.y = _loc3_;
            this.h.y = _loc3_;
            this.b.v = 1;
            this.c.v = 1;
            this.e.v = 0;
            this.f.v = _loc3_ / this.§finally var dynamic§;
            this.g.v = _loc3_ / this.§finally var dynamic§;
            this.h.v = 0;
            this.§static package override§.material = this.material;
            this.§%P§.material = this.material;
         }
      }
   }
}

