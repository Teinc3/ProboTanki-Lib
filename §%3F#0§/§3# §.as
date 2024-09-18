package §?#0§
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.camera.§3!0§;
   import alternativa.tanks.camera.§function const package§;
   import alternativa.tanks.models.tank.§7!9§;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.utils.MathUtils;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class §3# § implements §function const package§
   {
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var §break package with§:IDisplay;
      
      [Inject]
      public static var settings:ISettingsService;
      
      private static const §,"N§:Number = 15;
      
      private static const §2"!§:Number = §,"N§ * Math.PI / 180;
      
      private static var §`!-§:Vector3 = new Vector3();
      
      private static var §try set const§:Matrix4 = new Matrix4();
      
      private static var §var for while§:Matrix4 = new Matrix4();
      
      private static var §do var do§:Vector3 = new Vector3();
      
      private var stage:Stage;
      
      private var §^"B§:Point;
      
      private var §package set with§:Boolean = false;
      
      private var camera:§3!0§;
      
      private var §##q§:Number;
      
      private var §extends for null§:Number;
      
      private var movementX:Number;
      
      private var movementY:Number;
      
      private var rotationX:Number;
      
      private var rotationZ:Number;
      
      private var §2!U§:Number;
      
      public function §3# §(param1:Number, param2:Number)
      {
         this.§^"B§ = new Point();
         super();
         this.§##q§ = param1;
         this.§extends for null§ = param2;
         this.stage = §break package with§.stage;
      }
      
      public function activate() : void
      {
         this.camera = battleService.§3l§().§super package§();
         this.movementX = 0;
         this.movementY = 0;
         this.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         this.§include set super§();
         this.§2!U§ = §7!9§.§8"-§.tank.§set const implements§();
         this.rotationX = 0;
         this.rotationZ = 0;
      }
      
      public function deactivate() : void
      {
         this.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         this.§1"O§();
      }
      
      private function §include set super§() : void
      {
         this.§^"B§.x = this.stage.mouseX;
         this.§^"B§.y = this.stage.mouseY;
         this.§package set with§ = true;
      }
      
      public function §1"O§(param1:Event = null) : void
      {
         this.§package set with§ = false;
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         this.movementX += param1["movementX"];
         this.movementY += param1["movementY"] * this.§`#B§();
      }
      
      private function §&$$§(param1:Number, param2:Number) : Number
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
         if(this.§package set with§)
         {
            _loc3_ = §7!9§.§8"-§.tank;
            if(this.movementX != 0 || this.movementY != 0)
            {
               this.§^"B§.x = this.stage.mouseX;
               this.§^"B§.y = this.stage.mouseY;
               _loc6_ = this.§return set function§();
               _loc7_ = -this.movementY * _loc6_ / this.stage.stageHeight;
               this.rotationX = MathUtils.clamp(MathUtils.clampAngle(this.rotationX + _loc7_),this.§extends for null§,this.§##q§);
               _loc8_ = this.§native var case§();
               _loc9_ = _loc3_.§set const implements§();
               _loc10_ = this.rotationZ - this.movementX * _loc8_ / this.stage.stageWidth;
               _loc11_ = _loc10_ + this.§2!U§;
               _loc12_ = this.§&$$§(_loc11_,_loc9_);
               _loc12_ = MathUtils.clamp(_loc12_,-§2"!§,§2"!§);
               _loc13_ = _loc9_ + _loc12_;
               _loc14_ = _loc13_ - this.§2!U§;
               this.rotationZ = _loc14_;
               this.movementX = 0;
               this.movementY = 0;
            }
            §`!-§.copy(_loc3_.§else catch true§());
            §`!-§.y = 0;
            §try set const§.setPosition(§`!-§);
            _loc4_ = _loc3_.§2"F§();
            §var for while§.setMatrix(_loc4_.x,_loc4_.y,_loc4_.z,_loc4_.rotationX,_loc4_.rotationY,_loc4_.rotationZ);
            §try set const§.append(§var for while§);
            this.camera.x = §try set const§.m03;
            this.camera.y = §try set const§.m13;
            this.camera.z = §try set const§.m23;
            _loc5_ = _loc3_.§in package default§().§7!T§();
            §try set const§.setMatrix(0,0,0,-Math.PI / 2 + this.rotationX,0,this.rotationZ + this.§2!U§);
            §var for while§.setMatrix(0,0,0,_loc5_.rotationX,_loc5_.rotationY,_loc5_.rotationZ);
            §try set const§.append(§var for while§);
            §try set const§.getEulerAngles(§do var do§);
            this.camera.rotationX = MathUtils.clampAngle(§do var do§.x);
            this.camera.rotationY = MathUtils.clampAngle(§do var do§.y);
            this.camera.rotationZ = MathUtils.clampAngle(§do var do§.z);
         }
      }
      
      private function §return set function§() : Number
      {
         return 2 * Math.atan(this.stage.stageHeight / (2 * this.§function var finally§()));
      }
      
      private function §native var case§() : Number
      {
         return 2 * Math.atan(this.stage.stageWidth / (2 * this.§function var finally§()));
      }
      
      private function §function var finally§() : Number
      {
         return Math.sqrt(this.stage.stageWidth * this.stage.stageWidth + this.stage.stageHeight * this.stage.stageHeight) / (2 * Math.tan(this.camera.fov * 0.5));
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
      }
      
      private function §`#B§() : int
      {
         return !!settings.mouseYInverseShaftAim ? int(-1) : int(1);
      }
   }
}

