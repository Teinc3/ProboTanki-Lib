package alternativa.tanks.models.weapon.shaft
{
   import Renamed136.Renamed663;
   import Renamed280.Renamed3288;
   import Renamed280.Renamed3289;
   import Renamed280.Renamed3290;
   import Renamed280.Renamed3291;
   import Renamed280.IdleState;
   import Renamed280.Renamed3292;
   import Renamed280.Renamed3293;
   import Renamed280.Renamed3207;
   import Renamed280.Renamed3230;
   import Renamed301.Renamed3044;
   import Renamed3294.Renamed3295;
   import Renamed3294.Renamed3296;
   import Renamed479.Renamed912;
   import Renamed479.Renamed3148;
   import Renamed500.Renamed3297;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.RayIntersectionData;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.Renamed668;
   import alternativa.tanks.battle.Renamed768;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.Renamed832;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.objects.tank.Renamed925;
   import alternativa.tanks.battle.objects.tank.Renamed990;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.objects.tank.Renamed1150;
   import alternativa.tanks.battle.objects.tank.tankskin.Renamed917;
   import alternativa.tanks.battle.scene3d.Renamed1230;
   import alternativa.tanks.battle.scene3d.Renamed610;
   import alternativa.tanks.battle.scene3d.Renamed1334;
   import alternativa.tanks.camera.Renamed842;
   import alternativa.tanks.camera.Renamed1345;
   import alternativa.tanks.models.weapon.Renamed664;
   import alternativa.tanks.models.weapon.Renamed3065;
   import alternativa.tanks.models.weapon.shared.Renamed3150;
   import alternativa.tanks.models.weapons.targeting.Renamed3071;
   import alternativa.tanks.services.targeting.TargetingModeService;
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   import alternativa.tanks.utils.EncryptedNumber;
   import alternativa.tanks.utils.EncryptedNumberImpl;
   import alternativa.tanks.utils.MathUtils;
   import alternativa.tanks.utils.SetControllerForTemporaryItems;
   import Renamed56.Renamed3298;
   import com.alternativaplatform.projects.tanks.client.commons.types.TankSpecification;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.geom.Point;
   import flash.geom.Vector3D;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   import Renamed373.Renamed666;
   import Renamed79.Renamed80;
   import Renamed447.Renamed3299;
   import Renamed447.Renamed3300;
   import Renamed447.Renamed3301;
   import Renamed447.Renamed3302;
   import Renamed94.Renamed96;
   
   public class Renamed3170 extends Renamed832 implements Renamed990, Renamed1150, Renamed768, Renamed3208
   {
      [Inject]
      public static var Renamed926:TargetingModeService;
      
      [Inject]
      public static var display:IDisplay;
      
      private static const Renamed3303:Class = Renamed3287;
      
      private static const Renamed3304:BitmapData = new Renamed3303().bitmapData;
      
      private static const Renamed3305:int = 200;
      
      private static const Renamed3306:Number = 9;
      
      private static const Renamed3307:Vector3 = new Vector3();
      
      private static const _direction:Vector3 = new Vector3();
      
      private static const _m:Matrix4 = new Matrix4();
      
      private static const Renamed3308:Vector3 = new Vector3();
      
      private static const Renamed3309:Vector3 = new Vector3();
      
      private static const Renamed3310:Vector3 = new Vector3();
      
      private static const Renamed784:EncryptedInt = new EncryptedIntImpl(1000);
      
      private static const Renamed3195:Renamed664 = new Renamed664();
      
      private static const Renamed3311:int = 75;
      
      private var battleService:BattleService;
      
      private var battleEventDispatcher:BattleEventDispatcher;
      
      private var laser:Renamed80;
      
      private var callback:Renamed3153;
      
      private var effects:Renamed3160;
      
      private var Renamed3079:Renamed3071;
      
      private var Renamed3312:Renamed96;
      
      private var Renamed3313:Renamed3065;
      
      private var Renamed1358:Renamed3296;
      
      private var Renamed3314:Renamed3150;
      
      private var Renamed3154:Dictionary;
      
      private var Renamed3110:Renamed925;
      
      private var states:Dictionary;
      
      private var currentState:Renamed3230;
      
      private var Renamed3315:Vector.<Renamed3289>;
      
      private var Renamed3316:EncryptedInt;
      
      private var Renamed3317:EncryptedNumber;
      
      private var Renamed3318:EncryptedNumber;
      
      private var Renamed3319:Renamed3140;
      
      private var Renamed3320:Renamed3232;
      
      private var enabled:Boolean;
      
      private var Renamed991:Renamed3148;
      
      private var Renamed3321:int;
      
      private var Renamed3322:int;
      
      private var team:Renamed663;
      
      private var Renamed3323:SetControllerForTemporaryItems;
      
      private var Renamed3324:Dictionary;
      
      private var Renamed3325:Renamed3295;
      
      private var Renamed3129:TankSpecification;
      
      private var Renamed3326:Renamed3044;
      
      private var Renamed3327:Renamed3184;
      
      private var Renamed3328:Renamed3297;
      
      private var cross:Bitmap;
      
      private var Renamed3329:Renamed3169;
      
      public function Renamed3170(param1:Renamed3169, param2:BattleService, param3:BattleEventDispatcher, param4:Renamed3153, param5:Renamed96, param6:Renamed3065, param7:Renamed3150, param8:Dictionary, param9:Renamed3148, param10:Renamed3071, param11:Renamed3044)
      {
         this.Renamed3154 = new Dictionary();
         this.Renamed3316 = new EncryptedIntImpl();
         this.Renamed3317 = new EncryptedNumberImpl();
         this.Renamed3318 = new EncryptedNumberImpl();
         this.Renamed3319 = Renamed3140.RECHARGE;
         this.Renamed3328 = new Renamed3297();
         this.cross = new Bitmap(Renamed3304);
         super();
         this.Renamed3329 = param1;
         this.laser = param1.laser();
         this.Renamed3321 = param1.Renamed3049();
         this.battleService = param2;
         this.battleEventDispatcher = param3;
         this.callback = param4;
         this.effects = param1.Renamed3159();
         this.Renamed3079 = param10;
         this.Renamed3312 = param5;
         this.Renamed3313 = param6;
         this.Renamed1358 = new Renamed3296(param1.Renamed3051(),-param1.Renamed3053(),param5.Renamed134,param5.Renamed127);
         this.Renamed3314 = param7;
         this.Renamed3154 = param8;
         this.Renamed991 = param9;
         this.Renamed3129 = param1.Renamed3048().Renamed2872;
         this.Renamed3326 = param11;
         var _loc12_:Renamed610 = param2.Renamed621();
         this.Renamed3320 = new Renamed3232(_loc12_.Renamed739());
         this.Renamed3324 = _loc12_.Renamed1405();
         this.Renamed3323 = new SetControllerForTemporaryItems(this.Renamed3324);
         this.Renamed3325 = new Renamed3295(param1.Renamed3051(),-param1.Renamed3053());
         this.Renamed3327 = param9.Renamed3330();
      }
      
      private static function Renamed3331(param1:Vector3, param2:Vector.<Vector3>, param3:Vector3) : void
      {
         var _loc4_:Number = NaN;
         Renamed3309.copy(param2[0]);
         Renamed3309.y = 0;
         param3.copy(Renamed3309);
         var _loc5_:Number = param1.distanceToSquared(Renamed3309);
         var _loc6_:int = 1;
         while(_loc6_ < param2.length)
         {
            Renamed3309.copy(param2[_loc6_]);
            Renamed3309.y = 0;
            _loc4_ = param1.distanceToSquared(Renamed3309);
            if(_loc4_ < _loc5_)
            {
               _loc5_ = _loc4_;
               param3.copy(Renamed3309);
            }
            _loc6_++;
         }
      }
      
      private static function Renamed3332(param1:DisplayObject) : void
      {
         param1.x = display.stage.stageWidth - param1.width >> 1;
         param1.y = display.stage.stageHeight - param1.height >> 1;
      }
      
      public function init(param1:Renamed925) : void
      {
         this.Renamed3110 = param1;
         this.Renamed3314.setWeapon(this);
         this.Renamed3314.init();
         this.Renamed3320.setSkin(param1.Renamed1075());
         this.Renamed1358.Renamed3333(param1.Renamed1020());
         this.team = this.getTank().teamType;
         this.initStateMachine();
         this.reset();
      }
      
      public function destroy() : void
      {
         this.Renamed3329 = null;
         this.laser = null;
         this.battleService = null;
         this.battleEventDispatcher = null;
         this.callback = null;
         this.effects = null;
         this.Renamed3079 = null;
         this.Renamed3312 = null;
         this.Renamed3313 = null;
         this.Renamed1358 = null;
         this.Renamed3154 = null;
         this.Renamed991 = null;
         this.Renamed3129 = null;
         this.Renamed3326 = null;
         this.currentState.exit();
         this.Renamed3314.destroy();
         this.Renamed3320.stop();
      }
      
      public function activate() : void
      {
         Renamed619().Renamed815(this);
      }
      
      public function deactivate() : void
      {
         Renamed619().Renamed816(this);
      }
      
      public function enable() : void
      {
         if(!this.enabled)
         {
            this.enabled = true;
            this.currentState.enter(this.battleService.Renamed653());
         }
      }
      
      public function disable(param1:Boolean) : void
      {
         if(this.enabled)
         {
            this.enabled = false;
            this.Renamed3211(Renamed3212.STOP,param1);
         }
      }
      
      public function reset() : void
      {
         var _loc1_:int = this.battleService.Renamed653();
         if(this.currentState != this.states[Renamed3334.IDLE])
         {
            this.currentState.exit();
            this.currentState = this.states[Renamed3334.IDLE];
         }
         var _loc2_:Renamed663 = this.getTank().teamType;
         if(this.team != _loc2_)
         {
            this.team = _loc2_;
            this.Renamed3327.Renamed3247(this.Renamed3335(this.team));
         }
         this.currentState.enter(_loc1_);
         this.Renamed3336(Renamed3140.RECHARGE,this.Renamed3312.Renamed129,_loc1_);
      }
      
      private function getTank() : Tank
      {
         return this.Renamed3110.Renamed696().tank;
      }
      
      public function getStatus() : Number
      {
         return this.Renamed2961(getTimer()) / this.Renamed3312.Renamed129;
      }
      
      public function Renamed1151() : void
      {
         if(this.enabled)
         {
            this.currentState.Renamed3211(Renamed3212.TRIGGER_PULL,null);
         }
      }
      
      public function Renamed1152() : void
      {
         if(this.enabled)
         {
            this.currentState.Renamed3211(Renamed3212.TRIGGER_RELEASE,null);
         }
      }
      
      public function Renamed769(param1:int, param2:int) : void
      {
         if(this.enabled)
         {
            this.currentState.update(param1,param2);
         }
      }
      
      public function Renamed3209() : Boolean
      {
         return this.Renamed3314.Renamed3209();
      }
      
      public function Renamed3210(param1:Renamed3140) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         if(param1 != this.Renamed3319)
         {
            _loc2_ = this.battleService.Renamed653();
            _loc3_ = this.Renamed2961(_loc2_);
            this.Renamed3336(param1,_loc3_,_loc2_);
         }
      }
      
      public function Renamed3211(param1:Renamed3212, param2:* = undefined) : void
      {
         var _loc3_:Renamed3289 = null;
         for each(_loc3_ in this.Renamed3315)
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
                  this.Renamed991.Renamed3337();
               }
               this.currentState.enter(this.battleService.Renamed653());
               return;
            }
         }
         throw new Renamed3231(this.currentState,param1);
      }
      
      public function Renamed2961(param1:int) : Number
      {
         var _loc2_:Number = this.Renamed3317.getNumber() + (param1 - this.Renamed3316.getInt()) * this.Renamed3318.getNumber() / Renamed784.getInt();
         return MathUtils.clamp(_loc2_,0,this.Renamed3312.Renamed129);
      }
      
      public function Renamed3215() : void
      {
         this.battleService.Renamed638(Renamed1345.INSTANCE);
      }
      
      public function Renamed3216(param1:int, param2:int) : void
      {
         this.Renamed3328.x = param1 + Renamed3306;
         this.Renamed3328.y = param2;
      }
      
      private function Renamed3335(param1:Renamed663) : uint
      {
         switch(param1)
         {
            case Renamed663.BLUE:
               return this.Renamed3329.laser().Renamed3338(this.Renamed3329.Renamed3048().turret);
            case Renamed663.RED:
               return this.Renamed3329.laser().getLaserPointerRedColor(this.Renamed3329.Renamed3048().turret);
            default:
               return this.Renamed3329.laser().getLaserPointerRedColor(this.Renamed3329.Renamed3048().turret);
         }
      }
      
      public function Renamed3168() : void
      {
         this.Renamed3320.stop();
         this.Renamed3110.stopMovement();
         this.Renamed3110.Renamed1078(true);
         this.Renamed3110.Renamed1079(false);
         this.Renamed3110.Renamed1102(Renamed668.Renamed669);
         this.Renamed1358.Renamed3339(Renamed668.Renamed669);
         this.Renamed1358.Renamed3340 = 0;
         this.Renamed1358.Renamed3341 = 0;
         if(this.Renamed3342())
         {
            this.Renamed3325.activate();
            this.battleService.Renamed638(this.Renamed3325);
         }
         else
         {
            this.battleService.Renamed638(this.Renamed1358);
         }
         this.effects.Renamed3200(this.Renamed3110.Renamed1020());
         this.callback.Renamed3177();
         this.callback.Renamed3183();
         var _loc1_:Renamed610 = this.battleService.Renamed621();
         _loc1_.Renamed1384();
         _loc1_.Renamed1377.Renamed3343(this.Renamed3110.Renamed696().state.position,0);
      }
      
      private function Renamed3342() : Boolean
      {
         return Renamed926.Renamed1024() == Renamed912.Renamed1026;
      }
      
      public function Renamed3165() : void
      {
         if(this.Renamed3327.parent != null)
         {
            this.Renamed3327.parent.removeChild(this.Renamed3327);
            this.Renamed3328.parent.removeChild(this.Renamed3328);
            if(this.cross.parent != null)
            {
               this.cross.parent.removeChild(this.cross);
            }
         }
         this.Renamed3110.Renamed1078(false);
         this.Renamed3110.Renamed1079(true);
         this.battleService.Renamed648();
         this.battleService.Renamed645();
         this.Renamed3325.deactivate();
         this.battleService.Renamed621().Renamed1386();
         this.Renamed3110.Renamed1076();
         var _loc1_:Number = this.battleService.Renamed622().Renamed745();
         var _loc2_:Number = this.battleService.Renamed622().Renamed746();
         this.Renamed3320.Renamed3236(Renamed1334.Renamed1339(_loc1_,_loc2_));
         this.Renamed3320.start();
      }
      
      public function Renamed3217(param1:uint) : Boolean
      {
         return this.Renamed3314.Renamed3344(param1);
      }
      
      public function Renamed3218() : Boolean
      {
         var _loc1_:Object3D = null;
         this.Renamed3110.Renamed1054(Renamed3195);
         var _loc2_:Vector3 = this.Renamed3110.Renamed696().state.position;
         _direction.diff(Renamed3195.Renamed689,_loc2_);
         var _loc3_:RayIntersectionData = this.battleService.Renamed621().raycast(_loc2_,_direction,this.battleService.Renamed647());
         if(_loc3_ != null && _loc3_.time <= 1)
         {
            _loc1_ = _loc3_.object;
            return _loc1_.name == Renamed1230.Renamed690;
         }
         return false;
      }
      
      public function Renamed3219() : void
      {
         this.effects.Renamed3219();
      }
      
      public function Renamed3220() : Number
      {
         return this.Renamed3312.Renamed129;
      }
      
      public function Renamed3221(param1:Number) : void
      {
         var _loc2_:Renamed610 = this.battleService.Renamed621();
         _loc2_.Renamed1377.Renamed3343(this.Renamed3110.Renamed696().state.position,param1);
      }
      
      public function Renamed3222(param1:Number) : void
      {
         var _loc2_:int = this.battleService.Renamed653();
         this.effects.Renamed3201();
         this.Renamed3110.Renamed1054(Renamed3195);
         var _loc3_:Renamed3345 = this.Renamed3346();
         this.Renamed1358.Renamed3347(_direction);
         var _loc4_:Number = param1 - this.Renamed2961(_loc2_);
         this.effects.Renamed3204(Renamed3195.Renamed689,_loc3_.staticHitPoint);
         this.Renamed3348(_loc3_.staticHitPoint,_loc3_.targetHitPoints,_direction);
         this.Renamed3349(_loc3_.targets,_loc3_.targetHitPoints,this.Renamed3350(_loc4_),_direction);
         this.Renamed3322 = this.battleService.Renamed653() + this.Renamed3321;
         this.callback.Renamed3171(_loc2_,_loc3_.staticHitPoint,_loc3_.targets,_loc3_.targetHitPoints);
         this.Renamed3336(Renamed3140.RECHARGE,Math.min(this.Renamed2961(_loc2_),this.Renamed3312.Renamed129 - this.Renamed3312.minAimedShotEnergy),_loc2_);
      }
      
      private function Renamed3346() : Renamed3345
      {
         var _loc1_:RayIntersectionData = null;
         var _loc2_:Object3D = null;
         var _loc3_:Vector3 = null;
         var _loc4_:Tank = null;
         var _loc5_:Renamed3345 = new Renamed3345();
         this.Renamed1358.Renamed3351(Renamed3307);
         this.Renamed991.Renamed3352(_direction);
         this.Renamed3353(this.Renamed3110.Renamed1075());
         while(true)
         {
            _loc1_ = this.battleService.Renamed621().raycast(Renamed3307,_direction,this.Renamed3324);
            if(_loc1_ == null)
            {
               break;
            }
            _loc2_ = _loc1_.object;
            _loc3_ = Renamed3307.clone().addScaled(_loc1_.time + 0.1,_direction);
            if(_loc2_.name == Renamed1230.Renamed690)
            {
               _loc5_.Renamed3354(_loc3_);
               break;
            }
            if(_loc2_.name == Renamed1230.TANK_PART)
            {
               _loc4_ = this.Renamed3154[_loc2_];
               if(this.Renamed3355(_loc4_,_loc2_,_loc3_))
               {
                  _loc5_.Renamed1554(_loc4_.Renamed696(),_loc3_);
               }
               this.Renamed3353(_loc4_.Renamed1075());
            }
            else
            {
               this.Renamed3323.addTemporaryItem(_loc2_);
            }
            Renamed3307.copy(_loc3_);
         }
         this.Renamed3323.deleteAllTemporaryItems();
         return _loc5_;
      }
      
      private function Renamed3355(param1:Tank, param2:Object3D, param3:Vector3) : Boolean
      {
         var _loc4_:Renamed917 = param1.Renamed1075();
         if(_loc4_.Renamed1020() == param2)
         {
            _m.setMatrix(param2.x,param2.y,param2.z,param2.rotationX,param2.rotationY,param2.rotationZ);
            _m.transformVectorInverse(param3,Renamed3308);
            Renamed3331(Renamed3308,_loc4_.Renamed1057().Renamed1058,Renamed3310);
            _m.transformVector(Renamed3310,Renamed3308);
            Renamed3308.subtract(param3);
            if(Renamed619().Renamed692().hasStaticHit(param3,Renamed3308,Renamed666.Renamed690,1))
            {
               return false;
            }
         }
         return _loc4_.Renamed1267() == 1;
      }
      
      public function Renamed3223(param1:Number) : void
      {
         var _loc2_:Renamed3298 = null;
         var _loc3_:Body = null;
         var _loc4_:Vector3 = null;
         var _loc5_:Vector3 = null;
         var _loc6_:Number = NaN;
         var _loc7_:int = this.battleService.Renamed653();
         var _loc8_:Number = param1 < 0 ? Number(this.Renamed2961(_loc7_)) : Number(param1);
         if(_loc8_ >= this.Renamed3312.fastShotEnergy)
         {
            _loc8_ -= this.Renamed3312.fastShotEnergy;
            _loc2_ = new Renamed3298();
            if(!this.Renamed3218())
            {
               this.Renamed3110.Renamed1054(Renamed3195);
               _loc2_.Renamed3356(this.Renamed3079.target(Renamed3195));
               this.Renamed3348(_loc2_.Renamed3357(),_loc2_.Renamed3143,_loc2_.shotDirection);
               this.Renamed3349(_loc2_.targets,_loc2_.Renamed3143,this.Renamed3312.weakeningCoeff,_loc2_.shotDirection);
               this.effects.Renamed3204(Renamed3195.Renamed689,_loc2_.staticHitPoint);
            }
            this.effects.Renamed3202(this.Renamed3110.Renamed1071(),this.Renamed3110.Renamed1020());
            this.Renamed3322 = this.battleService.Renamed653() + this.Renamed3321;
            this.callback.Renamed3173(_loc7_,_loc2_.Renamed3357(),_loc2_.targets,_loc2_.Renamed3143);
         }
         this.Renamed3336(Renamed3140.RECHARGE,_loc8_,_loc7_);
      }
      
      public function Renamed3225() : Boolean
      {
         return this.battleService.Renamed653() >= this.Renamed3322;
      }
      
      public function Renamed3224() : void
      {
         var _loc1_:int = this.battleService.Renamed653();
         this.callback.Renamed3179(_loc1_);
      }
      
      private function Renamed3353(param1:Renamed917) : void
      {
         this.Renamed3323.addTemporaryItem(param1.Renamed1023());
         this.Renamed3323.addTemporaryItem(param1.Renamed1020());
      }
      
      private function initStateMachine() : void
      {
         var _loc1_:Vector3 = this.Renamed3110.Renamed1072().clone();
         this.states = new Dictionary();
         this.states[Renamed3334.IDLE] = new IdleState(this);
         this.states[Renamed3334.READY_TO_SHOOT] = new Renamed3288(this,Renamed3305);
         var _loc2_:Renamed3290 = new Renamed3290();
         this.states[Renamed3334.Renamed3358] = new Renamed3292(_loc2_,this,this.Renamed3312.targetingTransitionTime,this.Renamed3312.Renamed128,_loc1_,this.battleService.Renamed621().Renamed739(),this.Renamed3110.Renamed1075(),this.Renamed3110,this.Renamed991,this.Renamed3312,this.Renamed3129);
         this.states[Renamed3334.Renamed3359] = new Renamed3293(_loc2_,this,this.Renamed1358,this.Renamed3312,this.Renamed991,this.effects,this.Renamed3129);
         this.currentState = this.states[Renamed3334.IDLE];
         this.Renamed3315 = Vector.<Renamed3289>([this.Renamed3360(Renamed3334.IDLE,Renamed3212.READY_TO_SHOOT,Renamed3334.READY_TO_SHOOT,null),this.Renamed3360(Renamed3334.IDLE,Renamed3212.STOP,Renamed3334.IDLE,null),this.Renamed3360(Renamed3334.READY_TO_SHOOT,Renamed3212.TRIGGER_RELEASE,Renamed3334.IDLE,new Renamed3299(this)),this.Renamed3360(Renamed3334.READY_TO_SHOOT,Renamed3212.SWITCH,Renamed3334.Renamed3358,null),this.Renamed3360(Renamed3334.READY_TO_SHOOT,Renamed3212.STOP,Renamed3334.IDLE,null),this.Renamed3360(Renamed3334.Renamed3358,Renamed3212.SWITCH,Renamed3334.Renamed3359,null),this.Renamed3360(Renamed3334.Renamed3358,Renamed3212.TRIGGER_RELEASE,Renamed3334.IDLE,new Renamed3301(this)),this.Renamed3360(Renamed3334.Renamed3358,Renamed3212.STOP,Renamed3334.IDLE,new Renamed3300(this)),this.Renamed3360(Renamed3334.Renamed3359,Renamed3212.EXIT,Renamed3334.IDLE,null),this.Renamed3360(Renamed3334.Renamed3359,Renamed3212.STOP,Renamed3334.IDLE,new Renamed3302(this))]);
      }
      
      private function Renamed3360(param1:Renamed3334, param2:Renamed3212, param3:Renamed3334, param4:Renamed3291) : Renamed3289
      {
         return new Renamed3289(param2,this.states[param1],this.states[param3],param4);
      }
      
      private function Renamed3336(param1:Renamed3140, param2:Number, param3:int) : void
      {
         this.Renamed3319 = param1;
         switch(param1)
         {
            case Renamed3140.RECHARGE:
               this.Renamed3317.setNumber(0);
               this.Renamed3318.setNumber(this.Renamed3312.chargeRate);
               this.Renamed3316.setInt(param3 - param2 / this.Renamed3318.getNumber() * Renamed784.getInt());
               break;
            case Renamed3140.DRAIN:
               this.Renamed3317.setNumber(this.Renamed3312.Renamed129);
               this.Renamed3318.setNumber(-this.Renamed3312.Renamed126);
               this.Renamed3316.setInt(param3 + (this.Renamed3312.Renamed129 - param2) / this.Renamed3318.getNumber() * Renamed784.getInt());
               this.callback.Renamed3175(param3);
         }
      }
      
      private function Renamed3348(param1:Vector3, param2:Vector.<Vector3>, param3:Vector3) : void
      {
         this.effects.Renamed3203(Renamed3195.Renamed693);
         this.effects.Renamed3205(param1,param2,Renamed3195.Renamed693,Renamed3195.direction,param3);
         this.Renamed3110.Renamed696().addWorldForceScaled(Renamed3195.Renamed693,Renamed3195.direction,-this.Renamed3313.Renamed3068());
         this.Renamed3110.Renamed1032();
      }
      
      private function Renamed3349(param1:Vector.<Body>, param2:Vector.<Vector3>, param3:Number, param4:Vector3) : void
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
               _loc8_.tank.Renamed1029(param2[_loc6_],param4,_loc7_);
               _loc5_ *= this.Renamed3312.weakeningCoeff;
               _loc6_++;
            }
         }
      }
      
      private function Renamed3350(param1:Number) : Number
      {
         var _loc2_:Number = this.Renamed3329.Renamed3055().Renamed3067();
         return _loc2_ + (this.Renamed3313.Renamed3067() - _loc2_) * param1 / this.Renamed3312.Renamed129;
      }
      
      public function Renamed3227(param1:Number) : void
      {
         this.Renamed3327.Renamed3227(param1);
      }
      
      public function Renamed3226(param1:Vector3, param2:Renamed3207) : Boolean
      {
         var _loc3_:RayIntersectionData = null;
         var _loc4_:Object3D = null;
         var _loc5_:Tank = null;
         this.Renamed1358.Renamed3351(Renamed3307);
         _direction.copy(param1);
         this.Renamed3353(this.Renamed3110.Renamed1075());
         param2.reset();
         while(true)
         {
            _loc3_ = this.battleService.Renamed621().raycast(Renamed3307,param1,this.Renamed3324);
            if(_loc3_ == null)
            {
               break;
            }
            _loc4_ = _loc3_.object;
            if(_loc4_.name == Renamed1230.Renamed690)
            {
               Renamed3307.addScaled(_loc3_.time,param1);
               param2.Renamed3361(Renamed3307);
               this.Renamed3323.deleteAllTemporaryItems();
               return true;
            }
            if(_loc4_.name == Renamed1230.TANK_PART)
            {
               Renamed3307.addScaled(_loc3_.time,param1);
               _loc5_ = this.Renamed3154[_loc4_];
               if(this.Renamed3355(_loc5_,_loc4_,Renamed3307))
               {
                  param2.Renamed3361(Renamed3307,_loc5_);
                  this.Renamed3323.deleteAllTemporaryItems();
                  return true;
               }
            }
            this.Renamed3323.addTemporaryItem(_loc3_.object);
         }
         this.Renamed3323.deleteAllTemporaryItems();
         return false;
      }
      
      public function Renamed3213(param1:Point, param2:Point) : void
      {
         var _loc3_:DisplayObjectContainer = this.battleService.Renamed622().Renamed748();
         _loc3_.addChild(this.Renamed3327);
         Renamed3332(this.Renamed3327);
         var _loc4_:Tank = this.getTank();
         _loc4_.Renamed1077();
         var _loc5_:BitmapData = _loc4_.Renamed1094();
         this.Renamed3328.bitmapData = _loc5_;
         _loc3_.addChild(this.Renamed3328);
         if(Renamed926.Renamed1024() == Renamed912.Renamed1026)
         {
            _loc3_.addChild(this.cross);
         }
         var _loc6_:Renamed842 = this.battleService.Renamed621().Renamed739();
         var _loc7_:Vector3D = new Vector3D();
         _loc4_.Renamed1014(_loc7_);
         _loc7_ = _loc6_.projectGlobal(_loc7_);
         param1.x = _loc7_.x + this.battleService.Renamed622().Renamed749();
         param1.y = _loc7_.y + this.battleService.Renamed622().Renamed750() - _loc5_.height;
         this.Renamed3328.x = param1.x;
         this.Renamed3328.y = param1.y;
         this.Renamed3362();
         param2.x = display.stage.stageWidth >> 1;
         param2.y = (display.stage.stageHeight >> 1) + Renamed3311;
      }
      
      private function Renamed3362() : void
      {
         this.cross.x = display.stage.stageWidth - this.cross.width >> 1;
         this.cross.y = display.stage.stageHeight - this.cross.height >> 1;
      }
      
      public function Renamed3214(param1:Number) : void
      {
         this.Renamed3327.Renamed3245.alpha = param1;
         this.Renamed3328.alpha = param1;
      }
      
      public function Renamed3228() : Renamed80
      {
         return this.laser;
      }
   }
}

