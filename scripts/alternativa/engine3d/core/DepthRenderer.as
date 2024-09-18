package alternativa.engine3d.core
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.lights.OmniLight;
   import alternativa.engine3d.lights.SpotLight;
   import alternativa.engine3d.lights.TubeLight;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.BSP;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.gfx.core.BitmapTextureResource;
   import alternativa.gfx.core.Device;
   import alternativa.gfx.core.IndexBufferResource;
   import alternativa.gfx.core.ProgramResource;
   import alternativa.gfx.core.RenderTargetTextureResource;
   import alternativa.gfx.core.VertexBufferResource;
   import flash.display.BitmapData;
   import flash.display3D.Context3DBlendFactor;
   import flash.display3D.Context3DProgramType;
   import flash.display3D.Context3DVertexBufferFormat;
   import flash.geom.Rectangle;
   import flash.utils.ByteArray;
   
   use namespace alternativa3d;
   
   public class DepthRenderer
   {
      private static const limit2const:int = 62;
      
      private static const limit5const:int = 24;
      
      private var depthPrograms:Array;
      
      private var correction:Vector.<Number>;
      
      private var depthFragment:Vector.<Number>;
      
      private var alphaTestConst:Vector.<Number>;
      
      private var ssaoProgram:ProgramResource;
      
      private var ssaoVertexBuffer:VertexBufferResource;
      
      private var ssaoIndexBuffer:IndexBufferResource;
      
      private var ssaoVertex:Vector.<Number>;
      
      private var ssaoFragment:Vector.<Number>;
      
      private var blurProgram:ProgramResource;
      
      private var blurFragment:Vector.<Number>;
      
      private var omniProgram:ProgramResource;
      
      private var spotProgram:ProgramResource;
      
      private var tubeProgram:ProgramResource;
      
      private var lightConst:Vector.<Number>;
      
      private var lightVertexBuffer:VertexBufferResource;
      
      private var lightIndexBuffer:IndexBufferResource;
      
      alternativa3d var depthBuffer:RenderTargetTextureResource;
      
      alternativa3d var lightBuffer:RenderTargetTextureResource;
      
      private var temporaryBuffer:RenderTargetTextureResource;
      
      private var scissor:Rectangle;
      
      private var table:BitmapTextureResource;
      
      private var noise:BitmapTextureResource;
      
      private var bias:Number = 0.1;
      
      private var tableSize:int = 128;
      
      private var noiseSize:int = 4;
      
      private var blurSamples:int = 16;
      
      private var intensity:Number = 2.5;
      
      private var noiseRandom:Number = 0.2;
      
      private var samples:int = 6;
      
      private var noiseAngle:Number;
      
      alternativa3d var correctionX:Number;
      
      alternativa3d var correctionY:Number;
      
      public function DepthRenderer()
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         this.depthPrograms = new Array();
         this.correction = Vector.<Number>([0,0,0,1,0,0,0,1,0,0,0,0.5]);
         this.depthFragment = Vector.<Number>([1 / 255,0,0,1,0.5,0.5,0,1]);
         this.alphaTestConst = Vector.<Number>([0,0,0,1]);
         this.ssaoVertexBuffer = new VertexBufferResource(Vector.<Number>([-1,1,0,0,0,-1,-1,0,0,1,1,-1,0,1,1,1,1,0,1,0]),5);
         this.ssaoIndexBuffer = new IndexBufferResource(Vector.<uint>([0,1,3,2,3,1]));
         this.ssaoVertex = Vector.<Number>([0,0,0,1,0,0,0,1,1,1,0,1]);
         this.ssaoFragment = Vector.<Number>([0,0,0,Math.PI * 2,0,0,0,1,0,0,0,1,0,0,1,1,0,0,0,0,0,0,0,1,0,0,Math.PI * 2,Math.PI * 2]);
         this.blurFragment = Vector.<Number>([0,0,0,1,0,0,0,1]);
         this.lightConst = new Vector.<Number>();
         this.scissor = new Rectangle();
         this.noiseAngle = Math.PI * 2 / this.samples;
         super();
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:Vector.<Number> = new Vector.<Number>();
         var _loc23_:Vector.<uint> = new Vector.<uint>();
         _loc1_ = 0;
         while(_loc1_ < limit2const)
         {
            _loc3_ = 4 + _loc1_ * 2;
            _loc4_ = 4 + _loc1_ * 5;
            _loc5_ = _loc1_ * 8;
            _loc22_[_loc20_] = -1;
            _loc20_++;
            _loc22_[_loc20_] = 1;
            _loc20_++;
            _loc22_[_loc20_] = -1;
            _loc20_++;
            _loc22_[_loc20_] = _loc3_;
            _loc20_++;
            _loc22_[_loc20_] = _loc4_;
            _loc20_++;
            _loc6_ = _loc5_ + 1;
            _loc22_[_loc20_] = 1;
            _loc20_++;
            _loc22_[_loc20_] = 1;
            _loc20_++;
            _loc22_[_loc20_] = -1;
            _loc20_++;
            _loc22_[_loc20_] = _loc3_;
            _loc20_++;
            _loc22_[_loc20_] = _loc4_;
            _loc20_++;
            _loc7_ = _loc6_ + 1;
            _loc22_[_loc20_] = 1;
            _loc20_++;
            _loc22_[_loc20_] = 1;
            _loc20_++;
            _loc22_[_loc20_] = 1;
            _loc20_++;
            _loc22_[_loc20_] = _loc3_;
            _loc20_++;
            _loc22_[_loc20_] = _loc4_;
            _loc20_++;
            _loc8_ = _loc7_ + 1;
            _loc22_[_loc20_] = -1;
            _loc20_++;
            _loc22_[_loc20_] = 1;
            _loc20_++;
            _loc22_[_loc20_] = 1;
            _loc20_++;
            _loc22_[_loc20_] = _loc3_;
            _loc20_++;
            _loc22_[_loc20_] = _loc4_;
            _loc20_++;
            _loc9_ = _loc8_ + 1;
            _loc22_[_loc20_] = -1;
            _loc20_++;
            _loc22_[_loc20_] = -1;
            _loc20_++;
            _loc22_[_loc20_] = -1;
            _loc20_++;
            _loc22_[_loc20_] = _loc3_;
            _loc20_++;
            _loc22_[_loc20_] = _loc4_;
            _loc20_++;
            _loc10_ = _loc9_ + 1;
            _loc22_[_loc20_] = 1;
            _loc20_++;
            _loc22_[_loc20_] = -1;
            _loc20_++;
            _loc22_[_loc20_] = -1;
            _loc20_++;
            _loc22_[_loc20_] = _loc3_;
            _loc20_++;
            _loc22_[_loc20_] = _loc4_;
            _loc20_++;
            _loc11_ = _loc10_ + 1;
            _loc22_[_loc20_] = 1;
            _loc20_++;
            _loc22_[_loc20_] = -1;
            _loc20_++;
            _loc22_[_loc20_] = 1;
            _loc20_++;
            _loc22_[_loc20_] = _loc3_;
            _loc20_++;
            _loc22_[_loc20_] = _loc4_;
            _loc20_++;
            _loc12_ = _loc11_ + 1;
            _loc22_[_loc20_] = -1;
            _loc20_++;
            _loc22_[_loc20_] = -1;
            _loc20_++;
            _loc22_[_loc20_] = 1;
            _loc20_++;
            _loc22_[_loc20_] = _loc3_;
            _loc20_++;
            _loc22_[_loc20_] = _loc4_;
            _loc20_++;
            _loc23_[_loc21_] = _loc5_;
            _loc21_++;
            _loc23_[_loc21_] = _loc9_;
            _loc21_++;
            _loc23_[_loc21_] = _loc6_;
            _loc21_++;
            _loc23_[_loc21_] = _loc6_;
            _loc21_++;
            _loc23_[_loc21_] = _loc9_;
            _loc21_++;
            _loc23_[_loc21_] = _loc10_;
            _loc21_++;
            _loc23_[_loc21_] = _loc6_;
            _loc21_++;
            _loc23_[_loc21_] = _loc10_;
            _loc21_++;
            _loc23_[_loc21_] = _loc11_;
            _loc21_++;
            _loc23_[_loc21_] = _loc6_;
            _loc21_++;
            _loc23_[_loc21_] = _loc11_;
            _loc21_++;
            _loc23_[_loc21_] = _loc7_;
            _loc21_++;
            _loc23_[_loc21_] = _loc9_;
            _loc21_++;
            _loc23_[_loc21_] = _loc11_;
            _loc21_++;
            _loc23_[_loc21_] = _loc10_;
            _loc21_++;
            _loc23_[_loc21_] = _loc9_;
            _loc21_++;
            _loc23_[_loc21_] = _loc12_;
            _loc21_++;
            _loc23_[_loc21_] = _loc11_;
            _loc21_++;
            _loc23_[_loc21_] = _loc7_;
            _loc21_++;
            _loc23_[_loc21_] = _loc11_;
            _loc21_++;
            _loc23_[_loc21_] = _loc12_;
            _loc21_++;
            _loc23_[_loc21_] = _loc7_;
            _loc21_++;
            _loc23_[_loc21_] = _loc12_;
            _loc21_++;
            _loc23_[_loc21_] = _loc8_;
            _loc21_++;
            _loc23_[_loc21_] = _loc5_;
            _loc21_++;
            _loc23_[_loc21_] = _loc8_;
            _loc21_++;
            _loc23_[_loc21_] = _loc12_;
            _loc21_++;
            _loc23_[_loc21_] = _loc5_;
            _loc21_++;
            _loc23_[_loc21_] = _loc12_;
            _loc21_++;
            _loc23_[_loc21_] = _loc9_;
            _loc21_++;
            _loc23_[_loc21_] = _loc5_;
            _loc21_++;
            _loc23_[_loc21_] = _loc6_;
            _loc21_++;
            _loc23_[_loc21_] = _loc7_;
            _loc21_++;
            _loc23_[_loc21_] = _loc5_;
            _loc21_++;
            _loc23_[_loc21_] = _loc7_;
            _loc21_++;
            _loc23_[_loc21_] = _loc8_;
            _loc21_++;
            _loc1_++;
         }
         this.lightVertexBuffer = new VertexBufferResource(_loc22_,5);
         this.lightIndexBuffer = new IndexBufferResource(_loc23_);
         var _loc24_:Vector.<uint> = new Vector.<uint>();
         var _loc25_:int = 0;
         var _loc26_:Number = Math.PI * 2;
         var _loc27_:int = this.tableSize - 1;
         _loc1_ = 0;
         while(_loc1_ < this.tableSize)
         {
            _loc13_ = (_loc1_ / _loc27_ - 0.5) * 2;
            _loc2_ = 0;
            while(_loc2_ < this.tableSize)
            {
               _loc14_ = (_loc2_ / _loc27_ - 0.5) * 2;
               _loc15_ = Math.atan2(_loc13_,_loc14_);
               if(_loc15_ < 0)
               {
                  _loc15_ += _loc26_;
               }
               _loc24_[_loc25_] = Math.round(255 * _loc15_ / _loc26_);
               _loc25_++;
               _loc2_++;
            }
            _loc1_++;
         }
         this.table = new BitmapTextureResource(new BitmapData(this.tableSize,this.tableSize,false,0),false);
         this.table.bitmapData.setVector(this.table.bitmapData.rect,_loc24_);
         _loc24_ = new Vector.<uint>();
         _loc25_ = 0;
         _loc1_ = 0;
         while(_loc1_ < this.noiseSize)
         {
            _loc2_ = 0;
            while(_loc2_ < this.noiseSize)
            {
               _loc16_ = Math.random() * this.noiseAngle;
               _loc17_ = Math.sin(_loc16_) * 255;
               _loc18_ = Math.cos(_loc16_) * 255;
               _loc19_ = (this.noiseRandom + Math.random() * (1 - this.noiseRandom)) * 255;
               _loc24_[_loc25_] = _loc17_ << 16 | _loc18_ << 8 | _loc19_;
               _loc25_++;
               _loc2_++;
            }
            _loc1_++;
         }
         this.noise = new BitmapTextureResource(new BitmapData(this.noiseSize,this.noiseSize,false,0),false);
         this.noise.bitmapData.setVector(this.noise.bitmapData.rect,_loc24_);
         this.alternativa3d::depthBuffer = new RenderTargetTextureResource(1,1);
         this.temporaryBuffer = new RenderTargetTextureResource(1,1);
         this.alternativa3d::lightBuffer = new RenderTargetTextureResource(1,1);
      }
      
      alternativa3d function render(param1:Camera3D, param2:Number, param3:Number, param4:Number, param5:Boolean, param6:Boolean, param7:Number, param8:Vector.<Object3D>, param9:int) : void
      {
         var _loc10_:int = 0;
         var _loc11_:Object3D = null;
         var _loc12_:VertexBufferResource = null;
         var _loc13_:IndexBufferResource = null;
         var _loc14_:int = 0;
         var _loc15_:TextureMaterial = null;
         var _loc16_:Mesh = null;
         var _loc17_:BSP = null;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:OmniLight = null;
         var _loc21_:SpotLight = null;
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc24_:TubeLight = null;
         var _loc25_:Device = param1.alternativa3d::device;
         if(param2 > 2048)
         {
            param2 = 2048;
         }
         if(param3 > 2048)
         {
            param3 = 2048;
         }
         if(param4 > 1)
         {
            param4 = 1;
         }
         param2 = Math.round(param2 * param4);
         param3 = Math.round(param3 * param4);
         if(param2 < 1)
         {
            param2 = 1;
         }
         if(param3 < 1)
         {
            param3 = 1;
         }
         this.scissor.width = param2;
         this.scissor.height = param3;
         var _loc26_:* = 1 << Math.ceil(Math.log(param2) / Math.LN2);
         var _loc27_:* = 1 << Math.ceil(Math.log(param3) / Math.LN2);
         if(_loc26_ != this.alternativa3d::depthBuffer.width || _loc27_ != this.alternativa3d::depthBuffer.height)
         {
            this.alternativa3d::depthBuffer.dispose();
            this.alternativa3d::depthBuffer = new RenderTargetTextureResource(_loc26_,_loc27_);
            this.temporaryBuffer.dispose();
            this.temporaryBuffer = new RenderTargetTextureResource(_loc26_,_loc27_);
            this.alternativa3d::lightBuffer.dispose();
            this.alternativa3d::lightBuffer = new RenderTargetTextureResource(_loc26_,_loc27_);
         }
         if(!param5)
         {
            this.noise.reset();
            this.temporaryBuffer.reset();
            this.ssaoVertexBuffer.reset();
            this.ssaoIndexBuffer.reset();
         }
         if(!param6)
         {
            this.alternativa3d::lightBuffer.reset();
            this.lightVertexBuffer.reset();
            this.lightIndexBuffer.reset();
         }
         if(!param5 && !param6)
         {
            this.table.reset();
         }
         this.alternativa3d::correctionX = param2 / this.alternativa3d::depthBuffer.width;
         this.alternativa3d::correctionY = param3 / this.alternativa3d::depthBuffer.height;
         _loc25_.setRenderToTexture(this.alternativa3d::depthBuffer,true);
         _loc25_.clear(1,0,0.25,1);
         _loc25_.setScissorRectangle(this.scissor);
         this.correction[0] = this.alternativa3d::correctionX;
         this.correction[1] = this.alternativa3d::correctionY;
         this.correction[2] = 255 / param1.farClipping;
         this.correction[4] = 1 - this.alternativa3d::correctionX;
         this.correction[5] = 1 - this.alternativa3d::correctionY;
         this.correction[8] = param1.alternativa3d::correctionX;
         this.correction[9] = param1.alternativa3d::correctionY;
         _loc25_.setProgramConstantsFromVector(Context3DProgramType.VERTEX,3,param1.alternativa3d::projection,1,false);
         _loc25_.setProgramConstantsFromVector(Context3DProgramType.VERTEX,4,this.correction,3,false);
         if(param5 || param6)
         {
            _loc25_.setTextureAt(0,this.table);
         }
         _loc10_ = 0;
         while(_loc10_ < param9)
         {
            _loc11_ = param8[_loc10_];
            if(_loc11_ is Mesh)
            {
               _loc16_ = Mesh(_loc11_);
               _loc12_ = _loc16_.alternativa3d::vertexBuffer;
               _loc13_ = _loc16_.alternativa3d::indexBuffer;
               _loc14_ = _loc16_.alternativa3d::numTriangles;
               _loc15_ = _loc16_.alternativa3d::faceList.material as TextureMaterial;
            }
            else if(_loc11_ is BSP)
            {
               _loc17_ = BSP(_loc11_);
               _loc12_ = _loc17_.alternativa3d::vertexBuffer;
               _loc13_ = _loc17_.alternativa3d::indexBuffer;
               _loc14_ = _loc17_.alternativa3d::numTriangles;
               _loc15_ = _loc17_.alternativa3d::faces[0].material as TextureMaterial;
            }
            if(_loc15_ != null && _loc15_.alphaTestThreshold > 0 && _loc15_.alternativa3d::transparent)
            {
               _loc25_.setProgram(this.getDepthProgram(param5 || param6,true,param1.view.alternativa3d::quality,_loc15_.repeat,_loc15_.alternativa3d::_mipMapping > 0,false,false));
               _loc25_.setVertexBufferAt(2,_loc12_,3,Context3DVertexBufferFormat.FLOAT_2);
               _loc25_.setTextureAt(1,_loc15_.alternativa3d::textureResource);
               this.alphaTestConst[0] = _loc15_.alternativa3d::textureResource.correctionU;
               this.alphaTestConst[1] = _loc15_.alternativa3d::textureResource.correctionV;
               this.alphaTestConst[3] = _loc15_.alphaTestThreshold;
               _loc25_.setProgramConstantsFromVector(Context3DProgramType.VERTEX,7,this.alphaTestConst,1);
            }
            else
            {
               _loc25_.setProgram(this.getDepthProgram(param5 || param6,false));
            }
            _loc25_.setVertexBufferAt(0,_loc12_,0,Context3DVertexBufferFormat.FLOAT_3);
            _loc25_.setProgramConstantsFromVector(Context3DProgramType.VERTEX,0,_loc11_.alternativa3d::transformConst,3,false);
            _loc25_.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT,0,this.depthFragment,2);
            if(param5 || param6)
            {
               _loc25_.setVertexBufferAt(1,_loc12_,5,Context3DVertexBufferFormat.FLOAT_3);
            }
            _loc25_.drawTriangles(_loc13_,0,_loc14_);
            _loc25_.setTextureAt(1,null);
            _loc25_.setVertexBufferAt(2,null);
            _loc10_++;
         }
         if(param6)
         {
            _loc25_.setRenderToTexture(this.alternativa3d::lightBuffer,false);
            _loc25_.clear(param7,param7,param7,0);
            _loc25_.setBlendFactors(Context3DBlendFactor.ONE,Context3DBlendFactor.ONE);
            _loc25_.setTextureAt(0,this.alternativa3d::depthBuffer);
            _loc25_.setVertexBufferAt(0,this.lightVertexBuffer,0,Context3DVertexBufferFormat.FLOAT_3);
            _loc25_.setVertexBufferAt(1,this.lightVertexBuffer,3,Context3DVertexBufferFormat.FLOAT_2);
            _loc25_.setProgramConstantsFromVector(Context3DProgramType.VERTEX,0,param1.alternativa3d::projection,1,false);
            _loc25_.setProgramConstantsFromVector(Context3DProgramType.VERTEX,1,this.correction,3,false);
            this.ssaoFragment[0] = param1.farClipping;
            this.ssaoFragment[1] = param1.farClipping / 255;
            this.ssaoFragment[4] = 2 / this.alternativa3d::correctionX;
            this.ssaoFragment[5] = 2 / this.alternativa3d::correctionY;
            this.ssaoFragment[6] = 0;
            this.ssaoFragment[8] = 1;
            this.ssaoFragment[9] = 1;
            this.ssaoFragment[10] = 0.5;
            this.ssaoFragment[12] = param1.alternativa3d::correctionX;
            this.ssaoFragment[13] = param1.alternativa3d::correctionY;
            this.ssaoFragment[16] = 0.5;
            this.ssaoFragment[17] = 0.5;
            _loc25_.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT,0,this.ssaoFragment,7,false);
            _loc25_.setProgram(this.getOmniProgram());
            _loc18_ = 0;
            _loc19_ = 0;
            _loc10_ = 0;
            while(_loc10_ < param1.alternativa3d::omniesCount)
            {
               _loc20_ = param1.alternativa3d::omnies[_loc10_];
               this.lightConst[_loc18_] = _loc20_.alternativa3d::cmd * param1.alternativa3d::correctionX;
               _loc18_++;
               this.lightConst[_loc18_] = _loc20_.alternativa3d::cmh * param1.alternativa3d::correctionY;
               _loc18_++;
               this.lightConst[_loc18_] = _loc20_.alternativa3d::cml;
               _loc18_++;
               this.lightConst[_loc18_] = _loc20_.attenuationEnd;
               _loc18_++;
               this.lightConst[_loc18_] = _loc20_.intensity * param1.deferredLightingStrength * (_loc20_.color >> 16 & 0xFF) / 255;
               _loc18_++;
               this.lightConst[_loc18_] = _loc20_.intensity * param1.deferredLightingStrength * (_loc20_.color >> 8 & 0xFF) / 255;
               _loc18_++;
               this.lightConst[_loc18_] = _loc20_.intensity * param1.deferredLightingStrength * (_loc20_.color & 0xFF) / 255;
               _loc18_++;
               this.lightConst[_loc18_] = 1 / (_loc20_.attenuationEnd - _loc20_.attenuationBegin);
               _loc18_++;
               _loc19_++;
               if(_loc19_ == limit2const || _loc10_ == param1.alternativa3d::omniesCount - 1)
               {
                  _loc25_.setProgramConstantsFromVector(Context3DProgramType.VERTEX,4,this.lightConst,_loc19_ * 2,false);
                  _loc25_.drawTriangles(this.lightIndexBuffer,0,_loc19_ * 6 * 2);
                  _loc19_ = 0;
                  _loc18_ = 0;
               }
               _loc10_++;
            }
            _loc25_.setProgram(this.getSpotProgram());
            _loc18_ = 0;
            _loc19_ = 0;
            _loc10_ = 0;
            while(_loc10_ < param1.alternativa3d::spotsCount)
            {
               _loc21_ = param1.alternativa3d::spots[_loc10_];
               _loc22_ = Math.cos(_loc21_.hotspot * 0.5);
               _loc23_ = Math.cos(_loc21_.falloff * 0.5);
               this.lightConst[_loc18_] = _loc21_.alternativa3d::cma;
               _loc18_++;
               this.lightConst[_loc18_] = _loc21_.alternativa3d::cmb;
               _loc18_++;
               this.lightConst[_loc18_] = _loc21_.alternativa3d::cmc;
               _loc18_++;
               this.lightConst[_loc18_] = _loc21_.alternativa3d::cmd;
               _loc18_++;
               this.lightConst[_loc18_] = _loc21_.alternativa3d::cme;
               _loc18_++;
               this.lightConst[_loc18_] = _loc21_.alternativa3d::cmf;
               _loc18_++;
               this.lightConst[_loc18_] = _loc21_.alternativa3d::cmg;
               _loc18_++;
               this.lightConst[_loc18_] = _loc21_.alternativa3d::cmh;
               _loc18_++;
               this.lightConst[_loc18_] = _loc21_.alternativa3d::cmi;
               _loc18_++;
               this.lightConst[_loc18_] = _loc21_.alternativa3d::cmj;
               _loc18_++;
               this.lightConst[_loc18_] = _loc21_.alternativa3d::cmk;
               _loc18_++;
               this.lightConst[_loc18_] = _loc21_.alternativa3d::cml;
               _loc18_++;
               this.lightConst[_loc18_] = _loc21_.attenuationEnd;
               _loc18_++;
               this.lightConst[_loc18_] = 1 / (_loc21_.attenuationEnd - _loc21_.attenuationBegin);
               _loc18_++;
               this.lightConst[_loc18_] = _loc23_;
               _loc18_++;
               this.lightConst[_loc18_] = 1 / (_loc22_ - _loc23_);
               _loc18_++;
               this.lightConst[_loc18_] = _loc21_.intensity * param1.deferredLightingStrength * (_loc21_.color >> 16 & 0xFF) / 255;
               _loc18_++;
               this.lightConst[_loc18_] = _loc21_.intensity * param1.deferredLightingStrength * (_loc21_.color >> 8 & 0xFF) / 255;
               _loc18_++;
               this.lightConst[_loc18_] = _loc21_.intensity * param1.deferredLightingStrength * (_loc21_.color & 0xFF) / 255;
               _loc18_++;
               this.lightConst[_loc18_] = Math.sin(_loc21_.falloff * 0.5) * _loc21_.attenuationEnd;
               _loc18_++;
               _loc19_++;
               if(_loc19_ == limit5const || _loc10_ == param1.alternativa3d::spotsCount - 1)
               {
                  _loc25_.setProgramConstantsFromVector(Context3DProgramType.VERTEX,4,this.lightConst,_loc19_ * 5,false);
                  _loc25_.drawTriangles(this.lightIndexBuffer,0,_loc19_ * 6 * 2);
                  _loc19_ = 0;
                  _loc18_ = 0;
               }
               _loc10_++;
            }
            _loc25_.setProgram(this.getTubeProgram());
            _loc18_ = 0;
            _loc19_ = 0;
            _loc10_ = 0;
            while(_loc10_ < param1.alternativa3d::tubesCount)
            {
               _loc24_ = param1.alternativa3d::tubes[_loc10_];
               this.lightConst[_loc18_] = _loc24_.alternativa3d::cma;
               _loc18_++;
               this.lightConst[_loc18_] = _loc24_.alternativa3d::cmb;
               _loc18_++;
               this.lightConst[_loc18_] = _loc24_.alternativa3d::cmc;
               _loc18_++;
               this.lightConst[_loc18_] = _loc24_.alternativa3d::cmd;
               _loc18_++;
               this.lightConst[_loc18_] = _loc24_.alternativa3d::cme;
               _loc18_++;
               this.lightConst[_loc18_] = _loc24_.alternativa3d::cmf;
               _loc18_++;
               this.lightConst[_loc18_] = _loc24_.alternativa3d::cmg;
               _loc18_++;
               this.lightConst[_loc18_] = _loc24_.alternativa3d::cmh;
               _loc18_++;
               this.lightConst[_loc18_] = _loc24_.alternativa3d::cmi;
               _loc18_++;
               this.lightConst[_loc18_] = _loc24_.alternativa3d::cmj;
               _loc18_++;
               this.lightConst[_loc18_] = _loc24_.alternativa3d::cmk;
               _loc18_++;
               this.lightConst[_loc18_] = _loc24_.alternativa3d::cml;
               _loc18_++;
               this.lightConst[_loc18_] = _loc24_.attenuationEnd;
               _loc18_++;
               this.lightConst[_loc18_] = 1 / (_loc24_.attenuationEnd - _loc24_.attenuationBegin);
               _loc18_++;
               this.lightConst[_loc18_] = _loc24_.length * 0.5 + _loc24_.falloff;
               _loc18_++;
               this.lightConst[_loc18_] = 1 / _loc24_.falloff;
               _loc18_++;
               this.lightConst[_loc18_] = _loc24_.intensity * param1.deferredLightingStrength * (_loc24_.color >> 16 & 0xFF) / 255;
               _loc18_++;
               this.lightConst[_loc18_] = _loc24_.intensity * param1.deferredLightingStrength * (_loc24_.color >> 8 & 0xFF) / 255;
               _loc18_++;
               this.lightConst[_loc18_] = _loc24_.intensity * param1.deferredLightingStrength * (_loc24_.color & 0xFF) / 255;
               _loc18_++;
               this.lightConst[_loc18_] = _loc24_.length * 0.5;
               _loc18_++;
               _loc19_++;
               if(_loc19_ == limit5const || _loc10_ == param1.alternativa3d::tubesCount - 1)
               {
                  _loc25_.setProgramConstantsFromVector(Context3DProgramType.VERTEX,4,this.lightConst,_loc19_ * 5,false);
                  _loc25_.drawTriangles(this.lightIndexBuffer,0,_loc19_ * 6 * 2);
                  _loc19_ = 0;
                  _loc18_ = 0;
               }
               _loc10_++;
            }
            _loc25_.setBlendFactors(Context3DBlendFactor.ONE,Context3DBlendFactor.ZERO);
         }
         if(param5)
         {
            _loc25_.setRenderToTexture(this.temporaryBuffer,false);
            _loc25_.clear(0,0,0,0);
            _loc25_.setProgram(this.getSSAOProgram());
            _loc25_.setTextureAt(0,this.alternativa3d::depthBuffer);
            _loc25_.setTextureAt(1,this.noise);
            _loc25_.setVertexBufferAt(0,this.ssaoVertexBuffer,0,Context3DVertexBufferFormat.FLOAT_3);
            _loc25_.setVertexBufferAt(1,this.ssaoVertexBuffer,3,Context3DVertexBufferFormat.FLOAT_2);
            this.ssaoVertex[0] = _loc26_ / this.noiseSize;
            this.ssaoVertex[1] = _loc27_ / this.noiseSize;
            this.ssaoVertex[4] = 2 / this.alternativa3d::correctionX;
            this.ssaoVertex[5] = 2 / this.alternativa3d::correctionY;
            _loc25_.setProgramConstantsFromVector(Context3DProgramType.VERTEX,0,this.ssaoVertex,3,false);
            this.ssaoFragment[0] = param1.farClipping;
            this.ssaoFragment[1] = param1.farClipping / 255;
            this.ssaoFragment[4] = 2 / this.alternativa3d::correctionX;
            this.ssaoFragment[5] = 2 / this.alternativa3d::correctionY;
            this.ssaoFragment[6] = param1.ssaoRadius;
            this.ssaoFragment[8] = 1;
            this.ssaoFragment[9] = 1;
            this.ssaoFragment[10] = this.bias;
            this.ssaoFragment[11] = this.intensity * 1 / this.samples;
            this.ssaoFragment[12] = param1.alternativa3d::correctionX;
            this.ssaoFragment[13] = param1.alternativa3d::correctionY;
            this.ssaoFragment[15] = 1 / param1.ssaoRange;
            this.ssaoFragment[16] = Math.cos(this.noiseAngle);
            this.ssaoFragment[17] = Math.sin(this.noiseAngle);
            this.ssaoFragment[20] = -Math.sin(this.noiseAngle);
            this.ssaoFragment[21] = Math.cos(this.noiseAngle);
            this.ssaoFragment[24] = this.alternativa3d::correctionX - 1 / _loc26_;
            this.ssaoFragment[25] = this.alternativa3d::correctionY - 1 / _loc27_;
            _loc25_.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT,0,this.ssaoFragment,7,false);
            _loc25_.drawTriangles(this.ssaoIndexBuffer,0,2);
            _loc25_.setTextureAt(1,null);
            _loc25_.setRenderToTexture(this.alternativa3d::depthBuffer,false);
            _loc25_.clear(0,0,0,0);
            _loc25_.setProgram(this.getBlurProgram());
            _loc25_.setTextureAt(0,this.temporaryBuffer);
            this.blurFragment[0] = 1 / _loc26_;
            this.blurFragment[1] = 1 / _loc27_;
            this.blurFragment[3] = 1 / this.blurSamples;
            this.blurFragment[4] = this.alternativa3d::correctionX - 1 / _loc26_;
            this.blurFragment[5] = this.alternativa3d::correctionY - 1 / _loc27_;
            _loc25_.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT,0,this.blurFragment,2,false);
            _loc25_.drawTriangles(this.ssaoIndexBuffer,0,2);
         }
         _loc25_.setVertexBufferAt(1,null);
         _loc25_.setTextureAt(0,null);
         _loc25_.setScissorRectangle(null);
      }
      
      alternativa3d function resetResources() : void
      {
         this.noise.reset();
         this.table.reset();
         this.alternativa3d::depthBuffer.reset();
         this.temporaryBuffer.reset();
         this.alternativa3d::lightBuffer.reset();
         this.ssaoVertexBuffer.reset();
         this.ssaoIndexBuffer.reset();
         this.lightVertexBuffer.reset();
         this.lightIndexBuffer.reset();
      }
      
      private function getDepthProgram(param1:Boolean, param2:Boolean, param3:Boolean = false, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false) : ProgramResource
      {
         var _loc8_:ByteArray = null;
         var _loc9_:ByteArray = null;
         var _loc10_:* = int(param1) | int(param2) << 1 | int(param3) << 2 | int(param4) << 3 | int(param5) << 4 | int(param6) << 5 | int(param7) << 6;
         var _loc11_:ProgramResource = this.depthPrograms[_loc10_];
         if(_loc11_ == null)
         {
            _loc8_ = new DepthRendererDepthVertexShader(param1,param2).agalcode;
            _loc9_ = new DepthRendererDepthFragmentShader(param1,param2,param3,param4,param5).agalcode;
            _loc11_ = new ProgramResource(_loc8_,_loc9_);
            this.depthPrograms[_loc10_] = _loc11_;
         }
         return _loc11_;
      }
      
      private function getSSAOProgram() : ProgramResource
      {
         var _loc1_:ByteArray = null;
         var _loc2_:ByteArray = null;
         var _loc3_:ProgramResource = this.ssaoProgram;
         if(_loc3_ == null)
         {
            _loc1_ = new DepthRendererSSAOVertexShader().agalcode;
            _loc2_ = new DepthRendererSSAOFragmentShader(this.samples).agalcode;
            _loc3_ = new ProgramResource(_loc1_,_loc2_);
            this.ssaoProgram = _loc3_;
         }
         return _loc3_;
      }
      
      private function getBlurProgram() : ProgramResource
      {
         var _loc1_:ByteArray = null;
         var _loc2_:ByteArray = null;
         var _loc3_:ProgramResource = this.blurProgram;
         if(_loc3_ == null)
         {
            _loc1_ = new DepthRendererBlurVertexShader().agalcode;
            _loc2_ = new DepthRendererBlurFragmentShader().agalcode;
            _loc3_ = new ProgramResource(_loc1_,_loc2_);
            this.blurProgram = _loc3_;
         }
         return _loc3_;
      }
      
      private function getOmniProgram() : ProgramResource
      {
         var _loc1_:ByteArray = null;
         var _loc2_:ByteArray = null;
         var _loc3_:ProgramResource = this.omniProgram;
         if(_loc3_ == null)
         {
            _loc1_ = new DepthRendererLightVertexShader(0).agalcode;
            _loc2_ = new DepthRendererLightFragmentShader(0).agalcode;
            _loc3_ = new ProgramResource(_loc1_,_loc2_);
            this.omniProgram = _loc3_;
         }
         return _loc3_;
      }
      
      private function getSpotProgram() : ProgramResource
      {
         var _loc1_:ByteArray = null;
         var _loc2_:ByteArray = null;
         var _loc3_:ProgramResource = this.spotProgram;
         if(_loc3_ == null)
         {
            _loc1_ = new DepthRendererLightVertexShader(1).agalcode;
            _loc2_ = new DepthRendererLightFragmentShader(1).agalcode;
            _loc3_ = new ProgramResource(_loc1_,_loc2_);
            this.spotProgram = _loc3_;
         }
         return _loc3_;
      }
      
      private function getTubeProgram() : ProgramResource
      {
         var _loc1_:ByteArray = null;
         var _loc2_:ByteArray = null;
         var _loc3_:ProgramResource = this.tubeProgram;
         if(_loc3_ == null)
         {
            _loc1_ = new DepthRendererLightVertexShader(2).agalcode;
            _loc2_ = new DepthRendererLightFragmentShader(2).agalcode;
            _loc3_ = new ProgramResource(_loc1_,_loc2_);
            this.tubeProgram = _loc3_;
         }
         return _loc3_;
      }
   }
}

