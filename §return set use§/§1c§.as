package §return set use§
{
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.core.Sorting;
   import alternativa.engine3d.core.Vertex;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.tanks.utils.§super with§;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.utils.Dictionary;
   
   public final class §1c§ extends Mesh
   {
      private static const §!!7§:Class = final;
      
      private static const § !9§:Class = §set const null§;
      
      private static const §override catch false§:BitmapData = new §!!7§().bitmapData;
      
      private static const §;"m§:BitmapData = new § !9§().bitmapData;
      
      private static const FADE:Number = 100;
      
      private static const WIDTH:Number = 10;
      
      private static const §^#i§:Number = 5;
      
      private static const §`!o§:Number = 0.5;
      
      private static const §5#Q§:Number = 0.75;
      
      private static const DELTA:Number = 300;
      
      private static const §"-§:Dictionary = new Dictionary();
      
      private static const §@!^§:Dictionary = new Dictionary();
      
      private var material:TextureMaterial;
      
      private var a1:Vertex;
      
      private var b1:Vertex;
      
      private var c1:Vertex;
      
      private var d1:Vertex;
      
      private var e1:Vertex;
      
      private var f1:Vertex;
      
      private var g1:Vertex;
      
      private var h1:Vertex;
      
      private var rayFace1:Face;
      
      private var rayBeginFace1:Face;
      
      private var a2:Vertex;
      
      private var b2:Vertex;
      
      private var c2:Vertex;
      
      private var d2:Vertex;
      
      private var e2:Vertex;
      
      private var f2:Vertex;
      
      private var g2:Vertex;
      
      private var h2:Vertex;
      
      private var rayFace2:Face;
      
      private var rayBeginFace2:Face;
      
      private var §finally var dynamic§:Number;
      
      private var angle:Number;
      
      private var angle2:Number;
      
      private var color:uint;
      
      public function §1c§()
      {
         super();
         this.a1 = addVertex(-1,1,0);
         this.b1 = addVertex(-1,0,0);
         this.c1 = addVertex(1,0,0);
         this.d1 = addVertex(1,1,0);
         this.e1 = addVertex(-1,1,0);
         this.f1 = addVertex(-1,0,0);
         this.g1 = addVertex(1,0,0);
         this.h1 = addVertex(1,1,0);
         this.rayFace1 = addQuadFace(this.a1,this.b1,this.c1,this.d1);
         this.rayBeginFace1 = addQuadFace(this.e1,this.f1,this.g1,this.h1);
         this.a2 = addVertex(-1,1,0);
         this.b2 = addVertex(-1,0,0);
         this.c2 = addVertex(1,0,0);
         this.d2 = addVertex(1,1,0);
         this.e2 = addVertex(-1,1,0);
         this.f2 = addVertex(-1,0,0);
         this.g2 = addVertex(1,0,0);
         this.h2 = addVertex(1,1,0);
         this.rayFace2 = addQuadFace(this.a2,this.b2,this.c2,this.d2);
         this.rayBeginFace2 = addQuadFace(this.e2,this.f2,this.g2,this.h2);
         calculateFacesNormals();
         useLight = false;
         useShadowMap = false;
         sorting = Sorting.DYNAMIC_BSP;
         shadowMapAlphaThreshold = 2;
         depthMapAlphaThreshold = 2;
         blendMode = BlendMode.ADD;
      }
      
      public function init(param1:int) : void
      {
         this.color = param1;
         this.material = §super with§.§continue in§(§"-§,param1,§override catch false§);
         this.rayFace1.material = this.material;
         this.rayFace2.material = this.material;
         var _loc2_:TextureMaterial = §super with§.§continue in§(§@!^§,param1,§;"m§,false);
         this.rayBeginFace1.material = _loc2_;
         this.rayBeginFace2.material = _loc2_;
         var _loc3_:Number = WIDTH * 0.5;
         this.a1.x = -_loc3_;
         this.a1.u = 0;
         this.b1.x = -_loc3_;
         this.b1.u = 0;
         this.c1.x = _loc3_;
         this.c1.u = 1;
         this.d1.x = _loc3_;
         this.d1.u = 1;
         this.e1.x = -_loc3_;
         this.e1.u = 0;
         this.e1.v = 0;
         this.f1.x = -_loc3_;
         this.f1.u = 0;
         this.f1.v = 1;
         this.g1.x = _loc3_;
         this.g1.u = 1;
         this.g1.v = 1;
         this.h1.x = _loc3_;
         this.h1.u = 1;
         this.h1.v = 0;
         this.a2.x = -_loc3_;
         this.a2.u = 0;
         this.b2.x = -_loc3_;
         this.b2.u = 0;
         this.c2.x = _loc3_;
         this.c2.u = 1;
         this.d2.x = _loc3_;
         this.d2.u = 1;
         this.e2.x = -_loc3_;
         this.e2.u = 0;
         this.e2.v = 0;
         this.f2.x = -_loc3_;
         this.f2.u = 0;
         this.f2.v = 1;
         this.g2.x = _loc3_;
         this.g2.u = 1;
         this.g2.v = 1;
         this.h2.x = _loc3_;
         this.h2.u = 1;
         this.h2.v = 0;
         this.§finally var dynamic§ = §^#i§ * WIDTH * this.material.texture.height / this.material.texture.width;
         this.angle = 0;
         this.angle2 = 0;
      }
      
      public function update(param1:int, param2:Number) : void
      {
         var _loc3_:Number = param1 / 1000;
         this.a1.y = param2;
         this.b1.y = FADE;
         this.c1.y = FADE;
         this.d1.y = param2;
         this.e1.y = FADE;
         this.f1.y = 0;
         this.g1.y = 0;
         this.h1.y = FADE;
         this.a2.y = param2;
         this.b2.y = FADE;
         this.c2.y = FADE;
         this.d2.y = param2;
         this.e2.y = FADE;
         this.f2.y = 0;
         this.g2.y = 0;
         this.h2.y = FADE;
         this.angle += §`!o§ * _loc3_;
         this.angle2 += §5#Q§ * _loc3_;
         var _loc4_:Number = Math.sin(this.angle) * DELTA;
         var _loc5_:Number = Math.sin(this.angle2) * DELTA;
         this.a1.v = (-this.a1.y + _loc4_) / this.§finally var dynamic§;
         this.b1.v = (-this.b1.y + _loc4_) / this.§finally var dynamic§;
         this.c1.v = (-this.c1.y + _loc4_) / this.§finally var dynamic§;
         this.d1.v = (-this.d1.y + _loc4_) / this.§finally var dynamic§;
         this.a2.v = (-this.a2.y + _loc5_) / this.§finally var dynamic§;
         this.b2.v = (-this.b2.y + _loc5_) / this.§finally var dynamic§;
         this.c2.v = (-this.c2.y + _loc5_) / this.§finally var dynamic§;
         this.d2.v = (-this.d2.y + _loc5_) / this.§finally var dynamic§;
         var _loc6_:Number = this.material.texture.width;
         var _loc7_:Number = this.material.texture.height;
         var _loc8_:Number = _loc6_ / 2;
         var _loc9_:Number = this.b1.v * _loc7_ % _loc7_;
         if(_loc9_ < 0)
         {
            _loc9_ = _loc7_ + _loc9_;
         }
         var _loc10_:Number = (§override catch false§.getPixel(_loc8_,_loc9_) >> 16 & 0xFF) / 255;
         this.e1.v = 1 - _loc10_;
         this.h1.v = 1 - _loc10_;
         _loc9_ = this.b2.v * _loc7_ % _loc7_;
         if(_loc9_ < 0)
         {
            _loc9_ = _loc7_ + _loc9_;
         }
         _loc10_ = (§override catch false§.getPixel(_loc8_,_loc9_) >> 16 & 0xFF) / 255;
         this.e2.v = 1 - _loc10_;
         this.h2.v = 1 - _loc10_;
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         if(this.color in §"-§)
         {
            delete §"-§[this.color];
         }
         if(this.color in §@!^§)
         {
            delete §@!^§[this.color];
         }
         this.material = null;
         this.rayFace1.material = null;
         this.rayFace2.material = null;
         this.rayBeginFace1.material = null;
         this.rayBeginFace2.material = null;
      }
   }
}

