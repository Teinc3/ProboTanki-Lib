package Renamed50
{
   import Renamed258.Renamed3507;
   import Renamed281.Renamed7198;
   import Renamed281.Renamed4610;
   import Renamed479.Renamed915;
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.physics.Body;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.Renamed668;
   import alternativa.tanks.battle.Renamed768;
   import alternativa.tanks.battle.Renamed832;
   import alternativa.tanks.battle.objects.tank.Renamed925;
   import alternativa.tanks.battle.objects.tank.Renamed990;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.objects.tank.Renamed1150;
   import alternativa.tanks.models.weapon.Renamed664;
   import alternativa.tanks.models.weapon.Renamed922;
   import alternativa.tanks.models.weapon.shared.Renamed3150;
   import alternativa.tanks.models.weapons.targeting.Renamed3071;
   import alternativa.tanks.models.weapons.targeting.Renamed3072;
   import alternativa.tanks.models.weapons.targeting.priority.Renamed3508;
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   import flash.utils.getTimer;
   import Renamed82.Renamed84;
   import Renamed82.Renamed8544;
   
   public class Renamed9794 extends Renamed832 implements Renamed990, Renamed1150, Renamed9766, Renamed768
   {
      private static const Renamed9795:int = 250;
      
      private static const Renamed784:EncryptedInt = new EncryptedIntImpl(1000);
      
      private static const Renamed3195:Renamed664 = new Renamed664();
      
      private static const Renamed9796:Renamed922 = new Renamed922();
      
      private static const localHitPoint:Vector3 = new Vector3();
      
      private static const Renamed7200:Vector3 = new Vector3();
      
      private static const Renamed1511:Matrix3 = new Matrix3();
      
      private var controller:Renamed3150;
      
      private var Renamed3110:Renamed925;
      
      private var callback:Renamed4657;
      
      private var effects:Renamed9752;
      
      private var Renamed3079:Renamed3071;
      
      private var Renamed9797:Renamed84;
      
      private var Renamed3109:Boolean;
      
      private var Renamed3399:Boolean;
      
      private var enabled:Boolean;
      
      private var Renamed8356:int;
      
      private var state:Renamed8544;
      
      private var Renamed8355:EncryptedInt;
      
      private var Renamed8357:EncryptedInt;
      
      private var currentTarget:Body;
      
      private var Renamed991:Renamed915;
      
      private var Renamed9798:RayHit;
      
      private var Renamed9799:int;
      
      private var Renamed9800:Renamed4610;
      
      private var Renamed9801:Renamed7198;
      
      public function Renamed9794(param1:ClientObject, param2:Renamed84, param3:Renamed3150, param4:Renamed9752, param5:Renamed4657)
      {
         this.Renamed8355 = new EncryptedIntImpl();
         this.Renamed8357 = new EncryptedIntImpl();
         super();
         this.Renamed9800 = new Renamed4610(param2);
         this.Renamed9801 = new Renamed7198(param2.coneAngle);
         this.Renamed3079 = new Renamed3071(this.Renamed9801,new Renamed3507(param1,param2.radius),new Renamed3508(this.Renamed9800));
         this.controller = param3;
         this.callback = param5;
         this.effects = param4;
         this.Renamed9797 = param2;
         this.Renamed991 = this.Renamed991;
      }
      
      private static function Renamed9802(param1:Tank, param2:Tank) : Renamed8544
      {
         return param1.Renamed1017(param2.teamType) ? Renamed8544.HEALING : Renamed8544.DAMAGING;
      }
      
      public function init(param1:Renamed925) : void
      {
         this.Renamed3110 = param1;
         this.effects.init(param1.Renamed1020(),param1.Renamed1071());
         this.controller.init();
         this.controller.setWeapon(this);
      }
      
      public function destroy() : void
      {
         this.Renamed3079 = null;
         this.effects = null;
         this.callback = null;
         this.deactivate();
         this.controller.destroy();
         this.Renamed991 = null;
      }
      
      public function activate() : void
      {
         Renamed619().Renamed815(this);
      }
      
      public function deactivate() : void
      {
         this.disable(false);
         Renamed619().Renamed816(this);
      }
      
      public function enable() : void
      {
         if(!this.enabled)
         {
            this.enabled = true;
            this.Renamed3399 = this.controller.Renamed3209();
         }
      }
      
      public function disable(param1:Boolean) : void
      {
         if(this.enabled)
         {
            this.enabled = false;
            this.stop(Renamed619().Renamed653(),param1);
         }
      }
      
      public function reset() : void
      {
         this.Renamed9800.Renamed7205();
         this.currentTarget = null;
         this.Renamed3109 = false;
         this.Renamed3399 = false;
         this.Renamed8356 = 0;
         this.Renamed8357.setInt(0);
         this.Renamed8355.setInt(0);
         this.state = Renamed8544.OFF;
      }
      
      public function getStatus() : Number
      {
         var _loc1_:Number = NaN;
         if(this.Renamed3109)
         {
            _loc1_ = this.Renamed8358(getTimer(),this.state);
         }
         else
         {
            _loc1_ = this.Renamed8359(getTimer());
         }
         return _loc1_ / this.Renamed9797.capacity;
      }
      
      public function Renamed769(param1:int, param2:int) : void
      {
         if(this.enabled)
         {
            if(this.Renamed3109)
            {
               this.Renamed8360(param1);
            }
            else
            {
               this.Renamed8361(param1);
            }
         }
      }
      
      private function Renamed8360(param1:int) : void
      {
         var _loc2_:Body = null;
         if(this.Renamed3399)
         {
            this.Renamed9798 = this.target();
            _loc2_ = Boolean(this.Renamed9798) ? this.Renamed9798.shape.body : null;
            if(_loc2_ != this.currentTarget)
            {
               this.currentTarget = _loc2_;
               this.Renamed9803(param1);
            }
            else if(this.currentTarget != null)
            {
               if(this.Renamed9799 + Renamed9795 <= param1)
               {
                  this.Renamed9804(param1);
               }
               this.Renamed9805();
            }
            this.Renamed8362(param1);
            this.Renamed9806(param1);
         }
         else
         {
            this.stop(param1,true);
         }
      }
      
      private function Renamed9806(param1:int) : void
      {
         if(this.Renamed8357.getInt() == 0 && this.Renamed8358(param1,this.state) <= 0)
         {
            this.stop(param1,true);
         }
      }
      
      private function Renamed8362(param1:int) : void
      {
         if(this.Renamed8357.getInt() > 0)
         {
            if(param1 >= this.Renamed8355.getInt())
            {
               this.Renamed8357.setInt(this.Renamed8357.getInt() - 1);
               this.tick(param1);
            }
         }
      }
      
      private function Renamed8361(param1:int) : void
      {
         if(this.Renamed3399)
         {
            this.start(param1);
         }
      }
      
      public function Renamed1151() : void
      {
         if(this.enabled)
         {
            this.Renamed3399 = true;
         }
      }
      
      public function Renamed1152() : void
      {
         this.Renamed3399 = false;
      }
      
      public function Renamed9767(param1:Tank) : void
      {
         if(param1 != null)
         {
            if(this.currentTarget == param1.Renamed696())
            {
               this.currentTarget = null;
               this.Renamed9807(Renamed619().Renamed653());
            }
         }
      }
      
      private function Renamed9803(param1:int) : void
      {
         this.Renamed9807(param1);
         this.Renamed9804(param1);
      }
      
      private function Renamed9804(param1:int) : void
      {
         this.Renamed9799 = param1;
         this.callback.Renamed9804(param1,this.Renamed9798);
      }
      
      private function Renamed9807(param1:int) : void
      {
         var _loc2_:Tank = null;
         var _loc3_:Renamed8544 = this.state;
         if(this.currentTarget == null)
         {
            this.state = Renamed8544.IDLE;
         }
         else
         {
            _loc2_ = this.Renamed3110.Renamed696().tank;
            if(Renamed9802(_loc2_,this.currentTarget.tank) == Renamed8544.HEALING)
            {
               this.state = Renamed8544.HEALING;
            }
            else
            {
               this.state = Renamed8544.DAMAGING;
            }
         }
         this.Renamed8356 = this.Renamed9808(param1,this.Renamed8358(param1,_loc3_),this.state);
         if(this.currentTarget == null)
         {
            this.Renamed9809();
         }
         else
         {
            this.Renamed9810(param1);
         }
      }
      
      private function Renamed9809() : void
      {
         this.effects.Renamed9811(Renamed8544.IDLE);
         this.Renamed9800.Renamed7205();
         this.Renamed8357.setInt(0);
      }
      
      private function Renamed9810(param1:int) : void
      {
         this.Renamed9812(param1);
         this.Renamed9813(param1);
         this.Renamed9805();
      }
      
      private function Renamed9805() : void
      {
         var _loc1_:Tank = this.currentTarget.tank;
         var _loc2_:Tank = this.Renamed3110.Renamed696().tank;
         localHitPoint.copy(this.Renamed9798.position);
         Renamed668.globalToLocal(this.currentTarget,localHitPoint);
         this.effects.Renamed9811(Renamed9802(_loc2_,_loc1_),_loc1_,localHitPoint);
      }
      
      private function Renamed9813(param1:int) : void
      {
         this.Renamed8355.setInt(param1 + this.Renamed9797.checkPeriodMsec);
      }
      
      private function Renamed9812(param1:int) : void
      {
         var _loc2_:Number = this.Renamed8358(param1,this.state);
         this.Renamed8357.setInt(Renamed784.getInt() * _loc2_ / (this.Renamed9814(this.state) * this.Renamed9797.checkPeriodMsec));
      }
      
      private function Renamed9814(param1:Renamed8544) : int
      {
         switch(param1)
         {
            case Renamed8544.DAMAGING:
               return this.Renamed9797.dischargeDamageRate;
            case Renamed8544.HEALING:
               return this.Renamed9797.dischargeHealingRate;
            case Renamed8544.IDLE:
               return this.Renamed9797.dischargeIdleRate;
            default:
               return 0;
         }
      }
      
      private function tick(param1:int) : void
      {
         this.Renamed8355.setInt(param1 + this.Renamed9797.checkPeriodMsec);
         this.Renamed3110.Renamed1059(Renamed9796);
         this.callback.onTick(param1,this.Renamed9798);
      }
      
      private function start(param1:int) : void
      {
         if(!this.Renamed3109)
         {
            this.Renamed3109 = true;
            this.Renamed9798 = this.target();
            this.currentTarget = Boolean(this.Renamed9798) ? this.Renamed9798.shape.body : null;
            this.Renamed8356 = this.Renamed9808(param1,this.Renamed8359(param1),this.state);
            this.Renamed9803(param1);
         }
      }
      
      private function stop(param1:int, param2:Boolean) : void
      {
         if(this.Renamed3109)
         {
            this.Renamed9800.Renamed7205();
            this.currentTarget = null;
            this.Renamed3399 = false;
            this.Renamed3109 = false;
            this.Renamed8356 = this.Renamed9815(param1,this.Renamed8358(param1,this.state));
            this.Renamed8357.setInt(0);
            this.effects.Renamed3062();
            if(param2)
            {
               this.callback.stop(param1);
            }
         }
      }
      
      private function Renamed8359(param1:int) : Number
      {
         var _loc2_:Number = this.Renamed9797.capacity;
         var _loc3_:Number = this.Renamed9797.chargeRate * (param1 - this.Renamed8356) / Renamed784.getInt();
         return _loc3_ > _loc2_ ? Number(_loc2_) : Number(_loc3_);
      }
      
      private function Renamed8358(param1:int, param2:Renamed8544) : Number
      {
         var _loc3_:Number = this.Renamed9797.capacity - this.Renamed9814(param2) * (param1 - this.Renamed8356) / Renamed784.getInt();
         return _loc3_ < 0 ? Number(0) : Number(_loc3_);
      }
      
      private function Renamed9815(param1:int, param2:Number) : int
      {
         return param1 - param2 / this.Renamed9797.chargeRate * Renamed784.getInt();
      }
      
      private function Renamed9808(param1:int, param2:Number, param3:Renamed8544) : int
      {
         return param1 - (this.Renamed9797.capacity - param2) / this.Renamed9814(param3) * Renamed784.getInt();
      }
      
      private function target() : RayHit
      {
         var _loc1_:RayHit = null;
         var _loc2_:Tank = null;
         this.Renamed3110.Renamed1054(Renamed3195);
         if(this.currentTarget != null)
         {
            this.Renamed9816();
            Renamed7200.transform3(Renamed1511);
            this.Renamed9801.Renamed7201(Renamed7200);
         }
         else
         {
            this.Renamed9801.Renamed7202();
         }
         var _loc3_:Renamed3072 = this.Renamed3079.target(Renamed3195);
         this.Renamed9817(_loc3_);
         if(_loc3_.Renamed3101())
         {
            _loc1_ = _loc3_.Renamed3102();
            _loc2_ = _loc1_.shape.body.tank;
            if(_loc2_.tankData.health == 0)
            {
               return null;
            }
            this.Renamed9800.Renamed1554(_loc2_);
            return _loc3_.Renamed3102();
         }
         return null;
      }
      
      private function Renamed9817(param1:Renamed3072) : void
      {
         Renamed7200.copy(param1.Renamed1013());
         this.Renamed9816();
         Renamed7200.transformTransposed3(Renamed1511);
      }
      
      private function Renamed9816() : void
      {
         var _loc1_:Object3D = this.Renamed3110.Renamed1020();
         Renamed1511.setRotationMatrix(_loc1_.rotationX,_loc1_.rotationY,_loc1_.rotationZ);
      }
   }
}

