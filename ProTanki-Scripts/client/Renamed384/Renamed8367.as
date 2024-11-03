package Renamed384
{
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.Renamed768;
   import alternativa.tanks.battle.Renamed832;
   import alternativa.tanks.battle.objects.tank.Renamed925;
   import alternativa.tanks.battle.objects.tank.Renamed990;
   import alternativa.tanks.battle.objects.tank.Renamed1150;
   import alternativa.tanks.models.weapon.Renamed664;
   import alternativa.tanks.models.weapon.shared.Renamed3367;
   import alternativa.tanks.models.weapon.shared.Renamed3150;
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   import alternativa.tanks.utils.EncryptedNumber;
   import alternativa.tanks.utils.EncryptedNumberImpl;
   import flash.utils.getTimer;
   
   public class Renamed8348 extends Renamed832 implements Renamed990, Renamed768, Renamed1150
   {
      private static const Renamed8349:EncryptedInt = new EncryptedIntImpl(1000);
      
      private static const Renamed8350:Number = 0.3;
      
      private static const Renamed3195:Renamed664 = new Renamed664();
      
      private static const Renamed8351:Vector.<Body> = new Vector.<Body>();
      
      private static const Renamed8352:Vector.<Number> = new Vector.<Number>();
      
      private static const targetHitPoints:Vector.<Vector3> = new Vector.<Vector3>();
      
      private var energyCapacity:EncryptedNumber;
      
      private var Renamed8353:EncryptedNumber;
      
      private var energyRechargeSpeed:EncryptedNumber;
      
      private var tickInterval:EncryptedInt;
      
      private var Renamed3079:Renamed3367;
      
      private var controller:Renamed3150;
      
      private var callback:Renamed4684;
      
      private var effects:Renamed8354;
      
      private var Renamed3110:Renamed925;
      
      private var Renamed8355:EncryptedInt;
      
      private var enabled:Boolean;
      
      private var Renamed3399:Boolean;
      
      private var Renamed3109:Boolean;
      
      private var Renamed8356:EncryptedInt;
      
      private var Renamed8357:EncryptedInt;
      
      public function Renamed8348(param1:Number, param2:Number, param3:Number, param4:int, param5:Renamed3367, param6:Renamed3150, param7:Renamed4684, param8:Renamed8354)
      {
         this.energyCapacity = new EncryptedNumberImpl();
         this.Renamed8353 = new EncryptedNumberImpl();
         this.energyRechargeSpeed = new EncryptedNumberImpl();
         this.tickInterval = new EncryptedIntImpl();
         this.Renamed8355 = new EncryptedIntImpl();
         this.Renamed8356 = new EncryptedIntImpl();
         this.Renamed8357 = new EncryptedIntImpl();
         super();
         this.energyCapacity.setNumber(param1);
         this.Renamed8353.setNumber(param2);
         this.energyRechargeSpeed.setNumber(param3);
         this.tickInterval.setInt(param4);
         this.Renamed3079 = param5;
         this.controller = param6;
         this.callback = param7;
         this.effects = param8;
      }
      
      public function init(param1:Renamed925) : void
      {
         this.Renamed3110 = param1;
         this.controller.init();
         this.controller.setWeapon(this);
      }
      
      public function destroy() : void
      {
         this.Renamed3079 = null;
         this.effects = null;
         this.callback = null;
         this.controller.destroy();
         this.controller = null;
         this.Renamed3110 = null;
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
         this.Renamed3109 = false;
         this.Renamed3399 = false;
         this.Renamed8356.setInt(0);
         this.Renamed8355.setInt(0);
         this.Renamed8357.setInt(0);
      }
      
      public function getStatus() : Number
      {
         var _loc1_:Number = NaN;
         if(this.Renamed3399)
         {
            _loc1_ = this.Renamed8358(getTimer());
         }
         else
         {
            _loc1_ = this.Renamed8359(getTimer());
         }
         return _loc1_ / this.energyCapacity.getNumber();
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
         if(this.Renamed3399)
         {
            this.Renamed8362(param1);
            this.Renamed8363(param1);
         }
         else
         {
            this.stop(param1,true);
         }
      }
      
      private function Renamed8362(param1:int) : void
      {
         if(this.Renamed8357.getInt() > 0)
         {
            if(this.Renamed8355.getInt() <= param1)
            {
               this.tick(param1);
               this.Renamed8357.setInt(this.Renamed8357.getInt() - 1);
            }
         }
      }
      
      private function Renamed8363(param1:int) : void
      {
         if(this.Renamed8357.getInt() == 0)
         {
            if(this.Renamed8358(param1) <= 0)
            {
               this.stop(param1,true);
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
      
      private function start(param1:int) : void
      {
         var _loc2_:Number = NaN;
         if(!this.Renamed3109)
         {
            this.Renamed3109 = true;
            _loc2_ = this.Renamed8359(param1);
            this.Renamed8356.setInt(this.Renamed8364(param1,_loc2_));
            this.Renamed8365(_loc2_);
            this.Renamed8355.setInt(param1 + this.tickInterval.getInt());
            this.effects.Renamed8366(this.Renamed3110.Renamed696(),this.Renamed3110.Renamed1071(),this.Renamed3110.Renamed1020());
            this.callback.start(param1);
         }
      }
      
      private function Renamed8365(param1:Number) : void
      {
         this.Renamed8357.setInt(Renamed8349.getInt() * param1 / (this.Renamed8353.getNumber() * this.tickInterval.getInt()));
      }
      
      private function stop(param1:int, param2:Boolean) : void
      {
         if(this.Renamed3109)
         {
            this.Renamed3399 = false;
            this.Renamed3109 = false;
            this.Renamed8356.setInt(param1 - this.Renamed8358(param1) / this.energyRechargeSpeed.getNumber() * Renamed8349.getInt());
            this.Renamed8357.setInt(0);
            this.effects.Renamed3062();
            if(param2)
            {
               this.callback.stop(param1);
            }
         }
      }
      
      private function tick(param1:int) : void
      {
         var _loc2_:Body = null;
         this.Renamed8355.setInt(param1 + this.tickInterval.getInt());
         var _loc3_:Vector3 = this.Renamed3110.Renamed1071();
         this.Renamed3110.Renamed1054(Renamed3195);
         var _loc4_:Number = _loc3_.y;
         Renamed8351.length = 0;
         Renamed8352.length = 0;
         targetHitPoints.length = 0;
         this.Renamed3079.Renamed3376(this.Renamed3110.Renamed696(),_loc4_,Renamed8350,Renamed3195.Renamed689,Renamed3195.direction,Renamed3195.Renamed3025,Renamed8351,Renamed8352,targetHitPoints);
         var _loc5_:int = int(Renamed8351.length);
         if(_loc5_ > 0)
         {
            this.callback.onTick(this,Renamed8351,Renamed8352,targetHitPoints,param1);
         }
         var _loc6_:int = 0;
         while(_loc6_ < Renamed8351.length)
         {
            _loc2_ = Renamed8351[_loc6_];
            _loc2_.tank.Renamed1031(targetHitPoints[_loc6_]);
            _loc6_++;
         }
         Renamed8351.length = 0;
         Renamed8352.length = 0;
         targetHitPoints.length = 0;
      }
      
      private function Renamed8359(param1:int) : Number
      {
         var _loc2_:Number = this.energyCapacity.getNumber();
         var _loc3_:Number = this.energyRechargeSpeed.getNumber() * (param1 - this.Renamed8356.getInt()) / Renamed8349.getInt();
         return _loc3_ > _loc2_ ? Number(_loc2_) : Number(_loc3_);
      }
      
      private function Renamed8358(param1:int) : Number
      {
         var _loc2_:Number = this.energyCapacity.getNumber() - this.Renamed8353.getNumber() * (param1 - this.Renamed8356.getInt()) / Renamed8349.getInt();
         return _loc2_ < 0 ? Number(0) : Number(_loc2_);
      }
      
      private function Renamed8364(param1:int, param2:Number) : int
      {
         return param1 - (this.energyCapacity.getNumber() - param2) / this.Renamed8353.getNumber() * Renamed8349.getInt();
      }
   }
}

