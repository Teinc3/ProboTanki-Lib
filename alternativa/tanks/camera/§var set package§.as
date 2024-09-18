package alternativa.tanks.camera
{
   import §]#R§.§1!X§;
   import alternativa.engine3d.core.EllipsoidCollider;
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.osgi.service.console.variables.ConsoleVarFloat;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.events.§9"A§;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.§throw package continue§;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.service.settings.SettingsServiceEvent;
   import alternativa.tanks.service.settings.keybinding.§&7§;
   import alternativa.tanks.service.settings.keybinding.KeysBindingService;
   import alternativa.tanks.services.targeting.§9#j§;
   import alternativa.tanks.services.targeting.TargetingInputManager;
   import alternativa.tanks.utils.MathUtils;
   import flash.display.Stage;
   import flash.geom.Point;
   import flash.geom.Vector3D;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   
   public class §var set package§ extends §#X§ implements §9#j§, §throw package continue§
   {
      [Inject]
      public static var settings:ISettingsService;
      
      [Inject]
      public static var storageService:IStorageService;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var §9!U§:TargetingInputManager;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var §5!$§:KeysBindingService;
      
      private static const §7!`§:ConsoleVarFloat = new ConsoleVarFloat("cam_vspeed",0.7,0,10);
      
      private static const §for var get§:Number = 0.001;
      
      private static const §,#J§:Number = 5 * Math.PI / 180;
      
      private static const §0#0§:Number = 50;
      
      private static const §package const var§:Number = 5;
      
      private static const §true for catch§:Number = 3;
      
      private static const §0"8§:Number = 9;
      
      private static const collisionPoint:Vector3 = new Vector3();
      
      private static const §;]§:Vector3 = new Vector3();
      
      private static const §1#§:Vector3D = new Vector3D();
      
      private static const §&#H§:Vector3D = new Vector3D();
      
      private static const §static for with§:Vector3D = new Vector3D();
      
      private static const §if const var§:Vector3D = new Vector3D();
      
      private static const §get catch break§:Matrix3 = new Matrix3();
      
      private static const axis:Vector3 = new Vector3();
      
      private static const §2#D§:Vector3 = new Vector3();
      
      private static var §7!§:ConsoleVarFloat = new ConsoleVarFloat("cam_maxmove",§package const var§,0,§package const var§);
      
      public static var §?r§:Number = 10;
      
      public static var §]"%§:Number = Math.PI / 180;
      
      public static var §'#?§:Number = 10;
      
      private static const §finally const final§:Number = 10 * Math.PI / 180;
      
      private static const §extends for for§:Number = 1;
      
      private static const §3z§:Number = 300;
      
      private static const §return const import§:Vector3 = new Vector3();
      
      private static const §continue catch dynamic§:Vector3 = new Vector3();
      
      private static const §3#q§:Vector3 = new Vector3();
      
      private static const §%"8§:Vector3 = new Vector3();
      
      private static const §[!>§:Vector3 = new Vector3();
      
      private var §=$$§:Boolean;
      
      public var §while extends§:Boolean;
      
      private var stage:Stage;
      
      private var §class package in§:Number = 0;
      
      private var locked:Boolean;
      
      private var §var const return§:Boolean;
      
      private var §get package final§:Boolean;
      
      private var active:Boolean;
      
      private var target:§^"I§;
      
      private var position:Vector3;
      
      private var rotation:Vector3;
      
      private var §&#9§:Vector3;
      
      private var §^"t§:Vector3;
      
      private var §set set in§:Number = 0;
      
      private var §import var do§:Number = 0;
      
      private var §@"f§:Number = 0;
      
      private var §include const extends§:int;
      
      private var §implements var for§:§for const default§;
      
      private var §for catch package§:Number;
      
      private var §continue set case§:Number = 0;
      
      private var §for package function§:Point;
      
      private var §;"3§:Point;
      
      private var §6#u§:Point;
      
      private var §4"2§:Point;
      
      private var §false package throw§:Point;
      
      private var §7#Q§:EllipsoidCollider;
      
      private var §case catch null§:Object3D;
      
      private var §continue const continue§:int;
      
      private var §9!h§:Number = 0;
      
      private var §case for finally§:Number = 0;
      
      private var targetingMode:int;
      
      public function §var set package§()
      {
         this.position = new Vector3();
         this.rotation = new Vector3();
         this.§&#9§ = new Vector3();
         this.§^"t§ = new Vector3();
         this.§implements var for§ = new §for const default§();
         this.§for package function§ = new Point();
         super();
         this.stage = display.stage;
         this.§;"3§ = new Point(145,545);
         this.§6#u§ = new Point(930,1395);
         this.§4"2§ = new Point(2245,1565);
         this.§false package throw§ = new Point(3105,760);
         this.§7#Q§ = new EllipsoidCollider(§0#0§,§0#0§,§0#0§);
         settings.addEventListener(SettingsServiceEvent.SETTINGS_CHANGED,this.§break catch static§);
         this.§break catch static§();
         var _loc1_:Number = Number(storageService.getStorage().data["cameraT"]);
         if(isNaN(_loc1_))
         {
            _loc1_ = 0.2;
         }
         this.§?#1§(_loc1_);
      }
      
      private static function §dynamic true§(param1:Vector3, param2:Vector3D) : void
      {
         param2.x = param1.x;
         param2.y = param1.y;
         param2.z = param1.z;
      }
      
      private static function §use const throw§(param1:Number) : Number
      {
         return §7!§.value * param1;
      }
      
      private static function §throw var null§(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : Number
      {
         var _loc6_:Number = 3 * (param3 - param2);
         var _loc7_:Number = 3 * param2 - 6 * param3 + 3 * param4;
         var _loc8_:Number = -param2 + 3 * param3 - 3 * param4 + param5;
         return param2 + param1 * _loc6_ + param1 * param1 * _loc7_ + param1 * param1 * param1 * _loc8_;
      }
      
      private function §break catch static§(param1:SettingsServiceEvent = null) : void
      {
         if(settings.alternateCamera)
         {
            this.§]$ §();
         }
         else
         {
            this.§get set null§();
         }
      }
      
      public function §return catch null§(param1:Object3D) : void
      {
         this.§case catch null§ = param1;
      }
      
      public function §get set null§() : void
      {
         this.§=$$§ = true;
      }
      
      public function §]$ §() : void
      {
         this.§=$$§ = false;
      }
      
      public function §return const do§(param1:§^"I§) : void
      {
         this.target = param1;
      }
      
      public function §while const super§(param1:Vector3, param2:Vector3) : void
      {
         this.§&#9§.copy(param1);
         this.§^"t§.copy(param2);
         this.§include const extends§ = 0;
         this.§%$!§(param1,param2,this.§implements var for§);
         this.position.copy(this.§implements var for§.position);
         this.rotation.x = this.§while for if§(this.§implements var for§) - 0.5 * Math.PI;
         this.rotation.y = 0;
         this.rotation.z = Math.atan2(-param2.x,param2.y);
         setPosition(this.position);
         setOrientation(this.rotation);
      }
      
      public function § `§() : void
      {
         this.position.copy(§7#[§());
         this.rotation.reset(§for package catch§(),§7!$§(),§false package static§());
      }
      
      override public function activate() : void
      {
         super.activate();
         this.§ `§();
         if(!this.active)
         {
            this.active = true;
            §9!U§.addListener(this);
            battleEventDispatcher.§set for each§(§9"A§,this);
         }
      }
      
      override public function deactivate() : void
      {
         if(this.active)
         {
            this.active = false;
            §9!U§.removeListener(this);
            battleEventDispatcher.§7!3§(§9"A§,this);
            this.§var const return§ = false;
            this.§get package final§ = false;
         }
      }
      
      override public function update(param1:int, param2:int) : void
      {
         if(this.target == null)
         {
            return;
         }
         var _loc3_:Number = param2 * 0.001;
         if(_loc3_ > 0.1)
         {
            _loc3_ = 0.1;
         }
         this.§%u§(_loc3_);
         if(!this.locked)
         {
            this.§5"?§();
         }
         this.§%$!§(this.§&#9§,this.§^"t§,this.§implements var for§);
         §[!>§.diff(this.§implements var for§.position,this.position);
         var _loc4_:Number = §[!>§.length();
         if(_loc4_ > §?r§)
         {
            this.§set set in§ = §use const throw§(_loc4_ - §?r§);
         }
         var _loc5_:Number = this.§set set in§ * _loc3_;
         if(_loc5_ > _loc4_)
         {
            _loc5_ = _loc4_;
         }
         §[!>§.normalize().scale(_loc5_);
         var _loc6_:Number = this.§while for if§(this.§implements var for§);
         var _loc7_:Number = Math.atan2(-this.§^"t§.x,this.§^"t§.y);
         var _loc8_:Number = MathUtils.clampAngle(this.rotation.x + 0.5 * Math.PI);
         var _loc9_:Number = MathUtils.clampAngle(this.rotation.z);
         var _loc10_:Number = MathUtils.clampAngleFast(_loc6_ - _loc8_);
         this.§import var do§ = this.§5!C§(_loc10_,this.§import var do§);
         var _loc11_:Number = this.§import var do§ * _loc3_;
         if(_loc10_ > 0 && _loc11_ > _loc10_ || _loc10_ < 0 && _loc11_ < _loc10_)
         {
            _loc11_ = _loc10_;
         }
         var _loc12_:Number = MathUtils.clampAngleFast(_loc7_ - _loc9_);
         this.§@"f§ = this.§5!C§(_loc12_,this.§@"f§);
         var _loc13_:Number = this.§@"f§ * _loc3_;
         if(_loc12_ > 0 && _loc13_ > _loc12_ || _loc12_ < 0 && _loc13_ < _loc12_)
         {
            _loc13_ = _loc12_;
         }
         this.§set set in§ = MathUtils.snap(this.§set set in§,0,§'#?§);
         this.§import var do§ = MathUtils.snap(this.§import var do§,0,§'#?§);
         this.§@"f§ = MathUtils.snap(this.§@"f§,0,§'#?§);
         this.position.add(§[!>§);
         this.rotation.x += _loc11_;
         this.rotation.z += _loc13_;
         §return const import§.copy(this.position);
         §continue catch dynamic§.copy(this.rotation);
         setPosition(§return const import§);
         setOrientation(§continue catch dynamic§);
      }
      
      public function §use var each§(param1:Boolean) : void
      {
         this.locked = param1;
         if(param1)
         {
            this.§continue const continue§ = 0;
         }
      }
      
      public function §for true§() : Number
      {
         return this.§continue set case§;
      }
      
      public function §?#1§(param1:Number) : void
      {
         this.§continue set case§ = MathUtils.clamp(param1,0,1);
         var _loc2_:Number = MathUtils.clamp(this.§continue set case§ + this.§9!h§ * 0.1,0,1);
         this.§for package function§.x = §throw var null§(_loc2_,this.§;"3§.x,this.§6#u§.x,this.§4"2§.x,this.§false package throw§.x);
         this.§for package function§.y = §throw var null§(_loc2_,this.§;"3§.y,this.§6#u§.y,this.§4"2§.y,this.§false package throw§.y);
         this.§for catch package§ = Math.atan2(this.§for package function§.x,this.§for package function§.y);
         this.§class package in§ = this.§for package function§.length;
         this.§include const extends§ = 0;
      }
      
      public function §@!4§(param1:Vector3, param2:Vector3, param3:Vector3, param4:Vector3) : void
      {
         this.§%$!§(param1,param2,this.§implements var for§);
         param4.x = this.§while for if§(this.§implements var for§) - 0.5 * Math.PI;
         param4.z = Math.atan2(-param2.x,param2.y);
         param3.copy(this.§implements var for§.position);
      }
      
      public function §5"?§() : void
      {
         this.target.§get package false§(this.§&#9§,this.§^"t§);
      }
      
      private function §%$!§(param1:Vector3, param2:Vector3, param3:§for const default§) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = this.§for catch package§;
         var _loc6_:Number = Math.sqrt(param2.x * param2.x + param2.y * param2.y);
         if(_loc6_ < 0.00001)
         {
            §%"8§.x = 1;
            §%"8§.y = 0;
         }
         else
         {
            §%"8§.x = param2.x / _loc6_;
            §%"8§.y = param2.y / _loc6_;
         }
         param3.§-#I§ = 0;
         param3.t = 1;
         §3#q§.copy(param1);
         axis.x = §%"8§.y;
         axis.y = -§%"8§.x;
         §%"8§.reverse();
         §get catch break§.fromAxisAngle(axis,-_loc5_);
         §get catch break§.transformVector(§%"8§,§2#D§);
         this.§true catch package§(§3#q§,§2#D§,this.§class package in§,collisionPoint);
         var _loc7_:Number = §;]§.copy(§3#q§).subtract(collisionPoint).length();
         param3.t = _loc7_ / this.§class package in§;
         if(_loc7_ < §3z§)
         {
            §3#q§.copy(collisionPoint);
            _loc4_ = §3z§ - _loc7_;
            this.§true catch package§(§3#q§,Vector3.Z_AXIS,_loc4_,collisionPoint);
         }
         param3.position.copy(collisionPoint);
      }
      
      private function §true catch package§(param1:Vector3, param2:Vector3, param3:Number, param4:Vector3) : void
      {
         var _loc5_:Number = NaN;
         §dynamic true§(param1,§1#§);
         §&#H§.x = param3 * param2.x;
         §&#H§.y = param3 * param2.y;
         §&#H§.z = param3 * param2.z;
         if(this.§7#Q§.getCollision(§1#§,§&#H§,§static for with§,§if const var§,this.§case catch null§))
         {
            _loc5_ = §0#0§ + 0.1;
            param4.x = §static for with§.x + _loc5_ * §if const var§.x;
            param4.y = §static for with§.y + _loc5_ * §if const var§.y;
            param4.z = §static for with§.z + _loc5_ * §if const var§.z;
         }
         else
         {
            param4.copy(param1).addScaled(param3,param2);
         }
      }
      
      private function §%u§(param1:Number) : void
      {
         var _loc2_:int = 0;
         if(this.§continue const continue§ < 0)
         {
            this.§var const return§ = true;
            this.§get package final§ = false;
            ++this.§continue const continue§;
            if(this.§continue const continue§ == 0)
            {
               this.§var const return§ = false;
            }
         }
         else if(this.§continue const continue§ > 0)
         {
            this.§var const return§ = false;
            this.§get package final§ = true;
            --this.§continue const continue§;
            if(this.§continue const continue§ == 0)
            {
               this.§get package final§ = false;
            }
         }
         if(!this.§while extends§ && this.§var const return§ != this.§get package final§)
         {
            _loc2_ = this.§var const return§ ? int(1) : int(-1);
            this.§case for finally§ = this.§for true§() + _loc2_ * §7!`§.value * param1;
            this.§?#1§(this.§case for finally§);
         }
         else
         {
            this.§?#1§(this.§continue set case§);
         }
      }
      
      private function §5!C§(param1:Number, param2:Number) : Number
      {
         var _loc3_:Number = this.§class do§();
         if(param1 < -§]"%§)
         {
            return _loc3_ * (param1 + §]"%§);
         }
         if(param1 > §]"%§)
         {
            return _loc3_ * (param1 - §]"%§);
         }
         return param2;
      }
      
      private function §while for if§(param1:§for const default§) : Number
      {
         var _loc2_:Number = this.§for catch package§ - §finally const final§;
         if(_loc2_ < 0)
         {
            _loc2_ = 0;
         }
         var _loc3_:Number = param1.t;
         if(_loc3_ >= 1 || _loc2_ < §,#J§ || !this.§=$$§)
         {
            return param1.§-#I§ - _loc2_;
         }
         var _loc4_:Number = this.§for package function§.x;
         return param1.§-#I§ - Math.atan2(_loc3_ * _loc4_,§extends for for§ * _loc4_ * (1 / Math.tan(_loc2_) - (1 - _loc3_) / Math.tan(this.§for catch package§)));
      }
      
      [Obfuscation(rename="false")]
      override public function close() : void
      {
         storageService.getStorage().data["cameraT"] = this.§for true§();
         settings.removeEventListener(SettingsServiceEvent.SETTINGS_CHANGED,this.§break catch static§);
      }
      
      private function §class do§() : Number
      {
         return this.targetingMode == §1!X§.§'!Y§ ? Number(§0"8§) : Number(§true for catch§);
      }
      
      public function mouseAbsoluteMovement(param1:Number, param2:Number) : void
      {
      }
      
      public function mouseRelativeMovement(param1:Number, param2:Number) : void
      {
         if(!this.locked)
         {
            this.§9!h§ += param2 * §for var get§ * this.§`#B§();
            this.§9!h§ = MathUtils.clamp(this.§9!h§,-1,1);
         }
      }
      
      public function mouseLeftButton(param1:Boolean, param2:Boolean) : Boolean
      {
         return true;
      }
      
      public function mouseWheel(param1:int) : void
      {
         var _loc2_:Boolean = false;
         param1 *= this.§`#B§();
         if(!this.locked)
         {
            _loc2_ = false;
            if(param1 > 1)
            {
               if(this.§continue const continue§ < 0)
               {
                  this.§continue const continue§ = 0;
               }
               _loc2_ = true;
            }
            if(param1 < 1)
            {
               if(this.§continue const continue§ > 0)
               {
                  this.§continue const continue§ = 0;
               }
               _loc2_ = true;
            }
            if(_loc2_)
            {
               this.§continue const continue§ = param1 * 2;
            }
         }
      }
      
      public function mouseRightButton(param1:Boolean, param2:Boolean) : Boolean
      {
         return true;
      }
      
      public function keyboardButton(param1:uint, param2:Boolean) : Boolean
      {
         var _loc3_:§&7§ = §5!$§.§&!<§(param1);
         switch(_loc3_)
         {
            case §&7§.FOLLOW_CAMERA_UP:
               this.§var const return§ = param2;
               break;
            case §&7§.FOLLOW_CAMERA_DOWN:
               this.§get package final§ = param2;
         }
         return true;
      }
      
      public function mouseLocked(param1:Boolean) : void
      {
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         var _loc2_:§9"A§ = param1 as §9"A§;
         if(_loc2_ != null)
         {
            this.targetingMode = _loc2_.targetingMode;
         }
      }
      
      private function §`#B§() : int
      {
         return settings.mouseYInverse ? int(-1) : int(1);
      }
   }
}

