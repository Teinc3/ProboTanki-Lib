package Renamed19
{
   import Renamed301.Renamed3044;
   import alternativa.tanks.battle.Renamed668;
   import alternativa.tanks.battle.Renamed768;
   import alternativa.tanks.battle.Renamed832;
   import alternativa.tanks.battle.objects.tank.Renamed925;
   import alternativa.tanks.battle.objects.tank.Renamed990;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.weapon.Renamed664;
   import alternativa.tanks.models.weapon.Renamed3065;
   import alternativa.tanks.models.weapon.shared.Renamed3150;
   import alternativa.tanks.models.weapons.targeting.Renamed3071;
   import alternativa.tanks.models.weapons.targeting.Renamed3072;
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   import flash.utils.getTimer;
   import Renamed381.Renamed3073;
   import Renamed388.Renamed5834;
   
   public class Renamed5835 extends Renamed832 implements Renamed990, Renamed768
   {
      private static const Renamed3077:Renamed664 = new Renamed664();
      
      private static const Renamed3078:Renamed3073 = new Renamed3073();
      
      private var enabled:Boolean;
      
      private var Renamed3484:EncryptedInt;
      
      private var Renamed3485:EncryptedInt;
      
      private var Renamed3313:Renamed3065;
      
      private var controller:Renamed3150;
      
      private var Renamed3079:Renamed3071;
      
      private var Renamed3110:Renamed925;
      
      private var Renamed3326:Renamed3044;
      
      private var Renamed5836:Renamed5834;
      
      private var callback:Renamed4570;
      
      private var effects:Renamed5823;
      
      public function Renamed5835(param1:int, param2:Renamed3065, param3:Renamed3044, param4:Renamed3071, param5:Renamed5834, param6:Renamed5823, param7:Renamed4570)
      {
         this.Renamed3484 = new EncryptedIntImpl();
         this.Renamed3485 = new EncryptedIntImpl();
         super();
         this.Renamed3484.setInt(param1);
         this.Renamed3313 = param2;
         this.controller = new Renamed3150();
         this.Renamed3079 = param4;
         this.Renamed3326 = param3;
         this.Renamed5836 = param5;
         this.callback = param7;
         this.effects = param6;
      }
      
      private static function Renamed5837(param1:Renamed3073) : void
      {
         param1.position.add(param1.normal);
      }
      
      public function init(param1:Renamed925) : void
      {
         this.Renamed3110 = param1;
         this.controller.init();
         this.reset();
      }
      
      public function destroy() : void
      {
         this.Renamed3313 = null;
         this.Renamed3079 = null;
         this.Renamed3326 = null;
         this.Renamed5836 = null;
         this.callback = null;
         this.effects = null;
         this.controller.destroy();
         this.controller = null;
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
         this.enabled = true;
         this.controller.Renamed3404();
      }
      
      public function disable(param1:Boolean) : void
      {
         this.enabled = false;
      }
      
      public function reset() : void
      {
         this.Renamed3485.setInt(getTimer());
      }
      
      public function getStatus() : Number
      {
         var _loc1_:Number = 1 - (this.Renamed3485.getInt() - getTimer()) / this.Renamed3484.getInt();
         return _loc1_ > 1 ? Number(1) : Number(_loc1_);
      }
      
      public function Renamed769(param1:int, param2:int) : void
      {
         if(this.controller.Renamed3403())
         {
            if(this.enabled && param1 >= this.Renamed3485.getInt())
            {
               this.Renamed3454(param1);
            }
            this.controller.Renamed3404();
         }
      }
      
      private function Renamed3454(param1:int) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Tank = null;
         this.Renamed3485.setInt(param1 + this.Renamed3484.getInt());
         this.Renamed3110.Renamed1054(Renamed3077);
         this.Renamed3110.Renamed696().addWorldForceScaled(Renamed3077.Renamed689,Renamed3077.direction,-this.Renamed3313.Renamed3068());
         this.Renamed3110.Renamed1032();
         this.effects.Renamed3348(this.Renamed3110.Renamed1071(),this.Renamed3110.Renamed1020());
         if(Renamed668.Renamed688(this.Renamed3110.Renamed696(),Renamed3077) && this.Renamed3486(Renamed3077,Renamed3078))
         {
            Renamed5837(Renamed3078);
            this.effects.Renamed3472(Renamed3078.position);
            _loc2_ = this.Renamed3326.Renamed3447(Renamed3078.distance);
            this.Renamed5836.Renamed5838(Tank(this.Renamed3110).tankData.turret,Renamed3078.position,_loc2_,Renamed3078.body);
            if(Renamed668.Renamed687(Renamed3078.body))
            {
               _loc3_ = Renamed3078.body.tank;
               _loc3_.Renamed1029(Renamed3078.position,Renamed3078.direction,this.Renamed3313.Renamed3067() * _loc2_);
               this.callback.Renamed3482(param1,Renamed3078.position,Renamed3078.body);
            }
            else
            {
               this.effects.Renamed3473(Renamed3077.Renamed689,Renamed3078.position);
               this.callback.Renamed3481(param1,Renamed3078.position);
            }
         }
         else
         {
            this.callback.Renamed3444(param1);
         }
      }
      
      private function Renamed3486(param1:Renamed664, param2:Renamed3073) : Boolean
      {
         var _loc3_:Renamed3072 = this.Renamed3079.target(param1);
         param2.setResult(param1,_loc3_);
         return _loc3_.Renamed3103();
      }
   }
}

