package alternativa.tanks.gui.tankpreview
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.core.MipMapping;
   import alternativa.engine3d.core.Object3DContainer;
   import alternativa.engine3d.core.Vertex;
   import alternativa.engine3d.core.View;
   import alternativa.engine3d.core.Wrapper;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.BSP;
   import alternativa.engine3d.objects.Decal;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.osgi.service.locale.ILocaleService;
   import controls.TankWindow;
   import controls.TankWindowHeader;
   import controls.TankWindowInner;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.display.Shape;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.BlurFilter;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Vector3D;
   import flash.utils.Timer;
   import projects.tanks.clients.flash.commons.models.gpu.GPUCapabilities;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   import projects.tanks.clients.flash.resources.tanks.Tank3D;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.disposeBitmapsData;
   
   use namespace alternativa3d;
   
   public class TankPreviewWindow extends TankWindow
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      private static const §-#;§:Number = -1;
      
      private static const INITIAL_CAMERA_DIRECTION:Number = -150;
      
      private static const WINDOW_MARGIN:int = 11;
      
      private static const CAMERA_ANGLE:Number = -135;
      
      private static const CAMERA_DISTANCE:Number = -730;
      
      private static const §throw const true§:Number = 0.7;
      
      private static const §'#z§:Number = 13;
      
      private static const §`#Z§:Number = 2.5;
      
      private static const §include set try§:Vector3D = new Vector3D(0,0,-1);
      
      private var innerBevel:TankWindowInner;
      
      private var backgroundEraser:Shape;
      
      private var rootContainer:Object3DContainer;
      
      private var §in set break§:Object3DContainer;
      
      private var cameraContainer:Object3DContainer;
      
      private var camera:Camera3D;
      
      private var stateMachine:TankPreviewStateMachine;
      
      private var tank:Tank3D;
      
      private var loadedPartsCounter:int = 0;
      
      private var backgroundEraserTimer:Timer;
      
      private var shadow:Mesh;
      
      private var _hull:Tanks3DSResource;
      
      private var _turret:Tanks3DSResource;
      
      private var bitmapsData:Array;
      
      public function TankPreviewWindow(param1:Tanks3DSResource)
      {
         super(400,300);
         this.bitmapsData = [];
         this.setHeader();
         this.init3D();
         this.createWindowInnerBevel();
         this.addGarageObjectsToScene(param1);
         this.createTank();
         this.resize(400,300);
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
      
      private function setHeader() : void
      {
         headerLang = localeService.getText(TanksLocale.TEXT_GUI_LANG);
         header = TankWindowHeader.YOUR_TANK;
      }
      
      private function init3D() : void
      {
         this.rootContainer = new Object3DContainer();
         this.camera = new Camera3D();
         this.camera.view = new View(100,100,GPUCapabilities.constrained);
         this.camera.view.hideLogo();
         addChild(this.camera.view);
         this.cameraContainer = new Object3DContainer();
         this.rootContainer.addChild(this.cameraContainer);
         this.§in set break§ = new Object3DContainer();
         this.rootContainer.addChild(this.§in set break§);
         this.cameraContainer.addChild(this.camera);
         this.cameraContainer.rotationX = CAMERA_ANGLE * Math.PI / 180;
         this.camera.z = CAMERA_DISTANCE;
         this.cameraContainer.rotationZ = INITIAL_CAMERA_DIRECTION * Math.PI / 180;
         if(GPUCapabilities.gpuEnabled)
         {
            this.backgroundEraser = new Shape();
            this.backgroundEraser.blendMode = BlendMode.ERASE;
         }
      }
      
      private function createWindowInnerBevel() : void
      {
         this.innerBevel = new TankWindowInner(0,0,TankWindowInner.TRANSPARENT);
         addChild(this.innerBevel);
         this.innerBevel.mouseEnabled = true;
      }
      
      private function createTank() : void
      {
         this.tank = new Tank3D();
         this.rootContainer.addChild(this.tank);
         this.tank.matrix.appendTranslation(-17,0,0);
      }
      
      private function addGarageObjectsToScene(param1:Tanks3DSResource) : void
      {
         var _loc2_:Mesh = null;
         var _loc3_:TextureMaterial = null;
         var _loc4_:BSP = null;
         var _loc5_:int = int(param1.objects.length);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc2_ = param1.objects[_loc6_] as Mesh;
            if(_loc2_ != null)
            {
               _loc3_ = TextureMaterial(_loc2_.alternativa3d::faceList.material);
               _loc3_.texture = param1.getTextureForObject(_loc6_);
               _loc2_.setMaterialToAllFaces(_loc3_);
               _loc4_ = new BSP();
               _loc4_.createTree(_loc2_);
               _loc4_.matrix = _loc2_.matrix;
               this.§in set break§.addChild(_loc4_);
            }
            _loc6_++;
         }
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.ENTER_FRAME,this.onEnterFrame,false,§-#;§);
         this.initStateMachine();
         if(GPUCapabilities.gpuEnabled)
         {
            this.backgroundEraserTimer = new Timer(1000,1);
            this.backgroundEraserTimer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onBackgroundEraserTimerComplete);
            this.backgroundEraserTimer.start();
         }
      }
      
      private function onBackgroundEraserTimerComplete(param1:TimerEvent) : void
      {
         addChild(this.backgroundEraser);
         this.backgroundEraserTimer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onBackgroundEraserTimerComplete);
         this.backgroundEraserTimer = null;
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         this.stateMachine.updateCurrentState();
         this.camera.render();
      }
      
      private function initStateMachine() : void
      {
         this.stateMachine = new TankPreviewStateMachine();
         var _loc1_:TankPreviewContext = new TankPreviewContext();
         var _loc2_:ManualRotationState = new ManualRotationState(this.stateMachine,stage,_loc1_,this.camera,this.cameraContainer);
         var _loc3_:RotationDecelerationState = new RotationDecelerationState(this.stateMachine,this.innerBevel,_loc1_,this.cameraContainer);
         var _loc4_:IdleState = new IdleState(this.stateMachine,this.innerBevel);
         var _loc5_:AutoRotationState = new AutoRotationState(this.stateMachine,this.innerBevel,this.cameraContainer);
         this.stateMachine.addTransition(TankPreviewEvent.MOUSE_DOWN,_loc3_,_loc2_);
         this.stateMachine.addTransition(TankPreviewEvent.MOUSE_DOWN,_loc4_,_loc2_);
         this.stateMachine.addTransition(TankPreviewEvent.MOUSE_DOWN,_loc5_,_loc2_);
         this.stateMachine.addTransition(TankPreviewEvent.STOP_MANUAL_ROTATION,_loc2_,_loc3_);
         this.stateMachine.addTransition(TankPreviewEvent.ROTATION_STOPPED,_loc3_,_loc4_);
         this.stateMachine.addTransition(TankPreviewEvent.IDLE_STATE_TIMEOUT,_loc4_,_loc5_);
         this.stateMachine.setCurrentState(_loc4_);
      }
      
      public function destroy() : void
      {
         removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         if(this.backgroundEraserTimer != null)
         {
            this.backgroundEraserTimer.stop();
            this.backgroundEraserTimer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onBackgroundEraserTimerComplete);
            this.backgroundEraserTimer = null;
         }
         this.innerBevel = null;
         this.rootContainer = null;
         this.cameraContainer = null;
         this.camera.view.clear();
         this.camera = null;
         this.tank.destroy();
         this.tank = null;
         this.shadow = null;
         this._hull = null;
         this._turret = null;
         disposeBitmapsData(this.bitmapsData);
         this.bitmapsData = null;
      }
      
      public function setHull(param1:Tanks3DSResource) : void
      {
         this._hull = param1;
         this.tank.setHull(this._hull);
         this.onTankPartLoaded();
      }
      
      public function setTurret(param1:Tanks3DSResource) : void
      {
         this._turret = param1;
         this.tank.setTurret(this._turret);
         this.onTankPartLoaded();
      }
      
      public function setColorMap(param1:BitmapData) : void
      {
         this.tank.setColorMap(param1);
         this.onTankPartLoaded();
      }
      
      private function onTankPartLoaded() : void
      {
         if(this.loadedPartsCounter < 3)
         {
            ++this.loadedPartsCounter;
         }
         if(this.loadedPartsCounter == 3)
         {
            if(this.shadow != null && this.tank.contains(this.shadow))
            {
               this.tank.removeChild(this.shadow);
            }
            this.shadow = this.§true catch use§(Mesh(this._hull.objects[0]),§include set try§,§`#Z§,§'#z§,§throw const true§);
            this.tank.addChildAt(this.shadow,0);
            if(!GPUCapabilities.gpuEnabled)
            {
               this.camera.render();
            }
         }
      }
      
      public function resize(param1:Number, param2:Number) : void
      {
         this.width = param1;
         this.height = param2;
         this.adjustInnerBevel(param1,param2);
         this.adjustView3D(param1,param2);
         this.§##L§();
         if(!GPUCapabilities.gpuEnabled)
         {
            this.camera.render();
         }
      }
      
      private function adjustInnerBevel(param1:Number, param2:Number) : void
      {
         this.innerBevel.width = param1 - WINDOW_MARGIN * 2;
         this.innerBevel.height = param2 - WINDOW_MARGIN * 2;
         this.innerBevel.x = WINDOW_MARGIN;
         this.innerBevel.y = WINDOW_MARGIN;
      }
      
      private function adjustView3D(param1:Number, param2:Number) : void
      {
         this.camera.view.width = param1 - WINDOW_MARGIN * 2 - 2;
         this.camera.view.height = param2 - WINDOW_MARGIN * 2 - 2;
         this.camera.view.x = WINDOW_MARGIN;
         this.camera.view.y = WINDOW_MARGIN;
      }
      
      private function §##L§() : void
      {
         if(GPUCapabilities.gpuEnabled)
         {
            this.backgroundEraser.x = this.camera.view.x;
            this.backgroundEraser.y = this.camera.view.y;
            this.backgroundEraser.graphics.clear();
            this.backgroundEraser.graphics.beginFill(16711680);
            this.backgroundEraser.graphics.drawRect(0,0,this.camera.view.width,this.camera.view.height);
            this.backgroundEraser.graphics.endFill();
         }
      }
      
      private function §true catch use§(param1:Mesh, param2:Vector3D, param3:Number, param4:int, param5:Number, param6:uint = 0) : Mesh
      {
         var _loc7_:Wrapper = null;
         var _loc8_:Vertex = null;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Decal = null;
         param2 = param2.clone();
         param2.normalize();
         var _loc13_:Number = 1e+22;
         var _loc14_:Number = 1e+22;
         var _loc15_:Number = -1e+22;
         var _loc16_:Number = -1e+22;
         var _loc17_:Shape = new Shape();
         var _loc18_:Face = param1.alternativa3d::faceList;
         while(_loc18_ != null)
         {
            _loc7_ = _loc18_.alternativa3d::wrapper;
            while(_loc7_ != null)
            {
               _loc8_ = _loc7_.alternativa3d::vertex;
               _loc9_ = -_loc8_.z / param2.z;
               _loc10_ = _loc8_.x + param2.x * _loc9_;
               _loc11_ = _loc8_.y + param2.y * _loc9_;
               if(_loc10_ < _loc13_)
               {
                  _loc13_ = _loc10_;
               }
               if(_loc10_ > _loc15_)
               {
                  _loc15_ = _loc10_;
               }
               if(_loc11_ < _loc14_)
               {
                  _loc14_ = _loc11_;
               }
               if(_loc11_ > _loc16_)
               {
                  _loc16_ = _loc11_;
               }
               if(_loc7_ == _loc18_.alternativa3d::wrapper)
               {
                  _loc17_.graphics.beginFill(param6);
                  _loc17_.graphics.moveTo(_loc10_,_loc11_);
               }
               else
               {
                  _loc17_.graphics.lineTo(_loc10_,_loc11_);
               }
               _loc7_ = _loc7_.alternativa3d::next;
            }
            _loc18_ = _loc18_.alternativa3d::next;
         }
         _loc13_ = (Math.floor(_loc13_ / param3) - param4) * param3;
         _loc14_ = (Math.floor(_loc14_ / param3) - param4) * param3;
         _loc15_ = (Math.ceil(_loc15_ / param3) + param4) * param3;
         _loc16_ = (Math.ceil(_loc16_ / param3) + param4) * param3;
         var _loc19_:BitmapData = new BitmapData(Math.round((_loc15_ - _loc13_) / param3),Math.round((_loc16_ - _loc14_) / param3),true,0);
         this.bitmapsData.push(_loc19_);
         _loc19_.draw(_loc17_,new Matrix(1 / param3,0,0,-1 / param3,-_loc13_ / param3,_loc16_ / param3));
         _loc19_.applyFilter(_loc19_,_loc19_.rect,new Point(),new BlurFilter(param4,param4,BitmapFilterQuality.MEDIUM));
         var _loc20_:TextureMaterial = new TextureMaterial(_loc19_,false,true,MipMapping.PER_PIXEL,param3);
         var _loc21_:Mesh = new Mesh();
         var _loc22_:Vertex = _loc21_.addVertex(_loc13_,_loc16_,0,0,0);
         var _loc23_:Vertex = _loc21_.addVertex(_loc13_,_loc14_,0,0,1);
         var _loc24_:Vertex = _loc21_.addVertex(_loc15_,_loc14_,0,1,1);
         var _loc25_:Vertex = _loc21_.addVertex(_loc15_,_loc16_,0,1,0);
         _loc21_.addQuadFace(_loc22_,_loc23_,_loc24_,_loc25_,_loc20_);
         _loc21_.calculateFacesNormals();
         _loc21_.calculateBounds();
         _loc21_.alpha = param5;
         if(GPUCapabilities.gpuEnabled)
         {
            _loc12_ = new Decal();
            _loc12_.createGeometry(_loc21_,true);
            _loc12_.x = _loc21_.x;
            _loc12_.y = _loc21_.y;
            _loc12_.z = _loc21_.z;
            _loc12_.alpha = _loc21_.alpha;
            return _loc12_;
         }
         return _loc21_;
      }
   }
}

