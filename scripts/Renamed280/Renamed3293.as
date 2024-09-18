package Renamed280
{
   import Renamed3294.Renamed3296;
   import Renamed479.Renamed3148;
   import Renamed479.Renamed915;
   import alternativa.math.Vector3;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.models.weapon.shaft.Renamed3140;
   import alternativa.tanks.models.weapon.shaft.Renamed3138;
   import alternativa.tanks.models.weapon.shaft.Renamed3208;
   import alternativa.tanks.models.weapon.shaft.Renamed3160;
   import alternativa.tanks.models.weapon.shaft.Renamed3212;
   import alternativa.tanks.services.targeting.TargetingModeService;
   import alternativa.tanks.utils.MathUtils;
   import com.alternativaplatform.projects.tanks.client.commons.types.TankSpecification;
   import flash.events.FullScreenEvent;
   import flash.utils.getTimer;
   import Renamed94.Renamed96;
   
   public class Renamed3293 implements Renamed3230
   {
      [Inject]
      public static var Renamed926:TargetingModeService;
      
      [Inject]
      public static var display:IDisplay;
      
      private static const Renamed7175:Number = 8;
      
      private static const Renamed7176:Number = 1;
      
      private static const Renamed7177:Number = 5000;
      
      private static const Renamed7178:Number = 50;
      
      private static const Renamed7179:Number = Renamed7177 - Renamed7178;
      
      private static const Renamed7180:Number = Renamed7175 - Renamed7176;
      
      private static var Renamed5284:Vector3 = new Vector3();
      
      private static var targetPoint:Renamed3207 = new Renamed3207();
      
      private static var Renamed1466:Vector3 = new Vector3();
      
      private var context:Renamed3290;
      
      private var weapon:Renamed3208;
      
      private var up:Boolean;
      
      private var down:Boolean;
      
      private var Renamed1358:Renamed3296;
      
      private var Renamed7181:Renamed96;
      
      private var Renamed7163:Renamed3138;
      
      private var Renamed7182:Renamed3138;
      
      private var exitTime:int;
      
      private var Renamed7183:Boolean;
      
      private var Renamed7184:Boolean;
      
      private var Renamed991:Renamed3148;
      
      private var effects:Renamed3160;
      
      private var Renamed3364:Number;
      
      private var Renamed3129:TankSpecification;
      
      public function Renamed3293(param1:Renamed3290, param2:Renamed3208, param3:Renamed3296, param4:Renamed96, param5:Renamed3148, param6:Renamed3160, param7:TankSpecification)
      {
         this.Renamed7163 = new Renamed3138();
         this.Renamed7182 = new Renamed3138();
         super();
         this.context = param1;
         this.weapon = param2;
         this.Renamed1358 = param3;
         this.Renamed7181 = param4;
         this.Renamed991 = param5;
         this.effects = param6;
         this.Renamed3129 = param7;
         this.Renamed7163.setInterval(param4.Renamed128,param4.Renamed130);
         this.Renamed7182.setInterval(param4.Renamed133,param4.Renamed132);
      }
      
      public function enter(param1:int) : void
      {
         this.Renamed3364 = Renamed915(this.Renamed991.Renamed1062()).getTurnAcceleration();
         Renamed915(this.Renamed991.Renamed1062()).setTurnAcceleration(this.Renamed7181.targetingAcceleration);
         this.Renamed7185(1);
         this.weapon.Renamed3210(Renamed3140.DRAIN);
         this.weapon.Renamed3168();
         this.up = MathUtils.getBitValue(Renamed915(this.Renamed991.Renamed1062()).getControl(),Renamed915.Renamed7186) != 0;
         this.down = MathUtils.getBitValue(Renamed915(this.Renamed991.Renamed1062()).getControl(),Renamed915.Renamed7187) != 0;
         this.exitTime = -1;
         this.Renamed7183 = false;
         this.Renamed7184 = true;
         this.Renamed991.Renamed7172();
         display.stage.addEventListener(FullScreenEvent.FULL_SCREEN,this.Renamed3407);
      }
      
      private function Renamed7185(param1:Number) : void
      {
         Renamed915(this.Renamed991.Renamed1062()).setMaxTurnSpeed(param1 * this.Renamed7181.Renamed127 * this.Renamed991.Renamed1062().getTurnAcceleration(),false);
         this.Renamed1358.Renamed5720(param1);
         this.Renamed991.Renamed5288(param1);
      }
      
      public function update(param1:int, param2:int) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         this.up = MathUtils.getBitValue(Renamed915(this.Renamed991.Renamed1062()).getControl(),Renamed915.Renamed7186) != 0;
         this.down = MathUtils.getBitValue(Renamed915(this.Renamed991.Renamed1062()).getControl(),Renamed915.Renamed7187) != 0;
         if(this.exitTime > 0)
         {
            if(param1 >= this.exitTime)
            {
               this.weapon.Renamed3211(Renamed3212.EXIT);
            }
         }
         else if(this.weapon.Renamed3218())
         {
            this.weapon.Renamed3211(Renamed3212.STOP,true);
         }
         else
         {
            _loc3_ = int(this.up) - int(this.down);
            this.Renamed1358.Renamed3341 = _loc3_;
            this.effects.Renamed3278(_loc3_ != 0 && !this.Renamed1358.Renamed5719() || Renamed915(this.Renamed991.Renamed1062()).isRotating());
            _loc4_ = this.weapon.Renamed2961(param1);
            if(_loc4_ == 0 && this.Renamed7184)
            {
               this.Renamed7184 = false;
               this.weapon.Renamed3219();
            }
            _loc5_ = this.context.Renamed7157 - _loc4_;
            _loc6_ = _loc5_ / this.weapon.Renamed3220();
            this.Renamed7188();
            this.Renamed1358.Renamed5721(this.Renamed7163.interpolate(_loc6_));
            _loc7_ = this.Renamed3366(_loc6_);
            this.Renamed7185(_loc7_);
            this.weapon.Renamed3221(this.Renamed7182.interpolate(_loc6_));
         }
      }
      
      private function Renamed7188() : void
      {
         var _loc1_:Number = NaN;
         this.Renamed991.Renamed3352(Renamed5284);
         this.Renamed1358.Renamed3351(Renamed1466);
         if(this.weapon.Renamed3226(Renamed5284,targetPoint))
         {
            _loc1_ = Vector3.distanceBetween(Renamed1466,targetPoint.Renamed7189());
            this.weapon.Renamed3227(this.Renamed7190(_loc1_));
         }
         else
         {
            this.weapon.Renamed3227(Renamed7176);
         }
         if(targetPoint.Renamed7191())
         {
            this.weapon.Renamed3228().Renamed7192(targetPoint.getTank(),targetPoint.Renamed7193());
         }
         else
         {
            this.weapon.Renamed3228().Renamed7194(Renamed5284);
         }
      }
      
      private function Renamed7190(param1:Number) : Number
      {
         if(param1 < Renamed7178)
         {
            return Renamed7175;
         }
         if(param1 > Renamed7177)
         {
            return Renamed7176;
         }
         var _loc2_:Number = param1 - Renamed7178;
         return (1 - _loc2_ / Renamed7179) * Renamed7180 + Renamed7176;
      }
      
      public function Renamed3211(param1:Renamed3212, param2:*) : void
      {
         switch(param1)
         {
            case Renamed3212.TRIGGER_RELEASE:
               if(!this.Renamed7183)
               {
                  this.Renamed7183 = true;
                  this.weapon.Renamed3222(this.context.Renamed7157);
                  this.weapon.Renamed3210(Renamed3140.RECHARGE);
                  this.exitTime = getTimer() + this.Renamed7181.afterShotPause;
                  break;
               }
         }
      }
      
      public function exit() : void
      {
         this.effects.Renamed3278(false);
         this.effects.Renamed3201();
         Renamed915(this.Renamed991.Renamed1062()).setMaxTurnSpeed(this.Renamed3129.turretRotationSpeed,true);
         Renamed915(this.Renamed991.Renamed1062()).setTurnAcceleration(this.Renamed3364);
         this.weapon.Renamed3228().Renamed7195();
         this.weapon.Renamed3165();
         this.Renamed991.Renamed7173();
         display.stage.removeEventListener(FullScreenEvent.FULL_SCREEN,this.Renamed3407);
      }
      
      private function Renamed3407(param1:FullScreenEvent) : void
      {
         this.weapon.Renamed3211(Renamed3212.EXIT);
      }
      
      private function Renamed3366(param1:Number) : Number
      {
         var _loc2_:Number = this.Renamed7181.rotationCoeffT1;
         if(param1 < _loc2_)
         {
            return 1;
         }
         var _loc3_:Number = this.Renamed7181.rotationCoeffT2;
         var _loc4_:Number = this.Renamed7181.rotationCoeffKmin;
         if(param1 < _loc3_)
         {
            return 1 - (1 - _loc4_) * (param1 - _loc2_) / (_loc3_ - _loc2_);
         }
         return _loc4_;
      }
   }
}

