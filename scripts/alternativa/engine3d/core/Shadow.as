package alternativa.engine3d.core
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.lights.DirectionalLight;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.gfx.agal.FragmentShader;
   import alternativa.gfx.agal.Shader;
   import alternativa.gfx.core.Device;
   import alternativa.gfx.core.IndexBufferResource;
   import alternativa.gfx.core.ProgramResource;
   import alternativa.gfx.core.TextureResource;
   import alternativa.gfx.core.VertexBufferResource;
   import flash.display3D.Context3DProgramType;
   import flash.display3D.Context3DVertexBufferFormat;
   import flash.geom.Vector3D;
   import flash.utils.ByteArray;
   
   use namespace alternativa3d;
   
   public class Shadow
   {
      private static var casterProgram:ProgramResource;
      
      private static var volumeProgram:ProgramResource;
      
      private static var casterConst:Vector.<Number> = Vector.<Number>([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0]);
      
      private static var volumeVertexBuffer:VertexBufferResource = new VertexBufferResource(Vector.<Number>([0,0,0,0,1,0,1,1,0,1,0,0,0,0,1,0,1,1,1,1,1,1,0,1]),3);
      
      private static var volumeIndexBuffer:IndexBufferResource = new IndexBufferResource(Vector.<uint>([0,1,3,2,3,1,7,6,4,5,4,6,4,5,0,1,0,5,3,2,7,6,7,2,0,3,4,7,4,3,5,6,1,2,1,6]));
      
      private static var volumeTransformConst:Vector.<Number> = new Vector.<Number>(20);
      
      private static var volumeFragmentConst:Vector.<Number> = Vector.<Number>([1,0,1,0.5]);
      
      private static var receiverPrograms:Array = new Array();
      
      public var mapSize:int;
      
      public var blur:int;
      
      public var attenuation:Number;
      
      public var nearDistance:Number;
      
      public var farDistance:Number;
      
      public var color:int;
      
      public var alpha:Number;
      
      public var direction:Vector3D;
      
      public var offset:Number = 0;
      
      public var backFadeRange:Number = 0;
      
      private var casters:Vector.<Mesh>;
      
      private var castersCount:int = 0;
      
      alternativa3d var receiversBuffers:Vector.<int>;
      
      alternativa3d var receiversFirstIndexes:Vector.<int>;
      
      alternativa3d var receiversNumsTriangles:Vector.<int>;
      
      alternativa3d var receiversCount:int = 0;
      
      private var dir:Vector3D;
      
      private var light:DirectionalLight;
      
      private var boundVertexList:Vertex;
      
      private var planeX:Number;
      
      private var planeY:Number;
      
      private var planeSize:Number;
      
      private var minZ:Number;
      
      alternativa3d var boundMinX:Number;
      
      alternativa3d var boundMinY:Number;
      
      alternativa3d var boundMinZ:Number;
      
      alternativa3d var boundMaxX:Number;
      
      alternativa3d var boundMaxY:Number;
      
      alternativa3d var boundMaxZ:Number;
      
      alternativa3d var cameraInside:Boolean;
      
      private var transformConst:Vector.<Number>;
      
      private var uvConst:Vector.<Number>;
      
      private var colorConst:Vector.<Number>;
      
      private var clampConst:Vector.<Number>;
      
      alternativa3d var texture:TextureResource;
      
      alternativa3d var textureScaleU:Number;
      
      alternativa3d var textureScaleV:Number;
      
      alternativa3d var textureOffsetU:Number;
      
      alternativa3d var textureOffsetV:Number;
      
      public function Shadow(param1:int, param2:int, param3:Number, param4:Number, param5:Number, param6:int = 0, param7:Number = 1)
      {
         this.direction = new Vector3D(0,0,-1);
         this.casters = new Vector.<Mesh>();
         this.alternativa3d::receiversBuffers = new Vector.<int>();
         this.alternativa3d::receiversFirstIndexes = new Vector.<int>();
         this.alternativa3d::receiversNumsTriangles = new Vector.<int>();
         this.dir = new Vector3D();
         this.light = new DirectionalLight(0);
         this.boundVertexList = Vertex.alternativa3d::createList(8);
         this.transformConst = new Vector.<Number>(12);
         this.uvConst = Vector.<Number>([0,0,0,1,0,0,0,1]);
         this.colorConst = new Vector.<Number>(12);
         this.clampConst = Vector.<Number>([0,0,0,1]);
         super();
         if(param1 > ShadowAtlas.alternativa3d::sizeLimit)
         {
            throw new Error("Value of mapSize too big.");
         }
         var _loc8_:Number = Math.log(param1) / Math.LN2;
         if(_loc8_ != int(_loc8_))
         {
            throw new Error("Value of mapSize must be power of 2.");
         }
         this.mapSize = param1;
         this.blur = param2;
         this.attenuation = param3;
         this.nearDistance = param4;
         this.farDistance = param5;
         this.color = param6;
         this.alpha = param7;
      }
      
      alternativa3d static function getCasterProgram() : ProgramResource
      {
         var _loc1_:ByteArray = null;
         var _loc2_:FragmentShader = null;
         var _loc3_:ProgramResource = casterProgram;
         if(_loc3_ == null)
         {
            _loc1_ = new ShadowCasterVertexShader().agalcode;
            _loc2_ = new FragmentShader();
            _loc2_.mov(FragmentShader.oc,Shader.v0);
            _loc3_ = new ProgramResource(_loc1_,_loc2_.agalcode);
            casterProgram = _loc3_;
         }
         return _loc3_;
      }
      
      public function addCaster(param1:Mesh) : void
      {
         this.casters[this.castersCount] = param1;
         ++this.castersCount;
      }
      
      public function removeCaster(param1:Mesh) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.castersCount)
         {
            if(this.casters[_loc2_] == param1)
            {
               --this.castersCount;
               while(_loc2_ < this.castersCount)
               {
                  this.casters[_loc2_] = this.casters[int(_loc2_ + 1)];
                  _loc2_++;
               }
               this.casters.length = this.castersCount;
               break;
            }
            _loc2_++;
         }
      }
      
      public function removeAllCasters() : void
      {
         this.castersCount = 0;
         this.casters.length = 0;
      }
      
      alternativa3d function checkVisibility(param1:Camera3D) : Boolean
      {
         var _loc2_:Object3D = null;
         var _loc3_:Object3D = null;
         var _loc4_:Vertex = null;
         var _loc5_:Number = NaN;
         if(this.castersCount == 0)
         {
            return false;
         }
         if(this.direction != null)
         {
            this.dir.x = this.direction.x;
            this.dir.y = this.direction.y;
            this.dir.z = this.direction.z;
            this.dir.normalize();
         }
         else
         {
            this.dir.x = 0;
            this.dir.y = 0;
            this.dir.z = -1;
         }
         this.light.rotationX = Math.atan2(this.dir.z,Math.sqrt(this.dir.x * this.dir.x + this.dir.y * this.dir.y)) - Math.PI / 2;
         this.light.rotationY = 0;
         this.light.rotationZ = -Math.atan2(this.dir.x,this.dir.y);
         this.light.alternativa3d::composeMatrix();
         var _loc6_:Number = Number(this.light.alternativa3d::ma);
         var _loc7_:Number = Number(this.light.alternativa3d::mb);
         var _loc8_:Number = Number(this.light.alternativa3d::mc);
         var _loc9_:Number = Number(this.light.alternativa3d::md);
         var _loc10_:Number = Number(this.light.alternativa3d::me);
         var _loc11_:Number = Number(this.light.alternativa3d::mf);
         var _loc12_:Number = Number(this.light.alternativa3d::mg);
         var _loc13_:Number = Number(this.light.alternativa3d::mh);
         var _loc14_:Number = Number(this.light.alternativa3d::mi);
         var _loc15_:Number = Number(this.light.alternativa3d::mj);
         var _loc16_:Number = Number(this.light.alternativa3d::mk);
         var _loc17_:Number = Number(this.light.alternativa3d::ml);
         this.light.alternativa3d::invertMatrix();
         this.light.alternativa3d::ima = this.light.alternativa3d::ma;
         this.light.alternativa3d::imb = this.light.alternativa3d::mb;
         this.light.alternativa3d::imc = this.light.alternativa3d::mc;
         this.light.alternativa3d::imd = this.light.alternativa3d::md;
         this.light.alternativa3d::ime = this.light.alternativa3d::me;
         this.light.alternativa3d::imf = this.light.alternativa3d::mf;
         this.light.alternativa3d::img = this.light.alternativa3d::mg;
         this.light.alternativa3d::imh = this.light.alternativa3d::mh;
         this.light.alternativa3d::imi = this.light.alternativa3d::mi;
         this.light.alternativa3d::imj = this.light.alternativa3d::mj;
         this.light.alternativa3d::imk = this.light.alternativa3d::mk;
         this.light.alternativa3d::iml = this.light.alternativa3d::ml;
         this.light.boundMinX = 1e+22;
         this.light.boundMinY = 1e+22;
         this.light.boundMinZ = 1e+22;
         this.light.boundMaxX = -1e+22;
         this.light.boundMaxY = -1e+22;
         this.light.boundMaxZ = -1e+22;
         var _loc18_:int = 0;
         while(_loc18_ < this.castersCount)
         {
            _loc2_ = this.casters[_loc18_];
            _loc2_.alternativa3d::composeMatrix();
            _loc3_ = _loc2_.alternativa3d::_parent;
            while(_loc3_ != null)
            {
               Object3D.alternativa3d::tA.alternativa3d::composeMatrixFromSource(_loc3_);
               _loc2_.alternativa3d::appendMatrix(Object3D.alternativa3d::tA);
               _loc3_ = _loc3_.alternativa3d::_parent;
            }
            _loc2_.alternativa3d::appendMatrix(this.light);
            (_loc4_ = this.boundVertexList).x = _loc2_.boundMinX;
            _loc4_.y = _loc2_.boundMinY;
            _loc4_.z = _loc2_.boundMinZ;
            (_loc4_ = _loc4_.alternativa3d::next).x = _loc2_.boundMaxX;
            _loc4_.y = _loc2_.boundMinY;
            _loc4_.z = _loc2_.boundMinZ;
            (_loc4_ = _loc4_.alternativa3d::next).x = _loc2_.boundMinX;
            _loc4_.y = _loc2_.boundMaxY;
            _loc4_.z = _loc2_.boundMinZ;
            (_loc4_ = _loc4_.alternativa3d::next).x = _loc2_.boundMaxX;
            _loc4_.y = _loc2_.boundMaxY;
            _loc4_.z = _loc2_.boundMinZ;
            (_loc4_ = _loc4_.alternativa3d::next).x = _loc2_.boundMinX;
            _loc4_.y = _loc2_.boundMinY;
            _loc4_.z = _loc2_.boundMaxZ;
            (_loc4_ = _loc4_.alternativa3d::next).x = _loc2_.boundMaxX;
            _loc4_.y = _loc2_.boundMinY;
            _loc4_.z = _loc2_.boundMaxZ;
            (_loc4_ = _loc4_.alternativa3d::next).x = _loc2_.boundMinX;
            _loc4_.y = _loc2_.boundMaxY;
            _loc4_.z = _loc2_.boundMaxZ;
            (_loc4_ = _loc4_.alternativa3d::next).x = _loc2_.boundMaxX;
            _loc4_.y = _loc2_.boundMaxY;
            _loc4_.z = _loc2_.boundMaxZ;
            _loc4_ = this.boundVertexList;
            while(_loc4_ != null)
            {
               _loc4_.alternativa3d::cameraX = _loc2_.alternativa3d::ma * _loc4_.x + _loc2_.alternativa3d::mb * _loc4_.y + _loc2_.alternativa3d::mc * _loc4_.z + _loc2_.alternativa3d::md;
               _loc4_.alternativa3d::cameraY = _loc2_.alternativa3d::me * _loc4_.x + _loc2_.alternativa3d::mf * _loc4_.y + _loc2_.alternativa3d::mg * _loc4_.z + _loc2_.alternativa3d::mh;
               _loc4_.alternativa3d::cameraZ = _loc2_.alternativa3d::mi * _loc4_.x + _loc2_.alternativa3d::mj * _loc4_.y + _loc2_.alternativa3d::mk * _loc4_.z + _loc2_.alternativa3d::ml;
               if(_loc4_.alternativa3d::cameraX < this.light.boundMinX)
               {
                  this.light.boundMinX = _loc4_.alternativa3d::cameraX;
               }
               if(_loc4_.alternativa3d::cameraX > this.light.boundMaxX)
               {
                  this.light.boundMaxX = _loc4_.alternativa3d::cameraX;
               }
               if(_loc4_.alternativa3d::cameraY < this.light.boundMinY)
               {
                  this.light.boundMinY = _loc4_.alternativa3d::cameraY;
               }
               if(_loc4_.alternativa3d::cameraY > this.light.boundMaxY)
               {
                  this.light.boundMaxY = _loc4_.alternativa3d::cameraY;
               }
               if(_loc4_.alternativa3d::cameraZ < this.light.boundMinZ)
               {
                  this.light.boundMinZ = _loc4_.alternativa3d::cameraZ;
               }
               if(_loc4_.alternativa3d::cameraZ > this.light.boundMaxZ)
               {
                  this.light.boundMaxZ = _loc4_.alternativa3d::cameraZ;
               }
               _loc4_ = _loc4_.alternativa3d::next;
            }
            _loc18_++;
         }
         var _loc19_:int = this.mapSize - 1 - 1 - this.blur - this.blur;
         var _loc20_:Number = this.light.boundMaxX - this.light.boundMinX;
         var _loc21_:Number = this.light.boundMaxY - this.light.boundMinY;
         var _loc22_:Number = _loc20_ > _loc21_ ? Number(_loc20_) : Number(_loc21_);
         var _loc23_:Number = _loc22_ / _loc19_;
         var _loc24_:Number = (1 + this.blur) * _loc23_;
         var _loc25_:Number = (1 + this.blur) * _loc23_;
         if(_loc20_ > _loc21_)
         {
            _loc25_ += (Math.ceil((_loc21_ - 0.01) / (_loc23_ + _loc23_)) * (_loc23_ + _loc23_) - _loc21_) * 0.5;
         }
         else
         {
            _loc24_ += (Math.ceil((_loc20_ - 0.01) / (_loc23_ + _loc23_)) * (_loc23_ + _loc23_) - _loc20_) * 0.5;
         }
         this.light.boundMinX -= _loc24_;
         this.light.boundMaxX += _loc24_;
         this.light.boundMinY -= _loc25_;
         this.light.boundMaxY += _loc25_;
         this.light.boundMinZ += this.offset;
         this.light.boundMaxZ += this.attenuation;
         this.planeSize = _loc22_ * this.mapSize / _loc19_;
         if(_loc20_ > _loc21_)
         {
            this.planeX = this.light.boundMinX;
            this.planeY = this.light.boundMinY - (this.light.boundMaxX - this.light.boundMinX - (this.light.boundMaxY - this.light.boundMinY)) * 0.5;
         }
         else
         {
            this.planeX = this.light.boundMinX - (this.light.boundMaxY - this.light.boundMinY - (this.light.boundMaxX - this.light.boundMinX)) * 0.5;
            this.planeY = this.light.boundMinY;
         }
         var _loc26_:Number = param1.farClipping;
         param1.farClipping = this.farDistance * param1.shadowsDistanceMultiplier;
         this.light.alternativa3d::ma = _loc6_;
         this.light.alternativa3d::mb = _loc7_;
         this.light.alternativa3d::mc = _loc8_;
         this.light.alternativa3d::md = _loc9_;
         this.light.alternativa3d::me = _loc10_;
         this.light.alternativa3d::mf = _loc11_;
         this.light.alternativa3d::mg = _loc12_;
         this.light.alternativa3d::mh = _loc13_;
         this.light.alternativa3d::mi = _loc14_;
         this.light.alternativa3d::mj = _loc15_;
         this.light.alternativa3d::mk = _loc16_;
         this.light.alternativa3d::ml = _loc17_;
         this.light.alternativa3d::appendMatrix(param1);
         var _loc27_:Boolean = this.cullingInCamera(param1);
         param1.farClipping = _loc26_;
         if(_loc27_)
         {
            if(param1.debug && Boolean(param1.alternativa3d::checkInDebug(this.light) & Debug.BOUNDS))
            {
               Debug.drawBounds(param1,this.light,this.light.boundMinX,this.light.boundMinY,this.light.boundMinZ,this.light.boundMaxX,this.light.boundMaxY,this.light.boundMaxZ,16711935);
            }
            this.alternativa3d::boundMinX = 1e+22;
            this.alternativa3d::boundMinY = 1e+22;
            this.alternativa3d::boundMinZ = 1e+22;
            this.alternativa3d::boundMaxX = -1e+22;
            this.alternativa3d::boundMaxY = -1e+22;
            this.alternativa3d::boundMaxZ = -1e+22;
            _loc4_ = this.boundVertexList;
            while(_loc4_ != null)
            {
               _loc4_.alternativa3d::cameraX = _loc6_ * _loc4_.x + _loc7_ * _loc4_.y + _loc8_ * _loc4_.z + _loc9_;
               _loc4_.alternativa3d::cameraY = _loc10_ * _loc4_.x + _loc11_ * _loc4_.y + _loc12_ * _loc4_.z + _loc13_;
               _loc4_.alternativa3d::cameraZ = _loc14_ * _loc4_.x + _loc15_ * _loc4_.y + _loc16_ * _loc4_.z + _loc17_;
               if(_loc4_.alternativa3d::cameraX < this.alternativa3d::boundMinX)
               {
                  this.alternativa3d::boundMinX = _loc4_.alternativa3d::cameraX;
               }
               if(_loc4_.alternativa3d::cameraX > this.alternativa3d::boundMaxX)
               {
                  this.alternativa3d::boundMaxX = _loc4_.alternativa3d::cameraX;
               }
               if(_loc4_.alternativa3d::cameraY < this.alternativa3d::boundMinY)
               {
                  this.alternativa3d::boundMinY = _loc4_.alternativa3d::cameraY;
               }
               if(_loc4_.alternativa3d::cameraY > this.alternativa3d::boundMaxY)
               {
                  this.alternativa3d::boundMaxY = _loc4_.alternativa3d::cameraY;
               }
               if(_loc4_.alternativa3d::cameraZ < this.alternativa3d::boundMinZ)
               {
                  this.alternativa3d::boundMinZ = _loc4_.alternativa3d::cameraZ;
               }
               if(_loc4_.alternativa3d::cameraZ > this.alternativa3d::boundMaxZ)
               {
                  this.alternativa3d::boundMaxZ = _loc4_.alternativa3d::cameraZ;
               }
               _loc4_ = _loc4_.alternativa3d::next;
            }
            this.alternativa3d::cameraInside = false;
            if(this.minZ <= param1.nearClipping)
            {
               _loc5_ = this.light.alternativa3d::ima * param1.alternativa3d::gmd + this.light.alternativa3d::imb * param1.alternativa3d::gmh + this.light.alternativa3d::imc * param1.alternativa3d::gml + this.light.alternativa3d::imd;
               if(_loc5_ - param1.nearClipping <= this.light.boundMaxX && _loc5_ + param1.nearClipping >= this.light.boundMinX)
               {
                  _loc5_ = this.light.alternativa3d::ime * param1.alternativa3d::gmd + this.light.alternativa3d::imf * param1.alternativa3d::gmh + this.light.alternativa3d::img * param1.alternativa3d::gml + this.light.alternativa3d::imh;
                  if(_loc5_ - param1.nearClipping <= this.light.boundMaxY && _loc5_ + param1.nearClipping >= this.light.boundMinY)
                  {
                     _loc5_ = this.light.alternativa3d::imi * param1.alternativa3d::gmd + this.light.alternativa3d::imj * param1.alternativa3d::gmh + this.light.alternativa3d::imk * param1.alternativa3d::gml + this.light.alternativa3d::iml;
                     if(_loc5_ - param1.nearClipping <= this.light.boundMaxZ && _loc5_ + param1.nearClipping >= this.light.boundMinZ)
                     {
                        this.alternativa3d::cameraInside = true;
                     }
                  }
               }
            }
         }
         return _loc27_;
      }
      
      alternativa3d function renderCasters(param1:Camera3D) : void
      {
         var _loc2_:Mesh = null;
         var _loc3_:Device = param1.alternativa3d::device;
         var _loc4_:Number = 2 / this.planeSize;
         var _loc5_:Number = -2 / this.planeSize;
         var _loc6_:Number = 1 / (this.light.boundMaxZ - this.attenuation - (this.light.boundMinZ - this.offset));
         var _loc7_:Number = -(this.light.boundMinZ - this.offset) * _loc6_;
         var _loc8_:Number = (this.light.boundMinX + this.light.boundMaxX) * 0.5;
         var _loc9_:Number = (this.light.boundMinY + this.light.boundMaxY) * 0.5;
         var _loc10_:int = 0;
         while(_loc10_ < this.castersCount)
         {
            _loc2_ = this.casters[_loc10_];
            _loc2_.alternativa3d::prepareResources();
            casterConst[0] = _loc2_.alternativa3d::ma * _loc4_;
            casterConst[1] = _loc2_.alternativa3d::mb * _loc4_;
            casterConst[2] = _loc2_.alternativa3d::mc * _loc4_;
            casterConst[3] = (_loc2_.alternativa3d::md - _loc8_) * _loc4_;
            casterConst[4] = _loc2_.alternativa3d::me * _loc5_;
            casterConst[5] = _loc2_.alternativa3d::mf * _loc5_;
            casterConst[6] = _loc2_.alternativa3d::mg * _loc5_;
            casterConst[7] = (_loc2_.alternativa3d::mh - _loc9_) * _loc5_;
            casterConst[8] = _loc2_.alternativa3d::mi * _loc6_;
            casterConst[9] = _loc2_.alternativa3d::mj * _loc6_;
            casterConst[10] = _loc2_.alternativa3d::mk * _loc6_;
            casterConst[11] = _loc2_.alternativa3d::ml * _loc6_ + _loc7_;
            casterConst[12] = this.alternativa3d::textureScaleU;
            casterConst[13] = this.alternativa3d::textureScaleV;
            casterConst[16] = 2 * this.alternativa3d::textureOffsetU - 1 + this.alternativa3d::textureScaleU;
            casterConst[17] = -(2 * this.alternativa3d::textureOffsetV - 1 + this.alternativa3d::textureScaleV);
            _loc3_.setVertexBufferAt(0,_loc2_.alternativa3d::vertexBuffer,0,Context3DVertexBufferFormat.FLOAT_3);
            _loc3_.setProgramConstantsFromVector(Context3DProgramType.VERTEX,0,casterConst,5,false);
            _loc3_.drawTriangles(_loc2_.alternativa3d::indexBuffer,0,_loc2_.alternativa3d::numTriangles);
            _loc10_++;
         }
         this.clampConst[0] = this.alternativa3d::textureOffsetU;
         this.clampConst[1] = this.alternativa3d::textureOffsetV;
         this.clampConst[2] = this.alternativa3d::textureOffsetU + this.alternativa3d::textureScaleU;
         this.clampConst[3] = this.alternativa3d::textureOffsetV + this.alternativa3d::textureScaleV;
      }
      
      alternativa3d function renderVolume(param1:Camera3D) : void
      {
         var _loc2_:Device = param1.alternativa3d::device;
         volumeTransformConst[0] = this.light.alternativa3d::ma;
         volumeTransformConst[1] = this.light.alternativa3d::mb;
         volumeTransformConst[2] = this.light.alternativa3d::mc;
         volumeTransformConst[3] = this.light.alternativa3d::md;
         volumeTransformConst[4] = this.light.alternativa3d::me;
         volumeTransformConst[5] = this.light.alternativa3d::mf;
         volumeTransformConst[6] = this.light.alternativa3d::mg;
         volumeTransformConst[7] = this.light.alternativa3d::mh;
         volumeTransformConst[8] = this.light.alternativa3d::mi;
         volumeTransformConst[9] = this.light.alternativa3d::mj;
         volumeTransformConst[10] = this.light.alternativa3d::mk;
         volumeTransformConst[11] = this.light.alternativa3d::ml;
         volumeTransformConst[12] = this.light.boundMaxX - this.light.boundMinX;
         volumeTransformConst[13] = this.light.boundMaxY - this.light.boundMinY;
         volumeTransformConst[14] = this.light.boundMaxZ - this.light.boundMinZ;
         volumeTransformConst[15] = 1;
         volumeTransformConst[16] = this.light.boundMinX;
         volumeTransformConst[17] = this.light.boundMinY;
         volumeTransformConst[18] = this.light.boundMinZ;
         volumeTransformConst[19] = 1;
         _loc2_.setProgram(this.getVolumeProgram());
         _loc2_.setVertexBufferAt(0,volumeVertexBuffer,0,Context3DVertexBufferFormat.FLOAT_3);
         _loc2_.setProgramConstantsFromVector(Context3DProgramType.VERTEX,11,volumeTransformConst,5,false);
         _loc2_.setProgramConstantsFromVector(Context3DProgramType.VERTEX,16,param1.alternativa3d::projection,1);
         _loc2_.setProgramConstantsFromVector(Context3DProgramType.VERTEX,17,param1.alternativa3d::correction,1);
         _loc2_.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT,13,volumeFragmentConst,1);
         _loc2_.drawTriangles(volumeIndexBuffer,0,12);
      }
      
      alternativa3d function renderReceivers(param1:Camera3D) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Device = param1.alternativa3d::device;
         var _loc4_:Number = this.light.boundMinZ - this.offset;
         var _loc5_:Number = this.light.boundMaxZ - this.attenuation - _loc4_;
         var _loc6_:Number = this.light.alternativa3d::ima / this.planeSize;
         var _loc7_:Number = this.light.alternativa3d::imb / this.planeSize;
         var _loc8_:Number = this.light.alternativa3d::imc / this.planeSize;
         var _loc9_:Number = (this.light.alternativa3d::imd - this.planeX) / this.planeSize;
         var _loc10_:Number = this.light.alternativa3d::ime / this.planeSize;
         var _loc11_:Number = this.light.alternativa3d::imf / this.planeSize;
         var _loc12_:Number = this.light.alternativa3d::img / this.planeSize;
         var _loc13_:Number = (this.light.alternativa3d::imh - this.planeY) / this.planeSize;
         var _loc14_:Number = this.light.alternativa3d::imi / _loc5_;
         var _loc15_:Number = this.light.alternativa3d::imj / _loc5_;
         var _loc16_:Number = this.light.alternativa3d::imk / _loc5_;
         var _loc17_:Number = (this.light.alternativa3d::iml - _loc4_) / _loc5_;
         this.transformConst[0] = _loc6_ * param1.alternativa3d::gma + _loc7_ * param1.alternativa3d::gme + _loc8_ * param1.alternativa3d::gmi;
         this.transformConst[1] = _loc6_ * param1.alternativa3d::gmb + _loc7_ * param1.alternativa3d::gmf + _loc8_ * param1.alternativa3d::gmj;
         this.transformConst[2] = _loc6_ * param1.alternativa3d::gmc + _loc7_ * param1.alternativa3d::gmg + _loc8_ * param1.alternativa3d::gmk;
         this.transformConst[3] = _loc6_ * param1.alternativa3d::gmd + _loc7_ * param1.alternativa3d::gmh + _loc8_ * param1.alternativa3d::gml + _loc9_;
         this.transformConst[4] = _loc10_ * param1.alternativa3d::gma + _loc11_ * param1.alternativa3d::gme + _loc12_ * param1.alternativa3d::gmi;
         this.transformConst[5] = _loc10_ * param1.alternativa3d::gmb + _loc11_ * param1.alternativa3d::gmf + _loc12_ * param1.alternativa3d::gmj;
         this.transformConst[6] = _loc10_ * param1.alternativa3d::gmc + _loc11_ * param1.alternativa3d::gmg + _loc12_ * param1.alternativa3d::gmk;
         this.transformConst[7] = _loc10_ * param1.alternativa3d::gmd + _loc11_ * param1.alternativa3d::gmh + _loc12_ * param1.alternativa3d::gml + _loc13_;
         this.transformConst[8] = _loc14_ * param1.alternativa3d::gma + _loc15_ * param1.alternativa3d::gme + _loc16_ * param1.alternativa3d::gmi;
         this.transformConst[9] = _loc14_ * param1.alternativa3d::gmb + _loc15_ * param1.alternativa3d::gmf + _loc16_ * param1.alternativa3d::gmj;
         this.transformConst[10] = _loc14_ * param1.alternativa3d::gmc + _loc15_ * param1.alternativa3d::gmg + _loc16_ * param1.alternativa3d::gmk;
         this.transformConst[11] = _loc14_ * param1.alternativa3d::gmd + _loc15_ * param1.alternativa3d::gmh + _loc16_ * param1.alternativa3d::gml + _loc17_;
         this.uvConst[0] = this.alternativa3d::textureScaleU;
         this.uvConst[1] = this.alternativa3d::textureScaleV;
         this.uvConst[4] = this.alternativa3d::textureOffsetU;
         this.uvConst[5] = this.alternativa3d::textureOffsetV;
         var _loc18_:Number = this.nearDistance * param1.shadowsDistanceMultiplier;
         var _loc19_:Number = this.farDistance * param1.shadowsDistanceMultiplier;
         var _loc20_:Number = 1 - (this.minZ - _loc18_) / (_loc19_ - _loc18_);
         if(_loc20_ < 0)
         {
            _loc20_ = 0;
         }
         if(_loc20_ > 1)
         {
            _loc20_ = 1;
         }
         this.colorConst[0] = 0;
         this.colorConst[1] = 256;
         this.colorConst[2] = 1;
         this.colorConst[3] = this.attenuation / _loc5_;
         this.colorConst[4] = 0;
         this.colorConst[5] = this.backFadeRange / _loc5_;
         this.colorConst[6] = this.offset / _loc5_;
         this.colorConst[7] = 1;
         this.colorConst[8] = (this.color >> 16 & 0xFF) / 255;
         this.colorConst[9] = (this.color >> 8 & 0xFF) / 255;
         this.colorConst[10] = (this.color & 0xFF) / 255;
         this.colorConst[11] = this.alpha * _loc20_ * param1.shadowsStrength;
         _loc3_.setProgram(this.getReceiverProgram(param1.view.alternativa3d::quality,this.alternativa3d::cameraInside,param1.view.alternativa3d::correction));
         _loc3_.setProgramConstantsFromVector(Context3DProgramType.VERTEX,11,param1.alternativa3d::transform,3);
         _loc3_.setProgramConstantsFromVector(Context3DProgramType.VERTEX,14,param1.alternativa3d::projection,1);
         _loc3_.setProgramConstantsFromVector(Context3DProgramType.VERTEX,15,this.transformConst,3);
         _loc3_.setProgramConstantsFromVector(Context3DProgramType.VERTEX,18,param1.alternativa3d::correction,1);
         _loc3_.setProgramConstantsFromVector(Context3DProgramType.VERTEX,19,this.uvConst,2);
         _loc3_.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT,13,this.colorConst,3);
         _loc3_.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT,16,this.clampConst,1);
         var _loc21_:int = 0;
         while(_loc21_ < this.alternativa3d::receiversCount)
         {
            _loc2_ = this.alternativa3d::receiversBuffers[_loc21_];
            _loc3_.setVertexBufferAt(0,param1.alternativa3d::receiversVertexBuffers[_loc2_],0,Context3DVertexBufferFormat.FLOAT_3);
            _loc3_.drawTriangles(param1.alternativa3d::receiversIndexBuffers[_loc2_],this.alternativa3d::receiversFirstIndexes[_loc21_],this.alternativa3d::receiversNumsTriangles[_loc21_]);
            ++param1.alternativa3d::numShadows;
            _loc21_++;
         }
         this.alternativa3d::receiversCount = 0;
      }
      
      private function getVolumeProgram() : ProgramResource
      {
         var _loc1_:ByteArray = null;
         var _loc2_:FragmentShader = null;
         var _loc3_:ProgramResource = volumeProgram;
         if(_loc3_ == null)
         {
            _loc1_ = new ShadowVolumeVertexShader().agalcode;
            _loc2_ = new FragmentShader();
            _loc2_.mov(FragmentShader.oc,FragmentShader.fc[13]);
            _loc3_ = new ProgramResource(_loc1_,_loc2_.agalcode);
            volumeProgram = _loc3_;
         }
         return _loc3_;
      }
      
      private function getReceiverProgram(param1:Boolean, param2:Boolean, param3:Boolean) : ProgramResource
      {
         var _loc4_:ByteArray = null;
         var _loc5_:ByteArray = null;
         var _loc6_:* = int(param1) | int(param2) << 1 | int(param3) << 2;
         var _loc7_:ProgramResource = receiverPrograms[_loc6_];
         if(_loc7_ == null)
         {
            _loc4_ = new ShadowReceiverVertexShader(param3).agalcode;
            _loc5_ = new ShadowReceiverFragmentShader(param1,param2).agalcode;
            _loc7_ = new ProgramResource(_loc4_,_loc5_);
            receiverPrograms[_loc6_] = _loc7_;
         }
         return _loc7_;
      }
      
      private function cullingInCamera(param1:Camera3D) : Boolean
      {
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         var _loc4_:Vertex;
         (_loc4_ = this.boundVertexList).x = this.light.boundMinX;
         _loc4_.y = this.light.boundMinY;
         _loc4_.z = this.light.boundMinZ;
         (_loc4_ = _loc4_.alternativa3d::next).x = this.light.boundMaxX;
         _loc4_.y = this.light.boundMinY;
         _loc4_.z = this.light.boundMinZ;
         (_loc4_ = _loc4_.alternativa3d::next).x = this.light.boundMinX;
         _loc4_.y = this.light.boundMaxY;
         _loc4_.z = this.light.boundMinZ;
         (_loc4_ = _loc4_.alternativa3d::next).x = this.light.boundMaxX;
         _loc4_.y = this.light.boundMaxY;
         _loc4_.z = this.light.boundMinZ;
         (_loc4_ = _loc4_.alternativa3d::next).x = this.light.boundMinX;
         _loc4_.y = this.light.boundMinY;
         _loc4_.z = this.light.boundMaxZ;
         (_loc4_ = _loc4_.alternativa3d::next).x = this.light.boundMaxX;
         _loc4_.y = this.light.boundMinY;
         _loc4_.z = this.light.boundMaxZ;
         (_loc4_ = _loc4_.alternativa3d::next).x = this.light.boundMinX;
         _loc4_.y = this.light.boundMaxY;
         _loc4_.z = this.light.boundMaxZ;
         (_loc4_ = _loc4_.alternativa3d::next).x = this.light.boundMaxX;
         _loc4_.y = this.light.boundMaxY;
         _loc4_.z = this.light.boundMaxZ;
         this.minZ = 1e+22;
         _loc4_ = this.boundVertexList;
         while(_loc4_ != null)
         {
            _loc4_.alternativa3d::cameraX = this.light.alternativa3d::ma * _loc4_.x + this.light.alternativa3d::mb * _loc4_.y + this.light.alternativa3d::mc * _loc4_.z + this.light.alternativa3d::md;
            _loc4_.alternativa3d::cameraY = this.light.alternativa3d::me * _loc4_.x + this.light.alternativa3d::mf * _loc4_.y + this.light.alternativa3d::mg * _loc4_.z + this.light.alternativa3d::mh;
            _loc4_.alternativa3d::cameraZ = this.light.alternativa3d::mi * _loc4_.x + this.light.alternativa3d::mj * _loc4_.y + this.light.alternativa3d::mk * _loc4_.z + this.light.alternativa3d::ml;
            if(_loc4_.alternativa3d::cameraZ < this.minZ)
            {
               this.minZ = _loc4_.alternativa3d::cameraZ;
            }
            _loc4_ = _loc4_.alternativa3d::next;
         }
         var _loc5_:Number = param1.nearClipping;
         _loc4_ = this.boundVertexList;
         _loc2_ = false;
         _loc3_ = false;
         while(_loc4_ != null)
         {
            if(_loc4_.alternativa3d::cameraZ > _loc5_)
            {
               _loc2_ = true;
               if(_loc3_)
               {
                  break;
               }
            }
            else
            {
               _loc3_ = true;
               if(_loc2_)
               {
                  break;
               }
            }
            _loc4_ = _loc4_.alternativa3d::next;
         }
         if(_loc3_ && !_loc2_)
         {
            return false;
         }
         var _loc6_:Number = param1.farClipping;
         _loc4_ = this.boundVertexList;
         _loc2_ = false;
         _loc3_ = false;
         while(_loc4_ != null)
         {
            if(_loc4_.alternativa3d::cameraZ < _loc6_)
            {
               _loc2_ = true;
               if(_loc3_)
               {
                  break;
               }
            }
            else
            {
               _loc3_ = true;
               if(_loc2_)
               {
                  break;
               }
            }
            _loc4_ = _loc4_.alternativa3d::next;
         }
         if(_loc3_ && !_loc2_)
         {
            return false;
         }
         _loc4_ = this.boundVertexList;
         _loc2_ = false;
         _loc3_ = false;
         while(_loc4_ != null)
         {
            if(-_loc4_.alternativa3d::cameraX < _loc4_.alternativa3d::cameraZ)
            {
               _loc2_ = true;
               if(_loc3_)
               {
                  break;
               }
            }
            else
            {
               _loc3_ = true;
               if(_loc2_)
               {
                  break;
               }
            }
            _loc4_ = _loc4_.alternativa3d::next;
         }
         if(_loc3_ && !_loc2_)
         {
            return false;
         }
         _loc4_ = this.boundVertexList;
         _loc2_ = false;
         _loc3_ = false;
         while(_loc4_ != null)
         {
            if(_loc4_.alternativa3d::cameraX < _loc4_.alternativa3d::cameraZ)
            {
               _loc2_ = true;
               if(_loc3_)
               {
                  break;
               }
            }
            else
            {
               _loc3_ = true;
               if(_loc2_)
               {
                  break;
               }
            }
            _loc4_ = _loc4_.alternativa3d::next;
         }
         if(_loc3_ && !_loc2_)
         {
            return false;
         }
         _loc4_ = this.boundVertexList;
         _loc2_ = false;
         _loc3_ = false;
         while(_loc4_ != null)
         {
            if(-_loc4_.alternativa3d::cameraY < _loc4_.alternativa3d::cameraZ)
            {
               _loc2_ = true;
               if(_loc3_)
               {
                  break;
               }
            }
            else
            {
               _loc3_ = true;
               if(_loc2_)
               {
                  break;
               }
            }
            _loc4_ = _loc4_.alternativa3d::next;
         }
         if(_loc3_ && !_loc2_)
         {
            return false;
         }
         _loc4_ = this.boundVertexList;
         _loc2_ = false;
         _loc3_ = false;
         while(_loc4_ != null)
         {
            if(_loc4_.alternativa3d::cameraY < _loc4_.alternativa3d::cameraZ)
            {
               _loc2_ = true;
               if(_loc3_)
               {
                  break;
               }
            }
            else
            {
               _loc3_ = true;
               if(_loc2_)
               {
                  break;
               }
            }
            _loc4_ = _loc4_.alternativa3d::next;
         }
         if(_loc3_ && !_loc2_)
         {
            return false;
         }
         return true;
      }
   }
}

