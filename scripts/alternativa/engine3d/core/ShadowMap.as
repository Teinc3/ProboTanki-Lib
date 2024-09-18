package alternativa.engine3d.core
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.lights.DirectionalLight;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.BSP;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.gfx.core.BitmapTextureResource;
   import alternativa.gfx.core.Device;
   import alternativa.gfx.core.IndexBufferResource;
   import alternativa.gfx.core.ProgramResource;
   import alternativa.gfx.core.RenderTargetTextureResource;
   import alternativa.gfx.core.VertexBufferResource;
   import flash.display.BitmapData;
   import flash.display3D.Context3DProgramType;
   import flash.display3D.Context3DVertexBufferFormat;
   import flash.geom.Rectangle;
   import flash.utils.ByteArray;
   
   use namespace alternativa3d;
   
   public class ShadowMap
   {
      private static const sizeLimit:int = 2048;
      
      private static const bigValue:Number = 2048;
      
      public static const numSamples:int = 6;
      
      private var programs:Array;
      
      private var spriteVertexBuffer:VertexBufferResource;
      
      private var spriteIndexBuffer:IndexBufferResource;
      
      alternativa3d var transform:Vector.<Number>;
      
      alternativa3d var params:Vector.<Number>;
      
      private var coords:Vector.<Number>;
      
      private var fragment:Vector.<Number>;
      
      private var alphaTestConst:Vector.<Number>;
      
      private var scissor:Rectangle;
      
      alternativa3d var map:RenderTargetTextureResource;
      
      alternativa3d var noise:BitmapTextureResource;
      
      private var noiseSize:int = 2;
      
      private var noiseAngle:Number = 1.0471975511965976;
      
      private var noiseRadius:Number = 1.3;
      
      private var noiseRandom:Number = 0.3;
      
      public var mapSize:int;
      
      public var nearDistance:Number;
      
      public var farDistance:Number;
      
      public var bias:Number = 0;
      
      public var biasMultiplier:Number = 30;
      
      public var additionalSpace:Number = 0;
      
      public var alphaThreshold:Number = 0.1;
      
      private var defaultLight:DirectionalLight;
      
      private var boundVertexList:Vertex;
      
      private var light:DirectionalLight;
      
      private var dirZ:Number;
      
      private var planeX:Number;
      
      private var planeY:Number;
      
      private var planeSize:Number;
      
      private var pixel:Number;
      
      alternativa3d var boundMinX:Number;
      
      alternativa3d var boundMinY:Number;
      
      alternativa3d var boundMinZ:Number;
      
      alternativa3d var boundMaxX:Number;
      
      alternativa3d var boundMaxY:Number;
      
      alternativa3d var boundMaxZ:Number;
      
      public function ShadowMap(param1:int, param2:Number, param3:Number, param4:Number = 0, param5:Number = 0)
      {
         var _loc6_:int = 0;
         var _loc7_:Number = NaN;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         this.programs = new Array();
         this.spriteVertexBuffer = new VertexBufferResource(Vector.<Number>([0,2,4,6]),1);
         this.spriteIndexBuffer = new IndexBufferResource(Vector.<uint>([0,1,3,1,2,3]));
         this.alternativa3d::transform = Vector.<Number>([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1]);
         this.alternativa3d::params = Vector.<Number>([-255 * bigValue,-bigValue,bigValue,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1]);
         this.coords = Vector.<Number>([0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,1 / 255,1]);
         this.fragment = Vector.<Number>([1 / 255,0,1,1]);
         this.alphaTestConst = Vector.<Number>([0,0,0,1]);
         this.scissor = new Rectangle();
         this.defaultLight = new DirectionalLight(8355711);
         this.boundVertexList = Vertex.alternativa3d::createList(8);
         super();
         if(param1 > sizeLimit)
         {
            throw new Error("Value of mapSize too big.");
         }
         var _loc11_:Number = Math.log(param1) / Math.LN2;
         if(_loc11_ != int(_loc11_))
         {
            throw new Error("Value of mapSize must be power of 2.");
         }
         this.mapSize = param1;
         this.nearDistance = param2;
         this.farDistance = param3;
         this.bias = param4;
         this.additionalSpace = param5;
         this.defaultLight.rotationX = Math.PI;
         this.alternativa3d::map = new RenderTargetTextureResource(param1,param1);
         var _loc12_:Vector.<uint> = new Vector.<uint>();
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         while(_loc14_ < this.noiseSize)
         {
            _loc6_ = 0;
            while(_loc6_ < this.noiseSize)
            {
               _loc7_ = Math.random() * this.noiseAngle;
               _loc8_ = Math.sin(_loc7_) * 255;
               _loc9_ = Math.cos(_loc7_) * 255;
               _loc10_ = (this.noiseRandom + Math.random() * (1 - this.noiseRandom)) * 255;
               _loc12_[_loc13_] = _loc8_ << 16 | _loc9_ << 8 | _loc10_;
               _loc13_++;
               _loc6_++;
            }
            _loc14_++;
         }
         this.alternativa3d::noise = new BitmapTextureResource(new BitmapData(this.noiseSize,this.noiseSize,false,0),false);
         this.alternativa3d::noise.bitmapData.setVector(this.alternativa3d::noise.bitmapData.rect,_loc12_);
      }
      
      alternativa3d function calculateBounds(param1:Camera3D) : void
      {
         if(param1.directionalLight != null)
         {
            this.light = param1.directionalLight;
         }
         else
         {
            this.light = this.defaultLight;
         }
         this.light.alternativa3d::composeMatrix();
         this.dirZ = this.light.alternativa3d::mk;
         this.light.alternativa3d::calculateInverseMatrix();
         var _loc2_:Number = Number(this.light.alternativa3d::ima);
         var _loc3_:Number = Number(this.light.alternativa3d::imb);
         var _loc4_:Number = Number(this.light.alternativa3d::imc);
         var _loc5_:Number = Number(this.light.alternativa3d::imd);
         var _loc6_:Number = Number(this.light.alternativa3d::ime);
         var _loc7_:Number = Number(this.light.alternativa3d::imf);
         var _loc8_:Number = Number(this.light.alternativa3d::img);
         var _loc9_:Number = Number(this.light.alternativa3d::imh);
         var _loc10_:Number = Number(this.light.alternativa3d::imi);
         var _loc11_:Number = Number(this.light.alternativa3d::imj);
         var _loc12_:Number = Number(this.light.alternativa3d::imk);
         var _loc13_:Number = Number(this.light.alternativa3d::iml);
         this.light.alternativa3d::ima = _loc2_ * param1.alternativa3d::gma + _loc3_ * param1.alternativa3d::gme + _loc4_ * param1.alternativa3d::gmi;
         this.light.alternativa3d::imb = _loc2_ * param1.alternativa3d::gmb + _loc3_ * param1.alternativa3d::gmf + _loc4_ * param1.alternativa3d::gmj;
         this.light.alternativa3d::imc = _loc2_ * param1.alternativa3d::gmc + _loc3_ * param1.alternativa3d::gmg + _loc4_ * param1.alternativa3d::gmk;
         this.light.alternativa3d::imd = _loc2_ * param1.alternativa3d::gmd + _loc3_ * param1.alternativa3d::gmh + _loc4_ * param1.alternativa3d::gml + _loc5_;
         this.light.alternativa3d::ime = _loc6_ * param1.alternativa3d::gma + _loc7_ * param1.alternativa3d::gme + _loc8_ * param1.alternativa3d::gmi;
         this.light.alternativa3d::imf = _loc6_ * param1.alternativa3d::gmb + _loc7_ * param1.alternativa3d::gmf + _loc8_ * param1.alternativa3d::gmj;
         this.light.alternativa3d::img = _loc6_ * param1.alternativa3d::gmc + _loc7_ * param1.alternativa3d::gmg + _loc8_ * param1.alternativa3d::gmk;
         this.light.alternativa3d::imh = _loc6_ * param1.alternativa3d::gmd + _loc7_ * param1.alternativa3d::gmh + _loc8_ * param1.alternativa3d::gml + _loc9_;
         this.light.alternativa3d::imi = _loc10_ * param1.alternativa3d::gma + _loc11_ * param1.alternativa3d::gme + _loc12_ * param1.alternativa3d::gmi;
         this.light.alternativa3d::imj = _loc10_ * param1.alternativa3d::gmb + _loc11_ * param1.alternativa3d::gmf + _loc12_ * param1.alternativa3d::gmj;
         this.light.alternativa3d::imk = _loc10_ * param1.alternativa3d::gmc + _loc11_ * param1.alternativa3d::gmg + _loc12_ * param1.alternativa3d::gmk;
         this.light.alternativa3d::iml = _loc10_ * param1.alternativa3d::gmd + _loc11_ * param1.alternativa3d::gmh + _loc12_ * param1.alternativa3d::gml + _loc13_;
         var _loc14_:Vertex;
         (_loc14_ = this.boundVertexList).x = -param1.nearClipping;
         _loc14_.y = -param1.nearClipping;
         _loc14_.z = param1.nearClipping;
         (_loc14_ = _loc14_.alternativa3d::next).x = -param1.nearClipping;
         _loc14_.y = param1.nearClipping;
         _loc14_.z = param1.nearClipping;
         (_loc14_ = _loc14_.alternativa3d::next).x = param1.nearClipping;
         _loc14_.y = param1.nearClipping;
         _loc14_.z = param1.nearClipping;
         (_loc14_ = _loc14_.alternativa3d::next).x = param1.nearClipping;
         _loc14_.y = -param1.nearClipping;
         _loc14_.z = param1.nearClipping;
         (_loc14_ = _loc14_.alternativa3d::next).x = -this.farDistance;
         _loc14_.y = -this.farDistance;
         _loc14_.z = this.farDistance;
         (_loc14_ = _loc14_.alternativa3d::next).x = -this.farDistance;
         _loc14_.y = this.farDistance;
         _loc14_.z = this.farDistance;
         (_loc14_ = _loc14_.alternativa3d::next).x = this.farDistance;
         _loc14_.y = this.farDistance;
         _loc14_.z = this.farDistance;
         (_loc14_ = _loc14_.alternativa3d::next).x = this.farDistance;
         _loc14_.y = -this.farDistance;
         _loc14_.z = this.farDistance;
         this.light.boundMinX = 1e+22;
         this.light.boundMinY = 1e+22;
         this.light.boundMinZ = 1e+22;
         this.light.boundMaxX = -1e+22;
         this.light.boundMaxY = -1e+22;
         this.light.boundMaxZ = -1e+22;
         _loc14_ = this.boundVertexList;
         while(_loc14_ != null)
         {
            _loc14_.alternativa3d::cameraX = this.light.alternativa3d::ima * _loc14_.x + this.light.alternativa3d::imb * _loc14_.y + this.light.alternativa3d::imc * _loc14_.z + this.light.alternativa3d::imd;
            _loc14_.alternativa3d::cameraY = this.light.alternativa3d::ime * _loc14_.x + this.light.alternativa3d::imf * _loc14_.y + this.light.alternativa3d::img * _loc14_.z + this.light.alternativa3d::imh;
            _loc14_.alternativa3d::cameraZ = this.light.alternativa3d::imi * _loc14_.x + this.light.alternativa3d::imj * _loc14_.y + this.light.alternativa3d::imk * _loc14_.z + this.light.alternativa3d::iml;
            if(_loc14_.alternativa3d::cameraX < this.light.boundMinX)
            {
               this.light.boundMinX = _loc14_.alternativa3d::cameraX;
            }
            if(_loc14_.alternativa3d::cameraX > this.light.boundMaxX)
            {
               this.light.boundMaxX = _loc14_.alternativa3d::cameraX;
            }
            if(_loc14_.alternativa3d::cameraY < this.light.boundMinY)
            {
               this.light.boundMinY = _loc14_.alternativa3d::cameraY;
            }
            if(_loc14_.alternativa3d::cameraY > this.light.boundMaxY)
            {
               this.light.boundMaxY = _loc14_.alternativa3d::cameraY;
            }
            if(_loc14_.alternativa3d::cameraZ < this.light.boundMinZ)
            {
               this.light.boundMinZ = _loc14_.alternativa3d::cameraZ;
            }
            if(_loc14_.alternativa3d::cameraZ > this.light.boundMaxZ)
            {
               this.light.boundMaxZ = _loc14_.alternativa3d::cameraZ;
            }
            _loc14_ = _loc14_.alternativa3d::next;
         }
         var _loc15_:Vertex = this.boundVertexList;
         var _loc16_:Vertex = this.boundVertexList.alternativa3d::next.alternativa3d::next.alternativa3d::next.alternativa3d::next.alternativa3d::next.alternativa3d::next;
         var _loc17_:Vertex = this.boundVertexList.alternativa3d::next.alternativa3d::next.alternativa3d::next.alternativa3d::next;
         var _loc18_:Number = _loc16_.alternativa3d::cameraX - _loc15_.alternativa3d::cameraX;
         var _loc19_:Number = _loc16_.alternativa3d::cameraY - _loc15_.alternativa3d::cameraY;
         var _loc20_:Number = _loc16_.alternativa3d::cameraZ - _loc15_.alternativa3d::cameraZ;
         var _loc21_:Number = _loc17_.alternativa3d::cameraX - _loc16_.alternativa3d::cameraX;
         var _loc22_:Number = _loc17_.alternativa3d::cameraY - _loc16_.alternativa3d::cameraY;
         var _loc23_:Number = _loc17_.alternativa3d::cameraZ - _loc16_.alternativa3d::cameraZ;
         var _loc24_:Number = _loc18_ * _loc18_ + _loc19_ * _loc19_ + _loc20_ * _loc20_;
         var _loc25_:Number = _loc21_ * _loc21_ + _loc22_ * _loc22_ + _loc23_ * _loc23_;
         var _loc26_:int = Math.ceil(this.noiseRadius);
         this.planeSize = _loc24_ > _loc25_ ? Number(Math.sqrt(_loc24_)) : Number(Math.sqrt(_loc25_));
         this.pixel = this.planeSize / (this.mapSize - 1 - this.noiseRadius);
         this.planeSize += _loc26_ * this.pixel * 2;
         this.light.boundMinX -= _loc26_ * this.pixel;
         this.light.boundMaxX += _loc26_ * this.pixel;
         this.light.boundMinY -= _loc26_ * this.pixel;
         this.light.boundMaxY += _loc26_ * this.pixel;
         this.light.boundMinZ -= this.additionalSpace;
         (_loc14_ = this.boundVertexList).x = this.light.boundMinX;
         _loc14_.y = this.light.boundMinY;
         _loc14_.z = this.light.boundMinZ;
         (_loc14_ = _loc14_.alternativa3d::next).x = this.light.boundMaxX;
         _loc14_.y = this.light.boundMinY;
         _loc14_.z = this.light.boundMinZ;
         (_loc14_ = _loc14_.alternativa3d::next).x = this.light.boundMinX;
         _loc14_.y = this.light.boundMaxY;
         _loc14_.z = this.light.boundMinZ;
         (_loc14_ = _loc14_.alternativa3d::next).x = this.light.boundMaxX;
         _loc14_.y = this.light.boundMaxY;
         _loc14_.z = this.light.boundMinZ;
         (_loc14_ = _loc14_.alternativa3d::next).x = this.light.boundMinX;
         _loc14_.y = this.light.boundMinY;
         _loc14_.z = this.light.boundMaxZ;
         (_loc14_ = _loc14_.alternativa3d::next).x = this.light.boundMaxX;
         _loc14_.y = this.light.boundMinY;
         _loc14_.z = this.light.boundMaxZ;
         (_loc14_ = _loc14_.alternativa3d::next).x = this.light.boundMinX;
         _loc14_.y = this.light.boundMaxY;
         _loc14_.z = this.light.boundMaxZ;
         (_loc14_ = _loc14_.alternativa3d::next).x = this.light.boundMaxX;
         _loc14_.y = this.light.boundMaxY;
         _loc14_.z = this.light.boundMaxZ;
         this.alternativa3d::boundMinX = 1e+22;
         this.alternativa3d::boundMinY = 1e+22;
         this.alternativa3d::boundMinZ = 1e+22;
         this.alternativa3d::boundMaxX = -1e+22;
         this.alternativa3d::boundMaxY = -1e+22;
         this.alternativa3d::boundMaxZ = -1e+22;
         _loc14_ = this.boundVertexList;
         while(_loc14_ != null)
         {
            _loc14_.alternativa3d::cameraX = this.light.alternativa3d::ma * _loc14_.x + this.light.alternativa3d::mb * _loc14_.y + this.light.alternativa3d::mc * _loc14_.z + this.light.alternativa3d::md;
            _loc14_.alternativa3d::cameraY = this.light.alternativa3d::me * _loc14_.x + this.light.alternativa3d::mf * _loc14_.y + this.light.alternativa3d::mg * _loc14_.z + this.light.alternativa3d::mh;
            _loc14_.alternativa3d::cameraZ = this.light.alternativa3d::mi * _loc14_.x + this.light.alternativa3d::mj * _loc14_.y + this.light.alternativa3d::mk * _loc14_.z + this.light.alternativa3d::ml;
            if(_loc14_.alternativa3d::cameraX < this.alternativa3d::boundMinX)
            {
               this.alternativa3d::boundMinX = _loc14_.alternativa3d::cameraX;
            }
            if(_loc14_.alternativa3d::cameraX > this.alternativa3d::boundMaxX)
            {
               this.alternativa3d::boundMaxX = _loc14_.alternativa3d::cameraX;
            }
            if(_loc14_.alternativa3d::cameraY < this.alternativa3d::boundMinY)
            {
               this.alternativa3d::boundMinY = _loc14_.alternativa3d::cameraY;
            }
            if(_loc14_.alternativa3d::cameraY > this.alternativa3d::boundMaxY)
            {
               this.alternativa3d::boundMaxY = _loc14_.alternativa3d::cameraY;
            }
            if(_loc14_.alternativa3d::cameraZ < this.alternativa3d::boundMinZ)
            {
               this.alternativa3d::boundMinZ = _loc14_.alternativa3d::cameraZ;
            }
            if(_loc14_.alternativa3d::cameraZ > this.alternativa3d::boundMaxZ)
            {
               this.alternativa3d::boundMaxZ = _loc14_.alternativa3d::cameraZ;
            }
            _loc14_ = _loc14_.alternativa3d::next;
         }
      }
      
      alternativa3d function render(param1:Camera3D, param2:Vector.<Object3D>, param3:int) : void
      {
         var _loc4_:Object3D = null;
         var _loc5_:VertexBufferResource = null;
         var _loc6_:IndexBufferResource = null;
         var _loc7_:int = 0;
         var _loc8_:Boolean = false;
         var _loc9_:TextureMaterial = null;
         var _loc10_:Sprite3D = null;
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
         var _loc23_:Number = NaN;
         var _loc24_:Number = NaN;
         var _loc25_:Mesh = null;
         var _loc26_:BSP = null;
         var _loc27_:Device = param1.alternativa3d::device;
         this.planeX = Math.floor(this.light.boundMinX / this.pixel) * this.pixel;
         this.planeY = Math.floor(this.light.boundMinY / this.pixel) * this.pixel;
         this.scissor.width = Math.ceil(this.light.boundMaxX / this.pixel) - this.planeX / this.pixel;
         this.scissor.height = Math.ceil(this.light.boundMaxY / this.pixel) - this.planeY / this.pixel;
         var _loc28_:Number = 2 / this.planeSize;
         var _loc29_:Number = -2 / this.planeSize;
         var _loc30_:Number = 255 / (this.light.boundMaxZ - this.light.boundMinZ);
         var _loc31_:Number = -(this.planeX + this.planeSize * 0.5) * _loc28_;
         var _loc32_:Number = -(this.planeY + this.planeSize * 0.5) * _loc29_;
         var _loc33_:Number = -this.light.boundMinZ * _loc30_;
         if(this.mapSize != this.alternativa3d::map.width)
         {
            this.alternativa3d::map.dispose();
            this.alternativa3d::map = new RenderTargetTextureResource(this.mapSize,this.mapSize);
         }
         _loc27_.setRenderToTexture(this.alternativa3d::map,true);
         _loc27_.clear(1,0,0);
         _loc27_.setScissorRectangle(this.scissor);
         this.alternativa3d::transform[14] = 1 / 255;
         var _loc34_:int = 0;
         while(_loc34_ < param3)
         {
            _loc4_ = param2[_loc34_];
            _loc5_ = null;
            _loc6_ = null;
            _loc8_ = false;
            if(_loc4_ is Sprite3D)
            {
               _loc10_ = Sprite3D(_loc4_);
               _loc9_ = TextureMaterial(_loc10_.material);
               _loc11_ = _loc10_.width;
               _loc12_ = _loc10_.height;
               if(_loc10_.autoSize)
               {
                  _loc23_ = _loc10_.bottomRightU - _loc10_.topLeftU;
                  _loc24_ = _loc10_.bottomRightV - _loc10_.topLeftV;
                  _loc11_ = _loc9_.texture.width * _loc23_;
                  _loc12_ = _loc9_.texture.height * _loc24_;
               }
               _loc13_ = Math.tan(Math.asin(-this.dirZ));
               _loc11_ *= _loc10_.scaleX;
               _loc12_ *= _loc10_.scaleY;
               _loc14_ = this.light.alternativa3d::ima * _loc4_.alternativa3d::md + this.light.alternativa3d::imb * _loc4_.alternativa3d::mh + this.light.alternativa3d::imc * _loc4_.alternativa3d::ml + this.light.alternativa3d::imd;
               _loc15_ = this.light.alternativa3d::ime * _loc4_.alternativa3d::md + this.light.alternativa3d::imf * _loc4_.alternativa3d::mh + this.light.alternativa3d::img * _loc4_.alternativa3d::ml + this.light.alternativa3d::imh;
               _loc16_ = this.light.alternativa3d::imi * _loc4_.alternativa3d::md + this.light.alternativa3d::imj * _loc4_.alternativa3d::mh + this.light.alternativa3d::imk * _loc4_.alternativa3d::ml + this.light.alternativa3d::iml;
               _loc15_ += Math.sin(-this.dirZ) * _loc12_ / 4;
               _loc16_ -= Math.cos(-this.dirZ) * _loc12_ / 4;
               _loc17_ = -_loc11_ * _loc10_.originX;
               _loc18_ = -_loc12_ * _loc10_.originY;
               _loc19_ = -_loc18_ / _loc13_;
               _loc20_ = _loc17_ + _loc11_;
               _loc21_ = _loc18_ + _loc12_;
               _loc22_ = -_loc21_ / _loc13_;
               _loc17_ = (_loc17_ + _loc14_) * _loc28_ + _loc31_;
               _loc18_ = (_loc18_ + _loc15_) * _loc29_ + _loc32_;
               _loc19_ = (_loc19_ + _loc16_) * _loc30_ + _loc33_;
               _loc20_ = (_loc20_ + _loc14_) * _loc28_ + _loc31_;
               _loc21_ = (_loc21_ + _loc15_) * _loc29_ + _loc32_;
               _loc22_ = (_loc22_ + _loc16_) * _loc30_ + _loc33_;
               _loc19_ -= this.bias * this.biasMultiplier * _loc30_ / _loc13_;
               _loc22_ -= this.bias * this.biasMultiplier * _loc30_ / _loc13_;
               this.coords[0] = _loc17_;
               this.coords[1] = _loc18_;
               this.coords[2] = _loc19_;
               this.coords[4] = 0;
               this.coords[5] = 0;
               this.coords[8] = _loc17_;
               this.coords[9] = _loc21_;
               this.coords[10] = _loc22_;
               this.coords[12] = 0;
               this.coords[13] = 1;
               this.coords[16] = _loc20_;
               this.coords[17] = _loc21_;
               this.coords[18] = _loc22_;
               this.coords[20] = 1;
               this.coords[21] = 1;
               this.coords[24] = _loc20_;
               this.coords[25] = _loc18_;
               this.coords[26] = _loc19_;
               this.coords[28] = 1;
               this.coords[29] = 0;
               _loc5_ = this.spriteVertexBuffer;
               _loc6_ = this.spriteIndexBuffer;
               _loc7_ = 2;
               _loc8_ = true;
               _loc27_.setProgram(this.getProgram(true,true));
               _loc27_.setVertexBufferAt(0,_loc5_,0,Context3DVertexBufferFormat.FLOAT_1);
               _loc27_.setProgramConstantsFromVector(Context3DProgramType.VERTEX,0,this.coords,9,false);
            }
            else
            {
               this.alternativa3d::transform[0] = (this.light.alternativa3d::ima * _loc4_.alternativa3d::ma + this.light.alternativa3d::imb * _loc4_.alternativa3d::me + this.light.alternativa3d::imc * _loc4_.alternativa3d::mi) * _loc28_;
               this.alternativa3d::transform[1] = (this.light.alternativa3d::ima * _loc4_.alternativa3d::mb + this.light.alternativa3d::imb * _loc4_.alternativa3d::mf + this.light.alternativa3d::imc * _loc4_.alternativa3d::mj) * _loc28_;
               this.alternativa3d::transform[2] = (this.light.alternativa3d::ima * _loc4_.alternativa3d::mc + this.light.alternativa3d::imb * _loc4_.alternativa3d::mg + this.light.alternativa3d::imc * _loc4_.alternativa3d::mk) * _loc28_;
               this.alternativa3d::transform[3] = (this.light.alternativa3d::ima * _loc4_.alternativa3d::md + this.light.alternativa3d::imb * _loc4_.alternativa3d::mh + this.light.alternativa3d::imc * _loc4_.alternativa3d::ml + this.light.alternativa3d::imd) * _loc28_ + _loc31_;
               this.alternativa3d::transform[4] = (this.light.alternativa3d::ime * _loc4_.alternativa3d::ma + this.light.alternativa3d::imf * _loc4_.alternativa3d::me + this.light.alternativa3d::img * _loc4_.alternativa3d::mi) * _loc29_;
               this.alternativa3d::transform[5] = (this.light.alternativa3d::ime * _loc4_.alternativa3d::mb + this.light.alternativa3d::imf * _loc4_.alternativa3d::mf + this.light.alternativa3d::img * _loc4_.alternativa3d::mj) * _loc29_;
               this.alternativa3d::transform[6] = (this.light.alternativa3d::ime * _loc4_.alternativa3d::mc + this.light.alternativa3d::imf * _loc4_.alternativa3d::mg + this.light.alternativa3d::img * _loc4_.alternativa3d::mk) * _loc29_;
               this.alternativa3d::transform[7] = (this.light.alternativa3d::ime * _loc4_.alternativa3d::md + this.light.alternativa3d::imf * _loc4_.alternativa3d::mh + this.light.alternativa3d::img * _loc4_.alternativa3d::ml + this.light.alternativa3d::imh) * _loc29_ + _loc32_;
               this.alternativa3d::transform[8] = (this.light.alternativa3d::imi * _loc4_.alternativa3d::ma + this.light.alternativa3d::imj * _loc4_.alternativa3d::me + this.light.alternativa3d::imk * _loc4_.alternativa3d::mi) * _loc30_;
               this.alternativa3d::transform[9] = (this.light.alternativa3d::imi * _loc4_.alternativa3d::mb + this.light.alternativa3d::imj * _loc4_.alternativa3d::mf + this.light.alternativa3d::imk * _loc4_.alternativa3d::mj) * _loc30_;
               this.alternativa3d::transform[10] = (this.light.alternativa3d::imi * _loc4_.alternativa3d::mc + this.light.alternativa3d::imj * _loc4_.alternativa3d::mg + this.light.alternativa3d::imk * _loc4_.alternativa3d::mk) * _loc30_;
               this.alternativa3d::transform[11] = (this.light.alternativa3d::imi * _loc4_.alternativa3d::md + this.light.alternativa3d::imj * _loc4_.alternativa3d::mh + this.light.alternativa3d::imk * _loc4_.alternativa3d::ml + this.light.alternativa3d::iml) * _loc30_ + _loc33_;
               if(_loc4_ is Mesh)
               {
                  _loc25_ = Mesh(_loc4_);
                  _loc25_.alternativa3d::prepareResources();
                  _loc5_ = _loc25_.alternativa3d::vertexBuffer;
                  _loc6_ = _loc25_.alternativa3d::indexBuffer;
                  _loc7_ = _loc25_.alternativa3d::numTriangles;
                  _loc9_ = _loc25_.alternativa3d::faceList.material as TextureMaterial;
               }
               else if(_loc4_ is BSP)
               {
                  _loc26_ = BSP(_loc4_);
                  _loc26_.alternativa3d::prepareResources();
                  _loc5_ = _loc26_.alternativa3d::vertexBuffer;
                  _loc6_ = _loc26_.alternativa3d::indexBuffer;
                  _loc7_ = _loc26_.alternativa3d::numTriangles;
                  _loc9_ = _loc26_.alternativa3d::faces[0].material as TextureMaterial;
               }
               else
               {
                  _loc9_ = null;
               }
               if(_loc9_ != null && _loc9_.alternativa3d::transparent)
               {
                  _loc8_ = true;
                  _loc27_.setProgram(this.getProgram(true,false));
                  _loc27_.setVertexBufferAt(1,_loc5_,3,Context3DVertexBufferFormat.FLOAT_2);
               }
               else
               {
                  _loc27_.setProgram(this.getProgram(false,false));
               }
               _loc27_.setVertexBufferAt(0,_loc5_,0,Context3DVertexBufferFormat.FLOAT_3);
               _loc27_.setProgramConstantsFromVector(Context3DProgramType.VERTEX,0,this.alternativa3d::transform,4,false);
            }
            if(_loc5_ != null && _loc6_ != null)
            {
               _loc27_.setTextureAt(4,null);
               _loc27_.setTextureAt(6,null);
               if(_loc8_)
               {
                  _loc27_.setTextureAt(0,_loc9_.alternativa3d::textureResource);
                  this.alphaTestConst[0] = _loc9_.alternativa3d::textureResource.correctionU;
                  this.alphaTestConst[1] = _loc9_.alternativa3d::textureResource.correctionV;
                  this.alphaTestConst[3] = _loc4_ is Sprite3D ? Number(0.99) : Number(this.alphaThreshold);
                  _loc27_.setProgramConstantsFromVector(Context3DProgramType.VERTEX,10,this.alphaTestConst,1);
               }
               _loc27_.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT,0,this.fragment,1);
               _loc27_.drawTriangles(_loc6_,0,_loc7_);
            }
            if(_loc8_)
            {
               _loc27_.setTextureAt(0,null);
               _loc27_.setVertexBufferAt(1,null);
            }
            _loc34_++;
         }
         _loc27_.setScissorRectangle(null);
         _loc28_ = 1 / this.planeSize;
         _loc29_ = 1 / this.planeSize;
         _loc31_ = -this.planeX * _loc28_;
         _loc32_ = -this.planeY * _loc29_;
         this.alternativa3d::transform[0] = this.light.alternativa3d::ima * _loc28_;
         this.alternativa3d::transform[1] = this.light.alternativa3d::imb * _loc28_;
         this.alternativa3d::transform[2] = this.light.alternativa3d::imc * _loc28_;
         this.alternativa3d::transform[3] = this.light.alternativa3d::imd * _loc28_ + _loc31_;
         this.alternativa3d::transform[4] = this.light.alternativa3d::ime * _loc29_;
         this.alternativa3d::transform[5] = this.light.alternativa3d::imf * _loc29_;
         this.alternativa3d::transform[6] = this.light.alternativa3d::img * _loc29_;
         this.alternativa3d::transform[7] = this.light.alternativa3d::imh * _loc29_ + _loc32_;
         this.alternativa3d::transform[8] = this.light.alternativa3d::imi * _loc30_;
         this.alternativa3d::transform[9] = this.light.alternativa3d::imj * _loc30_;
         this.alternativa3d::transform[10] = this.light.alternativa3d::imk * _loc30_;
         this.alternativa3d::transform[11] = this.light.alternativa3d::iml * _loc30_ + _loc33_ - this.bias * this.biasMultiplier * _loc30_;
         this.alternativa3d::transform[12] = this.nearDistance;
         this.alternativa3d::transform[13] = this.farDistance - this.nearDistance;
         this.alternativa3d::transform[14] = -_loc30_;
         this.alternativa3d::params[4] = 0;
         this.alternativa3d::params[5] = 0;
         this.alternativa3d::params[6] = this.noiseRadius / this.mapSize;
         this.alternativa3d::params[7] = 1 / numSamples;
         this.alternativa3d::params[8] = param1.view.alternativa3d::_width / this.noiseSize;
         this.alternativa3d::params[9] = param1.view.alternativa3d::_height / this.noiseSize;
         this.alternativa3d::params[11] = param1.directionalLight != null ? Number(param1.directionalLightStrength * param1.shadowMapStrength) : Number(0);
         this.alternativa3d::params[12] = Math.cos(this.noiseAngle);
         this.alternativa3d::params[13] = Math.sin(this.noiseAngle);
         this.alternativa3d::params[16] = -Math.sin(this.noiseAngle);
         this.alternativa3d::params[17] = Math.cos(this.noiseAngle);
      }
      
      public function dispose() : void
      {
         this.alternativa3d::map.reset();
         this.alternativa3d::noise.reset();
      }
      
      private function getProgram(param1:Boolean, param2:Boolean) : ProgramResource
      {
         var _loc3_:ByteArray = null;
         var _loc4_:ByteArray = null;
         var _loc5_:* = int(param1) | int(param2) << 1;
         var _loc6_:ProgramResource = this.programs[_loc5_];
         if(_loc6_ == null)
         {
            _loc3_ = new ShadowMapVertexShader(param1,param2).agalcode;
            _loc4_ = new ShadowMapFragmentShader(param1).agalcode;
            _loc6_ = new ProgramResource(_loc3_,_loc4_);
            this.programs[_loc5_] = _loc6_;
         }
         return _loc6_;
      }
   }
}

