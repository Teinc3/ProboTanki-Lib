package alternativa.engine3d.core
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.gfx.core.Device;
   import alternativa.gfx.core.IndexBufferResource;
   import alternativa.gfx.core.ProgramResource;
   import alternativa.gfx.core.RenderTargetTextureResource;
   import alternativa.gfx.core.VertexBufferResource;
   import flash.display3D.Context3DProgramType;
   import flash.display3D.Context3DVertexBufferFormat;
   import flash.utils.ByteArray;
   
   use namespace alternativa3d;
   
   public class ShadowAtlas
   {
      alternativa3d static const sizeLimit:int = 1024;
      
      private static var blurPrograms:Array = new Array();
      
      private static var blurVertexBuffer:VertexBufferResource = new VertexBufferResource(Vector.<Number>([-1,1,0,0,0,-1,-1,0,0,1,1,-1,0,1,1,1,1,0,1,0]),5);
      
      private static var blurIndexBuffer:IndexBufferResource = new IndexBufferResource(Vector.<uint>([0,1,3,2,3,1]));
      
      private static var blurConst:Vector.<Number> = Vector.<Number>([0,0,0,1,0,0,0,1]);
      
      alternativa3d var shadows:Vector.<Shadow>;
      
      alternativa3d var shadowsCount:int = 0;
      
      private var mapSize:int;
      
      private var blur:int;
      
      private var maps:Array;
      
      private var map1:RenderTargetTextureResource;
      
      private var map2:RenderTargetTextureResource;
      
      public function ShadowAtlas(param1:int, param2:int)
      {
         this.alternativa3d::shadows = new Vector.<Shadow>();
         this.maps = new Array();
         super();
         this.mapSize = param1;
         this.blur = param2;
      }
      
      alternativa3d function renderCasters(param1:Camera3D) : void
      {
         var _loc2_:Shadow = null;
         var _loc3_:Device = param1.alternativa3d::device;
         var _loc4_:int = alternativa3d::sizeLimit / this.mapSize;
         var _loc5_:* = int(Math.ceil(this.alternativa3d::shadowsCount / _loc4_));
         var _loc6_:* = this.alternativa3d::shadowsCount > _loc4_ ? int(_loc4_) : int(this.alternativa3d::shadowsCount);
         _loc5_ = 1 << Math.ceil(Math.log(_loc5_) / Math.LN2);
         _loc6_ = 1 << Math.ceil(Math.log(_loc6_) / Math.LN2);
         if(_loc5_ > _loc4_)
         {
            _loc5_ = _loc4_;
            this.alternativa3d::shadowsCount = _loc5_ * _loc6_;
         }
         var _loc7_:* = _loc5_ << 8 | _loc6_;
         this.map1 = this.maps[_loc7_];
         var _loc8_:* = 1 << 16 | _loc7_;
         this.map2 = this.maps[_loc8_];
         if(this.map1 == null)
         {
            this.map1 = new RenderTargetTextureResource(_loc6_ * this.mapSize,_loc5_ * this.mapSize);
            this.map2 = new RenderTargetTextureResource(_loc6_ * this.mapSize,_loc5_ * this.mapSize);
            this.maps[_loc7_] = this.map1;
            this.maps[_loc8_] = this.map2;
         }
         _loc3_.setRenderToTexture(this.map1,true);
         _loc3_.clear(0,0,0,0,0);
         var _loc9_:int = 0;
         while(_loc9_ < this.alternativa3d::shadowsCount)
         {
            _loc2_ = this.alternativa3d::shadows[_loc9_];
            _loc2_.alternativa3d::texture = this.map1;
            _loc2_.alternativa3d::textureScaleU = 1 / _loc6_;
            _loc2_.alternativa3d::textureScaleV = 1 / _loc5_;
            _loc2_.alternativa3d::textureOffsetU = _loc9_ % _loc6_ / _loc6_;
            _loc2_.alternativa3d::textureOffsetV = int(_loc9_ / _loc6_) / _loc5_;
            _loc2_.alternativa3d::renderCasters(param1);
            _loc9_++;
         }
      }
      
      alternativa3d function renderBlur(param1:Camera3D) : void
      {
         var _loc2_:Device = param1.alternativa3d::device;
         if(this.blur > 0)
         {
            _loc2_.setVertexBufferAt(0,blurVertexBuffer,0,Context3DVertexBufferFormat.FLOAT_3);
            _loc2_.setVertexBufferAt(1,blurVertexBuffer,3,Context3DVertexBufferFormat.FLOAT_2);
            blurConst[0] = 1 / this.map1.width;
            blurConst[1] = 1 / this.map1.height;
            blurConst[3] = 1 + this.blur + this.blur;
            blurConst[4] = this.blur / this.map1.width;
            blurConst[5] = this.blur / this.map1.height;
            _loc2_.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT,0,blurConst,2);
            _loc2_.setRenderToTexture(this.map2,false);
            _loc2_.clear(0,0,0,0);
            _loc2_.setProgram(this.getBlurProgram(1,this.blur));
            _loc2_.setTextureAt(0,this.map1);
            _loc2_.drawTriangles(blurIndexBuffer,0,2);
            _loc2_.setRenderToTexture(this.map1,false);
            _loc2_.clear(0,0,0,0);
            _loc2_.setProgram(this.getBlurProgram(2,this.blur));
            _loc2_.setTextureAt(0,this.map2);
            _loc2_.drawTriangles(blurIndexBuffer,0,2);
         }
      }
      
      alternativa3d function clear() : void
      {
         var _loc1_:Shadow = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.alternativa3d::shadowsCount)
         {
            _loc1_ = this.alternativa3d::shadows[_loc2_];
            _loc1_.alternativa3d::texture = null;
            _loc2_++;
         }
         this.alternativa3d::shadows.length = 0;
         this.alternativa3d::shadowsCount = 0;
      }
      
      private function getBlurProgram(param1:int, param2:int) : ProgramResource
      {
         var _loc3_:ByteArray = null;
         var _loc4_:ByteArray = null;
         var _loc5_:int = (param1 << 16) + param2;
         var _loc6_:ProgramResource = blurPrograms[_loc5_];
         if(_loc6_ == null)
         {
            _loc3_ = new ShadowAtlasVertexShader().agalcode;
            _loc4_ = new ShadowAtlasFragmentShader(param2,param1 == 1).agalcode;
            _loc6_ = new ProgramResource(_loc3_,_loc4_);
            blurPrograms[_loc5_] = _loc6_;
         }
         return _loc6_;
      }
   }
}

