package alternativa.tanks.battle.objects.tank
{
   import § !g§.§class for case§;
   import §-!!§.§6!<§;
   import §7"j§.§with for while§;
   import §;"?§.§#">§;
   import §?#Z§.§<"Q§;
   import §?#Z§.§`#T§;
   import §?#Z§.§return var native§;
   import §]#R§.§1!X§;
   import §]#R§.§import false§;
   import §]#R§.§switch var implements§;
   import §]#R§.§try set for§;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.math.Matrix3;
   import alternativa.math.Matrix4;
   import alternativa.math.Quaternion;
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.physics.Body;
   import alternativa.physics.BodyState;
   import alternativa.physics.PhysicsMaterial;
   import alternativa.physics.PhysicsScene;
   import alternativa.physics.PhysicsUtils;
   import alternativa.physics.collision.BodyCollisionFilter;
   import alternativa.physics.collision.CollisionDetector;
   import alternativa.physics.collision.CollisionShape;
   import alternativa.physics.collision.primitives.CollisionBox;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.§+$%§;
   import alternativa.tanks.battle.§4%§;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.§class true§;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.§native var const§;
   import alternativa.tanks.battle.objects.tank.tankskin.§1!2§;
   import alternativa.tanks.battle.objects.tank.tankskin.§false catch set§;
   import alternativa.tanks.battle.objects.tank.tankskin.§for for if§;
   import alternativa.tanks.battle.§return const break§;
   import alternativa.tanks.battle.scene3d.§[!r§;
   import alternativa.tanks.battle.scene3d.§else if§;
   import alternativa.tanks.battle.§static const super§;
   import alternativa.tanks.camera.§^"I§;
   import alternativa.tanks.display.usertitle.UserTitle;
   import alternativa.tanks.models.tank.§7!9§;
   import alternativa.tanks.models.weapon.§ !8§;
   import alternativa.tanks.models.weapon.§catch catch§;
   import alternativa.tanks.models.weapon.§final set var§;
   import alternativa.tanks.services.targeting.TargetingModeService;
   import alternativa.tanks.utils.DataUnitValidator;
   import alternativa.tanks.utils.DataValidationErrorEvent;
   import alternativa.tanks.utils.MathUtils;
   import flash.display.BitmapData;
   import flash.geom.Vector3D;
   import flash.utils.Dictionary;
   import §for set super§.§#!!§;
   import §for set super§.§=-§;
   import §for set super§.§super const continue§;
   import §while catch use§.§9!u§;
   import §while catch use§.§get for try§;
   
   public class Tank implements §return const break§, §4%§, §native var const§, §else if§, BodyCollisionFilter, §^"I§, §1"o§
   {
      public static var §default package import§:TargetingModeService;
      
      private static const §continue catch use§:int = 1;
      
      private static const BACK:int = 2;
      
      private static const LEFT:int = 4;
      
      private static const RIGHT:int = 8;
      
      private static const §if var static§:int = 16;
      
      private static const §import include§:int = 32;
      
      private static const CENTER_TURRET:int = 64;
      
      private static const §'!^§:int = 128;
      
      private static const §try var switch§:Matrix4 = new Matrix4();
      
      private static const §native for import§:Matrix4 = new Matrix4();
      
      private static const §!#D§:Vector3 = new Vector3();
      
      private static const §override const return§:Vector3 = new Vector3();
      
      private static const §>;§:Vector3 = new Vector3();
      
      private static const §return const extends§:Vector3 = new Vector3();
      
      private static const §case for try§:Vector3 = new Vector3();
      
      private static const §include continue§:Vector3 = new Vector3();
      
      private static const §'!G§:RayHit = new RayHit();
      
      private static const §false for implements§:Vector3 = new Vector3();
      
      private static const §set package static§:Vector3 = new Vector3();
      
      private static const PI:Number = Math.PI;
      
      private static const PI2:Number = 2 * Math.PI;
      
      private static var _m:Matrix3 = new Matrix3();
      
      private static var §finally package break§:Quaternion = new Quaternion();
      
      private static var §4#v§:Vector3 = new Vector3();
      
      private static var §;]§:Vector3 = new Vector3();
      
      private static var §"" §:Vector.<Number> = Vector.<Number>([0,0,0]);
      
      private static var §case set break§:Vector.<Number> = Vector.<Number>([0,0,0]);
      
      public var tankData:§7!9§;
      
      private var §]#`§:§implements set get§;
      
      private var battleEventDispatcher:BattleEventDispatcher;
      
      public var §with set null§:Vector3;
      
      public var §if catch class§:Boolean;
      
      public var §final const if§:CollisionBox;
      
      public var §"!v§:Vector.<Vector3>;
      
      private const §&#X§:Number = 5;
      
      private var §each catch package§:Vector3;
      
      private var skin:§false catch set§;
      
      public var title:UserTitle;
      
      public var §override native§:§return var native§;
      
      public var § "C§:§return var native§;
      
      public var prevState:§continue var case§;
      
      private var §throw package default§:§class for case§;
      
      public var §=!f§:Number = 0;
      
      public var §@!H§:Number = 0;
      
      private var §]"o§:Boolean;
      
      private var §default native§:Boolean;
      
      private var §=l§:Dictionary;
      
      private var container:§6!<§;
      
      private var battleService:BattleService;
      
      public var local:Boolean;
      
      private var §3#M§:Number;
      
      private var §4!d§:int;
      
      private var §%F§:§case final§;
      
      private var §finally const in§:Number;
      
      public var state:§continue var case§;
      
      private var §#!;§:§default catch import§;
      
      public var §include for var§:Vector3;
      
      public var §^#§:Quaternion;
      
      private var §try const var§:Number = 0;
      
      public var §catch package false§:Vector3;
      
      private const §finally const extends§:Number = 0;
      
      private var §3!P§:§with for while§;
      
      private var §,#2§:Boolean;
      
      public var §[!=§:int = 0;
      
      public var §each for true§:int = 0;
      
      private var §try const function§:§#@§;
      
      public var §do package include§:§<"Q§;
      
      private var §true for import§:§1!2§;
      
      private var §;S§:§=-§;
      
      private var §import set switch§:§`#T§;
      
      private var §^'§:BodyState;
      
      public var §`"N§:Vector.<CollisionBox>;
      
      private var §[#0§:§implements set get§;
      
      private var §?!g§:§implements set get§;
      
      public var §%Z§:int;
      
      private var §import for final§:Number;
      
      private var weapon:§4"3§;
      
      private var §finally for var§:§try set for§;
      
      private var §'$$§:§switch var implements§;
      
      private var temperature:Number = 0;
      
      private var inBattle:Boolean;
      
      private var maxHealth:int;
      
      public function Tank(param1:§false catch set§, param2:§try set for§, param3:§with for while§, param4:§switch var implements§, param5:§4"3§, param6:UserTitle, param7:Number, param8:Boolean, param9:BattleEventDispatcher, param10:int, param11:Number = 1250)
      {
         this.§each catch package§ = new Vector3();
         this.§=l§ = new Dictionary();
         this.§catch package false§ = new Vector3();
         this.§with set null§ = new Vector3();
         super();
         this.§finally for var§ = param2;
         this.§'$$§ = param4;
         this.§[#0§ = new §get set continue§(100,1000,0,0);
         this.§?!g§ = new §get set continue§(0.3,10,0,0);
         this.skin = param1;
         this.battleEventDispatcher = param9;
         this.§3!P§ = param3;
         this.local = param8;
         this.maxHealth = param10;
         this.§`"N§ = new Vector.<CollisionBox>();
         this.§include for var§ = new Vector3();
         this.§^#§ = new Quaternion();
         this.§^'§ = new BodyState();
         this.§import set switch§ = new §`#T§();
         this.§import set switch§.dampingCoeff = param11;
         param3.§with for with§(this);
         this.title = param6;
         var _loc12_:Vector3 = this.§override set switch§(param1.§-w§().mesh);
         var _loc13_:Vector3 = new Vector3(_loc12_.x / 2,_loc12_.y / 2,_loc12_.z / 2);
         this.§import for final§ = _loc13_.y;
         this.§&c§(_loc12_);
         this.§8#G§(param7,_loc13_);
         this.§1#s§(_loc13_);
         this.§true set finally§(_loc13_);
         this.§1"e§(param1);
         this.§do package include§ = new §<"Q§(this.§;S§.body,this.§import set switch§,this.§[#0§,_loc12_);
         this.§true for import§ = new §1!2§(this.§do package include§,param1,this.§[#0§);
         this.§%F§ = new §case final§(this.§;S§.body,param9);
         this.weapon = param5;
         param5.init(this);
         §default package import§ = TargetingModeService(OSGi.getInstance().getService(TargetingModeService));
         this.§;S§.§^#;§();
      }
      
      private static function §true for with§(param1:BodyState, param2:§#">§, param3:§#">§, param4:§#">§, param5:§#">§) : void
      {
         §+$%§.§default var super§(param1.position,param2);
         var _loc6_:Quaternion = param1.orientation;
         _loc6_.getEulerAngles(§;]§);
         param3.x = §;]§.x;
         param3.y = §;]§.y;
         param3.z = §;]§.z;
         §+$%§.§default var super§(param1.velocity,param4);
         §+$%§.§default var super§(param1.angularVelocity,param5);
      }
      
      public function § #E§(param1:Vector3) : Boolean
      {
         var _loc2_:int = int(this.§"!v§.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            §include continue§.copy(this.§"!v§[_loc3_]);
            if(this.§"!_§(§include continue§,param1))
            {
               return false;
            }
            _loc3_++;
         }
         return true;
      }
      
      private function §"!_§(param1:Vector3, param2:Vector3) : Boolean
      {
         var _loc3_:Body = this.§;S§.body;
         param1.transform3(_loc3_.baseMatrix);
         var _loc4_:BodyState = _loc3_.state;
         param1.add(_loc4_.position);
         §false for implements§.copy(param2);
         §set package static§.diff(param1,§false for implements§);
         var _loc5_:PhysicsScene = _loc3_.scene;
         if(_loc5_ == null)
         {
            return false;
         }
         var _loc6_:CollisionDetector = _loc5_.collisionDetector;
         return !_loc6_.raycastStatic(§false for implements§,§set package static§,§super const continue§.§finally catch while§,1,null,§'!G§);
      }
      
      public function §class package switch§() : Vector3
      {
         return this.§catch package false§;
      }
      
      public function §continue const§() : Boolean
      {
         return this.§;S§.§set extends§;
      }
      
      public function §,%§() : Boolean
      {
         return this.§;S§.§switch package import§();
      }
      
      public function §%G§() : Vector.<Body>
      {
         return this.§;S§.§5#O§;
      }
      
      public function §set const implements§() : Number
      {
         return this.§finally for var§.§do var§();
      }
      
      public function §>A§(param1:Vector3D) : void
      {
         this.title.readPosition(param1);
      }
      
      public function §set const dynamic§() : Number
      {
         return this.§import for final§;
      }
      
      public function §9"7§() : int
      {
         return this.maxHealth;
      }
      
      public function §="%§(param1:§class for case§) : Boolean
      {
         return this.teamType == param1 && param1 != §class for case§.NONE;
      }
      
      public function §if for with§() : ClientObject
      {
         return this.tankData.user;
      }
      
      public function §get package false§(param1:Vector3, param2:Vector3) : void
      {
         var _loc3_:int = -11;
         var _loc4_:int = this.§^e§();
         var _loc5_:Object3D = this.skin.§2"F§();
         if(_loc4_ == §import false§.TURRET)
         {
            §native for import§.setMatrix(_loc5_.x,_loc5_.y,_loc5_.z,_loc5_.rotationX,_loc5_.rotationY,_loc5_.rotationZ);
         }
         else if(_loc4_ == §import false§.§]"6§)
         {
            §native for import§.setMatrix(_loc5_.x,_loc5_.y,_loc5_.z,_loc5_.rotationX,_loc5_.rotationY,this.§finally for var§.§2"Y§());
         }
         else
         {
            §native for import§.setMatrix(_loc5_.x,_loc5_.y,_loc5_.z,0,0,0);
         }
         var _loc6_:Mesh = this.skin.§7!T§();
         §try var switch§.setRotationMatrix(_loc6_.rotationX,_loc6_.rotationY,_loc6_.rotationZ);
         var _loc7_:Vector3 = §+$%§.§@!c§;
         §try var switch§.getUp(_loc7_);
         §native for import§.getPosition(param1);
         param1.addScaled(_loc3_,_loc7_);
         param2.reset(§native for import§.m01,§native for import§.m11,§native for import§.m21);
         this.prevState = this.state;
      }
      
      private function §^e§() : int
      {
         switch(§default package import§.§;"W§())
         {
            case §1!X§.§return for else§:
               return §import false§.TURRET;
            case §1!X§.§'!Y§:
               return this.§finally for var§.§do const final§() && this.prevState != §continue var case§.DEAD ? int(§import false§.§]"6§) : int(§import false§.TURRET);
            default:
               return §import false§.TURRET;
         }
      }
      
      public function §each package const§() : Number
      {
         return this.§3#M§;
      }
      
      public function disable() : void
      {
         this.title.hideIndicators();
      }
      
      public function §case extends§(param1:Vector3, param2:Vector3, param3:Number) : void
      {
         if(this.tankData.health > 0)
         {
            this.§;S§.body.addWorldForceScaled(param1,param2,param3);
            this.§;S§.§use const set§.addScaled(param3,param2);
            this.§final set const§(param1);
         }
      }
      
      public function §final set const§(param1:Vector3) : void
      {
         this.§with set null§.copy(param1);
         §+$%§.globalToLocal(this.§0"t§(),this.§with set null§);
         this.§if catch class§ = true;
      }
      
      public function §6v§(param1:int = 7) : void
      {
         var _loc2_:§static const super§ = this.battleService.§3l§().§if catch import§();
         var _loc3_:int = 0;
         while(_loc3_ < param1)
         {
            _loc2_.§6"%§(this,0,0.9);
            _loc3_++;
         }
      }
      
      public function §5#2§(param1:int, param2:int, param3:Boolean) : void
      {
         this.§do package include§.§in var native§ = param1;
         this.§do package include§.§include package import§ = param2;
         this.§do package include§.§false set switch§ = param3;
         if(!this.§do package include§.§4;§)
         {
            if(param1 != 0)
            {
               this.§3!P§.§;#9§();
            }
            else if(param2 != 0)
            {
               this.§3!P§.§case set false§();
            }
            else
            {
               this.§3!P§.§null for for§();
            }
         }
      }
      
      public function §;`§() : CollisionBox
      {
         return this.§;S§.§4#j§;
      }
      
      private function §1"e§(param1:§false catch set§) : void
      {
         var _loc2_:§9!u§ = null;
         var _loc3_:CollisionBox = null;
         var _loc4_:Vector.<§9!u§> = param1.§]c§();
         for each(_loc2_ in _loc4_)
         {
            _loc3_ = this.§%!y§(_loc2_.§finally set do§());
            this.§`"N§.push(_loc3_);
            this.§;S§.body.addCollisionShape(_loc3_,new Matrix4());
         }
         this.§dynamic package case§(0);
      }
      
      private function §%!y§(param1:Vector3) : CollisionBox
      {
         return new CollisionBox(param1,0,PhysicsMaterial.DEFAULT_MATERIAL);
      }
      
      private function §true set finally§(param1:Vector3) : void
      {
         var _loc2_:Number = param1.x;
         var _loc3_:Number = param1.y;
         this.§"!v§ = Vector.<Vector3>([new Vector3(-_loc2_,_loc3_,0),new Vector3(_loc2_,_loc3_,0),new Vector3(-_loc2_,0,0),new Vector3(_loc2_,0,0),new Vector3(-_loc2_,-_loc3_,0),new Vector3(_loc2_,-_loc3_,0)]);
      }
      
      private function §1#s§(param1:Vector3) : void
      {
         var _loc2_:Number = 2 * param1.z - (this.§import set switch§.§8#'§ - §native catch var§.§&#X§);
         § "L§.§try const false§(param1,_loc2_,this.§;S§);
         § "L§.§[#`§(param1,_loc2_,this.§;S§);
         this.§switch const continue§(param1,_loc2_);
      }
      
      public function §get var switch§(param1:§ !8§, param2:int = 0) : void
      {
         §catch catch§.§^S§(this.skin.§include while§(),this.skin.§4W§().§false super§[param2],param1);
      }
      
      public function §else set return§(param1:§final set var§, param2:int = 0) : void
      {
         §catch catch§.§for const throw§(this.skin.§include while§(),this.skin.§4W§().§false super§[param2],param1);
      }
      
      public function §`"8§(param1:§try set for§) : void
      {
         this.§finally for var§ = param1;
      }
      
      public function §3H§() : §try set for§
      {
         return this.§finally for var§;
      }
      
      private function §8#G§(param1:Number, param2:Vector3) : void
      {
         var _loc3_:Body = new Body(param1,Matrix3.IDENTITY,0);
         PhysicsUtils.setBoxInvInertia(param1,param2,_loc3_.invInertia);
         _loc3_.tank = this;
         this.§;S§ = new §=-§(_loc3_);
      }
      
      private function §&c§(param1:Vector3) : void
      {
         var _loc2_:Mesh = this.skin.§7!T§();
         _loc2_.calculateBounds();
         this.§catch package false§.x = -0.5 * (_loc2_.boundMinX + _loc2_.boundMaxX);
         this.§catch package false§.y = -0.5 * (_loc2_.boundMinY + _loc2_.boundMaxY);
         this.§catch package false§.z = -0.5 * param1.z - this.§import set switch§.§8#'§ + 10;
      }
      
      public function render(param1:int, param2:int) : void
      {
         var _loc3_:Number = param2 * 0.001;
         this.§#!;§.update(_loc3_);
         this.skin.§3!V§(this.§try const var§);
         this.skin.§each var get§(this.temperature);
         this.§true for import§.§]"7§(_loc3_);
         var _loc4_:Object3D = this.skin.§2"F§();
         §;]§.x = _loc4_.x;
         §;]§.y = _loc4_.y;
         §;]§.z = _loc4_.z;
         this.title.setWeaponStatus(100 * this.weapon.getStatus());
         this.title.update(§;]§);
         var _loc5_:§for for if§ = this.skin.§-w§();
         if(_loc5_.hasIncorrectData())
         {
            this.battleEventDispatcher.§"#L§(new DataValidationErrorEvent(_loc5_.getType()));
         }
         var _loc6_:§get for try§ = this.skin.§4W§();
         if(_loc6_.hasIncorrectData())
         {
            this.battleEventDispatcher.§"#L§(new DataValidationErrorEvent(_loc6_.getType()));
         }
         if(this.§'$$§ != null && this.state != §continue var case§.DEAD)
         {
            this.§3#M§ = this.§,C§();
         }
      }
      
      public function §%#o§() : DataUnitValidator
      {
         if(this.§try const function§ == null)
         {
            this.§try const function§ = new §#@§(this.§;S§.body.collisionShapes);
         }
         return this.§try const function§;
      }
      
      public function §&#[§() : Number
      {
         return this.§finally const in§;
      }
      
      public function §implements package var§() : void
      {
         var _loc1_:§class true§ = null;
         var _loc2_:§[!r§ = null;
         if(this.battleService != null)
         {
            this.inBattle = false;
            this.weapon.deactivate();
            this.battleService.§3l§().§if catch import§().§true set false§(this);
            _loc1_ = this.battleService.§'x§();
            _loc2_ = this.battleService.§3l§();
            _loc1_.§0#X§(this.§;S§);
            _loc1_.§7`§(this);
            _loc1_.§finally set throw§(this);
            _loc1_.§]#r§(this);
            §#!!§.§8#g§(this.§;S§.id);
            this.skin.removeFromScene();
            this.title.removeFromContainer();
            _loc2_.§true set false§(this);
            _loc1_.§'M§().§use var super§(this.§3!P§);
            this.battleService = null;
         }
      }
      
      private function §,C§() : Number
      {
         this.§^#§.toMatrix3(_m);
         _m.transformVector(Vector3.Z_AXIS,§>;§);
         §>;§.normalize();
         §;]§.copy(this.§catch package false§);
         §;]§.transform3(_m);
         §;]§.add(this.§include for var§);
         §try var switch§.setFromMatrix3(_m,§;]§);
         §!#D§.reset(§try var switch§.m03,§try var switch§.m13,§try var switch§.m23);
         §override const return§.reset(§try var switch§.m01,§try var switch§.m11,§try var switch§.m21);
         §override const return§.normalize();
         §case for try§.copy(Vector3.X_AXIS);
         §return const extends§.copy(Vector3.Y_AXIS);
         §case for try§.projectOnPlane(§>;§);
         §return const extends§.projectOnPlane(§>;§);
         §case for try§.normalize();
         §return const extends§.normalize();
         var _loc1_:Number = MathUtils.clamp(§return const extends§.dot(§override const return§),-1,1);
         var _loc2_:Number = §case for try§.dot(§override const return§);
         return Math.acos(_loc1_) * (_loc2_ > 0 ? -1 : 1);
      }
      
      public function §else catch true§(param1:int = 0) : Vector3
      {
         return this.skin.§4W§().§false super§[param1];
      }
      
      public function §%$#§() : Vector3
      {
         return this.skin.§4W§().§if null§;
      }
      
      public function §do const false§(param1:int = 0) : Number
      {
         return Vector3(this.skin.§4W§().§false super§[param1]).y;
      }
      
      public function §2"F§() : Object3D
      {
         return this.skin.§2"F§();
      }
      
      public function §7!T§() : Mesh
      {
         return this.skin.§7!T§();
      }
      
      public function §in package default§() : §false catch set§
      {
         return this.skin;
      }
      
      public function §class package case§() : void
      {
         this.title.show();
      }
      
      public function §implements catch finally§() : void
      {
         this.title.hide();
      }
      
      public function stopMovement() : void
      {
         this.§3!P§.§null for for§();
      }
      
      public function §catch var extends§(param1:Boolean) : void
      {
         this.§do package include§.§4;§ = param1;
      }
      
      public function §true var continue§(param1:Boolean) : void
      {
         this.§3!P§.§2#!§ = param1;
      }
      
      public function spawn(param1:§class for case§, param2:int) : void
      {
         this.§throw package default§ = param1;
         this.§4!d§ = param2;
         this.temperature = 0;
         this.§[#0§.reset(this.§[#0§.§try package finally§());
         this.§?!g§.reset(this.§?!g§.§try package finally§());
         this.§;S§.body.clearAccumulators();
         this.skin.§]!b§();
         this.skin.§else set extends§();
         this.weapon.reset();
         this.§3!P§.§null for for§();
         this.§3!P§.§2#!§ = true;
         this.§do package include§.reset();
         this.§finally for var§.reset();
         this.§finally for var§.§ !n§();
         if(this.§'$$§ != null)
         {
            this.§'$$§.reset();
         }
         this.title.setTeamType(param1);
      }
      
      public function kill() : void
      {
         this.state = §continue var case§.DEAD;
         this.§3!P§.enabled = false;
         this.battleService.§'x§().§'M§().§use var super§(this.§3!P§);
         this.title.hideIndicators();
         this.title.hide();
         if(this.§'$$§ != null)
         {
            this.§'$$§.reset();
         }
      }
      
      public function §class catch false§() : §switch var implements§
      {
         return this.§'$$§;
      }
      
      public function §static set return§(param1:§switch var implements§) : void
      {
         this.§'$$§ = param1;
      }
      
      public function destroy() : void
      {
         this.state = §continue var case§.DEAD;
         this.skin.dispose();
         this.skin = null;
         this.weapon.destroy();
         this.§;S§.destroy();
         if(this.§try const function§ != null)
         {
            this.§try const function§.destroy();
         }
      }
      
      private function §switch const continue§(param1:Vector3, param2:Number) : void
      {
         var _loc3_:Vector3 = new Vector3(param1.x,param1.y,param2 / 2);
         var _loc4_:Matrix4 = this.§;S§.§4#j§.transform;
         this.§finally const in§ = _loc3_.length() + Math.abs(_loc4_.m23);
      }
      
      public function §super set extends§() : §=-§
      {
         return this.§;S§;
      }
      
      private function §override set switch§(param1:Mesh) : Vector3
      {
         return new Vector3(param1.boundMaxX - param1.boundMinX,param1.boundMaxY - param1.boundMinY,param1.boundMaxZ - param1.boundMinZ);
      }
      
      public function setMaxTurnSpeed(param1:Number, param2:Boolean) : void
      {
         if(param2)
         {
            this.§?!g§.reset(param1);
         }
         else
         {
            this.§?!g§.§while catch do§(param1);
         }
      }
      
      public function §`!C§(param1:Number) : void
      {
         this.temperature = param1;
      }
      
      public function §^"Y§() : Number
      {
         return this.temperature;
      }
      
      public function §^!Y§(param1:Number, param2:Boolean) : void
      {
         if(param2)
         {
            this.§[#0§.reset(param1);
         }
         else
         {
            this.§[#0§.§while catch do§(param1);
         }
      }
      
      public function §null var include§() : int
      {
         return CollisionShape(this.§;S§.§4#j§).collisionGroup;
      }
      
      public function §`8§(param1:int) : void
      {
         var _loc2_:CollisionBox = null;
         this.§;S§.§4#j§.collisionGroup = param1;
         for each(_loc2_ in this.§`"N§)
         {
            _loc2_.collisionGroup = param1 & §super const continue§.WEAPON;
         }
      }
      
      public function §import catch final§() : BitmapData
      {
         return this.title.getTexture();
      }
      
      public function §9!^§(param1:Number) : void
      {
         this.§finally for var§.rotate(param1);
         this.§dynamic package case§(this.§finally for var§.§do var§());
         this.§3!P§.§ $§(this.§finally for var§.isRotating());
      }
      
      private function §dynamic package case§(param1:Number) : void
      {
         var _loc2_:CollisionBox = null;
         var _loc3_:Matrix4 = null;
         var _loc4_:§9!u§ = null;
         var _loc5_:§for for if§ = this.skin.§-w§();
         var _loc6_:CollisionBox = this.§;S§.§4#j§;
         var _loc7_:Matrix4 = _loc6_.localTransform;
         var _loc8_:Vector.<§9!u§> = this.skin.§]c§();
         var _loc9_:int = 0;
         while(_loc9_ < this.§`"N§.length)
         {
            _loc2_ = this.§`"N§[_loc9_];
            _loc3_ = _loc2_.localTransform;
            _loc3_.setMatrix(_loc5_.§static for set§() - _loc7_.m03 + this.§catch package false§.x,_loc5_.§-1§() - _loc7_.m13 + this.§catch package false§.y,_loc5_.§&T§() - _loc7_.m23 + this.§catch package false§.z,0,0,param1);
            _loc4_ = _loc8_[_loc9_];
            _loc3_.prepend(_loc4_.§[!6§());
            _loc9_++;
         }
      }
      
      public function §each break§() : void
      {
         this.interpolatePhysicsState(1);
         this.§#!;§.update(0);
         this.skin.§3!V§(this.§try const var§);
      }
      
      public function interpolatePhysicsState(param1:Number) : void
      {
         this.§;S§.body.interpolate(param1,this.§include for var§,this.§^#§);
         this.§^#§.normalize();
         this.§try const var§ = this.§finally for var§.§super catch extends§(param1);
      }
      
      public function §use const continue§(param1:Vector3, param2:int = 0) : void
      {
         param1.copy(this.skin.§4W§().§false super§[param2]);
         param1.y = 0;
      }
      
      public function §+"B§() : int
      {
         return this.skin.§4W§().§false super§.length;
      }
      
      public function §catch set if§() : §return var native§
      {
         return this.§do package include§.§override native§;
      }
      
      public function §!"b§() : §return var native§
      {
         return this.§do package include§.§ "C§;
      }
      
      public function §null set try§() : Boolean
      {
         return this.§catch set if§().§set extends§() || this.§!"b§().§set extends§();
      }
      
      public function §case var continue§() : Number
      {
         return this.§0"t§().state.velocity.length();
      }
      
      public function §class for break§(param1:§#">§, param2:§#">§, param3:§#">§, param4:§#">§) : void
      {
         var _loc5_:Body = this.§;S§.body;
         var _loc6_:BodyState = _loc5_.state;
         §+$%§.§use set super§(param1,_loc6_.position);
         _loc6_.orientation.setFromEulerAnglesXYZ(param2.x,param2.y,param2.z);
         §+$%§.§use set super§(param3,_loc6_.velocity);
         §+$%§.§use set super§(param4,_loc6_.angularVelocity);
         _loc5_.saveState();
         _loc5_.calcDerivedData();
         this.§%F§.refresh();
      }
      
      public function §5`§(param1:Number) : void
      {
         this.§do package include§.§5`§(param1);
      }
      
      public function §5!c§(param1:Number) : void
      {
         this.§do package include§.§5!c§(param1);
      }
      
      public function §catch const catch§(param1:Number) : void
      {
         this.§do package include§.§catch const catch§(param1);
      }
      
      public function setTurnAcceleration(param1:Number) : void
      {
         this.§do package include§.setTurnAcceleration(param1);
      }
      
      public function §null override§(param1:Number) : void
      {
         this.§do package include§.§null override§(param1);
      }
      
      public function §5"R§(param1:§#">§, param2:§#">§, param3:§#">§, param4:§#">§) : void
      {
         §true for with§(this.§;S§.body.state,param1,param2,param3,param4);
      }
      
      public function §3#1§(param1:§#">§, param2:§#">§, param3:§#">§, param4:§#">§) : void
      {
         §true for with§(this.§;S§.body.prevState,param1,param2,param3,param4);
      }
      
      public function §try package const§() : void
      {
         this.state = §continue var case§.§set for for§;
         this.tankData.spawnState = §continue var case§.§set for for§;
         this.§`8§(§super const continue§.TANK);
         this.§2#u§(§super const continue§.§for const false§);
         this.skin.setAlpha(0.5);
         this.§;S§.body.postCollisionFilter = this;
      }
      
      public function §throw var else§() : void
      {
         this.state = §continue var case§.§?!S§;
         this.tankData.spawnState = §continue var case§.§?!S§;
         this.§`8§(§super const continue§.TANK | §super const continue§.§finally package while§ | §super const continue§.WEAPON);
         this.§2#u§(§super const continue§.§finally package while§);
         this.skin.setAlpha(1);
         this.§;S§.body.postCollisionFilter = null;
      }
      
      public function considerBodies(param1:Body, param2:Body) : Boolean
      {
         if(param1.postCollisionFilter != null && param2.postCollisionFilter == null)
         {
            ++param1.tank.§%Z§;
         }
         else if(param1.postCollisionFilter == null && param2.postCollisionFilter != null)
         {
            ++param2.tank.§%Z§;
         }
         return false;
      }
      
      public function §&"K§(param1:BattleService) : void
      {
         var _loc2_:§class true§ = param1.§'x§();
         var _loc3_:§[!r§ = param1.§3l§();
         if(this.battleService == null)
         {
            this.inBattle = true;
            this.battleService = param1;
            this.§;S§.id = §#!!§.§catch var package§();
            _loc2_ = param1.§'x§();
            _loc2_.§set for get§(this.§;S§);
            _loc2_.§^c§(this);
            _loc2_.§true for implements§(this);
            _loc2_.§,j§(this);
            this.skin.addToScene();
            this.title.addToContainer();
            _loc3_ = param1.§3l§();
            _loc3_.§each package import§(this);
            _loc2_.§'M§().§each set set§(this.§3!P§);
            this.§#!;§.reset();
            _loc3_.§if catch import§().§each package import§(this);
         }
      }
      
      public function §function const static§(param1:Number) : void
      {
         this.§function var throw§();
         this.§%F§.refresh();
         this.§finally for var§.§null var function§(this.§0"t§());
      }
      
      private function §function var throw§() : void
      {
         var _loc1_:Body = this.§;S§.body;
         var _loc2_:BodyState = _loc1_.state;
         if(!_loc2_.isValid())
         {
            _loc2_.copy(this.§^'§);
            _loc1_.saveState();
         }
      }
      
      public function §2#u§(param1:int) : void
      {
         this.§do package include§.§2#u§(param1);
      }
      
      public function runBeforePhysicsUpdate(param1:Number) : void
      {
         this.§%Z§ = 0;
         var _loc2_:Number = this.§[#0§.update(param1);
         var _loc3_:Number = this.§?!g§.update(param1);
         this.§;S§.body.setMaxSpeedXY(_loc2_);
         this.§do package include§.applyForces(_loc2_,_loc3_,param1);
         this.§;S§.body.slipperyMode = !this.§null set try§() && this.§;S§.§&#Q§();
         this.§9!^§(param1);
         this.§7!v§();
      }
      
      private function §7!v§() : void
      {
         this.§^'§.copy(this.§;S§.body.state);
         this.§%F§.validate();
      }
      
      public function §[9§(param1:§default catch import§) : void
      {
         this.§#!;§ = param1;
      }
      
      public function get teamType() : §class for case§
      {
         return this.§throw package default§;
      }
      
      public function get incarnation() : int
      {
         return this.§4!d§;
      }
      
      public function §0"t§() : Body
      {
         return this.§;S§.body;
      }
      
      public function §1"-§() : int
      {
         return this.§%Z§;
      }
      
      public function isInBattle() : Boolean
      {
         return this.inBattle;
      }
      
      public function §catch extends§() : Boolean
      {
         return this.§;S§.§catch extends§();
      }
      
      public function §`#U§() : Boolean
      {
         return this.§;S§.§`#U§();
      }
      
      public function §class var while§() : Boolean
      {
         return this.§;S§.§class var while§();
      }
   }
}

