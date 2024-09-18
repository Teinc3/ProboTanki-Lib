package Renamed3294
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.camera.Renamed842;
   import alternativa.tanks.camera.Renamed611;
   import alternativa.tanks.models.tank.Renamed775;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.utils.MathUtils;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class Renamed3295 implements Renamed611
   {
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var Renamed3672:IDisplay;
      
      [Inject]
      public static var settings:ISettingsService;
      
      private static const Renamed5690:Number = 15;
      
      private static const Renamed5691:Number = Renamed5690 * Math.PI / 180;
      
      private static var Renamed5692:Vector3 = new Vector3();
      
      private static var Renamed5693:Matrix4 = new Matrix4();
      
      private static var Renamed5694:Matrix4 = new Matrix4();
      
      private static var Renamed5695:Vector3 = new Vector3();
      
      private var stage:Stage;
      
      private var Renamed5696:Point;
      
      private var Renamed5697:Boolean = false;
      
      private var camera:Renamed842;
      
      private var Renamed5698:Number;
      
      private var Renamed5699:Number;
      
      private var movementX:Number;
      
      private var movementY:Number;
      
      private var rotationX:Number;
      
      private var rotationZ:Number;
      
      private var Renamed5700:Number;
      
      public function Renamed3295(param1:Number, param2:Number)
      {
         this.Renamed5696 = new Point();
         super();
         this.Renamed5698 = param1;
         this.Renamed5699 = param2;
         this.stage = Renamed3672.stage;
      }
      
      public function activate() : void
      {
         this.camera = battleService.Renamed621().Renamed739();
         this.movementX = 0;
         this.movementY = 0;
         this.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         this.Renamed5701();
         this.Renamed5700 = Renamed775.Renamed824.tank.Renamed697();
         this.rotationX = 0;
         this.rotationZ = 0;
      }
      
      public function deactivate() : void
      {
         this.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         this.Renamed5702();
      }
      
      private function Renamed5701() : void
      {
         this.Renamed5696.x = this.stage.mouseX;
         this.Renamed5696.y = this.stage.mouseY;
         this.Renamed5697 = true;
      }
      
      public function Renamed5702(param1:Event = null) : void
      {
         this.Renamed5697 = false;
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         this.movementX += param1["movementX"];
         this.movementY += param1["movementY"] * this.Renamed1564();
      }
      
      private function Renamed5703(param1:Number, param2:Number) : Number
      {
         return Math.atan2(Math.sin(param1 - param2),Math.cos(param1 - param2));
      }
      
      public function update(param1:int, param2:int) : void
      {
         var _loc3_:Tank = null;
         var _loc4_:Object3D = null;
         var _loc5_:Mesh = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         if(this.Renamed5697)
         {
            _loc3_ = Renamed775.Renamed824.tank;
            if(this.movementX != 0 || this.movementY != 0)
            {
               this.Renamed5696.x = this.stage.mouseX;
               this.Renamed5696.y = this.stage.mouseY;
               _loc6_ = this.Renamed5704();
               _loc7_ = -this.movementY * _loc6_ / this.stage.stageHeight;
               this.rotationX = MathUtils.clamp(MathUtils.clampAngle(this.rotationX + _loc7_),this.Renamed5699,this.Renamed5698);
               _loc8_ = this.Renamed5705();
               _loc9_ = _loc3_.Renamed697();
               _loc10_ = this.rotationZ - this.movementX * _loc8_ / this.stage.stageWidth;
               _loc11_ = _loc10_ + this.Renamed5700;
               _loc12_ = this.Renamed5703(_loc11_,_loc9_);
               _loc12_ = MathUtils.clamp(_loc12_,-Renamed5691,Renamed5691);
               _loc13_ = _loc9_ + _loc12_;
               _loc14_ = _loc13_ - this.Renamed5700;
               this.rotationZ = _loc14_;
               this.movementX = 0;
               this.movementY = 0;
            }
            Renamed5692.copy(_loc3_.Renamed1071());
            Renamed5692.y = 0;
            Renamed5693.setPosition(Renamed5692);
            _loc4_ = _loc3_.Renamed1020();
            Renamed5694.setMatrix(_loc4_.x,_loc4_.y,_loc4_.z,_loc4_.rotationX,_loc4_.rotationY,_loc4_.rotationZ);
            Renamed5693.append(Renamed5694);
            this.camera.x = Renamed5693.m03;
            this.camera.y = Renamed5693.m13;
            this.camera.z = Renamed5693.m23;
            _loc5_ = _loc3_.Renamed1075().Renamed1023();
            Renamed5693.setMatrix(0,0,0,-Math.PI / 2 + this.rotationX,0,this.rotationZ + this.Renamed5700);
            Renamed5694.setMatrix(0,0,0,_loc5_.rotationX,_loc5_.rotationY,_loc5_.rotationZ);
            Renamed5693.append(Renamed5694);
            Renamed5693.getEulerAngles(Renamed5695);
            this.camera.rotationX = MathUtils.clampAngle(Renamed5695.x);
            this.camera.rotationY = MathUtils.clampAngle(Renamed5695.y);
            this.camera.rotationZ = MathUtils.clampAngle(Renamed5695.z);
         }
      }
      
      private function Renamed5704() : Number
      {
         return 2 * Math.atan(this.stage.stageHeight / (2 * this.Renamed5706()));
      }
      
      private function Renamed5705() : Number
      {
         return 2 * Math.atan(this.stage.stageWidth / (2 * this.Renamed5706()));
      }
      
      private function Renamed5706() : Number
      {
         return Math.sqrt(this.stage.stageWidth * this.stage.stageWidth + this.stage.stageHeight * this.stage.stageHeight) / (2 * Math.tan(this.camera.fov * 0.5));
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
      }
      
      private function Renamed1564() : int
      {
         return !!settings.mouseYInverseShaftAim ? int(-1) : int(1);
      }
   }
}

