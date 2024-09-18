package alternativa.tanks.models.weapon.shaft
{
   import § !g§.§class for case§;
   import §9!1§.§!!R§;
   import §9!1§.§!"@§;
   import §9!1§.§&#T§;
   import §9!1§.§4"I§;
   import §9!1§.IdleState;
   import §9!1§.§false package finally§;
   import §9!1§.§false set throw§;
   import §9!1§.§return package super§;
   import §9!1§.§var§;
   import §=#M§.§catch do§;
   import §?#0§.§3# §;
   import §?#0§.§9#W§;
   import §]#R§.§1!X§;
   import §]#R§.§else for include§;
   import §`a§.§-,§;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.RayIntersectionData;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.§+$%§;
   import alternativa.tanks.battle.§;!t§;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.§else package false§;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.objects.tank.§1"o§;
   import alternativa.tanks.battle.objects.tank.§4"3§;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.objects.tank.§class package try§;
   import alternativa.tanks.battle.objects.tank.tankskin.§false catch set§;
   import alternativa.tanks.battle.scene3d.§?!2§;
   import alternativa.tanks.battle.scene3d.§[!r§;
   import alternativa.tanks.battle.scene3d.§switch set extends§;
   import alternativa.tanks.camera.§3!0§;
   import alternativa.tanks.camera.§true var set§;
   import alternativa.tanks.models.weapon.§ !8§;
   import alternativa.tanks.models.weapon.§override var dynamic§;
   import alternativa.tanks.models.weapon.shared.§6#L§;
   import alternativa.tanks.models.weapons.targeting.§implements set false§;
   import alternativa.tanks.services.targeting.TargetingModeService;
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   import alternativa.tanks.utils.EncryptedNumber;
   import alternativa.tanks.utils.EncryptedNumberImpl;
   import alternativa.tanks.utils.MathUtils;
   import alternativa.tanks.utils.SetControllerForTemporaryItems;
   import §class for§.§override for continue§;
   import com.alternativaplatform.projects.tanks.client.commons.types.TankSpecification;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.geom.Point;
   import flash.geom.Vector3D;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   import §for set super§.§super const continue§;
   import §return set use§.§6!g§;
   import §use catch break§.§]#t§;
   import §use catch break§.§break catch extends§;
   import §use catch break§.§const for include§;
   import §use catch break§.§if for for§;
   import §while const const§.§^"x§;
   
   public class §finally native§ extends §else package false§ implements §4"3§, §class package try§, §;!t§, §-"o§
   {
      [Inject]
      public static var §default package import§:TargetingModeService;
      
      [Inject]
      public static var display:IDisplay;
      
      private static const §native package continue§:Class = §continue var final§;
      
      private static const §-!+§:BitmapData = new §native package continue§().bitmapData;
      
      private static const §default for finally§:int = 200;
      
      private static const §const for import§:Number = 9;
      
      private static const §final const for§:Vector3 = new Vector3();
      
      private static const _direction:Vector3 = new Vector3();
      
      private static const _m:Matrix4 = new Matrix4();
      
      private static const §catch super§:Vector3 = new Vector3();
      
      private static const §include package extends§:Vector3 = new Vector3();
      
      private static const §>#s§:Vector3 = new Vector3();
      
      private static const §throw catch while§:EncryptedInt = new EncryptedIntImpl(1000);
      
      private static const §=#W§:§ !8§ = new § !8§();
      
      private static const §4H§:int = 75;
      
      private var battleService:BattleService;
      
      private var battleEventDispatcher:BattleEventDispatcher;
      
      private var laser:§6!g§;
      
      private var callback:§="D§;
      
      private var effects:§=#n§;
      
      private var §in set implements§:§implements set false§;
      
      private var §for const switch§:§^"x§;
      
      private var §7$$§:§override var dynamic§;
      
      private var §native catch switch§:§9#W§;
      
      private var §try set import§:§6#L§;
      
      private var §@y§:Dictionary;
      
      private var §try do§:§1"o§;
      
      private var states:Dictionary;
      
      private var currentState:§var§;
      
      private var §-!&§:Vector.<§!"@§>;
      
      private var §>#e§:EncryptedInt;
      
      private var §>"Y§:EncryptedNumber;
      
      private var § s§:EncryptedNumber;
      
      private var § !§:§"!a§;
      
      private var §while catch for§:§5"j§;
      
      private var enabled:Boolean;
      
      private var §finally for var§:§else for include§;
      
      private var §true const default§:int;
      
      private var §get var implements§:int;
      
      private var team:§class for case§;
      
      private var §?#q§:SetControllerForTemporaryItems;
      
      private var §-!;§:Dictionary;
      
      private var §include package switch§:§3# §;
      
      private var §%!6§:TankSpecification;
      
      private var §5"2§:§catch do§;
      
      private var §`!w§:§9#D§;
      
      private var §false package include§:§-,§;
      
      private var cross:Bitmap;
      
      private var §6"n§:§1!A§;
      
      public function §finally native§(param1:§1!A§, param2:BattleService, param3:BattleEventDispatcher, param4:§="D§, param5:§^"x§, param6:§override var dynamic§, param7:§6#L§, param8:Dictionary, param9:§else for include§, param10:§implements set false§, param11:§catch do§)
      {
         this.§@y§ = new Dictionary();
         this.§>#e§ = new EncryptedIntImpl();
         this.§>"Y§ = new EncryptedNumberImpl();
         this.§ s§ = new EncryptedNumberImpl();
         this.§ !§ = §"!a§.RECHARGE;
         this.§false package include§ = new §-,§();
         this.cross = new Bitmap(§-!+§);
         super();
         this.§6"n§ = param1;
         this.laser = param1.laser();
         this.§true const default§ = param1.§package var false§();
         this.battleService = param2;
         this.battleEventDispatcher = param3;
         this.callback = param4;
         this.effects = param1.§continue for each§();
         this.§in set implements§ = param10;
         this.§for const switch§ = param5;
         this.§7$$§ = param6;
         this.§native catch switch§ = new §9#W§(param1.§2!H§(),-param1.§static var return§(),param5.§continue var true§,param5.§="S§);
         this.§try set import§ = param7;
         this.§@y§ = param8;
         this.§finally for var§ = param9;
         this.§%!6§ = param1.§get package break§().§import extends§;
         this.§5"2§ = param11;
         var _loc12_:§[!r§ = param2.§3l§();
         this.§while catch for§ = new §5"j§(_loc12_.§super package§());
         this.§-!;§ = _loc12_.§import catch package§();
         this.§?#q§ = new SetControllerForTemporaryItems(this.§-!;§);
         this.§include package switch§ = new §3# §(param1.§2!H§(),-param1.§static var return§());
         this.§`!w§ = param9.§ k§();
      }
      
      private static function §continue catch return§(param1:Vector3, param2:Vector.<Vector3>, param3:Vector3) : void
      {
         var _loc4_:Number = NaN;
         §include package extends§.copy(param2[0]);
         §include package extends§.y = 0;
         param3.copy(§include package extends§);
         var _loc5_:Number = param1.distanceToSquared(§include package extends§);
         var _loc6_:int = 1;
         while(_loc6_ < param2.length)
         {
            §include package extends§.copy(param2[_loc6_]);
            §include package extends§.y = 0;
            _loc4_ = param1.distanceToSquared(§include package extends§);
            if(_loc4_ < _loc5_)
            {
               _loc5_ = _loc4_;
               param3.copy(§include package extends§);
            }
            _loc6_++;
         }
      }
      
      private static function §native extends§(param1:DisplayObject) : void
      {
         param1.x = display.stage.stageWidth - param1.width >> 1;
         param1.y = display.stage.stageHeight - param1.height >> 1;
      }
      
      public function init(param1:§1"o§) : void
      {
         this.§try do§ = param1;
         this.§try set import§.setWeapon(this);
         this.§try set import§.init();
         this.§while catch for§.setSkin(param1.§in package default§());
         this.§native catch switch§.§'#N§(param1.§2"F§());
         this.team = this.getTank().teamType;
         this.initStateMachine();
         this.reset();
      }
      
      public function destroy() : void
      {
         this.§6"n§ = null;
         this.laser = null;
         this.battleService = null;
         this.battleEventDispatcher = null;
         this.callback = null;
         this.effects = null;
         this.§in set implements§ = null;
         this.§for const switch§ = null;
         this.§7$$§ = null;
         this.§native catch switch§ = null;
         this.§@y§ = null;
         this.§finally for var§ = null;
         this.§%!6§ = null;
         this.§5"2§ = null;
         this.currentState.exit();
         this.§try set import§.destroy();
         this.§while catch for§.stop();
      }
      
      public function activate() : void
      {
         §'x§().§%#9§(this);
      }
      
      public function deactivate() : void
      {
         §'x§().§%"7§(this);
      }
      
      public function enable() : void
      {
         if(!this.enabled)
         {
            this.enabled = true;
            this.currentState.enter(this.battleService.§]"d§());
         }
      }
      
      public function disable(param1:Boolean) : void
      {
         if(this.enabled)
         {
            this.enabled = false;
            this.§#-§(§switch var override§.STOP,param1);
         }
      }
      
      public function reset() : void
      {
         var _loc1_:int = this.battleService.§]"d§();
         if(this.currentState != this.states[§try with§.IDLE])
         {
            this.currentState.exit();
            this.currentState = this.states[§try with§.IDLE];
         }
         var _loc2_:§class for case§ = this.getTank().teamType;
         if(this.team != _loc2_)
         {
            this.team = _loc2_;
            this.§`!w§.§false const throw§(this.§return catch do§(this.team));
         }
         this.currentState.enter(_loc1_);
         this.§try set native§(§"!a§.RECHARGE,this.§for const switch§.§]!n§,_loc1_);
      }
      
      private function getTank() : Tank
      {
         return this.§try do§.§0"t§().tank;
      }
      
      public function getStatus() : Number
      {
         return this.§6#r§(getTimer()) / this.§for const switch§.§]!n§;
      }
      
      public function §;>§() : void
      {
         if(this.enabled)
         {
            this.currentState.§#-§(§switch var override§.TRIGGER_PULL,null);
         }
      }
      
      public function §#w§() : void
      {
         if(this.enabled)
         {
            this.currentState.§#-§(§switch var override§.TRIGGER_RELEASE,null);
         }
      }
      
      public function §var package implements§(param1:int, param2:int) : void
      {
         if(this.enabled)
         {
            this.currentState.update(param1,param2);
         }
      }
      
      public function §override for var§() : Boolean
      {
         return this.§try set import§.§override for var§();
      }
      
      public function §%0§(param1:§"!a§) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         if(param1 != this.§ !§)
         {
            _loc2_ = this.battleService.§]"d§();
            _loc3_ = this.§6#r§(_loc2_);
            this.§try set native§(param1,_loc3_,_loc2_);
         }
      }
      
      public function §#-§(param1:§switch var override§, param2:* = undefined) : void
      {
         var _loc3_:§!"@§ = null;
         for each(_loc3_ in this.§-!&§)
         {
            if(_loc3_.eventType == param1 && _loc3_.state == this.currentState)
            {
               this.currentState.exit();
               if(_loc3_.handler != null)
               {
                  _loc3_.handler.execute(param2);
               }
               this.currentState = _loc3_.newState;
               if(this.currentState is IdleState)
               {
                  this.§finally for var§.§dynamic const false§();
               }
               this.currentState.enter(this.battleService.§]"d§());
               return;
            }
         }
         throw new §2;§(this.currentState,param1);
      }
      
      public function §6#r§(param1:int) : Number
      {
         var _loc2_:Number = this.§>"Y§.getNumber() + (param1 - this.§>#e§.getInt()) * this.§ s§.getNumber() / §throw catch while§.getInt();
         return MathUtils.clamp(_loc2_,0,this.§for const switch§.§]!n§);
      }
      
      public function §0n§() : void
      {
         this.battleService.§2!k§(§true var set§.INSTANCE);
      }
      
      public function §`"g§(param1:int, param2:int) : void
      {
         this.§false package include§.x = param1 + §const for import§;
         this.§false package include§.y = param2;
      }
      
      private function §return catch do§(param1:§class for case§) : uint
      {
         switch(param1)
         {
            case §class for case§.BLUE:
               return this.§6"n§.laser().§4"g§(this.§6"n§.§get package break§().turret);
            case §class for case§.RED:
               return this.§6"n§.laser().getLaserPointerRedColor(this.§6"n§.§get package break§().turret);
            default:
               return this.§6"n§.laser().getLaserPointerRedColor(this.§6"n§.§get package break§().turret);
         }
      }
      
      public function §+!4§() : void
      {
         this.§while catch for§.stop();
         this.§try do§.stopMovement();
         this.§try do§.§catch var extends§(true);
         this.§try do§.§true var continue§(false);
         this.§try do§.§use const continue§(§+$%§.§@!c§);
         this.§native catch switch§.§["'§(§+$%§.§@!c§);
         this.§native catch switch§.§+!N§ = 0;
         this.§native catch switch§.§implements§ = 0;
         if(this.§3#c§())
         {
            this.§include package switch§.activate();
            this.battleService.§2!k§(this.§include package switch§);
         }
         else
         {
            this.battleService.§2!k§(this.§native catch switch§);
         }
         this.effects.§if set default§(this.§try do§.§2"F§());
         this.callback.§,"$§();
         this.callback.§#"3§();
         var _loc1_:§[!r§ = this.battleService.§3l§();
         _loc1_.§9! §();
         _loc1_.§,_§.§8#S§(this.§try do§.§0"t§().state.position,0);
      }
      
      private function §3#c§() : Boolean
      {
         return §default package import§.§;"W§() == §1!X§.§'!Y§;
      }
      
      public function §dynamic package extends§() : void
      {
         if(this.§`!w§.parent != null)
         {
            this.§`!w§.parent.removeChild(this.§`!w§);
            this.§false package include§.parent.removeChild(this.§false package include§);
            if(this.cross.parent != null)
            {
               this.cross.parent.removeChild(this.cross);
            }
         }
         this.§try do§.§catch var extends§(false);
         this.§try do§.§true var continue§(true);
         this.battleService.§package case§();
         this.battleService.§try for true§();
         this.§include package switch§.deactivate();
         this.battleService.§3l§().§&![§();
         this.§try do§.§class package case§();
         var _loc1_:Number = this.battleService.§7#P§().§%!4§();
         var _loc2_:Number = this.battleService.§7#P§().§case catch break§();
         this.§while catch for§.§!!]§(§switch set extends§.§else for static§(_loc1_,_loc2_));
         this.§while catch for§.start();
      }
      
      public function §return catch false§(param1:uint) : Boolean
      {
         return this.§try set import§.§+"[§(param1);
      }
      
      public function §%! §() : Boolean
      {
         var _loc1_:Object3D = null;
         this.§try do§.§get var switch§(§=#W§);
         var _loc2_:Vector3 = this.§try do§.§0"t§().state.position;
         _direction.diff(§=#W§.§if package var§,_loc2_);
         var _loc3_:RayIntersectionData = this.battleService.§3l§().raycast(_loc2_,_direction,this.battleService.§^#6§());
         if(_loc3_ != null && _loc3_.time <= 1)
         {
            _loc1_ = _loc3_.object;
            return _loc1_.name == §?!2§.§finally catch while§;
         }
         return false;
      }
      
      public function §break set implements§() : void
      {
         this.effects.§break set implements§();
      }
      
      public function §function for native§() : Number
      {
         return this.§for const switch§.§]!n§;
      }
      
      public function §break package dynamic§(param1:Number) : void
      {
         var _loc2_:§[!r§ = this.battleService.§3l§();
         _loc2_.§,_§.§8#S§(this.§try do§.§0"t§().state.position,param1);
      }
      
      public function §import super§(param1:Number) : void
      {
         var _loc2_:int = this.battleService.§]"d§();
         this.effects.§catch for package§();
         this.§try do§.§get var switch§(§=#W§);
         var _loc3_:§true package implements§ = this.§^!c§();
         this.§native catch switch§.§var for const§(_direction);
         var _loc4_:Number = param1 - this.§6#r§(_loc2_);
         this.effects.§-!c§(§=#W§.§if package var§,_loc3_.staticHitPoint);
         this.§ #'§(_loc3_.staticHitPoint,_loc3_.targetHitPoints,_direction);
         this.§[!M§(_loc3_.targets,_loc3_.targetHitPoints,this.§use package package§(_loc4_),_direction);
         this.§get var implements§ = this.battleService.§]"d§() + this.§true const default§;
         this.callback.§while const static§(_loc2_,_loc3_.staticHitPoint,_loc3_.targets,_loc3_.targetHitPoints);
         this.§try set native§(§"!a§.RECHARGE,Math.min(this.§6#r§(_loc2_),this.§for const switch§.§]!n§ - this.§for const switch§.minAimedShotEnergy),_loc2_);
      }
      
      private function §^!c§() : §true package implements§
      {
         var _loc1_:RayIntersectionData = null;
         var _loc2_:Object3D = null;
         var _loc3_:Vector3 = null;
         var _loc4_:Tank = null;
         var _loc5_:§true package implements§ = new §true package implements§();
         this.§native catch switch§.§super extends§(§final const for§);
         this.§finally for var§.§1#$§(_direction);
         this.§finally package var§(this.§try do§.§in package default§());
         while(true)
         {
            _loc1_ = this.battleService.§3l§().raycast(§final const for§,_direction,this.§-!;§);
            if(_loc1_ == null)
            {
               break;
            }
            _loc2_ = _loc1_.object;
            _loc3_ = §final const for§.clone().addScaled(_loc1_.time + 0.1,_direction);
            if(_loc2_.name == §?!2§.§finally catch while§)
            {
               _loc5_.§=X§(_loc3_);
               break;
            }
            if(_loc2_.name == §?!2§.TANK_PART)
            {
               _loc4_ = this.§@y§[_loc2_];
               if(this.§2!5§(_loc4_,_loc2_,_loc3_))
               {
                  _loc5_.§return const do§(_loc4_.§0"t§(),_loc3_);
               }
               this.§finally package var§(_loc4_.§in package default§());
            }
            else
            {
               this.§?#q§.addTemporaryItem(_loc2_);
            }
            §final const for§.copy(_loc3_);
         }
         this.§?#q§.deleteAllTemporaryItems();
         return _loc5_;
      }
      
      private function §2!5§(param1:Tank, param2:Object3D, param3:Vector3) : Boolean
      {
         var _loc4_:§false catch set§ = param1.§in package default§();
         if(_loc4_.§2"F§() == param2)
         {
            _m.setMatrix(param2.x,param2.y,param2.z,param2.rotationX,param2.rotationY,param2.rotationZ);
            _m.transformVectorInverse(param3,§catch super§);
            §continue catch return§(§catch super§,_loc4_.§4W§().§false super§,§>#s§);
            _m.transformVector(§>#s§,§catch super§);
            §catch super§.subtract(param3);
            if(§'x§().§const const true§().hasStaticHit(param3,§catch super§,§super const continue§.§finally catch while§,1))
            {
               return false;
            }
         }
         return _loc4_.§catch in§() == 1;
      }
      
      public function §static var default§(param1:Number) : void
      {
         var _loc2_:§override for continue§ = null;
         var _loc3_:Body = null;
         var _loc4_:Vector3 = null;
         var _loc5_:Vector3 = null;
         var _loc6_:Number = NaN;
         var _loc7_:int = this.battleService.§]"d§();
         var _loc8_:Number = param1 < 0 ? Number(this.§6#r§(_loc7_)) : Number(param1);
         if(_loc8_ >= this.§for const switch§.fastShotEnergy)
         {
            _loc8_ -= this.§for const switch§.fastShotEnergy;
            _loc2_ = new §override for continue§();
            if(!this.§%! §())
            {
               this.§try do§.§get var switch§(§=#W§);
               _loc2_.§in try§(this.§in set implements§.target(§=#W§));
               this.§ #'§(_loc2_.§set use§(),_loc2_.§class package const§,_loc2_.shotDirection);
               this.§[!M§(_loc2_.targets,_loc2_.§class package const§,this.§for const switch§.weakeningCoeff,_loc2_.shotDirection);
               this.effects.§-!c§(§=#W§.§if package var§,_loc2_.staticHitPoint);
            }
            this.effects.§8F§(this.§try do§.§else catch true§(),this.§try do§.§2"F§());
            this.§get var implements§ = this.battleService.§]"d§() + this.§true const default§;
            this.callback.§!"n§(_loc7_,_loc2_.§set use§(),_loc2_.targets,_loc2_.§class package const§);
         }
         this.§try set native§(§"!a§.RECHARGE,_loc8_,_loc7_);
      }
      
      public function §true for do§() : Boolean
      {
         return this.battleService.§]"d§() >= this.§get var implements§;
      }
      
      public function §6!r§() : void
      {
         var _loc1_:int = this.battleService.§]"d§();
         this.callback.§3!!§(_loc1_);
      }
      
      private function §finally package var§(param1:§false catch set§) : void
      {
         this.§?#q§.addTemporaryItem(param1.§7!T§());
         this.§?#q§.addTemporaryItem(param1.§2"F§());
      }
      
      private function initStateMachine() : void
      {
         var _loc1_:Vector3 = this.§try do§.§%$#§().clone();
         this.states = new Dictionary();
         this.states[§try with§.IDLE] = new IdleState(this);
         this.states[§try with§.READY_TO_SHOOT] = new §!!R§(this,§default for finally§);
         var _loc2_:§&#T§ = new §&#T§();
         this.states[§try with§.§set var switch§] = new §false package finally§(_loc2_,this,this.§for const switch§.targetingTransitionTime,this.§for const switch§.§break set for§,_loc1_,this.battleService.§3l§().§super package§(),this.§try do§.§in package default§(),this.§try do§,this.§finally for var§,this.§for const switch§,this.§%!6§);
         this.states[§try with§.§6#n§] = new §false set throw§(_loc2_,this,this.§native catch switch§,this.§for const switch§,this.§finally for var§,this.effects,this.§%!6§);
         this.currentState = this.states[§try with§.IDLE];
         this.§-!&§ = Vector.<§!"@§>([this.§case for for§(§try with§.IDLE,§switch var override§.READY_TO_SHOOT,§try with§.READY_TO_SHOOT,null),this.§case for for§(§try with§.IDLE,§switch var override§.STOP,§try with§.IDLE,null),this.§case for for§(§try with§.READY_TO_SHOOT,§switch var override§.TRIGGER_RELEASE,§try with§.IDLE,new §]#t§(this)),this.§case for for§(§try with§.READY_TO_SHOOT,§switch var override§.SWITCH,§try with§.§set var switch§,null),this.§case for for§(§try with§.READY_TO_SHOOT,§switch var override§.STOP,§try with§.IDLE,null),this.§case for for§(§try with§.§set var switch§,§switch var override§.SWITCH,§try with§.§6#n§,null),this.§case for for§(§try with§.§set var switch§,§switch var override§.TRIGGER_RELEASE,§try with§.IDLE,new §const for include§(this)),this.§case for for§(§try with§.§set var switch§,§switch var override§.STOP,§try with§.IDLE,new §break catch extends§(this)),this.§case for for§(§try with§.§6#n§,§switch var override§.EXIT,§try with§.IDLE,null),this.§case for for§(§try with§.§6#n§,§switch var override§.STOP,§try with§.IDLE,new §if for for§(this))]);
      }
      
      private function §case for for§(param1:§try with§, param2:§switch var override§, param3:§try with§, param4:§4"I§) : §!"@§
      {
         return new §!"@§(param2,this.states[param1],this.states[param3],param4);
      }
      
      private function §try set native§(param1:§"!a§, param2:Number, param3:int) : void
      {
         this.§ !§ = param1;
         switch(param1)
         {
            case §"!a§.RECHARGE:
               this.§>"Y§.setNumber(0);
               this.§ s§.setNumber(this.§for const switch§.chargeRate);
               this.§>#e§.setInt(param3 - param2 / this.§ s§.getNumber() * §throw catch while§.getInt());
               break;
            case §"!a§.DRAIN:
               this.§>"Y§.setNumber(this.§for const switch§.§]!n§);
               this.§ s§.setNumber(-this.§for const switch§.§!§);
               this.§>#e§.setInt(param3 + (this.§for const switch§.§]!n§ - param2) / this.§ s§.getNumber() * §throw catch while§.getInt());
               this.callback.§throw var import§(param3);
         }
      }
      
      private function § #'§(param1:Vector3, param2:Vector.<Vector3>, param3:Vector3) : void
      {
         this.effects.§-"b§(§=#W§.§6u§);
         this.effects.§else catch false§(param1,param2,§=#W§.§6u§,§=#W§.direction,param3);
         this.§try do§.§0"t§().addWorldForceScaled(§=#W§.§6u§,§=#W§.direction,-this.§7$$§.§get package set§());
         this.§try do§.§6v§();
      }
      
      private function §[!M§(param1:Vector.<Body>, param2:Vector.<Vector3>, param3:Number, param4:Vector3) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:int = 0;
         var _loc7_:Number = NaN;
         var _loc8_:Body = null;
         if(param1 != null)
         {
            _loc5_ = 1;
            _loc6_ = 0;
            while(_loc6_ < param1.length)
            {
               _loc7_ = _loc5_ * param3;
               _loc8_ = param1[_loc6_];
               _loc8_.tank.§case extends§(param2[_loc6_],param4,_loc7_);
               _loc5_ *= this.§for const switch§.weakeningCoeff;
               _loc6_++;
            }
         }
      }
      
      private function §use package package§(param1:Number) : Number
      {
         var _loc2_:Number = this.§6"n§.§extends catch with§().§include package finally§();
         return _loc2_ + (this.§7$$§.§include package finally§() - _loc2_) * param1 / this.§for const switch§.§]!n§;
      }
      
      public function §do for dynamic§(param1:Number) : void
      {
         this.§`!w§.§do for dynamic§(param1);
      }
      
      public function §1"`§(param1:Vector3, param2:§return package super§) : Boolean
      {
         var _loc3_:RayIntersectionData = null;
         var _loc4_:Object3D = null;
         var _loc5_:Tank = null;
         this.§native catch switch§.§super extends§(§final const for§);
         _direction.copy(param1);
         this.§finally package var§(this.§try do§.§in package default§());
         param2.reset();
         while(true)
         {
            _loc3_ = this.battleService.§3l§().raycast(§final const for§,param1,this.§-!;§);
            if(_loc3_ == null)
            {
               break;
            }
            _loc4_ = _loc3_.object;
            if(_loc4_.name == §?!2§.§finally catch while§)
            {
               §final const for§.addScaled(_loc3_.time,param1);
               param2.§dynamic var do§(§final const for§);
               this.§?#q§.deleteAllTemporaryItems();
               return true;
            }
            if(_loc4_.name == §?!2§.TANK_PART)
            {
               §final const for§.addScaled(_loc3_.time,param1);
               _loc5_ = this.§@y§[_loc4_];
               if(this.§2!5§(_loc5_,_loc4_,§final const for§))
               {
                  param2.§dynamic var do§(§final const for§,_loc5_);
                  this.§?#q§.deleteAllTemporaryItems();
                  return true;
               }
            }
            this.§?#q§.addTemporaryItem(_loc3_.object);
         }
         this.§?#q§.deleteAllTemporaryItems();
         return false;
      }
      
      public function §implements for do§(param1:Point, param2:Point) : void
      {
         var _loc3_:DisplayObjectContainer = this.battleService.§7#P§().§1!^§();
         _loc3_.addChild(this.§`!w§);
         §native extends§(this.§`!w§);
         var _loc4_:Tank = this.getTank();
         _loc4_.§implements catch finally§();
         var _loc5_:BitmapData = _loc4_.§import catch final§();
         this.§false package include§.bitmapData = _loc5_;
         _loc3_.addChild(this.§false package include§);
         if(§default package import§.§;"W§() == §1!X§.§'!Y§)
         {
            _loc3_.addChild(this.cross);
         }
         var _loc6_:§3!0§ = this.battleService.§3l§().§super package§();
         var _loc7_:Vector3D = new Vector3D();
         _loc4_.§>A§(_loc7_);
         _loc7_ = _loc6_.projectGlobal(_loc7_);
         param1.x = _loc7_.x + this.battleService.§7#P§().§="f§();
         param1.y = _loc7_.y + this.battleService.§7#P§().§6!W§() - _loc5_.height;
         this.§false package include§.x = param1.x;
         this.§false package include§.y = param1.y;
         this.§try for override§();
         param2.x = display.stage.stageWidth >> 1;
         param2.y = (display.stage.stageHeight >> 1) + §4H§;
      }
      
      private function §try for override§() : void
      {
         this.cross.x = display.stage.stageWidth - this.cross.width >> 1;
         this.cross.y = display.stage.stageHeight - this.cross.height >> 1;
      }
      
      public function §native const do§(param1:Number) : void
      {
         this.§`!w§.§[#Q§.alpha = param1;
         this.§false package include§.alpha = param1;
      }
      
      public function §static var extends§() : §6!g§
      {
         return this.laser;
      }
   }
}

