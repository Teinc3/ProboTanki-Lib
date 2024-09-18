package §9!1§
{
   import §?#0§.§9#W§;
   import §]#R§.§else for include§;
   import §]#R§.§try set for§;
   import alternativa.math.Vector3;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.models.weapon.shaft.§"!a§;
   import alternativa.tanks.models.weapon.shaft.§#"X§;
   import alternativa.tanks.models.weapon.shaft.§-"o§;
   import alternativa.tanks.models.weapon.shaft.§=#n§;
   import alternativa.tanks.models.weapon.shaft.§switch var override§;
   import alternativa.tanks.services.targeting.TargetingModeService;
   import alternativa.tanks.utils.MathUtils;
   import com.alternativaplatform.projects.tanks.client.commons.types.TankSpecification;
   import flash.events.FullScreenEvent;
   import flash.utils.getTimer;
   import §while const const§.§^"x§;
   
   public class §false set throw§ implements §var§
   {
      [Inject]
      public static var §default package import§:TargetingModeService;
      
      [Inject]
      public static var display:IDisplay;
      
      private static const §in package finally§:Number = 8;
      
      private static const §function var super§:Number = 1;
      
      private static const §@"q§:Number = 5000;
      
      private static const §implements catch static§:Number = 50;
      
      private static const §use var with§:Number = §@"q§ - §implements catch static§;
      
      private static const §try set true§:Number = §in package finally§ - §function var super§;
      
      private static var §continue const null§:Vector3 = new Vector3();
      
      private static var targetPoint:§return package super§ = new §return package super§();
      
      private static var §for package function§:Vector3 = new Vector3();
      
      private var context:§&#T§;
      
      private var weapon:§-"o§;
      
      private var up:Boolean;
      
      private var down:Boolean;
      
      private var §native catch switch§:§9#W§;
      
      private var §dynamic const else§:§^"x§;
      
      private var §with for for§:§#"X§;
      
      private var §extends const else§:§#"X§;
      
      private var exitTime:int;
      
      private var §in set static§:Boolean;
      
      private var §package set override§:Boolean;
      
      private var §finally for var§:§else for include§;
      
      private var effects:§=#n§;
      
      private var §^"g§:Number;
      
      private var §%!6§:TankSpecification;
      
      public function §false set throw§(param1:§&#T§, param2:§-"o§, param3:§9#W§, param4:§^"x§, param5:§else for include§, param6:§=#n§, param7:TankSpecification)
      {
         this.§with for for§ = new §#"X§();
         this.§extends const else§ = new §#"X§();
         super();
         this.context = param1;
         this.weapon = param2;
         this.§native catch switch§ = param3;
         this.§dynamic const else§ = param4;
         this.§finally for var§ = param5;
         this.effects = param6;
         this.§%!6§ = param7;
         this.§with for for§.setInterval(param4.§break set for§,param4.§7#o§);
         this.§extends const else§.setInterval(param4.§]<§,param4.§8l§);
      }
      
      public function enter(param1:int) : void
      {
         this.§^"g§ = §try set for§(this.§finally for var§.§3H§()).getTurnAcceleration();
         §try set for§(this.§finally for var§.§3H§()).setTurnAcceleration(this.§dynamic const else§.targetingAcceleration);
         this.§if set do§(1);
         this.weapon.§%0§(§"!a§.DRAIN);
         this.weapon.§+!4§();
         this.up = MathUtils.getBitValue(§try set for§(this.§finally for var§.§3H§()).getControl(),§try set for§.§return package include§) != 0;
         this.down = MathUtils.getBitValue(§try set for§(this.§finally for var§.§3H§()).getControl(),§try set for§.§,"R§) != 0;
         this.exitTime = -1;
         this.§in set static§ = false;
         this.§package set override§ = true;
         this.§finally for var§.§each catch while§();
         display.stage.addEventListener(FullScreenEvent.FULL_SCREEN,this.§3"M§);
      }
      
      private function §if set do§(param1:Number) : void
      {
         §try set for§(this.§finally for var§.§3H§()).setMaxTurnSpeed(param1 * this.§dynamic const else§.§="S§ * this.§finally for var§.§3H§().getTurnAcceleration(),false);
         this.§native catch switch§.§if var throw§(param1);
         this.§finally for var§.§with const if§(param1);
      }
      
      public function update(param1:int, param2:int) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         this.up = MathUtils.getBitValue(§try set for§(this.§finally for var§.§3H§()).getControl(),§try set for§.§return package include§) != 0;
         this.down = MathUtils.getBitValue(§try set for§(this.§finally for var§.§3H§()).getControl(),§try set for§.§,"R§) != 0;
         if(this.exitTime > 0)
         {
            if(param1 >= this.exitTime)
            {
               this.weapon.§#-§(§switch var override§.EXIT);
            }
         }
         else if(this.weapon.§%! §())
         {
            this.weapon.§#-§(§switch var override§.STOP,true);
         }
         else
         {
            _loc3_ = int(this.up) - int(this.down);
            this.§native catch switch§.§implements§ = _loc3_;
            this.effects.§native package include§(_loc3_ != 0 && !this.§native catch switch§.§7!6§() || §try set for§(this.§finally for var§.§3H§()).isRotating());
            _loc4_ = this.weapon.§6#r§(param1);
            if(_loc4_ == 0 && this.§package set override§)
            {
               this.§package set override§ = false;
               this.weapon.§break set implements§();
            }
            _loc5_ = this.context.§?#]§ - _loc4_;
            _loc6_ = _loc5_ / this.weapon.§function for native§();
            this.§override for else§();
            this.§native catch switch§.§#!D§(this.§with for for§.interpolate(_loc6_));
            _loc7_ = this.§false const if§(_loc6_);
            this.§if set do§(_loc7_);
            this.weapon.§break package dynamic§(this.§extends const else§.interpolate(_loc6_));
         }
      }
      
      private function §override for else§() : void
      {
         var _loc1_:Number = NaN;
         this.§finally for var§.§1#$§(§continue const null§);
         this.§native catch switch§.§super extends§(§for package function§);
         if(this.weapon.§1"`§(§continue const null§,targetPoint))
         {
            _loc1_ = Vector3.distanceBetween(§for package function§,targetPoint.§true for get§());
            this.weapon.§do for dynamic§(this.§do var override§(_loc1_));
         }
         else
         {
            this.weapon.§do for dynamic§(§function var super§);
         }
         if(targetPoint.§case set dynamic§())
         {
            this.weapon.§static var extends§().§var const extends§(targetPoint.getTank(),targetPoint.§finally for final§());
         }
         else
         {
            this.weapon.§static var extends§().§else catch class§(§continue const null§);
         }
      }
      
      private function §do var override§(param1:Number) : Number
      {
         if(param1 < §implements catch static§)
         {
            return §in package finally§;
         }
         if(param1 > §@"q§)
         {
            return §function var super§;
         }
         var _loc2_:Number = param1 - §implements catch static§;
         return (1 - _loc2_ / §use var with§) * §try set true§ + §function var super§;
      }
      
      public function §#-§(param1:§switch var override§, param2:*) : void
      {
         switch(param1)
         {
            case §switch var override§.TRIGGER_RELEASE:
               if(!this.§in set static§)
               {
                  this.§in set static§ = true;
                  this.weapon.§import super§(this.context.§?#]§);
                  this.weapon.§%0§(§"!a§.RECHARGE);
                  this.exitTime = getTimer() + this.§dynamic const else§.afterShotPause;
                  break;
               }
         }
      }
      
      public function exit() : void
      {
         this.effects.§native package include§(false);
         this.effects.§catch for package§();
         §try set for§(this.§finally for var§.§3H§()).setMaxTurnSpeed(this.§%!6§.turretRotationSpeed,true);
         §try set for§(this.§finally for var§.§3H§()).setTurnAcceleration(this.§^"g§);
         this.weapon.§static var extends§().§<!#§();
         this.weapon.§dynamic package extends§();
         this.§finally for var§.§true class§();
         display.stage.removeEventListener(FullScreenEvent.FULL_SCREEN,this.§3"M§);
      }
      
      private function §3"M§(param1:FullScreenEvent) : void
      {
         this.weapon.§#-§(§switch var override§.EXIT);
      }
      
      private function §false const if§(param1:Number) : Number
      {
         var _loc2_:Number = this.§dynamic const else§.rotationCoeffT1;
         if(param1 < _loc2_)
         {
            return 1;
         }
         var _loc3_:Number = this.§dynamic const else§.rotationCoeffT2;
         var _loc4_:Number = this.§dynamic const else§.rotationCoeffKmin;
         if(param1 < _loc3_)
         {
            return 1 - (1 - _loc4_) * (param1 - _loc2_) / (_loc3_ - _loc2_);
         }
         return _loc4_;
      }
   }
}

