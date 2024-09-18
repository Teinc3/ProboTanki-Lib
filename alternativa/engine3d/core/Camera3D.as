package alternativa.engine3d.core
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.lights.DirectionalLight;
   import alternativa.engine3d.lights.OmniLight;
   import alternativa.engine3d.lights.SpotLight;
   import alternativa.engine3d.lights.TubeLight;
   import alternativa.engine3d.materials.Material;
   import alternativa.engine3d.objects.Decal;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.gfx.core.Device;
   import alternativa.gfx.core.IndexBufferResource;
   import alternativa.gfx.core.TextureResource;
   import alternativa.gfx.core.VertexBufferResource;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.display.StageAlign;
   import flash.display3D.Context3DBlendFactor;
   import flash.display3D.Context3DClearMask;
   import flash.display3D.Context3DCompareMode;
   import flash.display3D.Context3DProgramType;
   import flash.display3D.Context3DStencilAction;
   import flash.display3D.Context3DTriangleFace;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.geom.Vector3D;
   import flash.system.System;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.utils.Dictionary;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   import flash.utils.getQualifiedSuperclassName;
   import flash.utils.getTimer;
   
   use namespace alternativa3d;
   
   public class Camera3D extends Object3D
   {
      alternativa3d static var renderId:int = 0;
      
      private static const constantsAttributesCount:int = 8;
      
      private static const constantsOffset:int = 16;
      
      private static const constantsMaxTriangles:int = 18;
      
      private static const constants:Vector.<Number> = new Vector.<Number>(constantsMaxTriangles * 3 * constantsAttributesCount);
      
      private static const constantsVertexBuffer:VertexBufferResource = createConstantsVertexBuffer(constantsMaxTriangles * 3);
      
      private static const constantsIndexBuffer:IndexBufferResource = createConstantsIndexBuffer(constantsMaxTriangles * 3);
      
      public var view:View;
      
      public var fov:Number = 1.5707963267948966;
      
      public var nearClipping:Number = 1;
      
      public var farClipping:Number = 1000000;
      
      public var onRender:Function;
      
      alternativa3d var viewSizeX:Number;
      
      alternativa3d var viewSizeY:Number;
      
      alternativa3d var focalLength:Number;
      
      alternativa3d var correctionX:Number;
      
      alternativa3d var correctionY:Number;
      
      alternativa3d var lights:Vector.<Light3D>;
      
      alternativa3d var lightsLength:int = 0;
      
      alternativa3d var occluders:Vector.<Vertex>;
      
      alternativa3d var numOccluders:int;
      
      alternativa3d var occludedAll:Boolean;
      
      alternativa3d var numDraws:int;
      
      alternativa3d var numShadows:int;
      
      alternativa3d var numTriangles:int;
      
      alternativa3d var device:Device;
      
      alternativa3d var projection:Vector.<Number>;
      
      alternativa3d var correction:Vector.<Number>;
      
      alternativa3d var transform:Vector.<Number>;
      
      private var opaqueMaterials:Vector.<Material>;
      
      private var opaqueVertexBuffers:Vector.<VertexBufferResource>;
      
      private var opaqueIndexBuffers:Vector.<IndexBufferResource>;
      
      private var opaqueFirstIndexes:Vector.<int>;
      
      private var opaqueNumsTriangles:Vector.<int>;
      
      private var opaqueObjects:Vector.<Object3D>;
      
      private var opaqueCount:int = 0;
      
      private var skyMaterials:Vector.<Material>;
      
      private var skyVertexBuffers:Vector.<VertexBufferResource>;
      
      private var skyIndexBuffers:Vector.<IndexBufferResource>;
      
      private var skyFirstIndexes:Vector.<int>;
      
      private var skyNumsTriangles:Vector.<int>;
      
      private var skyObjects:Vector.<Object3D>;
      
      private var skyCount:int = 0;
      
      private var transparentFaceLists:Vector.<Face>;
      
      private var transparentObjects:Vector.<Object3D>;
      
      private var transparentCount:int = 0;
      
      private var transparentOpaqueFaceLists:Vector.<Face>;
      
      private var transparentOpaqueObjects:Vector.<Object3D>;
      
      private var transparentOpaqueCount:int = 0;
      
      private var transparentBatchObjects:Vector.<Object3D>;
      
      private var decals:Vector.<Decal>;
      
      private var decalsCount:int = 0;
      
      alternativa3d var depthObjects:Vector.<Object3D>;
      
      alternativa3d var depthCount:int = 0;
      
      alternativa3d var casterObjects:Vector.<Object3D>;
      
      alternativa3d var casterCount:int = 0;
      
      alternativa3d var shadowAtlases:Array;
      
      alternativa3d var receiversVertexBuffers:Vector.<VertexBufferResource>;
      
      alternativa3d var receiversIndexBuffers:Vector.<IndexBufferResource>;
      
      alternativa3d var gma:Number;
      
      alternativa3d var gmb:Number;
      
      alternativa3d var gmc:Number;
      
      alternativa3d var gmd:Number;
      
      alternativa3d var gme:Number;
      
      alternativa3d var gmf:Number;
      
      alternativa3d var gmg:Number;
      
      alternativa3d var gmh:Number;
      
      alternativa3d var gmi:Number;
      
      alternativa3d var gmj:Number;
      
      alternativa3d var gmk:Number;
      
      alternativa3d var gml:Number;
      
      alternativa3d var fogParams:Vector.<Number>;
      
      alternativa3d var fogFragment:Vector.<Number>;
      
      private var fragmentConst:Vector.<Number>;
      
      private var shadows:Dictionary;
      
      private var shadowList:Vector.<Shadow>;
      
      private var depthRenderer:DepthRenderer;
      
      alternativa3d var depthMap:TextureResource;
      
      alternativa3d var lightMap:TextureResource;
      
      private var depthParams:Vector.<Number>;
      
      private var ssaoParams:Vector.<Number>;
      
      private var lightTransform:Vector.<Number>;
      
      private var lightParams:Vector.<Number>;
      
      alternativa3d var omnies:Vector.<OmniLight>;
      
      alternativa3d var omniesCount:int = 0;
      
      alternativa3d var spots:Vector.<SpotLight>;
      
      alternativa3d var spotsCount:int = 0;
      
      alternativa3d var tubes:Vector.<TubeLight>;
      
      alternativa3d var tubesCount:int = 0;
      
      public var fogNear:Number = 0;
      
      public var fogFar:Number = 1000000;
      
      public var fogAlpha:Number = 0;
      
      public var fogColor:int = 8355711;
      
      public var softTransparency:Boolean = false;
      
      public var depthBufferScale:Number = 1;
      
      public var ssao:Boolean = false;
      
      public var ssaoRadius:Number = 100;
      
      public var ssaoRange:Number = 1000;
      
      public var ssaoColor:int = 0;
      
      public var ssaoAlpha:Number = 1;
      
      public var directionalLight:DirectionalLight;
      
      public var shadowMap:ShadowMap;
      
      public var ambientColor:int = 0;
      
      public var deferredLighting:Boolean = false;
      
      public var fogStrength:Number = 1;
      
      public var softTransparencyStrength:Number = 1;
      
      public var ssaoStrength:Number = 1;
      
      public var directionalLightStrength:Number = 1;
      
      public var shadowMapStrength:Number = 1;
      
      public var shadowsStrength:Number = 1;
      
      public var shadowsDistanceMultiplier:Number = 1;
      
      public var deferredLightingStrength:Number = 1;
      
      public var debug:Boolean = false;
      
      private var debugSet:Object;
      
      private var _diagram:Sprite;
      
      public var fpsUpdatePeriod:int = 10;
      
      public var timerUpdatePeriod:int = 10;
      
      private var fpsTextField:TextField;
      
      private var memoryTextField:TextField;
      
      private var drawsTextField:TextField;
      
      private var shadowsTextField:TextField;
      
      private var trianglesTextField:TextField;
      
      private var timerTextField:TextField;
      
      private var graph:Bitmap;
      
      private var rect:Rectangle;
      
      private var _diagramAlign:String = "TR";
      
      private var _diagramHorizontalMargin:Number = 2;
      
      private var _diagramVerticalMargin:Number = 2;
      
      private var fpsUpdateCounter:int;
      
      private var previousFrameTime:int;
      
      private var previousPeriodTime:int;
      
      private var maxMemory:int;
      
      private var timerUpdateCounter:int;
      
      private var timeSum:int;
      
      private var timeCount:int;
      
      private var timer:int;
      
      private var firstVertex:Vertex;
      
      private var firstFace:Face;
      
      private var firstWrapper:Wrapper;
      
      alternativa3d var lastWrapper:Wrapper;
      
      alternativa3d var lastVertex:Vertex;
      
      alternativa3d var lastFace:Face;
      
      public function Camera3D()
      {
         this.alternativa3d::lights = new Vector.<Light3D>();
         this.alternativa3d::occluders = new Vector.<Vertex>();
         this.alternativa3d::projection = new Vector.<Number>(4);
         this.alternativa3d::correction = new Vector.<Number>(4);
         this.alternativa3d::transform = new Vector.<Number>(12);
         this.opaqueMaterials = new Vector.<Material>();
         this.opaqueVertexBuffers = new Vector.<VertexBufferResource>();
         this.opaqueIndexBuffers = new Vector.<IndexBufferResource>();
         this.opaqueFirstIndexes = new Vector.<int>();
         this.opaqueNumsTriangles = new Vector.<int>();
         this.opaqueObjects = new Vector.<Object3D>();
         this.skyMaterials = new Vector.<Material>();
         this.skyVertexBuffers = new Vector.<VertexBufferResource>();
         this.skyIndexBuffers = new Vector.<IndexBufferResource>();
         this.skyFirstIndexes = new Vector.<int>();
         this.skyNumsTriangles = new Vector.<int>();
         this.skyObjects = new Vector.<Object3D>();
         this.transparentFaceLists = new Vector.<Face>();
         this.transparentObjects = new Vector.<Object3D>();
         this.transparentOpaqueFaceLists = new Vector.<Face>();
         this.transparentOpaqueObjects = new Vector.<Object3D>();
         this.transparentBatchObjects = new Vector.<Object3D>();
         this.decals = new Vector.<Decal>();
         this.alternativa3d::depthObjects = new Vector.<Object3D>();
         this.alternativa3d::casterObjects = new Vector.<Object3D>();
         this.alternativa3d::shadowAtlases = new Array();
         this.alternativa3d::fogParams = Vector.<Number>([1,1,0,1]);
         this.alternativa3d::fogFragment = Vector.<Number>([0,0,0,1]);
         this.fragmentConst = Vector.<Number>([0,0,0,1,0.5,0.5,0,1 / 4096]);
         this.shadows = new Dictionary();
         this.shadowList = new Vector.<Shadow>();
         this.depthRenderer = new DepthRenderer();
         this.depthParams = Vector.<Number>([0,0,0,1]);
         this.ssaoParams = Vector.<Number>([0,0,0,1]);
         this.lightTransform = Vector.<Number>([0,0,0,1]);
         this.lightParams = Vector.<Number>([0,0,0,1,0,0,0,1]);
         this.alternativa3d::omnies = new Vector.<OmniLight>();
         this.alternativa3d::spots = new Vector.<SpotLight>();
         this.alternativa3d::tubes = new Vector.<TubeLight>();
         this.debugSet = new Object();
         this._diagram = this.createDiagram();
         this.firstVertex = new Vertex();
         this.firstFace = new Face();
         this.firstWrapper = new Wrapper();
         this.alternativa3d::lastWrapper = this.firstWrapper;
         this.alternativa3d::lastVertex = this.firstVertex;
         this.alternativa3d::lastFace = this.firstFace;
         super();
      }
      
      private static function createConstantsVertexBuffer(param1:int) : VertexBufferResource
      {
         var _loc2_:int = 0;
         var _loc3_:Vector.<Number> = new Vector.<Number>();
         var _loc4_:int = 0;
         while(_loc4_ < param1)
         {
            _loc3_.push((_loc4_ << 1) + constantsOffset);
            _loc4_++;
         }
         var _loc5_:int = 0;
         while(_loc5_ < param1 << 1)
         {
            _loc2_ = _loc5_ * 4 + 3;
            constants[_loc2_] = 1;
            _loc5_++;
         }
         return new VertexBufferResource(_loc3_,1);
      }
      
      private static function createConstantsIndexBuffer(param1:int) : IndexBufferResource
      {
         var _loc2_:Vector.<uint> = new Vector.<uint>();
         var _loc3_:int = 0;
         while(_loc3_ < param1)
         {
            _loc2_.push(_loc3_);
            _loc3_++;
         }
         return new IndexBufferResource(_loc2_);
      }
      
      public function addShadow(param1:Shadow) : void
      {
         this.shadows[param1] = true;
      }
      
      public function removeShadow(param1:Shadow) : void
      {
         delete this.shadows[param1];
      }
      
      public function removeAllShadows() : void
      {
         this.shadows = new Dictionary();
      }
      
      public function render() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:Object3D = null;
         var _loc6_:Light3D = null;
         var _loc7_:ShadowAtlas = null;
         var _loc8_:Boolean = false;
         var _loc9_:Material = null;
         var _loc10_:* = undefined;
         var _loc11_:Decal = null;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:* = 0;
         var _loc15_:TextureResource = null;
         var _loc16_:Face = null;
         var _loc17_:Object3D = null;
         var _loc18_:* = false;
         var _loc19_:Boolean = false;
         var _loc20_:int = 0;
         var _loc21_:Sprite3D = null;
         var _loc22_:Face = null;
         var _loc23_:Face = null;
         var _loc24_:Object3D = null;
         var _loc25_:Sprite3D = null;
         this.alternativa3d::numDraws = 0;
         this.alternativa3d::numShadows = 0;
         this.alternativa3d::numTriangles = 0;
         if(this.view != null && this.view.alternativa3d::device != null && this.view.alternativa3d::device.ready)
         {
            ++alternativa3d::renderId;
            this.alternativa3d::device = this.view.alternativa3d::device;
            this.view.alternativa3d::configure();
            if(this.nearClipping < 1)
            {
               this.nearClipping = 1;
            }
            if(this.farClipping > 1000000)
            {
               this.farClipping = 1000000;
            }
            this.alternativa3d::viewSizeX = this.view.alternativa3d::_width * 0.5;
            this.alternativa3d::viewSizeY = this.view.alternativa3d::_height * 0.5;
            this.alternativa3d::focalLength = Math.sqrt(this.alternativa3d::viewSizeX * this.alternativa3d::viewSizeX + this.alternativa3d::viewSizeY * this.alternativa3d::viewSizeY) / Math.tan(this.fov * 0.5);
            this.alternativa3d::correctionX = this.alternativa3d::viewSizeX / this.alternativa3d::focalLength;
            this.alternativa3d::correctionY = this.alternativa3d::viewSizeY / this.alternativa3d::focalLength;
            this.alternativa3d::projection[0] = 1 << this.view.zBufferPrecision;
            this.alternativa3d::projection[1] = 1;
            this.alternativa3d::projection[2] = this.farClipping / (this.farClipping - this.nearClipping);
            this.alternativa3d::projection[3] = this.nearClipping * this.farClipping / (this.nearClipping - this.farClipping);
            this.alternativa3d::composeCameraMatrix();
            _loc5_ = this;
            while(_loc5_.alternativa3d::_parent != null)
            {
               _loc5_ = _loc5_.alternativa3d::_parent;
               _loc5_.alternativa3d::composeMatrix();
               alternativa3d::appendMatrix(_loc5_);
            }
            this.alternativa3d::gma = alternativa3d::ma;
            this.alternativa3d::gmb = alternativa3d::mb;
            this.alternativa3d::gmc = alternativa3d::mc;
            this.alternativa3d::gmd = alternativa3d::md;
            this.alternativa3d::gme = alternativa3d::me;
            this.alternativa3d::gmf = alternativa3d::mf;
            this.alternativa3d::gmg = alternativa3d::mg;
            this.alternativa3d::gmh = alternativa3d::mh;
            this.alternativa3d::gmi = alternativa3d::mi;
            this.alternativa3d::gmj = alternativa3d::mj;
            this.alternativa3d::gmk = alternativa3d::mk;
            this.alternativa3d::gml = alternativa3d::ml;
            alternativa3d::invertMatrix();
            this.alternativa3d::transform[0] = alternativa3d::ma;
            this.alternativa3d::transform[1] = alternativa3d::mb;
            this.alternativa3d::transform[2] = alternativa3d::mc;
            this.alternativa3d::transform[3] = alternativa3d::md;
            this.alternativa3d::transform[4] = alternativa3d::me;
            this.alternativa3d::transform[5] = alternativa3d::mf;
            this.alternativa3d::transform[6] = alternativa3d::mg;
            this.alternativa3d::transform[7] = alternativa3d::mh;
            this.alternativa3d::transform[8] = alternativa3d::mi;
            this.alternativa3d::transform[9] = alternativa3d::mj;
            this.alternativa3d::transform[10] = alternativa3d::mk;
            this.alternativa3d::transform[11] = alternativa3d::ml;
            this.alternativa3d::numOccluders = 0;
            this.alternativa3d::occludedAll = false;
            if(_loc5_ != this && _loc5_.visible)
            {
               this.alternativa3d::lightsLength = 0;
               _loc6_ = (_loc5_ as Object3DContainer).alternativa3d::lightList;
               while(_loc6_ != null)
               {
                  if(_loc6_.visible)
                  {
                     _loc6_.alternativa3d::calculateCameraMatrix(this);
                     if(_loc6_.alternativa3d::checkFrustumCulling(this))
                     {
                        this.alternativa3d::lights[this.alternativa3d::lightsLength] = _loc6_;
                        ++this.alternativa3d::lightsLength;
                        if(!this.view.alternativa3d::constrained && this.deferredLighting && this.deferredLightingStrength > 0)
                        {
                           if(_loc6_ is OmniLight)
                           {
                              this.alternativa3d::omnies[this.alternativa3d::omniesCount] = _loc6_ as OmniLight;
                              ++this.alternativa3d::omniesCount;
                           }
                           else if(_loc6_ is SpotLight)
                           {
                              this.alternativa3d::spots[this.alternativa3d::spotsCount] = _loc6_ as SpotLight;
                              ++this.alternativa3d::spotsCount;
                           }
                           else if(_loc6_ is TubeLight)
                           {
                              this.alternativa3d::tubes[this.alternativa3d::tubesCount] = _loc6_ as TubeLight;
                              ++this.alternativa3d::tubesCount;
                           }
                        }
                     }
                  }
                  _loc6_ = _loc6_.alternativa3d::nextLight;
               }
               _loc5_.alternativa3d::appendMatrix(this);
               _loc5_.alternativa3d::cullingInCamera(this,63);
               if(this.debug)
               {
                  _loc1_ = 0;
                  while(_loc1_ < this.alternativa3d::lightsLength)
                  {
                     (this.alternativa3d::lights[_loc1_] as Light3D).alternativa3d::drawDebug(this);
                     _loc1_++;
                  }
               }
               _loc8_ = false;
               if(!this.view.alternativa3d::constrained && this.shadowsStrength > 0)
               {
                  for(_loc4_ in this.shadows)
                  {
                     if(_loc4_.checkVisibility(this))
                     {
                        _loc2_ = _loc4_.mapSize + _loc4_.blur;
                        _loc7_ = this.alternativa3d::shadowAtlases[_loc2_];
                        if(_loc7_ == null)
                        {
                           _loc7_ = new ShadowAtlas(_loc4_.mapSize,_loc4_.blur);
                           this.alternativa3d::shadowAtlases[_loc2_] = _loc7_;
                        }
                        _loc7_.alternativa3d::shadows[_loc7_.alternativa3d::shadowsCount] = _loc4_;
                        ++_loc7_.alternativa3d::shadowsCount;
                        _loc8_ = true;
                     }
                  }
               }
               this.alternativa3d::device.setCulling(Context3DTriangleFace.FRONT);
               this.alternativa3d::device.setBlendFactors(Context3DBlendFactor.ONE,Context3DBlendFactor.ZERO);
               this.alternativa3d::device.setStencilActions(Context3DTriangleFace.NONE);
               this.alternativa3d::device.setStencilReferenceValue(0);
               if(_loc8_)
               {
                  this.alternativa3d::device.setCulling(Context3DTriangleFace.BACK);
                  this.alternativa3d::device.setDepthTest(true,Context3DCompareMode.GREATER_EQUAL);
                  this.alternativa3d::device.setProgram(Shadow.alternativa3d::getCasterProgram());
                  for each(_loc7_ in this.alternativa3d::shadowAtlases)
                  {
                     if(_loc7_.alternativa3d::shadowsCount > 0)
                     {
                        _loc7_.alternativa3d::renderCasters(this);
                     }
                  }
                  this.alternativa3d::device.setCulling(Context3DTriangleFace.FRONT);
                  this.alternativa3d::device.setDepthTest(false,Context3DCompareMode.ALWAYS);
                  for each(_loc7_ in this.alternativa3d::shadowAtlases)
                  {
                     if(_loc7_.alternativa3d::shadowsCount > 0)
                     {
                        _loc7_.alternativa3d::renderBlur(this);
                     }
                  }
                  this.alternativa3d::device.setTextureAt(0,null);
                  this.alternativa3d::device.setVertexBufferAt(1,null);
               }
               if(this.directionalLight != null)
               {
                  this.directionalLight.alternativa3d::composeAndAppend(this);
                  this.directionalLight.alternativa3d::calculateInverseMatrix();
               }
               _loc5_.alternativa3d::concatenatedAlpha = _loc5_.alpha;
               _loc5_.alternativa3d::concatenatedBlendMode = _loc5_.blendMode;
               _loc5_.alternativa3d::concatenatedColorTransform = _loc5_.colorTransform;
               _loc5_.alternativa3d::draw(this);
               this.alternativa3d::device.setDepthTest(true,Context3DCompareMode.LESS);
               if(!this.view.alternativa3d::constrained && this.shadowMap != null && this.shadowMapStrength > 0)
               {
                  this.shadowMap.alternativa3d::calculateBounds(this);
                  this.shadowMap.alternativa3d::render(this,this.alternativa3d::casterObjects,this.alternativa3d::casterCount);
               }
               this.alternativa3d::depthMap = null;
               this.alternativa3d::lightMap = null;
               if(!this.view.alternativa3d::constrained && (this.softTransparency && this.softTransparencyStrength > 0 || this.ssao && this.ssaoStrength > 0 || this.deferredLighting && this.deferredLightingStrength > 0))
               {
                  this.depthRenderer.alternativa3d::render(this,this.view.alternativa3d::_width,this.view.alternativa3d::_height,this.depthBufferScale,this.ssao && this.ssaoStrength > 0,this.deferredLighting && this.deferredLightingStrength > 0,this.directionalLight != null && this.directionalLightStrength > 0 || this.shadowMap != null && this.shadowMapStrength > 0 ? Number(0) : Number(0.5),this.alternativa3d::depthObjects,this.alternativa3d::depthCount);
                  if(this.softTransparency && this.softTransparencyStrength > 0 || this.ssao && this.ssaoStrength > 0)
                  {
                     this.alternativa3d::depthMap = this.depthRenderer.alternativa3d::depthBuffer;
                  }
                  if(this.deferredLighting && this.deferredLightingStrength > 0)
                  {
                     this.alternativa3d::lightMap = this.depthRenderer.alternativa3d::lightBuffer;
                  }
               }
               else
               {
                  this.depthRenderer.alternativa3d::resetResources();
               }
               if(_loc8_ || !this.view.alternativa3d::constrained && (this.softTransparency && this.softTransparencyStrength > 0 || this.ssao && this.ssaoStrength > 0 || this.deferredLighting && this.deferredLightingStrength > 0) || !this.view.alternativa3d::constrained && this.shadowMap != null && this.shadowMapStrength > 0)
               {
                  this.alternativa3d::device.setRenderToBackBuffer();
               }
               this.view.alternativa3d::clearArea();
               this.alternativa3d::device.setProgramConstantsFromVector(Context3DProgramType.VERTEX,3,this.alternativa3d::projection,1);
               this.fragmentConst[0] = this.farClipping;
               this.fragmentConst[1] = this.farClipping / 255;
               this.alternativa3d::device.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT,17,this.fragmentConst,2);
               this.alternativa3d::correction[0] = this.view.alternativa3d::rect.width / this.alternativa3d::device.width;
               this.alternativa3d::correction[1] = this.view.alternativa3d::rect.height / this.alternativa3d::device.height;
               this.alternativa3d::correction[2] = (this.view.alternativa3d::rect.x * 2 + this.view.alternativa3d::rect.width - this.alternativa3d::device.width) / this.alternativa3d::device.width;
               this.alternativa3d::correction[3] = (this.view.alternativa3d::rect.y * 2 + this.view.alternativa3d::rect.height - this.alternativa3d::device.height) / this.alternativa3d::device.height;
               this.alternativa3d::device.setProgramConstantsFromVector(Context3DProgramType.VERTEX,13,this.alternativa3d::correction,1);
               if(!this.view.alternativa3d::constrained && (this.softTransparency && this.softTransparencyStrength > 0 || this.ssao && this.ssaoStrength > 0 || this.deferredLighting && this.deferredLightingStrength > 0 || this.shadowMap != null && this.shadowMapStrength > 0))
               {
                  this.depthParams[0] = this.depthRenderer.alternativa3d::correctionX;
                  this.depthParams[1] = this.depthRenderer.alternativa3d::correctionY;
                  this.alternativa3d::device.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT,4,this.depthParams,1);
                  if(this.ssao && this.ssaoStrength > 0)
                  {
                     this.ssaoParams[0] = (1 - 2 * (this.ssaoColor >> 16 & 0xFF) / 255) * this.ssaoAlpha * this.ssaoStrength;
                     this.ssaoParams[1] = (1 - 2 * (this.ssaoColor >> 8 & 0xFF) / 255) * this.ssaoAlpha * this.ssaoStrength;
                     this.ssaoParams[2] = (1 - 2 * (this.ssaoColor & 0xFF) / 255) * this.ssaoAlpha * this.ssaoStrength;
                     this.alternativa3d::device.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT,12,this.ssaoParams,1);
                  }
               }
               if(!this.view.alternativa3d::constrained && this.shadowMap != null && this.shadowMapStrength > 0)
               {
                  this.alternativa3d::device.setProgramConstantsFromVector(Context3DProgramType.VERTEX,6,this.shadowMap.alternativa3d::transform,4);
                  this.alternativa3d::device.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT,5,this.shadowMap.alternativa3d::params,5);
               }
               if(this.fogAlpha > 0 && this.fogStrength > 0)
               {
                  this.alternativa3d::fogParams[2] = this.fogNear;
                  this.alternativa3d::fogParams[3] = this.fogFar - this.fogNear;
                  this.alternativa3d::device.setProgramConstantsFromVector(Context3DProgramType.VERTEX,5,this.alternativa3d::fogParams,1);
                  this.alternativa3d::fogFragment[0] = (this.fogColor >> 16 & 0xFF) / 255;
                  this.alternativa3d::fogFragment[1] = (this.fogColor >> 8 & 0xFF) / 255;
                  this.alternativa3d::fogFragment[2] = (this.fogColor & 0xFF) / 255;
                  this.alternativa3d::fogFragment[3] = this.fogAlpha * this.fogStrength;
                  this.alternativa3d::device.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT,2,this.alternativa3d::fogFragment,1);
               }
               if(!this.view.alternativa3d::constrained && this.directionalLight != null && this.directionalLightStrength > 0)
               {
                  this.lightTransform[0] = -this.directionalLight.alternativa3d::imi;
                  this.lightTransform[1] = -this.directionalLight.alternativa3d::imj;
                  this.lightTransform[2] = -this.directionalLight.alternativa3d::imk;
                  this.alternativa3d::device.setProgramConstantsFromVector(Context3DProgramType.VERTEX,10,this.lightTransform,1);
                  this.lightParams[0] = this.directionalLight.intensity * (this.directionalLight.color >> 16 & 0xFF) * 2 * this.directionalLightStrength / 255;
                  this.lightParams[1] = this.directionalLight.intensity * (this.directionalLight.color >> 8 & 0xFF) * 2 * this.directionalLightStrength / 255;
                  this.lightParams[2] = this.directionalLight.intensity * (this.directionalLight.color & 0xFF) * 2 * this.directionalLightStrength / 255;
                  this.lightParams[4] = 1 + ((this.ambientColor >> 16 & 0xFF) * 2 / 255 - 1) * this.directionalLightStrength;
                  this.lightParams[5] = 1 + ((this.ambientColor >> 8 & 0xFF) * 2 / 255 - 1) * this.directionalLightStrength;
                  this.lightParams[6] = 1 + ((this.ambientColor & 0xFF) * 2 / 255 - 1) * this.directionalLightStrength;
                  this.alternativa3d::device.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT,10,this.lightParams,2);
               }
               else if(!this.view.alternativa3d::constrained && this.shadowMap != null && this.shadowMapStrength > 0)
               {
                  this.lightParams[0] = 0;
                  this.lightParams[1] = 0;
                  this.lightParams[2] = 0;
                  this.lightParams[4] = 1;
                  this.lightParams[5] = 1;
                  this.lightParams[6] = 1;
                  this.alternativa3d::device.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT,10,this.lightParams,2);
               }
               _loc1_ = 0;
               while(_loc1_ < this.opaqueCount)
               {
                  _loc9_ = this.opaqueMaterials[_loc1_];
                  _loc9_.alternativa3d::drawOpaque(this,this.opaqueVertexBuffers[_loc1_],this.opaqueIndexBuffers[_loc1_],this.opaqueFirstIndexes[_loc1_],this.opaqueNumsTriangles[_loc1_],this.opaqueObjects[_loc1_]);
                  _loc1_++;
               }
               this.alternativa3d::device.setDepthTest(false,Context3DCompareMode.LESS_EQUAL);
               _loc1_ = 0;
               while(_loc1_ < this.skyCount)
               {
                  _loc9_ = this.skyMaterials[_loc1_];
                  _loc9_.alternativa3d::drawOpaque(this,this.skyVertexBuffers[_loc1_],this.skyIndexBuffers[_loc1_],this.skyFirstIndexes[_loc1_],this.skyNumsTriangles[_loc1_],this.skyObjects[_loc1_]);
                  _loc1_++;
               }
               this.alternativa3d::device.setDepthTest(false,Context3DCompareMode.LESS);
               _loc1_ = this.decalsCount - 1;
               while(_loc1_ >= 0)
               {
                  _loc11_ = this.decals[_loc1_];
                  if(_loc11_.alternativa3d::concatenatedBlendMode != "normal")
                  {
                     this.alternativa3d::device.setBlendFactors(Context3DBlendFactor.SOURCE_ALPHA,Context3DBlendFactor.ONE);
                  }
                  else
                  {
                     this.alternativa3d::device.setBlendFactors(Context3DBlendFactor.SOURCE_ALPHA,Context3DBlendFactor.ONE_MINUS_SOURCE_ALPHA);
                  }
                  _loc11_.alternativa3d::faceList.material.alternativa3d::drawOpaque(this,_loc11_.alternativa3d::vertexBuffer,_loc11_.alternativa3d::indexBuffer,0,_loc11_.alternativa3d::numTriangles,_loc11_);
                  _loc1_--;
               }
               if(_loc8_)
               {
                  this.alternativa3d::device.setTextureAt(0,null);
                  this.alternativa3d::device.setTextureAt(1,null);
                  this.alternativa3d::device.setTextureAt(2,null);
                  this.alternativa3d::device.setTextureAt(3,null);
                  this.alternativa3d::device.setTextureAt(5,null);
                  this.alternativa3d::device.setVertexBufferAt(1,null);
                  this.alternativa3d::device.setVertexBufferAt(2,null);
                  _loc12_ = 0;
                  for each(_loc7_ in this.alternativa3d::shadowAtlases)
                  {
                     _loc1_ = 0;
                     while(_loc1_ < _loc7_.alternativa3d::shadowsCount)
                     {
                        this.shadowList[_loc12_] = _loc7_.alternativa3d::shadows[_loc1_];
                        _loc12_++;
                        _loc1_++;
                     }
                  }
                  this.alternativa3d::device.setDepthTest(false,Context3DCompareMode.LESS);
                  _loc15_ = null;
                  _loc1_ = 0;
                  while(_loc1_ < _loc12_)
                  {
                     if(_loc1_ > 0)
                     {
                        this.alternativa3d::device.clear(0,0,0,0,1,0,Context3DClearMask.STENCIL);
                     }
                     this.alternativa3d::device.setBlendFactors(Context3DBlendFactor.ZERO,Context3DBlendFactor.ONE);
                     this.alternativa3d::device.setCulling(Context3DTriangleFace.NONE);
                     this.alternativa3d::device.setStencilActions(Context3DTriangleFace.FRONT_AND_BACK,Context3DCompareMode.ALWAYS,Context3DStencilAction.INVERT);
                     _loc13_ = _loc1_;
                     _loc14_ = 1;
                     while(_loc13_ < _loc1_ + 8 && _loc13_ < _loc12_)
                     {
                        _loc4_ = this.shadowList[_loc13_];
                        if(!_loc4_.cameraInside)
                        {
                           this.alternativa3d::device.setStencilReferenceValue(_loc14_,_loc14_,_loc14_);
                           _loc4_.renderVolume(this);
                        }
                        _loc13_++;
                        _loc14_ <<= 1;
                     }
                     this.alternativa3d::device.setBlendFactors(Context3DBlendFactor.SOURCE_ALPHA,Context3DBlendFactor.ONE_MINUS_SOURCE_ALPHA);
                     this.alternativa3d::device.setCulling(Context3DTriangleFace.FRONT);
                     this.alternativa3d::device.setStencilActions(Context3DTriangleFace.BACK,Context3DCompareMode.EQUAL);
                     _loc13_ = _loc1_;
                     _loc14_ = 1;
                     while(_loc13_ < _loc1_ + 8 && _loc13_ < _loc12_)
                     {
                        _loc4_ = this.shadowList[_loc13_];
                        if(_loc4_.texture != _loc15_)
                        {
                           this.alternativa3d::device.setTextureAt(0,_loc4_.texture);
                           _loc15_ = _loc4_.texture;
                        }
                        if(!_loc4_.cameraInside)
                        {
                           this.alternativa3d::device.setStencilReferenceValue(_loc14_,_loc14_,_loc14_);
                           _loc4_.renderReceivers(this);
                        }
                        else
                        {
                           this.alternativa3d::device.setStencilActions(Context3DTriangleFace.BACK,Context3DCompareMode.ALWAYS);
                           _loc4_.renderReceivers(this);
                           this.alternativa3d::device.setStencilActions(Context3DTriangleFace.BACK,Context3DCompareMode.EQUAL);
                        }
                        _loc13_++;
                        _loc14_ <<= 1;
                     }
                     this.alternativa3d::device.setTextureAt(0,null);
                     _loc15_ = null;
                     _loc1_ += 8;
                  }
                  this.alternativa3d::device.setStencilActions();
                  this.alternativa3d::device.setStencilReferenceValue(0);
               }
               this.alternativa3d::device.setProgramConstantsFromVector(Context3DProgramType.VERTEX,13,this.alternativa3d::correction,1);
               this.alternativa3d::device.setCulling(Context3DTriangleFace.FRONT);
               _loc1_ = 0;
               while(_loc1_ < this.transparentOpaqueCount)
               {
                  if(_loc1_ < this.transparentOpaqueFaceLists.length && _loc1_ < this.transparentOpaqueObjects.length)
                  {
                     this.transparentFaceLists[this.transparentCount] = this.transparentOpaqueFaceLists[_loc1_];
                     this.transparentObjects[this.transparentCount] = this.transparentOpaqueObjects[_loc1_];
                     ++this.transparentCount;
                  }
                  _loc1_++;
               }
               this.transparentOpaqueCount = this.transparentCount - this.transparentOpaqueCount;
               this.alternativa3d::device.setDepthTest(true,Context3DCompareMode.LESS);
               _loc1_ = this.transparentCount - 1;
               while(_loc1_ >= 0)
               {
                  if(_loc1_ + 1 == this.transparentOpaqueCount)
                  {
                     this.alternativa3d::device.setDepthTest(false,Context3DCompareMode.LESS);
                  }
                  _loc16_ = this.transparentFaceLists[_loc1_];
                  _loc17_ = this.transparentObjects[_loc1_];
                  if(_loc17_.alternativa3d::concatenatedBlendMode != "normal")
                  {
                     this.alternativa3d::device.setBlendFactors(Context3DBlendFactor.SOURCE_ALPHA,Context3DBlendFactor.ONE);
                  }
                  else
                  {
                     this.alternativa3d::device.setBlendFactors(Context3DBlendFactor.SOURCE_ALPHA,Context3DBlendFactor.ONE_MINUS_SOURCE_ALPHA);
                  }
                  _loc18_ = _loc17_ is Sprite3D;
                  if(_loc18_)
                  {
                     _loc20_ = 0;
                     _loc21_ = Sprite3D(_loc17_);
                     _loc22_ = _loc16_;
                     while(_loc22_.alternativa3d::processNext != null)
                     {
                        _loc22_.alternativa3d::distance = _loc20_;
                        _loc22_ = _loc22_.alternativa3d::processNext;
                     }
                     _loc22_.alternativa3d::distance = _loc20_;
                     this.transparentBatchObjects[_loc20_] = _loc17_;
                     _loc20_++;
                     _loc13_ = _loc1_ - 1;
                     while(_loc13_ >= 0)
                     {
                        _loc23_ = this.transparentFaceLists[_loc13_];
                        if(_loc16_.material != _loc23_.material)
                        {
                           break;
                        }
                        _loc24_ = this.transparentObjects[_loc13_];
                        if(!(_loc24_ is Sprite3D))
                        {
                           break;
                        }
                        _loc25_ = Sprite3D(_loc24_);
                        if(_loc21_.useLight != _loc25_.useLight || _loc21_.useShadowMap != _loc25_.useShadowMap || _loc21_.alternativa3d::lighted || _loc25_.alternativa3d::lighted || _loc21_.softAttenuation != _loc25_.softAttenuation || _loc21_.alternativa3d::concatenatedAlpha != _loc25_.alternativa3d::concatenatedAlpha || _loc21_.alternativa3d::concatenatedColorTransform != null || _loc25_.alternativa3d::concatenatedColorTransform != null || _loc21_.alternativa3d::concatenatedBlendMode != _loc25_.alternativa3d::concatenatedBlendMode)
                        {
                           break;
                        }
                        _loc22_.alternativa3d::processNext = _loc23_;
                        _loc22_ = _loc23_;
                        while(_loc22_.alternativa3d::processNext != null)
                        {
                           _loc22_.alternativa3d::distance = _loc20_;
                           _loc22_ = _loc22_.alternativa3d::processNext;
                        }
                        _loc22_.alternativa3d::distance = _loc20_;
                        this.transparentBatchObjects[_loc20_] = _loc24_;
                        _loc20_++;
                        _loc1_--;
                        _loc13_--;
                     }
                  }
                  _loc19_ = _loc18_ && !Sprite3D(_loc17_).depthTest;
                  if(_loc19_)
                  {
                     this.alternativa3d::device.setDepthTest(false,Context3DCompareMode.ALWAYS);
                  }
                  this.drawTransparentList(_loc16_,_loc17_,_loc18_);
                  if(_loc19_)
                  {
                     this.alternativa3d::device.setDepthTest(false,Context3DCompareMode.LESS);
                  }
                  _loc1_--;
               }
               this.alternativa3d::device.setTextureAt(0,null);
               this.alternativa3d::device.setTextureAt(1,null);
               this.alternativa3d::device.setTextureAt(2,null);
               this.alternativa3d::device.setTextureAt(3,null);
               this.alternativa3d::device.setTextureAt(5,null);
               this.alternativa3d::device.setTextureAt(6,null);
               this.alternativa3d::device.setTextureAt(7,null);
               this.alternativa3d::device.setVertexBufferAt(1,null);
               this.alternativa3d::device.setVertexBufferAt(2,null);
               this.alternativa3d::device.setVertexBufferAt(3,null);
               this.alternativa3d::device.setVertexBufferAt(4,null);
               this.alternativa3d::device.setVertexBufferAt(5,null);
               this.alternativa3d::device.setVertexBufferAt(6,null);
               this.alternativa3d::device.setVertexBufferAt(7,null);
               this.opaqueMaterials.length = 0;
               this.opaqueVertexBuffers.length = 0;
               this.opaqueIndexBuffers.length = 0;
               this.opaqueFirstIndexes.length = 0;
               this.opaqueNumsTriangles.length = 0;
               this.opaqueObjects.length = 0;
               this.opaqueCount = 0;
               this.skyMaterials.length = 0;
               this.skyVertexBuffers.length = 0;
               this.skyIndexBuffers.length = 0;
               this.skyFirstIndexes.length = 0;
               this.skyNumsTriangles.length = 0;
               this.skyObjects.length = 0;
               this.skyCount = 0;
               this.transparentFaceLists.length = 0;
               this.transparentObjects.length = 0;
               this.transparentCount = 0;
               this.transparentOpaqueFaceLists.length = 0;
               this.transparentOpaqueObjects.length = 0;
               this.transparentOpaqueCount = 0;
               this.transparentBatchObjects.length = 0;
               this.decals.length = 0;
               this.decalsCount = 0;
               this.alternativa3d::depthObjects.length = 0;
               this.alternativa3d::depthCount = 0;
               this.alternativa3d::casterObjects.length = 0;
               this.alternativa3d::casterCount = 0;
               this.alternativa3d::omnies.length = 0;
               this.alternativa3d::omniesCount = 0;
               this.alternativa3d::spots.length = 0;
               this.alternativa3d::spotsCount = 0;
               this.alternativa3d::tubes.length = 0;
               this.alternativa3d::tubesCount = 0;
               for each(_loc7_ in this.alternativa3d::shadowAtlases)
               {
                  if(_loc7_.alternativa3d::shadowsCount > 0)
                  {
                     _loc7_.alternativa3d::clear();
                  }
               }
               this.alternativa3d::receiversVertexBuffers = null;
               this.alternativa3d::receiversIndexBuffers = null;
               this.alternativa3d::deferredDestroy();
               this.alternativa3d::clearOccluders();
               this.view.alternativa3d::onRender(this);
               if(this.onRender != null)
               {
                  this.onRender();
               }
               this.view.alternativa3d::present();
            }
            else
            {
               this.view.alternativa3d::clearArea();
               if(this.onRender != null)
               {
                  this.onRender();
               }
               this.view.alternativa3d::present();
            }
            this.alternativa3d::device = null;
         }
      }
      
      private function drawTransparentList(param1:Face, param2:Object3D, param3:Boolean) : void
      {
         var _loc4_:Vertex = null;
         var _loc5_:Vertex = null;
         var _loc6_:Vertex = null;
         var _loc7_:Wrapper = null;
         var _loc8_:Face = null;
         var _loc9_:int = 0;
         var _loc10_:Object3D = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:Material = param1.material;
         while(param1 != null)
         {
            _loc8_ = param1.alternativa3d::processNext;
            param1.alternativa3d::processNext = null;
            _loc7_ = param1.alternativa3d::wrapper;
            _loc4_ = _loc7_.alternativa3d::vertex;
            _loc7_ = _loc7_.alternativa3d::next;
            _loc5_ = _loc7_.alternativa3d::vertex;
            if(param3)
            {
               _loc9_ = param1.alternativa3d::distance;
               _loc10_ = this.transparentBatchObjects[_loc9_];
               _loc7_ = _loc7_.alternativa3d::next;
               while(_loc7_ != null)
               {
                  if(_loc12_ == constantsMaxTriangles)
                  {
                     if(_loc13_ != null)
                     {
                        this.alternativa3d::device.setProgramConstantsFromVector(Context3DProgramType.VERTEX,constantsOffset,constants,_loc12_ * 6,false);
                        _loc13_.alternativa3d::drawTransparent(this,constantsVertexBuffer,constantsIndexBuffer,0,_loc12_,param2,true);
                     }
                     _loc12_ = 0;
                     _loc11_ = 0;
                  }
                  _loc6_ = _loc7_.alternativa3d::vertex;
                  constants[_loc11_] = _loc4_.alternativa3d::cameraX;
                  _loc11_++;
                  constants[_loc11_] = _loc4_.alternativa3d::cameraY;
                  _loc11_++;
                  constants[_loc11_] = _loc4_.alternativa3d::cameraZ;
                  _loc11_++;
                  constants[_loc11_] = -_loc10_.alternativa3d::md;
                  _loc11_++;
                  constants[_loc11_] = _loc4_.u;
                  _loc11_++;
                  constants[_loc11_] = _loc4_.v;
                  _loc11_++;
                  constants[_loc11_] = -_loc10_.alternativa3d::mh;
                  _loc11_++;
                  constants[_loc11_] = -_loc10_.alternativa3d::ml;
                  _loc11_++;
                  constants[_loc11_] = _loc5_.alternativa3d::cameraX;
                  _loc11_++;
                  constants[_loc11_] = _loc5_.alternativa3d::cameraY;
                  _loc11_++;
                  constants[_loc11_] = _loc5_.alternativa3d::cameraZ;
                  _loc11_++;
                  constants[_loc11_] = -_loc10_.alternativa3d::md;
                  _loc11_++;
                  constants[_loc11_] = _loc5_.u;
                  _loc11_++;
                  constants[_loc11_] = _loc5_.v;
                  _loc11_++;
                  constants[_loc11_] = -_loc10_.alternativa3d::mh;
                  _loc11_++;
                  constants[_loc11_] = -_loc10_.alternativa3d::ml;
                  _loc11_++;
                  constants[_loc11_] = _loc6_.alternativa3d::cameraX;
                  _loc11_++;
                  constants[_loc11_] = _loc6_.alternativa3d::cameraY;
                  _loc11_++;
                  constants[_loc11_] = _loc6_.alternativa3d::cameraZ;
                  _loc11_++;
                  constants[_loc11_] = -_loc10_.alternativa3d::md;
                  _loc11_++;
                  constants[_loc11_] = _loc6_.u;
                  _loc11_++;
                  constants[_loc11_] = _loc6_.v;
                  _loc11_++;
                  constants[_loc11_] = -_loc10_.alternativa3d::mh;
                  _loc11_++;
                  constants[_loc11_] = -_loc10_.alternativa3d::ml;
                  _loc11_++;
                  _loc12_++;
                  _loc5_ = _loc6_;
                  _loc7_ = _loc7_.alternativa3d::next;
               }
            }
            else
            {
               _loc7_ = _loc7_.alternativa3d::next;
               while(_loc7_ != null)
               {
                  if(_loc12_ == constantsMaxTriangles)
                  {
                     if(_loc13_ != null)
                     {
                        this.alternativa3d::device.setProgramConstantsFromVector(Context3DProgramType.VERTEX,constantsOffset,constants,_loc12_ * 6,false);
                        _loc13_.alternativa3d::drawTransparent(this,constantsVertexBuffer,constantsIndexBuffer,0,_loc12_,param2,true);
                     }
                     _loc12_ = 0;
                     _loc11_ = 0;
                  }
                  _loc6_ = _loc7_.alternativa3d::vertex;
                  constants[_loc11_] = _loc4_.alternativa3d::cameraX;
                  _loc11_++;
                  constants[_loc11_] = _loc4_.alternativa3d::cameraY;
                  _loc11_++;
                  constants[_loc11_] = _loc4_.alternativa3d::cameraZ;
                  _loc11_++;
                  constants[_loc11_] = _loc4_.normalX;
                  _loc11_++;
                  constants[_loc11_] = _loc4_.u;
                  _loc11_++;
                  constants[_loc11_] = _loc4_.v;
                  _loc11_++;
                  constants[_loc11_] = _loc4_.normalY;
                  _loc11_++;
                  constants[_loc11_] = _loc4_.normalZ;
                  _loc11_++;
                  constants[_loc11_] = _loc5_.alternativa3d::cameraX;
                  _loc11_++;
                  constants[_loc11_] = _loc5_.alternativa3d::cameraY;
                  _loc11_++;
                  constants[_loc11_] = _loc5_.alternativa3d::cameraZ;
                  _loc11_++;
                  constants[_loc11_] = _loc5_.normalX;
                  _loc11_++;
                  constants[_loc11_] = _loc5_.u;
                  _loc11_++;
                  constants[_loc11_] = _loc5_.v;
                  _loc11_++;
                  constants[_loc11_] = _loc5_.normalY;
                  _loc11_++;
                  constants[_loc11_] = _loc5_.normalZ;
                  _loc11_++;
                  constants[_loc11_] = _loc6_.alternativa3d::cameraX;
                  _loc11_++;
                  constants[_loc11_] = _loc6_.alternativa3d::cameraY;
                  _loc11_++;
                  constants[_loc11_] = _loc6_.alternativa3d::cameraZ;
                  _loc11_++;
                  constants[_loc11_] = _loc6_.normalX;
                  _loc11_++;
                  constants[_loc11_] = _loc6_.u;
                  _loc11_++;
                  constants[_loc11_] = _loc6_.v;
                  _loc11_++;
                  constants[_loc11_] = _loc6_.normalY;
                  _loc11_++;
                  constants[_loc11_] = _loc6_.normalZ;
                  _loc11_++;
                  _loc12_++;
                  _loc5_ = _loc6_;
                  _loc7_ = _loc7_.alternativa3d::next;
               }
            }
            param1 = _loc8_;
         }
         if(_loc12_ > 0 && _loc13_ != null)
         {
            this.alternativa3d::device.setProgramConstantsFromVector(Context3DProgramType.VERTEX,constantsOffset,constants,_loc12_ * 6,false);
            _loc13_.alternativa3d::drawTransparent(this,constantsVertexBuffer,constantsIndexBuffer,0,_loc12_,param2,true);
         }
      }
      
      public function lookAt(param1:Number, param2:Number, param3:Number) : void
      {
         var _loc4_:Number = param1 - this.x;
         var _loc5_:Number = param2 - this.y;
         var _loc6_:Number = param3 - this.z;
         rotationX = Math.atan2(_loc6_,Math.sqrt(_loc4_ * _loc4_ + _loc5_ * _loc5_)) - Math.PI / 2;
         rotationY = 0;
         rotationZ = -Math.atan2(_loc4_,_loc5_);
      }
      
      public function projectGlobal(param1:Vector3D) : Vector3D
      {
         if(this.view == null)
         {
            throw new Error("It is necessary to have view set.");
         }
         this.alternativa3d::viewSizeX = this.view.alternativa3d::_width * 0.5;
         this.alternativa3d::viewSizeY = this.view.alternativa3d::_height * 0.5;
         this.alternativa3d::focalLength = Math.sqrt(this.alternativa3d::viewSizeX * this.alternativa3d::viewSizeX + this.alternativa3d::viewSizeY * this.alternativa3d::viewSizeY) / Math.tan(this.fov * 0.5);
         this.alternativa3d::composeCameraMatrix();
         var _loc2_:Object3D = this;
         while(_loc2_.alternativa3d::_parent != null)
         {
            _loc2_ = _loc2_.alternativa3d::_parent;
            alternativa3d::tA.alternativa3d::composeMatrixFromSource(_loc2_);
            alternativa3d::appendMatrix(alternativa3d::tA);
         }
         alternativa3d::invertMatrix();
         var _loc3_:Vector3D = new Vector3D();
         _loc3_.x = alternativa3d::ma * param1.x + alternativa3d::mb * param1.y + alternativa3d::mc * param1.z + alternativa3d::md;
         _loc3_.y = alternativa3d::me * param1.x + alternativa3d::mf * param1.y + alternativa3d::mg * param1.z + alternativa3d::mh;
         _loc3_.z = alternativa3d::mi * param1.x + alternativa3d::mj * param1.y + alternativa3d::mk * param1.z + alternativa3d::ml;
         _loc3_.x = _loc3_.x * this.alternativa3d::viewSizeX / _loc3_.z + this.alternativa3d::viewSizeX;
         _loc3_.y = _loc3_.y * this.alternativa3d::viewSizeY / _loc3_.z + this.alternativa3d::viewSizeY;
         return _loc3_;
      }
      
      public function calculateRay(param1:Vector3D, param2:Vector3D, param3:Number, param4:Number) : void
      {
         if(this.view == null)
         {
            throw new Error("It is necessary to have view set.");
         }
         this.alternativa3d::viewSizeX = this.view.alternativa3d::_width * 0.5;
         this.alternativa3d::viewSizeY = this.view.alternativa3d::_height * 0.5;
         this.alternativa3d::focalLength = Math.sqrt(this.alternativa3d::viewSizeX * this.alternativa3d::viewSizeX + this.alternativa3d::viewSizeY * this.alternativa3d::viewSizeY) / Math.tan(this.fov * 0.5);
         param3 -= this.alternativa3d::viewSizeX;
         param4 -= this.alternativa3d::viewSizeY;
         var _loc5_:Number = param3 * this.alternativa3d::focalLength / this.alternativa3d::viewSizeX;
         var _loc6_:Number = param4 * this.alternativa3d::focalLength / this.alternativa3d::viewSizeY;
         var _loc7_:Number = this.alternativa3d::focalLength;
         var _loc8_:Number = _loc5_ * this.nearClipping / this.alternativa3d::focalLength;
         var _loc9_:Number = _loc6_ * this.nearClipping / this.alternativa3d::focalLength;
         var _loc10_:Number = this.nearClipping;
         this.alternativa3d::composeCameraMatrix();
         var _loc11_:Object3D = this;
         while(_loc11_.alternativa3d::_parent != null)
         {
            _loc11_ = _loc11_.alternativa3d::_parent;
            alternativa3d::tA.alternativa3d::composeMatrixFromSource(_loc11_);
            alternativa3d::appendMatrix(alternativa3d::tA);
         }
         param1.x = alternativa3d::ma * _loc8_ + alternativa3d::mb * _loc9_ + alternativa3d::mc * _loc10_ + alternativa3d::md;
         param1.y = alternativa3d::me * _loc8_ + alternativa3d::mf * _loc9_ + alternativa3d::mg * _loc10_ + alternativa3d::mh;
         param1.z = alternativa3d::mi * _loc8_ + alternativa3d::mj * _loc9_ + alternativa3d::mk * _loc10_ + alternativa3d::ml;
         param2.x = alternativa3d::ma * _loc5_ + alternativa3d::mb * _loc6_ + alternativa3d::mc * _loc7_;
         param2.y = alternativa3d::me * _loc5_ + alternativa3d::mf * _loc6_ + alternativa3d::mg * _loc7_;
         param2.z = alternativa3d::mi * _loc5_ + alternativa3d::mj * _loc6_ + alternativa3d::mk * _loc7_;
         var _loc12_:Number = 1 / Math.sqrt(param2.x * param2.x + param2.y * param2.y + param2.z * param2.z);
         param2.x *= _loc12_;
         param2.y *= _loc12_;
         param2.z *= _loc12_;
      }
      
      override public function clone() : Object3D
      {
         var _loc1_:Camera3D = new Camera3D();
         _loc1_.clonePropertiesFrom(this);
         return _loc1_;
      }
      
      override protected function clonePropertiesFrom(param1:Object3D) : void
      {
         var _loc2_:* = undefined;
         super.clonePropertiesFrom(param1);
         var _loc3_:Camera3D = param1 as Camera3D;
         this.fov = _loc3_.fov;
         this.nearClipping = _loc3_.nearClipping;
         this.farClipping = _loc3_.farClipping;
         this.debug = _loc3_.debug;
         this.fogNear = _loc3_.fogNear;
         this.fogFar = _loc3_.fogFar;
         this.fogAlpha = _loc3_.fogAlpha;
         this.fogColor = _loc3_.fogColor;
         this.softTransparency = _loc3_.softTransparency;
         this.depthBufferScale = _loc3_.depthBufferScale;
         this.ssao = _loc3_.ssao;
         this.ssaoRadius = _loc3_.ssaoRadius;
         this.ssaoRange = _loc3_.ssaoRange;
         this.ssaoColor = _loc3_.ssaoColor;
         this.ssaoAlpha = _loc3_.ssaoAlpha;
         this.directionalLight = _loc3_.directionalLight;
         this.shadowMap = _loc3_.shadowMap;
         this.ambientColor = _loc3_.ambientColor;
         this.deferredLighting = _loc3_.deferredLighting;
         this.fogStrength = _loc3_.fogStrength;
         this.softTransparencyStrength = _loc3_.softTransparencyStrength;
         this.ssaoStrength = _loc3_.ssaoStrength;
         this.directionalLightStrength = _loc3_.directionalLightStrength;
         this.shadowMapStrength = _loc3_.shadowMapStrength;
         this.shadowsStrength = _loc3_.shadowsStrength;
         this.shadowsDistanceMultiplier = _loc3_.shadowsDistanceMultiplier;
         this.deferredLightingStrength = _loc3_.deferredLightingStrength;
         for(_loc2_ in _loc3_.shadows)
         {
            this.shadows[_loc2_] = true;
         }
      }
      
      alternativa3d function addOpaque(param1:Material, param2:VertexBufferResource, param3:IndexBufferResource, param4:int, param5:int, param6:Object3D) : void
      {
         this.opaqueMaterials[this.opaqueCount] = param1;
         this.opaqueVertexBuffers[this.opaqueCount] = param2;
         this.opaqueIndexBuffers[this.opaqueCount] = param3;
         this.opaqueFirstIndexes[this.opaqueCount] = param4;
         this.opaqueNumsTriangles[this.opaqueCount] = param5;
         this.opaqueObjects[this.opaqueCount] = param6;
         ++this.opaqueCount;
      }
      
      alternativa3d function addSky(param1:Material, param2:VertexBufferResource, param3:IndexBufferResource, param4:int, param5:int, param6:Object3D) : void
      {
         this.skyMaterials[this.skyCount] = param1;
         this.skyVertexBuffers[this.skyCount] = param2;
         this.skyIndexBuffers[this.skyCount] = param3;
         this.skyFirstIndexes[this.skyCount] = param4;
         this.skyNumsTriangles[this.skyCount] = param5;
         this.skyObjects[this.skyCount] = param6;
         ++this.skyCount;
      }
      
      alternativa3d function addTransparent(param1:Face, param2:Object3D) : void
      {
         this.transparentFaceLists[this.transparentCount] = param1;
         this.transparentObjects[this.transparentCount] = param2;
         ++this.transparentCount;
      }
      
      alternativa3d function addTransparentOpaque(param1:Face, param2:Object3D) : void
      {
         this.transparentOpaqueFaceLists[this.transparentOpaqueCount] = param1;
         this.transparentOpaqueObjects[this.transparentOpaqueCount] = param2;
         ++this.transparentOpaqueCount;
      }
      
      alternativa3d function addDecal(param1:Decal) : void
      {
         this.decals[this.decalsCount] = param1;
         ++this.decalsCount;
      }
      
      alternativa3d function composeCameraMatrix() : void
      {
         var _loc1_:Number = this.alternativa3d::viewSizeX / this.alternativa3d::focalLength;
         var _loc2_:Number = this.alternativa3d::viewSizeY / this.alternativa3d::focalLength;
         var _loc3_:Number = Math.cos(rotationX);
         var _loc4_:Number = Math.sin(rotationX);
         var _loc5_:Number = Math.cos(rotationY);
         var _loc6_:Number = Math.sin(rotationY);
         var _loc7_:Number = Math.cos(rotationZ);
         var _loc8_:Number = Math.sin(rotationZ);
         var _loc9_:Number = _loc7_ * _loc6_;
         var _loc10_:Number = _loc8_ * _loc6_;
         var _loc11_:Number = _loc5_ * scaleX;
         var _loc12_:Number = _loc4_ * scaleY;
         var _loc13_:Number = _loc3_ * scaleY;
         var _loc14_:Number = _loc3_ * scaleZ;
         var _loc15_:Number = _loc4_ * scaleZ;
         alternativa3d::ma = _loc7_ * _loc11_ * _loc1_;
         alternativa3d::mb = (_loc9_ * _loc12_ - _loc8_ * _loc13_) * _loc2_;
         alternativa3d::mc = _loc9_ * _loc14_ + _loc8_ * _loc15_;
         alternativa3d::md = x;
         alternativa3d::me = _loc8_ * _loc11_ * _loc1_;
         alternativa3d::mf = (_loc10_ * _loc12_ + _loc7_ * _loc13_) * _loc2_;
         alternativa3d::mg = _loc10_ * _loc14_ - _loc7_ * _loc15_;
         alternativa3d::mh = y;
         alternativa3d::mi = -_loc6_ * scaleX * _loc1_;
         alternativa3d::mj = _loc5_ * _loc12_ * _loc2_;
         alternativa3d::mk = _loc5_ * _loc14_;
         alternativa3d::ml = z;
         var _loc16_:Number = this.view.offsetX / this.alternativa3d::viewSizeX;
         var _loc17_:Number = this.view.offsetY / this.alternativa3d::viewSizeY;
         alternativa3d::mc -= alternativa3d::ma * _loc16_ + alternativa3d::mb * _loc17_;
         alternativa3d::mg -= alternativa3d::me * _loc16_ + alternativa3d::mf * _loc17_;
         alternativa3d::mk -= alternativa3d::mi * _loc16_ + alternativa3d::mj * _loc17_;
      }
      
      public function addToDebug(param1:int, param2:*) : void
      {
         if(!this.debugSet[param1])
         {
            this.debugSet[param1] = new Dictionary();
         }
         this.debugSet[param1][param2] = true;
      }
      
      public function removeFromDebug(param1:int, param2:*) : void
      {
         var _loc3_:* = undefined;
         if(this.debugSet[param1])
         {
            delete this.debugSet[param1][param2];
            for(_loc3_ in this.debugSet[param1])
            {
            }
            if(!_loc3_)
            {
               delete this.debugSet[param1];
            }
         }
      }
      
      alternativa3d function checkInDebug(param1:Object3D) : int
      {
         var _loc2_:Class = null;
         var _loc3_:int = 0;
         var _loc4_:int = 1;
         while(_loc4_ <= 512)
         {
            if(this.debugSet[_loc4_])
            {
               if(Boolean(this.debugSet[_loc4_][Object3D]) || Boolean(this.debugSet[_loc4_][param1]))
               {
                  _loc3_ = _loc3_ | _loc4_;
               }
               else
               {
                  _loc2_ = getDefinitionByName(getQualifiedClassName(param1)) as Class;
                  while(_loc2_ != Object3D)
                  {
                     if(this.debugSet[_loc4_][_loc2_])
                     {
                        _loc3_ = _loc3_ | _loc4_;
                        break;
                     }
                     _loc2_ = Class(getDefinitionByName(getQualifiedSuperclassName(_loc2_)));
                  }
               }
            }
            _loc4_ = _loc4_ << 1;
         }
         return _loc3_;
      }
      
      public function startTimer() : void
      {
         this.timer = getTimer();
      }
      
      public function stopTimer() : void
      {
         this.timeSum = this.timeSum + (getTimer() - this.timer);
         this.timeCount++;
      }
      
      public function get diagram() : DisplayObject
      {
         return this._diagram;
      }
      
      public function get diagramAlign() : String
      {
         return this._diagramAlign;
      }
      
      public function set diagramAlign(param1:String) : void
      {
         this._diagramAlign = param1;
         this.resizeDiagram();
      }
      
      public function get diagramHorizontalMargin() : Number
      {
         return this._diagramHorizontalMargin;
      }
      
      public function set diagramHorizontalMargin(param1:Number) : void
      {
         this._diagramHorizontalMargin = param1;
         this.resizeDiagram();
      }
      
      public function get diagramVerticalMargin() : Number
      {
         return this._diagramVerticalMargin;
      }
      
      public function set diagramVerticalMargin(param1:Number) : void
      {
         this._diagramVerticalMargin = param1;
         this.resizeDiagram();
      }
      
      private function createDiagram() : Sprite
      {
         var diagram:Sprite = null;
         diagram = null;
         diagram = new Sprite();
         diagram.mouseEnabled = false;
         diagram.mouseChildren = false;
         diagram.addEventListener(Event.ADDED_TO_STAGE,function():void
         {
            while(diagram.numChildren > 0)
            {
               diagram.removeChildAt(0);
            }
            fpsTextField = new TextField();
            fpsTextField.defaultTextFormat = new TextFormat("Tahoma",10,13421772);
            fpsTextField.autoSize = TextFieldAutoSize.LEFT;
            fpsTextField.text = "FPS:";
            fpsTextField.selectable = false;
            fpsTextField.x = -3;
            fpsTextField.y = -5;
            diagram.addChild(fpsTextField);
            fpsTextField = new TextField();
            fpsTextField.defaultTextFormat = new TextFormat("Tahoma",10,13421772);
            fpsTextField.autoSize = TextFieldAutoSize.RIGHT;
            fpsTextField.text = Number(diagram.stage.frameRate).toFixed(2);
            fpsTextField.selectable = false;
            fpsTextField.x = -3;
            fpsTextField.y = -5;
            fpsTextField.width = 65;
            diagram.addChild(fpsTextField);
            timerTextField = new TextField();
            timerTextField.defaultTextFormat = new TextFormat("Tahoma",10,26367);
            timerTextField.autoSize = TextFieldAutoSize.LEFT;
            timerTextField.text = "MS:";
            timerTextField.selectable = false;
            timerTextField.x = -3;
            timerTextField.y = 4;
            diagram.addChild(timerTextField);
            timerTextField = new TextField();
            timerTextField.defaultTextFormat = new TextFormat("Tahoma",10,26367);
            timerTextField.autoSize = TextFieldAutoSize.RIGHT;
            timerTextField.text = "";
            timerTextField.selectable = false;
            timerTextField.x = -3;
            timerTextField.y = 4;
            timerTextField.width = 65;
            diagram.addChild(timerTextField);
            memoryTextField = new TextField();
            memoryTextField.defaultTextFormat = new TextFormat("Tahoma",10,13421568);
            memoryTextField.autoSize = TextFieldAutoSize.LEFT;
            memoryTextField.text = "MEM:";
            memoryTextField.selectable = false;
            memoryTextField.x = -3;
            memoryTextField.y = 13;
            diagram.addChild(memoryTextField);
            memoryTextField = new TextField();
            memoryTextField.defaultTextFormat = new TextFormat("Tahoma",10,13421568);
            memoryTextField.autoSize = TextFieldAutoSize.RIGHT;
            memoryTextField.text = bytesToString(System.totalMemory);
            memoryTextField.selectable = false;
            memoryTextField.x = -3;
            memoryTextField.y = 13;
            memoryTextField.width = 65;
            diagram.addChild(memoryTextField);
            drawsTextField = new TextField();
            drawsTextField.defaultTextFormat = new TextFormat("Tahoma",10,52224);
            drawsTextField.autoSize = TextFieldAutoSize.LEFT;
            drawsTextField.text = "DRW:";
            drawsTextField.selectable = false;
            drawsTextField.x = -3;
            drawsTextField.y = 22;
            diagram.addChild(drawsTextField);
            drawsTextField = new TextField();
            drawsTextField.defaultTextFormat = new TextFormat("Tahoma",10,52224);
            drawsTextField.autoSize = TextFieldAutoSize.RIGHT;
            drawsTextField.text = "0";
            drawsTextField.selectable = false;
            drawsTextField.x = -3;
            drawsTextField.y = 22;
            drawsTextField.width = 52;
            diagram.addChild(drawsTextField);
            shadowsTextField = new TextField();
            shadowsTextField.defaultTextFormat = new TextFormat("Tahoma",10,16711731);
            shadowsTextField.autoSize = TextFieldAutoSize.LEFT;
            shadowsTextField.text = "SHD:";
            shadowsTextField.selectable = false;
            shadowsTextField.x = -3;
            shadowsTextField.y = 31;
            diagram.addChild(shadowsTextField);
            shadowsTextField = new TextField();
            shadowsTextField.defaultTextFormat = new TextFormat("Tahoma",10,16711731);
            shadowsTextField.autoSize = TextFieldAutoSize.RIGHT;
            shadowsTextField.text = "0";
            shadowsTextField.selectable = false;
            shadowsTextField.x = -3;
            shadowsTextField.y = 31;
            shadowsTextField.width = 52;
            diagram.addChild(shadowsTextField);
            trianglesTextField = new TextField();
            trianglesTextField.defaultTextFormat = new TextFormat("Tahoma",10,16737792);
            trianglesTextField.autoSize = TextFieldAutoSize.LEFT;
            trianglesTextField.text = "TRI:";
            trianglesTextField.selectable = false;
            trianglesTextField.x = -3;
            trianglesTextField.y = 40;
            diagram.addChild(trianglesTextField);
            trianglesTextField = new TextField();
            trianglesTextField.defaultTextFormat = new TextFormat("Tahoma",10,16737792);
            trianglesTextField.autoSize = TextFieldAutoSize.RIGHT;
            trianglesTextField.text = "0";
            trianglesTextField.selectable = false;
            trianglesTextField.x = -3;
            trianglesTextField.y = 40;
            trianglesTextField.width = 52;
            diagram.addChild(trianglesTextField);
            graph = new Bitmap(new BitmapData(60,40,true,553648127));
            rect = new Rectangle(0,0,1,40);
            graph.x = 0;
            graph.y = 54;
            diagram.addChild(graph);
            previousPeriodTime = getTimer();
            previousFrameTime = previousPeriodTime;
            fpsUpdateCounter = 0;
            maxMemory = 0;
            timerUpdateCounter = 0;
            timeSum = 0;
            timeCount = 0;
            diagram.stage.addEventListener(Event.ENTER_FRAME,updateDiagram,false,-1000);
            diagram.stage.addEventListener(Event.RESIZE,resizeDiagram,false,-1000);
            resizeDiagram();
         });
         diagram.addEventListener(Event.REMOVED_FROM_STAGE,function():void
         {
            while(diagram.numChildren > 0)
            {
               diagram.removeChildAt(0);
            }
            fpsTextField = null;
            memoryTextField = null;
            drawsTextField = null;
            shadowsTextField = null;
            trianglesTextField = null;
            timerTextField = null;
            graph.bitmapData.dispose();
            graph = null;
            rect = null;
            diagram.stage.removeEventListener(Event.ENTER_FRAME,updateDiagram);
            diagram.stage.removeEventListener(Event.RESIZE,resizeDiagram);
         });
         return diagram;
      }
      
      private function resizeDiagram(param1:Event = null) : void
      {
         var _loc2_:Point = null;
         if(this._diagram.stage != null)
         {
            _loc2_ = this._diagram.parent.globalToLocal(new Point());
            if(this._diagramAlign == StageAlign.TOP_LEFT || this._diagramAlign == StageAlign.LEFT || this._diagramAlign == StageAlign.BOTTOM_LEFT)
            {
               this._diagram.x = Math.round(_loc2_.x + this._diagramHorizontalMargin);
            }
            if(this._diagramAlign == StageAlign.TOP || this._diagramAlign == StageAlign.BOTTOM)
            {
               this._diagram.x = Math.round(_loc2_.x + this._diagram.stage.stageWidth / 2 - this.graph.width / 2);
            }
            if(this._diagramAlign == StageAlign.TOP_RIGHT || this._diagramAlign == StageAlign.RIGHT || this._diagramAlign == StageAlign.BOTTOM_RIGHT)
            {
               this._diagram.x = Math.round(_loc2_.x + this._diagram.stage.stageWidth - this._diagramHorizontalMargin - this.graph.width);
            }
            if(this._diagramAlign == StageAlign.TOP_LEFT || this._diagramAlign == StageAlign.TOP || this._diagramAlign == StageAlign.TOP_RIGHT)
            {
               this._diagram.y = Math.round(_loc2_.y + this._diagramVerticalMargin);
            }
            if(this._diagramAlign == StageAlign.LEFT || this._diagramAlign == StageAlign.RIGHT)
            {
               this._diagram.y = Math.round(_loc2_.y + this._diagram.stage.stageHeight / 2 - (this.graph.y + this.graph.height) / 2);
            }
            if(this._diagramAlign == StageAlign.BOTTOM_LEFT || this._diagramAlign == StageAlign.BOTTOM || this._diagramAlign == StageAlign.BOTTOM_RIGHT)
            {
               this._diagram.y = Math.round(_loc2_.y + this._diagram.stage.stageHeight - this._diagramVerticalMargin - this.graph.y - this.graph.height);
            }
         }
      }
      
      private function updateDiagram(param1:Event) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:int = 0;
         var _loc4_:String = null;
         var _loc5_:int = getTimer();
         var _loc6_:int = this._diagram.stage.frameRate;
         if(++this.fpsUpdateCounter == this.fpsUpdatePeriod)
         {
            _loc2_ = 1000 * this.fpsUpdatePeriod / (_loc5_ - this.previousPeriodTime);
            if(_loc2_ > _loc6_)
            {
               _loc2_ = _loc6_;
            }
            _loc3_ = _loc2_ * 100 % 100;
            _loc4_ = _loc3_ >= 10 ? String(_loc3_) : (_loc3_ > 0 ? "0" + String(_loc3_) : "00");
            this.fpsTextField.text = int(_loc2_) + "." + _loc4_;
            this.previousPeriodTime = _loc5_;
            this.fpsUpdateCounter = 0;
         }
         _loc2_ = 1000 / (_loc5_ - this.previousFrameTime);
         if(_loc2_ > _loc6_)
         {
            _loc2_ = _loc6_;
         }
         this.graph.bitmapData.scroll(1,0);
         this.graph.bitmapData.fillRect(this.rect,553648127);
         this.graph.bitmapData.setPixel32(0,40 * (1 - _loc2_ / _loc6_),4291611852);
         this.previousFrameTime = _loc5_;
         if(++this.timerUpdateCounter == this.timerUpdatePeriod)
         {
            if(this.timeCount > 0)
            {
               _loc2_ = this.timeSum / this.timeCount;
               _loc3_ = _loc2_ * 100 % 100;
               _loc4_ = _loc3_ >= 10 ? String(_loc3_) : (_loc3_ > 0 ? "0" + String(_loc3_) : "00");
               this.timerTextField.text = int(_loc2_) + "." + _loc4_;
            }
            else
            {
               this.timerTextField.text = "";
            }
            this.timerUpdateCounter = 0;
            this.timeSum = 0;
            this.timeCount = 0;
         }
         var _loc7_:int = int(System.totalMemory);
         _loc2_ = _loc7_ / 1048576;
         _loc3_ = _loc2_ * 100 % 100;
         _loc4_ = _loc3_ >= 10 ? String(_loc3_) : (_loc3_ > 0 ? "0" + String(_loc3_) : "00");
         this.memoryTextField.text = int(_loc2_) + "." + _loc4_;
         if(_loc7_ > this.maxMemory)
         {
            this.maxMemory = _loc7_;
         }
         this.graph.bitmapData.setPixel32(0,40 * (1 - _loc7_ / this.maxMemory),4291611648);
         this.drawsTextField.text = String(this.alternativa3d::numDraws);
         this.shadowsTextField.text = String(this.alternativa3d::numShadows);
         this.trianglesTextField.text = String(this.alternativa3d::numTriangles);
      }
      
      private function bytesToString(param1:int) : String
      {
         if(param1 < 1024)
         {
            return param1 + "b";
         }
         if(param1 < 10240)
         {
            return (param1 / 1024).toFixed(2) + "kb";
         }
         if(param1 < 102400)
         {
            return (param1 / 1024).toFixed(1) + "kb";
         }
         if(param1 < 1048576)
         {
            return (param1 >> 10) + "kb";
         }
         if(param1 < 10485760)
         {
            return (param1 / 1048576).toFixed(2);
         }
         if(param1 < 104857600)
         {
            return (param1 / 1048576).toFixed(1);
         }
         return String(param1 >> 20);
      }
      
      alternativa3d function deferredDestroy() : void
      {
         var _loc1_:Wrapper = null;
         var _loc2_:Wrapper = null;
         var _loc3_:Face = this.firstFace.alternativa3d::next;
         while(_loc3_ != null)
         {
            _loc1_ = _loc3_.alternativa3d::wrapper;
            if(_loc1_ != null)
            {
               _loc2_ = null;
               while(_loc1_ != null)
               {
                  _loc1_.alternativa3d::vertex = null;
                  _loc2_ = _loc1_;
                  _loc1_ = _loc1_.alternativa3d::next;
               }
               this.alternativa3d::lastWrapper.alternativa3d::next = _loc3_.alternativa3d::wrapper;
               this.alternativa3d::lastWrapper = _loc2_;
            }
            _loc3_.material = null;
            _loc3_.alternativa3d::wrapper = null;
            _loc3_ = _loc3_.alternativa3d::next;
         }
         if(this.firstFace != this.alternativa3d::lastFace)
         {
            this.alternativa3d::lastFace.alternativa3d::next = Face.alternativa3d::collector;
            Face.alternativa3d::collector = this.firstFace.alternativa3d::next;
            this.firstFace.alternativa3d::next = null;
            this.alternativa3d::lastFace = this.firstFace;
         }
         if(this.firstWrapper != this.alternativa3d::lastWrapper)
         {
            this.alternativa3d::lastWrapper.alternativa3d::next = Wrapper.alternativa3d::collector;
            Wrapper.alternativa3d::collector = this.firstWrapper.alternativa3d::next;
            this.firstWrapper.alternativa3d::next = null;
            this.alternativa3d::lastWrapper = this.firstWrapper;
         }
         if(this.firstVertex != this.alternativa3d::lastVertex)
         {
            this.alternativa3d::lastVertex.alternativa3d::next = Vertex.alternativa3d::collector;
            Vertex.alternativa3d::collector = this.firstVertex.alternativa3d::next;
            this.firstVertex.alternativa3d::next = null;
            this.alternativa3d::lastVertex = this.firstVertex;
         }
      }
      
      alternativa3d function clearOccluders() : void
      {
         var _loc1_:Vertex = null;
         var _loc2_:Vertex = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.alternativa3d::numOccluders)
         {
            _loc1_ = this.alternativa3d::occluders[_loc3_];
            _loc2_ = _loc1_;
            while(_loc2_.alternativa3d::next != null)
            {
               _loc2_ = _loc2_.alternativa3d::next;
            }
            _loc2_.alternativa3d::next = Vertex.alternativa3d::collector;
            Vertex.alternativa3d::collector = _loc1_;
            this.alternativa3d::occluders[_loc3_] = null;
            _loc3_++;
         }
         this.alternativa3d::numOccluders = 0;
      }
      
      alternativa3d function sortByAverageZ(param1:Face) : Face
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:Wrapper = null;
         var _loc5_:Face = param1;
         var _loc6_:Face = param1.alternativa3d::processNext;
         while(_loc6_ != null && _loc6_.alternativa3d::processNext != null)
         {
            param1 = param1.alternativa3d::processNext;
            _loc6_ = _loc6_.alternativa3d::processNext.alternativa3d::processNext;
         }
         _loc6_ = param1.alternativa3d::processNext;
         param1.alternativa3d::processNext = null;
         if(_loc5_.alternativa3d::processNext != null)
         {
            _loc5_ = this.alternativa3d::sortByAverageZ(_loc5_);
         }
         else
         {
            _loc2_ = 0;
            _loc3_ = 0;
            _loc4_ = _loc5_.alternativa3d::wrapper;
            while(_loc4_ != null)
            {
               _loc2_++;
               _loc3_ = _loc3_ + _loc4_.alternativa3d::vertex.alternativa3d::cameraZ;
               _loc4_ = _loc4_.alternativa3d::next;
            }
            _loc5_.alternativa3d::distance = _loc3_ / _loc2_;
         }
         if(_loc6_.alternativa3d::processNext != null)
         {
            _loc6_ = this.alternativa3d::sortByAverageZ(_loc6_);
         }
         else
         {
            _loc2_ = 0;
            _loc3_ = 0;
            _loc4_ = _loc6_.alternativa3d::wrapper;
            while(_loc4_ != null)
            {
               _loc2_++;
               _loc3_ = _loc3_ + _loc4_.alternativa3d::vertex.alternativa3d::cameraZ;
               _loc4_ = _loc4_.alternativa3d::next;
            }
            _loc6_.alternativa3d::distance = _loc3_ / _loc2_;
         }
         var _loc7_:* = _loc5_.alternativa3d::distance > _loc6_.alternativa3d::distance;
         if(_loc7_)
         {
            param1 = _loc5_;
            _loc5_ = _loc5_.alternativa3d::processNext;
         }
         else
         {
            param1 = _loc6_;
            _loc6_ = _loc6_.alternativa3d::processNext;
         }
         var _loc8_:Face = param1;
         while(_loc5_ != null)
         {
            if(_loc6_ == null)
            {
               _loc8_.alternativa3d::processNext = _loc5_;
               return param1;
            }
            if(_loc7_)
            {
               if(_loc5_.alternativa3d::distance > _loc6_.alternativa3d::distance)
               {
                  _loc8_ = _loc5_;
                  _loc5_ = _loc5_.alternativa3d::processNext;
               }
               else
               {
                  _loc8_.alternativa3d::processNext = _loc6_;
                  _loc8_ = _loc6_;
                  _loc6_ = _loc6_.alternativa3d::processNext;
                  _loc7_ = false;
               }
            }
            else if(_loc6_.alternativa3d::distance > _loc5_.alternativa3d::distance)
            {
               _loc8_ = _loc6_;
               _loc6_ = _loc6_.alternativa3d::processNext;
            }
            else
            {
               _loc8_.alternativa3d::processNext = _loc5_;
               _loc8_ = _loc5_;
               _loc5_ = _loc5_.alternativa3d::processNext;
               _loc7_ = true;
            }
         }
         _loc8_.alternativa3d::processNext = _loc6_;
         return param1;
      }
      
      alternativa3d function sortByDynamicBSP(param1:Face, param2:Number, param3:Face = null) : Face
      {
         var _loc4_:Wrapper = null;
         var _loc5_:Vertex = null;
         var _loc6_:Vertex = null;
         var _loc7_:Vertex = null;
         var _loc8_:Vertex = null;
         var _loc9_:Face = null;
         var _loc10_:Face = null;
         var _loc11_:Face = null;
         var _loc12_:Face = null;
         var _loc13_:Face = null;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc24_:Boolean = false;
         var _loc25_:Boolean = false;
         var _loc26_:Number = NaN;
         var _loc27_:Face = null;
         var _loc28_:Face = null;
         var _loc29_:Wrapper = null;
         var _loc30_:Wrapper = null;
         var _loc31_:Wrapper = null;
         var _loc32_:Boolean = false;
         var _loc33_:Number = NaN;
         var _loc34_:Face = null;
         var _loc35_:Number = NaN;
         var _loc36_:Number = NaN;
         var _loc37_:Number = NaN;
         var _loc38_:Number = NaN;
         var _loc39_:Number = NaN;
         var _loc40_:Number = NaN;
         var _loc41_:Number = NaN;
         var _loc42_:Number = NaN;
         var _loc43_:Number = NaN;
         var _loc44_:Number = NaN;
         var _loc45_:Number = NaN;
         var _loc46_:Number = NaN;
         var _loc47_:Number = NaN;
         var _loc48_:Face = null;
         var _loc49_:Face = null;
         _loc4_ = null;
         _loc5_ = null;
         _loc6_ = null;
         _loc7_ = null;
         _loc8_ = null;
         _loc9_ = null;
         _loc10_ = null;
         _loc11_ = null;
         _loc12_ = null;
         _loc13_ = null;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         _loc17_ = NaN;
         _loc18_ = NaN;
         _loc19_ = NaN;
         _loc20_ = NaN;
         _loc21_ = NaN;
         _loc22_ = NaN;
         _loc23_ = NaN;
         _loc24_ = false;
         _loc25_ = false;
         _loc26_ = NaN;
         _loc27_ = null;
         _loc28_ = null;
         _loc29_ = null;
         _loc30_ = null;
         _loc31_ = null;
         _loc32_ = false;
         _loc33_ = NaN;
         _loc34_ = param1;
         param1 = _loc34_.alternativa3d::processNext;
         _loc4_ = _loc34_.alternativa3d::wrapper;
         _loc5_ = _loc4_.alternativa3d::vertex;
         _loc4_ = _loc4_.alternativa3d::next;
         _loc6_ = _loc4_.alternativa3d::vertex;
         _loc35_ = _loc5_.alternativa3d::cameraX;
         _loc36_ = _loc5_.alternativa3d::cameraY;
         _loc37_ = _loc5_.alternativa3d::cameraZ;
         _loc38_ = _loc6_.alternativa3d::cameraX - _loc35_;
         _loc39_ = _loc6_.alternativa3d::cameraY - _loc36_;
         _loc40_ = _loc6_.alternativa3d::cameraZ - _loc37_;
         _loc41_ = 0;
         _loc42_ = 0;
         _loc43_ = 1;
         _loc44_ = _loc37_;
         _loc45_ = 0;
         _loc4_ = _loc4_.alternativa3d::next;
         while(_loc4_ != null)
         {
            _loc8_ = _loc4_.alternativa3d::vertex;
            _loc14_ = _loc8_.alternativa3d::cameraX - _loc35_;
            _loc15_ = _loc8_.alternativa3d::cameraY - _loc36_;
            _loc16_ = _loc8_.alternativa3d::cameraZ - _loc37_;
            _loc17_ = _loc16_ * _loc39_ - _loc15_ * _loc40_;
            _loc18_ = _loc14_ * _loc40_ - _loc16_ * _loc38_;
            _loc19_ = _loc15_ * _loc38_ - _loc14_ * _loc39_;
            _loc20_ = _loc17_ * _loc17_ + _loc18_ * _loc18_ + _loc19_ * _loc19_;
            if(_loc20_ > param2)
            {
               _loc20_ = 1 / Math.sqrt(_loc20_);
               _loc41_ = _loc17_ * _loc20_;
               _loc42_ = _loc18_ * _loc20_;
               _loc43_ = _loc19_ * _loc20_;
               _loc44_ = _loc35_ * _loc41_ + _loc36_ * _loc42_ + _loc37_ * _loc43_;
               break;
            }
            if(_loc20_ > _loc45_)
            {
               _loc20_ = 1 / Math.sqrt(_loc20_);
               _loc41_ = _loc17_ * _loc20_;
               _loc42_ = _loc18_ * _loc20_;
               _loc43_ = _loc19_ * _loc20_;
               _loc44_ = _loc35_ * _loc41_ + _loc36_ * _loc42_ + _loc37_ * _loc43_;
               _loc45_ = _loc20_;
            }
            _loc4_ = _loc4_.alternativa3d::next;
         }
         _loc46_ = _loc44_ - param2;
         _loc47_ = _loc44_ + param2;
         _loc48_ = _loc34_;
         _loc49_ = param1;
         while(_loc49_ != null)
         {
            _loc13_ = _loc49_.alternativa3d::processNext;
            _loc4_ = _loc49_.alternativa3d::wrapper;
            _loc5_ = _loc4_.alternativa3d::vertex;
            _loc4_ = _loc4_.alternativa3d::next;
            _loc6_ = _loc4_.alternativa3d::vertex;
            _loc4_ = _loc4_.alternativa3d::next;
            _loc7_ = _loc4_.alternativa3d::vertex;
            _loc4_ = _loc4_.alternativa3d::next;
            _loc21_ = _loc5_.alternativa3d::cameraX * _loc41_ + _loc5_.alternativa3d::cameraY * _loc42_ + _loc5_.alternativa3d::cameraZ * _loc43_;
            _loc22_ = _loc6_.alternativa3d::cameraX * _loc41_ + _loc6_.alternativa3d::cameraY * _loc42_ + _loc6_.alternativa3d::cameraZ * _loc43_;
            _loc23_ = _loc7_.alternativa3d::cameraX * _loc41_ + _loc7_.alternativa3d::cameraY * _loc42_ + _loc7_.alternativa3d::cameraZ * _loc43_;
            _loc24_ = _loc21_ < _loc46_ || _loc22_ < _loc46_ || _loc23_ < _loc46_;
            _loc25_ = _loc21_ > _loc47_ || _loc22_ > _loc47_ || _loc23_ > _loc47_;
            while(_loc4_ != null)
            {
               _loc8_ = _loc4_.alternativa3d::vertex;
               _loc26_ = _loc8_.alternativa3d::cameraX * _loc41_ + _loc8_.alternativa3d::cameraY * _loc42_ + _loc8_.alternativa3d::cameraZ * _loc43_;
               if(_loc26_ < _loc46_)
               {
                  _loc24_ = true;
               }
               else if(_loc26_ > _loc47_)
               {
                  _loc25_ = true;
               }
               _loc8_.alternativa3d::offset = _loc26_;
               _loc4_ = _loc4_.alternativa3d::next;
            }
            if(!_loc24_)
            {
               if(!_loc25_)
               {
                  _loc48_.alternativa3d::processNext = _loc49_;
                  _loc48_ = _loc49_;
               }
               else
               {
                  if(_loc11_ != null)
                  {
                     _loc12_.alternativa3d::processNext = _loc49_;
                  }
                  else
                  {
                     _loc11_ = _loc49_;
                  }
                  _loc12_ = _loc49_;
               }
            }
            else if(!_loc25_)
            {
               if(_loc9_ != null)
               {
                  _loc10_.alternativa3d::processNext = _loc49_;
               }
               else
               {
                  _loc9_ = _loc49_;
               }
               _loc10_ = _loc49_;
            }
            else
            {
               _loc5_.alternativa3d::offset = _loc21_;
               _loc6_.alternativa3d::offset = _loc22_;
               _loc7_.alternativa3d::offset = _loc23_;
               _loc27_ = _loc49_.alternativa3d::create();
               _loc27_.material = _loc49_.material;
               this.alternativa3d::lastFace.alternativa3d::next = _loc27_;
               this.alternativa3d::lastFace = _loc27_;
               _loc28_ = _loc49_.alternativa3d::create();
               _loc28_.material = _loc49_.material;
               this.alternativa3d::lastFace.alternativa3d::next = _loc28_;
               this.alternativa3d::lastFace = _loc28_;
               _loc29_ = null;
               _loc30_ = null;
               _loc4_ = _loc49_.alternativa3d::wrapper.alternativa3d::next.alternativa3d::next;
               while(_loc4_.alternativa3d::next != null)
               {
                  _loc4_ = _loc4_.alternativa3d::next;
               }
               _loc5_ = _loc4_.alternativa3d::vertex;
               _loc21_ = _loc5_.alternativa3d::offset;
               _loc32_ = _loc49_.material != null && _loc49_.material.alternativa3d::useVerticesNormals;
               _loc4_ = _loc49_.alternativa3d::wrapper;
               while(_loc4_ != null)
               {
                  _loc6_ = _loc4_.alternativa3d::vertex;
                  _loc22_ = _loc6_.alternativa3d::offset;
                  if(_loc21_ < _loc46_ && _loc22_ > _loc47_ || _loc21_ > _loc47_ && _loc22_ < _loc46_)
                  {
                     _loc33_ = (_loc44_ - _loc21_) / (_loc22_ - _loc21_);
                     _loc8_ = _loc6_.alternativa3d::create();
                     this.alternativa3d::lastVertex.alternativa3d::next = _loc8_;
                     this.alternativa3d::lastVertex = _loc8_;
                     _loc8_.alternativa3d::cameraX = _loc5_.alternativa3d::cameraX + (_loc6_.alternativa3d::cameraX - _loc5_.alternativa3d::cameraX) * _loc33_;
                     _loc8_.alternativa3d::cameraY = _loc5_.alternativa3d::cameraY + (_loc6_.alternativa3d::cameraY - _loc5_.alternativa3d::cameraY) * _loc33_;
                     _loc8_.alternativa3d::cameraZ = _loc5_.alternativa3d::cameraZ + (_loc6_.alternativa3d::cameraZ - _loc5_.alternativa3d::cameraZ) * _loc33_;
                     _loc8_.u = _loc5_.u + (_loc6_.u - _loc5_.u) * _loc33_;
                     _loc8_.v = _loc5_.v + (_loc6_.v - _loc5_.v) * _loc33_;
                     if(_loc32_)
                     {
                        _loc8_.x = _loc5_.x + (_loc6_.x - _loc5_.x) * _loc33_;
                        _loc8_.y = _loc5_.y + (_loc6_.y - _loc5_.y) * _loc33_;
                        _loc8_.z = _loc5_.z + (_loc6_.z - _loc5_.z) * _loc33_;
                        _loc8_.normalX = _loc5_.normalX + (_loc6_.normalX - _loc5_.normalX) * _loc33_;
                        _loc8_.normalY = _loc5_.normalY + (_loc6_.normalY - _loc5_.normalY) * _loc33_;
                        _loc8_.normalZ = _loc5_.normalZ + (_loc6_.normalZ - _loc5_.normalZ) * _loc33_;
                     }
                     _loc31_ = _loc4_.alternativa3d::create();
                     _loc31_.alternativa3d::vertex = _loc8_;
                     if(_loc29_ != null)
                     {
                        _loc29_.alternativa3d::next = _loc31_;
                     }
                     else
                     {
                        _loc27_.alternativa3d::wrapper = _loc31_;
                     }
                     _loc29_ = _loc31_;
                     _loc31_ = _loc4_.alternativa3d::create();
                     _loc31_.alternativa3d::vertex = _loc8_;
                     if(_loc30_ != null)
                     {
                        _loc30_.alternativa3d::next = _loc31_;
                     }
                     else
                     {
                        _loc28_.alternativa3d::wrapper = _loc31_;
                     }
                     _loc30_ = _loc31_;
                  }
                  if(_loc22_ <= _loc47_)
                  {
                     _loc31_ = _loc4_.alternativa3d::create();
                     _loc31_.alternativa3d::vertex = _loc6_;
                     if(_loc29_ != null)
                     {
                        _loc29_.alternativa3d::next = _loc31_;
                     }
                     else
                     {
                        _loc27_.alternativa3d::wrapper = _loc31_;
                     }
                     _loc29_ = _loc31_;
                  }
                  if(_loc22_ >= _loc46_)
                  {
                     _loc31_ = _loc4_.alternativa3d::create();
                     _loc31_.alternativa3d::vertex = _loc6_;
                     if(_loc30_ != null)
                     {
                        _loc30_.alternativa3d::next = _loc31_;
                     }
                     else
                     {
                        _loc28_.alternativa3d::wrapper = _loc31_;
                     }
                     _loc30_ = _loc31_;
                  }
                  _loc5_ = _loc6_;
                  _loc21_ = _loc22_;
                  _loc4_ = _loc4_.alternativa3d::next;
               }
               if(_loc9_ != null)
               {
                  _loc10_.alternativa3d::processNext = _loc27_;
               }
               else
               {
                  _loc9_ = _loc27_;
               }
               _loc10_ = _loc27_;
               if(_loc11_ != null)
               {
                  _loc12_.alternativa3d::processNext = _loc28_;
               }
               else
               {
                  _loc11_ = _loc28_;
               }
               _loc12_ = _loc28_;
               _loc49_.alternativa3d::processNext = null;
            }
            _loc49_ = _loc13_;
         }
         if(_loc11_ != null)
         {
            _loc12_.alternativa3d::processNext = null;
            if(_loc11_.alternativa3d::processNext != null)
            {
               param3 = this.alternativa3d::sortByDynamicBSP(_loc11_,param2,param3);
            }
            else
            {
               _loc11_.alternativa3d::processNext = param3;
               param3 = _loc11_;
            }
         }
         _loc48_.alternativa3d::processNext = param3;
         param3 = _loc34_;
         if(_loc9_ != null)
         {
            _loc10_.alternativa3d::processNext = null;
            if(_loc9_.alternativa3d::processNext != null)
            {
               param3 = this.alternativa3d::sortByDynamicBSP(_loc9_,param2,param3);
            }
            else
            {
               _loc9_.alternativa3d::processNext = param3;
               param3 = _loc9_;
            }
         }
         return param3;
      }
      
      alternativa3d function cull(param1:Face, param2:int) : Face
      {
         var _loc3_:Face = null;
         var _loc4_:Face = null;
         var _loc5_:Face = null;
         var _loc6_:Vertex = null;
         var _loc7_:Vertex = null;
         var _loc8_:Vertex = null;
         var _loc9_:Wrapper = null;
         var _loc10_:Vertex = null;
         var _loc11_:Wrapper = null;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:* = false;
         var _loc22_:* = false;
         var _loc23_:* = false;
         var _loc24_:* = false;
         var _loc25_:* = false;
         var _loc26_:* = false;
         var _loc27_:Number = NaN;
         var _loc28_:Number = NaN;
         var _loc29_:Boolean = false;
         var _loc30_:Boolean = false;
         var _loc31_:Face = null;
         _loc3_ = null;
         _loc4_ = null;
         _loc5_ = null;
         _loc6_ = null;
         _loc7_ = null;
         _loc8_ = null;
         _loc9_ = null;
         _loc10_ = null;
         _loc11_ = null;
         _loc12_ = NaN;
         _loc13_ = NaN;
         _loc14_ = NaN;
         _loc15_ = NaN;
         _loc16_ = NaN;
         _loc17_ = NaN;
         _loc18_ = NaN;
         _loc19_ = NaN;
         _loc20_ = NaN;
         _loc21_ = (param2 & 1) > 0;
         _loc22_ = (param2 & 2) > 0;
         _loc23_ = (param2 & 4) > 0;
         _loc24_ = (param2 & 8) > 0;
         _loc25_ = (param2 & 0x10) > 0;
         _loc26_ = (param2 & 0x20) > 0;
         _loc27_ = this.nearClipping;
         _loc28_ = this.farClipping;
         _loc29_ = _loc23_ || _loc24_;
         _loc30_ = _loc25_ || _loc26_;
         _loc31_ = param1;
         for(; _loc31_ != null; _loc31_ = _loc5_)
         {
            _loc5_ = _loc31_.alternativa3d::processNext;
            _loc9_ = _loc31_.alternativa3d::wrapper;
            _loc6_ = _loc9_.alternativa3d::vertex;
            _loc9_ = _loc9_.alternativa3d::next;
            _loc7_ = _loc9_.alternativa3d::vertex;
            _loc9_ = _loc9_.alternativa3d::next;
            _loc8_ = _loc9_.alternativa3d::vertex;
            _loc9_ = _loc9_.alternativa3d::next;
            if(_loc29_)
            {
               _loc12_ = _loc6_.alternativa3d::cameraX;
               _loc15_ = _loc7_.alternativa3d::cameraX;
               _loc18_ = _loc8_.alternativa3d::cameraX;
            }
            if(_loc30_)
            {
               _loc13_ = _loc6_.alternativa3d::cameraY;
               _loc16_ = _loc7_.alternativa3d::cameraY;
               _loc19_ = _loc8_.alternativa3d::cameraY;
            }
            _loc14_ = _loc6_.alternativa3d::cameraZ;
            _loc17_ = _loc7_.alternativa3d::cameraZ;
            _loc20_ = _loc8_.alternativa3d::cameraZ;
            if(_loc21_)
            {
               if(_loc14_ <= _loc27_ || _loc17_ <= _loc27_ || _loc20_ <= _loc27_)
               {
                  _loc31_.alternativa3d::processNext = null;
                  continue;
               }
               _loc11_ = _loc9_;
               while(_loc11_ != null)
               {
                  if(_loc11_.alternativa3d::vertex.alternativa3d::cameraZ <= _loc27_)
                  {
                     break;
                  }
                  _loc11_ = _loc11_.alternativa3d::next;
               }
               if(_loc11_ != null)
               {
                  _loc31_.alternativa3d::processNext = null;
                  continue;
               }
            }
            if(_loc22_ && _loc14_ >= _loc28_ && _loc17_ >= _loc28_ && _loc20_ >= _loc28_)
            {
               _loc11_ = _loc9_;
               while(_loc11_ != null)
               {
                  if(_loc11_.alternativa3d::vertex.alternativa3d::cameraZ < _loc28_)
                  {
                     break;
                  }
                  _loc11_ = _loc11_.alternativa3d::next;
               }
               if(_loc11_ == null)
               {
                  _loc31_.alternativa3d::processNext = null;
                  continue;
               }
            }
            if(_loc23_ && _loc14_ <= -_loc12_ && _loc17_ <= -_loc15_ && _loc20_ <= -_loc18_)
            {
               _loc11_ = _loc9_;
               while(_loc11_ != null)
               {
                  _loc10_ = _loc11_.alternativa3d::vertex;
                  if(-_loc10_.alternativa3d::cameraX < _loc10_.alternativa3d::cameraZ)
                  {
                     break;
                  }
                  _loc11_ = _loc11_.alternativa3d::next;
               }
               if(_loc11_ == null)
               {
                  _loc31_.alternativa3d::processNext = null;
                  continue;
               }
            }
            if(_loc24_ && _loc14_ <= _loc12_ && _loc17_ <= _loc15_ && _loc20_ <= _loc18_)
            {
               _loc11_ = _loc9_;
               while(_loc11_ != null)
               {
                  _loc10_ = _loc11_.alternativa3d::vertex;
                  if(_loc10_.alternativa3d::cameraX < _loc10_.alternativa3d::cameraZ)
                  {
                     break;
                  }
                  _loc11_ = _loc11_.alternativa3d::next;
               }
               if(_loc11_ == null)
               {
                  _loc31_.alternativa3d::processNext = null;
                  continue;
               }
            }
            if(_loc25_ && _loc14_ <= -_loc13_ && _loc17_ <= -_loc16_ && _loc20_ <= -_loc19_)
            {
               _loc11_ = _loc9_;
               while(_loc11_ != null)
               {
                  _loc10_ = _loc11_.alternativa3d::vertex;
                  if(-_loc10_.alternativa3d::cameraY < _loc10_.alternativa3d::cameraZ)
                  {
                     break;
                  }
                  _loc11_ = _loc11_.alternativa3d::next;
               }
               if(_loc11_ == null)
               {
                  _loc31_.alternativa3d::processNext = null;
                  continue;
               }
            }
            if(_loc26_ && _loc14_ <= _loc13_ && _loc17_ <= _loc16_ && _loc20_ <= _loc19_)
            {
               _loc11_ = _loc9_;
               while(_loc11_ != null)
               {
                  _loc10_ = _loc11_.alternativa3d::vertex;
                  if(_loc10_.alternativa3d::cameraY < _loc10_.alternativa3d::cameraZ)
                  {
                     break;
                  }
                  _loc11_ = _loc11_.alternativa3d::next;
               }
               if(_loc11_ == null)
               {
                  _loc31_.alternativa3d::processNext = null;
                  continue;
               }
            }
            if(_loc3_ != null)
            {
               _loc4_.alternativa3d::processNext = _loc31_;
            }
            else
            {
               _loc3_ = _loc31_;
            }
            _loc4_ = _loc31_;
         }
         if(_loc4_ != null)
         {
            _loc4_.alternativa3d::processNext = null;
         }
         return _loc3_;
      }
      
      alternativa3d function clip(param1:Face, param2:int) : Face
      {
         var _loc3_:Face = null;
         var _loc4_:Face = null;
         var _loc5_:Face = null;
         var _loc6_:Vertex = null;
         var _loc7_:Vertex = null;
         var _loc8_:Vertex = null;
         var _loc9_:Wrapper = null;
         var _loc10_:Vertex = null;
         var _loc11_:Wrapper = null;
         var _loc12_:Wrapper = null;
         var _loc13_:Wrapper = null;
         var _loc14_:Wrapper = null;
         var _loc15_:Wrapper = null;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc24_:Number = NaN;
         var _loc25_:Boolean = false;
         var _loc26_:Boolean = false;
         var _loc27_:Boolean = false;
         var _loc28_:Boolean = false;
         var _loc29_:Boolean = false;
         var _loc30_:Boolean = false;
         var _loc31_:Number = NaN;
         var _loc32_:Number = NaN;
         var _loc33_:Boolean = false;
         var _loc34_:Boolean = false;
         var _loc35_:int = 0;
         var _loc36_:Number = NaN;
         var _loc37_:Face = null;
         var _loc38_:Boolean = false;
         var _loc39_:Face = null;
         _loc3_ = null;
         _loc4_ = null;
         _loc5_ = null;
         _loc6_ = null;
         _loc7_ = null;
         _loc8_ = null;
         _loc9_ = null;
         _loc10_ = null;
         _loc11_ = null;
         _loc12_ = null;
         _loc13_ = null;
         _loc14_ = null;
         _loc15_ = null;
         _loc16_ = NaN;
         _loc17_ = NaN;
         _loc18_ = NaN;
         _loc19_ = NaN;
         _loc20_ = NaN;
         _loc21_ = NaN;
         _loc22_ = NaN;
         _loc23_ = NaN;
         _loc24_ = NaN;
         _loc25_ = false;
         _loc26_ = false;
         _loc27_ = false;
         _loc28_ = false;
         _loc29_ = false;
         _loc30_ = false;
         _loc31_ = NaN;
         _loc32_ = NaN;
         _loc33_ = false;
         _loc34_ = false;
         _loc35_ = 0;
         _loc36_ = NaN;
         _loc37_ = null;
         _loc38_ = false;
         _loc39_ = null;
         _loc25_ = (param2 & 1) > 0;
         _loc26_ = (param2 & 2) > 0;
         _loc27_ = (param2 & 4) > 0;
         _loc28_ = (param2 & 8) > 0;
         _loc29_ = (param2 & 0x10) > 0;
         _loc30_ = (param2 & 0x20) > 0;
         _loc31_ = this.nearClipping;
         _loc32_ = this.farClipping;
         _loc33_ = _loc27_ || _loc28_;
         _loc34_ = _loc29_ || _loc30_;
         _loc37_ = param1;
         for(; _loc37_ != null; _loc37_ = _loc5_)
         {
            _loc5_ = _loc37_.alternativa3d::processNext;
            _loc9_ = _loc37_.alternativa3d::wrapper;
            _loc6_ = _loc9_.alternativa3d::vertex;
            _loc9_ = _loc9_.alternativa3d::next;
            _loc7_ = _loc9_.alternativa3d::vertex;
            _loc9_ = _loc9_.alternativa3d::next;
            _loc8_ = _loc9_.alternativa3d::vertex;
            _loc9_ = _loc9_.alternativa3d::next;
            if(_loc33_)
            {
               _loc16_ = _loc6_.alternativa3d::cameraX;
               _loc19_ = _loc7_.alternativa3d::cameraX;
               _loc22_ = _loc8_.alternativa3d::cameraX;
            }
            if(_loc34_)
            {
               _loc17_ = _loc6_.alternativa3d::cameraY;
               _loc20_ = _loc7_.alternativa3d::cameraY;
               _loc23_ = _loc8_.alternativa3d::cameraY;
            }
            _loc18_ = _loc6_.alternativa3d::cameraZ;
            _loc21_ = _loc7_.alternativa3d::cameraZ;
            _loc24_ = _loc8_.alternativa3d::cameraZ;
            _loc35_ = 0;
            if(_loc25_)
            {
               if(_loc18_ <= _loc31_ && _loc21_ <= _loc31_ && _loc24_ <= _loc31_)
               {
                  _loc11_ = _loc9_;
                  while(_loc11_ != null)
                  {
                     if(_loc11_.alternativa3d::vertex.alternativa3d::cameraZ > _loc31_)
                     {
                        _loc35_ = _loc35_ | 1;
                        break;
                     }
                     _loc11_ = _loc11_.alternativa3d::next;
                  }
                  if(_loc11_ == null)
                  {
                     _loc37_.alternativa3d::processNext = null;
                     continue;
                  }
               }
               else if(_loc18_ > _loc31_ && _loc21_ > _loc31_ && _loc24_ > _loc31_)
               {
                  _loc11_ = _loc9_;
                  while(_loc11_ != null)
                  {
                     if(_loc11_.alternativa3d::vertex.alternativa3d::cameraZ <= _loc31_)
                     {
                        _loc35_ = _loc35_ | 1;
                        break;
                     }
                     _loc11_ = _loc11_.alternativa3d::next;
                  }
               }
               else
               {
                  _loc35_ = _loc35_ | 1;
               }
            }
            if(_loc26_)
            {
               if(_loc18_ >= _loc32_ && _loc21_ >= _loc32_ && _loc24_ >= _loc32_)
               {
                  _loc11_ = _loc9_;
                  while(_loc11_ != null)
                  {
                     if(_loc11_.alternativa3d::vertex.alternativa3d::cameraZ < _loc32_)
                     {
                        _loc35_ = _loc35_ | 2;
                        break;
                     }
                     _loc11_ = _loc11_.alternativa3d::next;
                  }
                  if(_loc11_ == null)
                  {
                     _loc37_.alternativa3d::processNext = null;
                     continue;
                  }
               }
               else if(_loc18_ < _loc32_ && _loc21_ < _loc32_ && _loc24_ < _loc32_)
               {
                  _loc11_ = _loc9_;
                  while(_loc11_ != null)
                  {
                     if(_loc11_.alternativa3d::vertex.alternativa3d::cameraZ >= _loc32_)
                     {
                        _loc35_ = _loc35_ | 2;
                        break;
                     }
                     _loc11_ = _loc11_.alternativa3d::next;
                  }
               }
               else
               {
                  _loc35_ = _loc35_ | 2;
               }
            }
            if(_loc27_)
            {
               if(_loc18_ <= -_loc16_ && _loc21_ <= -_loc19_ && _loc24_ <= -_loc22_)
               {
                  _loc11_ = _loc9_;
                  while(_loc11_ != null)
                  {
                     _loc10_ = _loc11_.alternativa3d::vertex;
                     if(-_loc10_.alternativa3d::cameraX < _loc10_.alternativa3d::cameraZ)
                     {
                        _loc35_ = _loc35_ | 4;
                        break;
                     }
                     _loc11_ = _loc11_.alternativa3d::next;
                  }
                  if(_loc11_ == null)
                  {
                     _loc37_.alternativa3d::processNext = null;
                     continue;
                  }
               }
               else if(_loc18_ > -_loc16_ && _loc21_ > -_loc19_ && _loc24_ > -_loc22_)
               {
                  _loc11_ = _loc9_;
                  while(_loc11_ != null)
                  {
                     _loc10_ = _loc11_.alternativa3d::vertex;
                     if(-_loc10_.alternativa3d::cameraX >= _loc10_.alternativa3d::cameraZ)
                     {
                        _loc35_ = _loc35_ | 4;
                        break;
                     }
                     _loc11_ = _loc11_.alternativa3d::next;
                  }
               }
               else
               {
                  _loc35_ = _loc35_ | 4;
               }
            }
            if(_loc28_)
            {
               if(_loc18_ <= _loc16_ && _loc21_ <= _loc19_ && _loc24_ <= _loc22_)
               {
                  _loc11_ = _loc9_;
                  while(_loc11_ != null)
                  {
                     _loc10_ = _loc11_.alternativa3d::vertex;
                     if(_loc10_.alternativa3d::cameraX < _loc10_.alternativa3d::cameraZ)
                     {
                        _loc35_ = _loc35_ | 8;
                        break;
                     }
                     _loc11_ = _loc11_.alternativa3d::next;
                  }
                  if(_loc11_ == null)
                  {
                     _loc37_.alternativa3d::processNext = null;
                     continue;
                  }
               }
               else if(_loc18_ > _loc16_ && _loc21_ > _loc19_ && _loc24_ > _loc22_)
               {
                  _loc11_ = _loc9_;
                  while(_loc11_ != null)
                  {
                     _loc10_ = _loc11_.alternativa3d::vertex;
                     if(_loc10_.alternativa3d::cameraX >= _loc10_.alternativa3d::cameraZ)
                     {
                        _loc35_ = _loc35_ | 8;
                        break;
                     }
                     _loc11_ = _loc11_.alternativa3d::next;
                  }
               }
               else
               {
                  _loc35_ = _loc35_ | 8;
               }
            }
            if(_loc29_)
            {
               if(_loc18_ <= -_loc17_ && _loc21_ <= -_loc20_ && _loc24_ <= -_loc23_)
               {
                  _loc11_ = _loc9_;
                  while(_loc11_ != null)
                  {
                     _loc10_ = _loc11_.alternativa3d::vertex;
                     if(-_loc10_.alternativa3d::cameraY < _loc10_.alternativa3d::cameraZ)
                     {
                        _loc35_ = _loc35_ | 0x10;
                        break;
                     }
                     _loc11_ = _loc11_.alternativa3d::next;
                  }
                  if(_loc11_ == null)
                  {
                     _loc37_.alternativa3d::processNext = null;
                     continue;
                  }
               }
               else if(_loc18_ > -_loc17_ && _loc21_ > -_loc20_ && _loc24_ > -_loc23_)
               {
                  _loc11_ = _loc9_;
                  while(_loc11_ != null)
                  {
                     _loc10_ = _loc11_.alternativa3d::vertex;
                     if(-_loc10_.alternativa3d::cameraY >= _loc10_.alternativa3d::cameraZ)
                     {
                        _loc35_ = _loc35_ | 0x10;
                        break;
                     }
                     _loc11_ = _loc11_.alternativa3d::next;
                  }
               }
               else
               {
                  _loc35_ = _loc35_ | 0x10;
               }
            }
            if(_loc30_)
            {
               if(_loc18_ <= _loc17_ && _loc21_ <= _loc20_ && _loc24_ <= _loc23_)
               {
                  _loc11_ = _loc9_;
                  while(_loc11_ != null)
                  {
                     _loc10_ = _loc11_.alternativa3d::vertex;
                     if(_loc10_.alternativa3d::cameraY < _loc10_.alternativa3d::cameraZ)
                     {
                        _loc35_ = _loc35_ | 0x20;
                        break;
                     }
                     _loc11_ = _loc11_.alternativa3d::next;
                  }
                  if(_loc11_ == null)
                  {
                     _loc37_.alternativa3d::processNext = null;
                     continue;
                  }
               }
               else if(_loc18_ > _loc17_ && _loc21_ > _loc20_ && _loc24_ > _loc23_)
               {
                  _loc11_ = _loc9_;
                  while(_loc11_ != null)
                  {
                     _loc10_ = _loc11_.alternativa3d::vertex;
                     if(_loc10_.alternativa3d::cameraY >= _loc10_.alternativa3d::cameraZ)
                     {
                        _loc35_ = _loc35_ | 0x20;
                        break;
                     }
                     _loc11_ = _loc11_.alternativa3d::next;
                  }
               }
               else
               {
                  _loc35_ = _loc35_ | 0x20;
               }
            }
            if(_loc35_ > 0)
            {
               _loc38_ = _loc37_.material != null && _loc37_.material.alternativa3d::useVerticesNormals;
               _loc12_ = null;
               _loc13_ = null;
               _loc11_ = _loc37_.alternativa3d::wrapper;
               while(_loc11_ != null)
               {
                  _loc15_ = _loc11_.alternativa3d::create();
                  _loc15_.alternativa3d::vertex = _loc11_.alternativa3d::vertex;
                  if(_loc12_ != null)
                  {
                     _loc13_.alternativa3d::next = _loc15_;
                  }
                  else
                  {
                     _loc12_ = _loc15_;
                  }
                  _loc13_ = _loc15_;
                  _loc11_ = _loc11_.alternativa3d::next;
               }
               if(_loc35_ & 1)
               {
                  _loc6_ = _loc13_.alternativa3d::vertex;
                  _loc18_ = _loc6_.alternativa3d::cameraZ;
                  _loc11_ = _loc12_;
                  _loc12_ = null;
                  _loc13_ = null;
                  while(_loc11_ != null)
                  {
                     _loc14_ = _loc11_.alternativa3d::next;
                     _loc7_ = _loc11_.alternativa3d::vertex;
                     _loc21_ = _loc7_.alternativa3d::cameraZ;
                     if(_loc21_ > _loc31_ && _loc18_ <= _loc31_ || _loc21_ <= _loc31_ && _loc18_ > _loc31_)
                     {
                        _loc36_ = (_loc31_ - _loc18_) / (_loc21_ - _loc18_);
                        _loc10_ = _loc7_.alternativa3d::create();
                        this.alternativa3d::lastVertex.alternativa3d::next = _loc10_;
                        this.alternativa3d::lastVertex = _loc10_;
                        _loc10_.alternativa3d::cameraX = _loc6_.alternativa3d::cameraX + (_loc7_.alternativa3d::cameraX - _loc6_.alternativa3d::cameraX) * _loc36_;
                        _loc10_.alternativa3d::cameraY = _loc6_.alternativa3d::cameraY + (_loc7_.alternativa3d::cameraY - _loc6_.alternativa3d::cameraY) * _loc36_;
                        _loc10_.alternativa3d::cameraZ = _loc18_ + (_loc21_ - _loc18_) * _loc36_;
                        _loc10_.x = _loc6_.x + (_loc7_.x - _loc6_.x) * _loc36_;
                        _loc10_.y = _loc6_.y + (_loc7_.y - _loc6_.y) * _loc36_;
                        _loc10_.z = _loc6_.z + (_loc7_.z - _loc6_.z) * _loc36_;
                        _loc10_.u = _loc6_.u + (_loc7_.u - _loc6_.u) * _loc36_;
                        _loc10_.v = _loc6_.v + (_loc7_.v - _loc6_.v) * _loc36_;
                        if(_loc38_)
                        {
                           _loc10_.normalX = _loc6_.normalX + (_loc7_.normalX - _loc6_.normalX) * _loc36_;
                           _loc10_.normalY = _loc6_.normalY + (_loc7_.normalY - _loc6_.normalY) * _loc36_;
                           _loc10_.normalZ = _loc6_.normalZ + (_loc7_.normalZ - _loc6_.normalZ) * _loc36_;
                        }
                        _loc15_ = _loc11_.alternativa3d::create();
                        _loc15_.alternativa3d::vertex = _loc10_;
                        if(_loc12_ != null)
                        {
                           _loc13_.alternativa3d::next = _loc15_;
                        }
                        else
                        {
                           _loc12_ = _loc15_;
                        }
                        _loc13_ = _loc15_;
                     }
                     if(_loc21_ > _loc31_)
                     {
                        if(_loc12_ != null)
                        {
                           _loc13_.alternativa3d::next = _loc11_;
                        }
                        else
                        {
                           _loc12_ = _loc11_;
                        }
                        _loc13_ = _loc11_;
                        _loc11_.alternativa3d::next = null;
                     }
                     else
                     {
                        _loc11_.alternativa3d::vertex = null;
                        _loc11_.alternativa3d::next = Wrapper.alternativa3d::collector;
                        Wrapper.alternativa3d::collector = _loc11_;
                     }
                     _loc6_ = _loc7_;
                     _loc18_ = _loc21_;
                     _loc11_ = _loc14_;
                  }
                  if(_loc12_ == null)
                  {
                     _loc37_.alternativa3d::processNext = null;
                     continue;
                  }
               }
               if(_loc35_ & 2)
               {
                  _loc6_ = _loc13_.alternativa3d::vertex;
                  _loc18_ = _loc6_.alternativa3d::cameraZ;
                  _loc11_ = _loc12_;
                  _loc12_ = null;
                  _loc13_ = null;
                  while(_loc11_ != null)
                  {
                     _loc14_ = _loc11_.alternativa3d::next;
                     _loc7_ = _loc11_.alternativa3d::vertex;
                     _loc21_ = _loc7_.alternativa3d::cameraZ;
                     if(_loc21_ < _loc32_ && _loc18_ >= _loc32_ || _loc21_ >= _loc32_ && _loc18_ < _loc32_)
                     {
                        _loc36_ = (_loc32_ - _loc18_) / (_loc21_ - _loc18_);
                        _loc10_ = _loc7_.alternativa3d::create();
                        this.alternativa3d::lastVertex.alternativa3d::next = _loc10_;
                        this.alternativa3d::lastVertex = _loc10_;
                        _loc10_.alternativa3d::cameraX = _loc6_.alternativa3d::cameraX + (_loc7_.alternativa3d::cameraX - _loc6_.alternativa3d::cameraX) * _loc36_;
                        _loc10_.alternativa3d::cameraY = _loc6_.alternativa3d::cameraY + (_loc7_.alternativa3d::cameraY - _loc6_.alternativa3d::cameraY) * _loc36_;
                        _loc10_.alternativa3d::cameraZ = _loc18_ + (_loc21_ - _loc18_) * _loc36_;
                        _loc10_.x = _loc6_.x + (_loc7_.x - _loc6_.x) * _loc36_;
                        _loc10_.y = _loc6_.y + (_loc7_.y - _loc6_.y) * _loc36_;
                        _loc10_.z = _loc6_.z + (_loc7_.z - _loc6_.z) * _loc36_;
                        _loc10_.u = _loc6_.u + (_loc7_.u - _loc6_.u) * _loc36_;
                        _loc10_.v = _loc6_.v + (_loc7_.v - _loc6_.v) * _loc36_;
                        if(_loc38_)
                        {
                           _loc10_.normalX = _loc6_.normalX + (_loc7_.normalX - _loc6_.normalX) * _loc36_;
                           _loc10_.normalY = _loc6_.normalY + (_loc7_.normalY - _loc6_.normalY) * _loc36_;
                           _loc10_.normalZ = _loc6_.normalZ + (_loc7_.normalZ - _loc6_.normalZ) * _loc36_;
                        }
                        _loc15_ = _loc11_.alternativa3d::create();
                        _loc15_.alternativa3d::vertex = _loc10_;
                        if(_loc12_ != null)
                        {
                           _loc13_.alternativa3d::next = _loc15_;
                        }
                        else
                        {
                           _loc12_ = _loc15_;
                        }
                        _loc13_ = _loc15_;
                     }
                     if(_loc21_ < _loc32_)
                     {
                        if(_loc12_ != null)
                        {
                           _loc13_.alternativa3d::next = _loc11_;
                        }
                        else
                        {
                           _loc12_ = _loc11_;
                        }
                        _loc13_ = _loc11_;
                        _loc11_.alternativa3d::next = null;
                     }
                     else
                     {
                        _loc11_.alternativa3d::vertex = null;
                        _loc11_.alternativa3d::next = Wrapper.alternativa3d::collector;
                        Wrapper.alternativa3d::collector = _loc11_;
                     }
                     _loc6_ = _loc7_;
                     _loc18_ = _loc21_;
                     _loc11_ = _loc14_;
                  }
                  if(_loc12_ == null)
                  {
                     _loc37_.alternativa3d::processNext = null;
                     continue;
                  }
               }
               if(_loc35_ & 4)
               {
                  _loc6_ = _loc13_.alternativa3d::vertex;
                  _loc16_ = _loc6_.alternativa3d::cameraX;
                  _loc18_ = _loc6_.alternativa3d::cameraZ;
                  _loc11_ = _loc12_;
                  _loc12_ = null;
                  _loc13_ = null;
                  while(_loc11_ != null)
                  {
                     _loc14_ = _loc11_.alternativa3d::next;
                     _loc7_ = _loc11_.alternativa3d::vertex;
                     _loc19_ = _loc7_.alternativa3d::cameraX;
                     _loc21_ = _loc7_.alternativa3d::cameraZ;
                     if(_loc21_ > -_loc19_ && _loc18_ <= -_loc16_ || _loc21_ <= -_loc19_ && _loc18_ > -_loc16_)
                     {
                        _loc36_ = (_loc16_ + _loc18_) / (_loc16_ + _loc18_ - _loc19_ - _loc21_);
                        _loc10_ = _loc7_.alternativa3d::create();
                        this.alternativa3d::lastVertex.alternativa3d::next = _loc10_;
                        this.alternativa3d::lastVertex = _loc10_;
                        _loc10_.alternativa3d::cameraX = _loc16_ + (_loc19_ - _loc16_) * _loc36_;
                        _loc10_.alternativa3d::cameraY = _loc6_.alternativa3d::cameraY + (_loc7_.alternativa3d::cameraY - _loc6_.alternativa3d::cameraY) * _loc36_;
                        _loc10_.alternativa3d::cameraZ = _loc18_ + (_loc21_ - _loc18_) * _loc36_;
                        _loc10_.x = _loc6_.x + (_loc7_.x - _loc6_.x) * _loc36_;
                        _loc10_.y = _loc6_.y + (_loc7_.y - _loc6_.y) * _loc36_;
                        _loc10_.z = _loc6_.z + (_loc7_.z - _loc6_.z) * _loc36_;
                        _loc10_.u = _loc6_.u + (_loc7_.u - _loc6_.u) * _loc36_;
                        _loc10_.v = _loc6_.v + (_loc7_.v - _loc6_.v) * _loc36_;
                        if(_loc38_)
                        {
                           _loc10_.normalX = _loc6_.normalX + (_loc7_.normalX - _loc6_.normalX) * _loc36_;
                           _loc10_.normalY = _loc6_.normalY + (_loc7_.normalY - _loc6_.normalY) * _loc36_;
                           _loc10_.normalZ = _loc6_.normalZ + (_loc7_.normalZ - _loc6_.normalZ) * _loc36_;
                        }
                        _loc15_ = _loc11_.alternativa3d::create();
                        _loc15_.alternativa3d::vertex = _loc10_;
                        if(_loc12_ != null)
                        {
                           _loc13_.alternativa3d::next = _loc15_;
                        }
                        else
                        {
                           _loc12_ = _loc15_;
                        }
                        _loc13_ = _loc15_;
                     }
                     if(_loc21_ > -_loc19_)
                     {
                        if(_loc12_ != null)
                        {
                           _loc13_.alternativa3d::next = _loc11_;
                        }
                        else
                        {
                           _loc12_ = _loc11_;
                        }
                        _loc13_ = _loc11_;
                        _loc11_.alternativa3d::next = null;
                     }
                     else
                     {
                        _loc11_.alternativa3d::vertex = null;
                        _loc11_.alternativa3d::next = Wrapper.alternativa3d::collector;
                        Wrapper.alternativa3d::collector = _loc11_;
                     }
                     _loc6_ = _loc7_;
                     _loc16_ = _loc19_;
                     _loc18_ = _loc21_;
                     _loc11_ = _loc14_;
                  }
                  if(_loc12_ == null)
                  {
                     _loc37_.alternativa3d::processNext = null;
                     continue;
                  }
               }
               if(_loc35_ & 8)
               {
                  _loc6_ = _loc13_.alternativa3d::vertex;
                  _loc16_ = _loc6_.alternativa3d::cameraX;
                  _loc18_ = _loc6_.alternativa3d::cameraZ;
                  _loc11_ = _loc12_;
                  _loc12_ = null;
                  _loc13_ = null;
                  while(_loc11_ != null)
                  {
                     _loc14_ = _loc11_.alternativa3d::next;
                     _loc7_ = _loc11_.alternativa3d::vertex;
                     _loc19_ = _loc7_.alternativa3d::cameraX;
                     _loc21_ = _loc7_.alternativa3d::cameraZ;
                     if(_loc21_ > _loc19_ && _loc18_ <= _loc16_ || _loc21_ <= _loc19_ && _loc18_ > _loc16_)
                     {
                        _loc36_ = (_loc18_ - _loc16_) / (_loc18_ - _loc16_ + _loc19_ - _loc21_);
                        _loc10_ = _loc7_.alternativa3d::create();
                        this.alternativa3d::lastVertex.alternativa3d::next = _loc10_;
                        this.alternativa3d::lastVertex = _loc10_;
                        _loc10_.alternativa3d::cameraX = _loc16_ + (_loc19_ - _loc16_) * _loc36_;
                        _loc10_.alternativa3d::cameraY = _loc6_.alternativa3d::cameraY + (_loc7_.alternativa3d::cameraY - _loc6_.alternativa3d::cameraY) * _loc36_;
                        _loc10_.alternativa3d::cameraZ = _loc18_ + (_loc21_ - _loc18_) * _loc36_;
                        _loc10_.x = _loc6_.x + (_loc7_.x - _loc6_.x) * _loc36_;
                        _loc10_.y = _loc6_.y + (_loc7_.y - _loc6_.y) * _loc36_;
                        _loc10_.z = _loc6_.z + (_loc7_.z - _loc6_.z) * _loc36_;
                        _loc10_.u = _loc6_.u + (_loc7_.u - _loc6_.u) * _loc36_;
                        _loc10_.v = _loc6_.v + (_loc7_.v - _loc6_.v) * _loc36_;
                        if(_loc38_)
                        {
                           _loc10_.normalX = _loc6_.normalX + (_loc7_.normalX - _loc6_.normalX) * _loc36_;
                           _loc10_.normalY = _loc6_.normalY + (_loc7_.normalY - _loc6_.normalY) * _loc36_;
                           _loc10_.normalZ = _loc6_.normalZ + (_loc7_.normalZ - _loc6_.normalZ) * _loc36_;
                        }
                        _loc15_ = _loc11_.alternativa3d::create();
                        _loc15_.alternativa3d::vertex = _loc10_;
                        if(_loc12_ != null)
                        {
                           _loc13_.alternativa3d::next = _loc15_;
                        }
                        else
                        {
                           _loc12_ = _loc15_;
                        }
                        _loc13_ = _loc15_;
                     }
                     if(_loc21_ > _loc19_)
                     {
                        if(_loc12_ != null)
                        {
                           _loc13_.alternativa3d::next = _loc11_;
                        }
                        else
                        {
                           _loc12_ = _loc11_;
                        }
                        _loc13_ = _loc11_;
                        _loc11_.alternativa3d::next = null;
                     }
                     else
                     {
                        _loc11_.alternativa3d::vertex = null;
                        _loc11_.alternativa3d::next = Wrapper.alternativa3d::collector;
                        Wrapper.alternativa3d::collector = _loc11_;
                     }
                     _loc6_ = _loc7_;
                     _loc16_ = _loc19_;
                     _loc18_ = _loc21_;
                     _loc11_ = _loc14_;
                  }
                  if(_loc12_ == null)
                  {
                     _loc37_.alternativa3d::processNext = null;
                     continue;
                  }
               }
               if(_loc35_ & 0x10)
               {
                  _loc6_ = _loc13_.alternativa3d::vertex;
                  _loc17_ = _loc6_.alternativa3d::cameraY;
                  _loc18_ = _loc6_.alternativa3d::cameraZ;
                  _loc11_ = _loc12_;
                  _loc12_ = null;
                  _loc13_ = null;
                  while(_loc11_ != null)
                  {
                     _loc14_ = _loc11_.alternativa3d::next;
                     _loc7_ = _loc11_.alternativa3d::vertex;
                     _loc20_ = _loc7_.alternativa3d::cameraY;
                     _loc21_ = _loc7_.alternativa3d::cameraZ;
                     if(_loc21_ > -_loc20_ && _loc18_ <= -_loc17_ || _loc21_ <= -_loc20_ && _loc18_ > -_loc17_)
                     {
                        _loc36_ = (_loc17_ + _loc18_) / (_loc17_ + _loc18_ - _loc20_ - _loc21_);
                        _loc10_ = _loc7_.alternativa3d::create();
                        this.alternativa3d::lastVertex.alternativa3d::next = _loc10_;
                        this.alternativa3d::lastVertex = _loc10_;
                        _loc10_.alternativa3d::cameraX = _loc6_.alternativa3d::cameraX + (_loc7_.alternativa3d::cameraX - _loc6_.alternativa3d::cameraX) * _loc36_;
                        _loc10_.alternativa3d::cameraY = _loc17_ + (_loc20_ - _loc17_) * _loc36_;
                        _loc10_.alternativa3d::cameraZ = _loc18_ + (_loc21_ - _loc18_) * _loc36_;
                        _loc10_.x = _loc6_.x + (_loc7_.x - _loc6_.x) * _loc36_;
                        _loc10_.y = _loc6_.y + (_loc7_.y - _loc6_.y) * _loc36_;
                        _loc10_.z = _loc6_.z + (_loc7_.z - _loc6_.z) * _loc36_;
                        _loc10_.u = _loc6_.u + (_loc7_.u - _loc6_.u) * _loc36_;
                        _loc10_.v = _loc6_.v + (_loc7_.v - _loc6_.v) * _loc36_;
                        if(_loc38_)
                        {
                           _loc10_.normalX = _loc6_.normalX + (_loc7_.normalX - _loc6_.normalX) * _loc36_;
                           _loc10_.normalY = _loc6_.normalY + (_loc7_.normalY - _loc6_.normalY) * _loc36_;
                           _loc10_.normalZ = _loc6_.normalZ + (_loc7_.normalZ - _loc6_.normalZ) * _loc36_;
                        }
                        _loc15_ = _loc11_.alternativa3d::create();
                        _loc15_.alternativa3d::vertex = _loc10_;
                        if(_loc12_ != null)
                        {
                           _loc13_.alternativa3d::next = _loc15_;
                        }
                        else
                        {
                           _loc12_ = _loc15_;
                        }
                        _loc13_ = _loc15_;
                     }
                     if(_loc21_ > -_loc20_)
                     {
                        if(_loc12_ != null)
                        {
                           _loc13_.alternativa3d::next = _loc11_;
                        }
                        else
                        {
                           _loc12_ = _loc11_;
                        }
                        _loc13_ = _loc11_;
                        _loc11_.alternativa3d::next = null;
                     }
                     else
                     {
                        _loc11_.alternativa3d::vertex = null;
                        _loc11_.alternativa3d::next = Wrapper.alternativa3d::collector;
                        Wrapper.alternativa3d::collector = _loc11_;
                     }
                     _loc6_ = _loc7_;
                     _loc17_ = _loc20_;
                     _loc18_ = _loc21_;
                     _loc11_ = _loc14_;
                  }
                  if(_loc12_ == null)
                  {
                     _loc37_.alternativa3d::processNext = null;
                     continue;
                  }
               }
               if(_loc35_ & 0x20)
               {
                  _loc6_ = _loc13_.alternativa3d::vertex;
                  _loc17_ = _loc6_.alternativa3d::cameraY;
                  _loc18_ = _loc6_.alternativa3d::cameraZ;
                  _loc11_ = _loc12_;
                  _loc12_ = null;
                  _loc13_ = null;
                  while(_loc11_ != null)
                  {
                     _loc14_ = _loc11_.alternativa3d::next;
                     _loc7_ = _loc11_.alternativa3d::vertex;
                     _loc20_ = _loc7_.alternativa3d::cameraY;
                     _loc21_ = _loc7_.alternativa3d::cameraZ;
                     if(_loc21_ > _loc20_ && _loc18_ <= _loc17_ || _loc21_ <= _loc20_ && _loc18_ > _loc17_)
                     {
                        _loc36_ = (_loc18_ - _loc17_) / (_loc18_ - _loc17_ + _loc20_ - _loc21_);
                        _loc10_ = _loc7_.alternativa3d::create();
                        this.alternativa3d::lastVertex.alternativa3d::next = _loc10_;
                        this.alternativa3d::lastVertex = _loc10_;
                        _loc10_.alternativa3d::cameraX = _loc6_.alternativa3d::cameraX + (_loc7_.alternativa3d::cameraX - _loc6_.alternativa3d::cameraX) * _loc36_;
                        _loc10_.alternativa3d::cameraY = _loc17_ + (_loc20_ - _loc17_) * _loc36_;
                        _loc10_.alternativa3d::cameraZ = _loc18_ + (_loc21_ - _loc18_) * _loc36_;
                        _loc10_.x = _loc6_.x + (_loc7_.x - _loc6_.x) * _loc36_;
                        _loc10_.y = _loc6_.y + (_loc7_.y - _loc6_.y) * _loc36_;
                        _loc10_.z = _loc6_.z + (_loc7_.z - _loc6_.z) * _loc36_;
                        _loc10_.u = _loc6_.u + (_loc7_.u - _loc6_.u) * _loc36_;
                        _loc10_.v = _loc6_.v + (_loc7_.v - _loc6_.v) * _loc36_;
                        if(_loc38_)
                        {
                           _loc10_.normalX = _loc6_.normalX + (_loc7_.normalX - _loc6_.normalX) * _loc36_;
                           _loc10_.normalY = _loc6_.normalY + (_loc7_.normalY - _loc6_.normalY) * _loc36_;
                           _loc10_.normalZ = _loc6_.normalZ + (_loc7_.normalZ - _loc6_.normalZ) * _loc36_;
                        }
                        _loc15_ = _loc11_.alternativa3d::create();
                        _loc15_.alternativa3d::vertex = _loc10_;
                        if(_loc12_ != null)
                        {
                           _loc13_.alternativa3d::next = _loc15_;
                        }
                        else
                        {
                           _loc12_ = _loc15_;
                        }
                        _loc13_ = _loc15_;
                     }
                     if(_loc21_ > _loc20_)
                     {
                        if(_loc12_ != null)
                        {
                           _loc13_.alternativa3d::next = _loc11_;
                        }
                        else
                        {
                           _loc12_ = _loc11_;
                        }
                        _loc13_ = _loc11_;
                        _loc11_.alternativa3d::next = null;
                     }
                     else
                     {
                        _loc11_.alternativa3d::vertex = null;
                        _loc11_.alternativa3d::next = Wrapper.alternativa3d::collector;
                        Wrapper.alternativa3d::collector = _loc11_;
                     }
                     _loc6_ = _loc7_;
                     _loc17_ = _loc20_;
                     _loc18_ = _loc21_;
                     _loc11_ = _loc14_;
                  }
                  if(_loc12_ == null)
                  {
                     _loc37_.alternativa3d::processNext = null;
                     continue;
                  }
               }
               _loc37_.alternativa3d::processNext = null;
               _loc39_ = _loc37_.alternativa3d::create();
               _loc39_.material = _loc37_.material;
               this.alternativa3d::lastFace.alternativa3d::next = _loc39_;
               this.alternativa3d::lastFace = _loc39_;
               _loc39_.alternativa3d::wrapper = _loc12_;
               _loc37_ = _loc39_;
            }
            if(_loc3_ != null)
            {
               _loc4_.alternativa3d::processNext = _loc37_;
            }
            else
            {
               _loc3_ = _loc37_;
            }
            _loc4_ = _loc37_;
         }
         if(_loc4_ != null)
         {
            _loc4_.alternativa3d::processNext = null;
         }
         return _loc3_;
      }
   }
}

