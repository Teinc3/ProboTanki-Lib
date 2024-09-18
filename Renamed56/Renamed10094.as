package Renamed56
{
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.Renamed668;
   import alternativa.tanks.battle.Renamed768;
   import alternativa.tanks.battle.Renamed832;
   import alternativa.tanks.battle.objects.tank.Renamed925;
   import alternativa.tanks.battle.objects.tank.Renamed990;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.weapon.Renamed664;
   import alternativa.tanks.models.weapon.Renamed922;
   import alternativa.tanks.models.weapon.Renamed3065;
   import alternativa.tanks.models.weapon.shared.Renamed3150;
   import alternativa.tanks.models.weapons.targeting.Renamed3071;
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   import alternativa.tanks.utils.MathUtils;
   import flash.utils.getTimer;
   
   public class Renamed10094 extends Renamed832 implements Renamed990, Renamed768
   {
      private static const Renamed3195:Renamed664 = new Renamed664();
      
      private static const Renamed9796:Renamed922 = new Renamed922();
      
      private var controller:Renamed3150;
      
      private var Renamed3079:Renamed3071;
      
      private var Renamed3484:EncryptedInt;
      
      private var Renamed3313:Renamed3065;
      
      private var weakeningCoeff:Number;
      
      private var Renamed10095:EncryptedInt;
      
      private var effects:Renamed10078;
      
      private var callback:Renamed4660;
      
      private var Renamed3110:Renamed925;
      
      private var enabled:Boolean;
      
      private var Renamed3485:EncryptedInt;
      
      private var Renamed10096:Boolean;
      
      public function Renamed10094(param1:Renamed3071, param2:Renamed3150, param3:int, param4:Renamed3065, param5:Number, param6:int, param7:Renamed10078, param8:Renamed4660)
      {
         this.Renamed3484 = new EncryptedIntImpl();
         this.Renamed10095 = new EncryptedIntImpl();
         this.Renamed3485 = new EncryptedIntImpl();
         super();
         this.Renamed3079 = param1;
         this.controller = param2;
         this.Renamed3484.setInt(param3);
         this.Renamed3313 = param4;
         this.weakeningCoeff = param5;
         this.Renamed10095.setInt(param6);
         this.effects = param7;
         this.callback = param8;
      }
      
      public function init(param1:Renamed925) : void
      {
         this.Renamed3110 = param1;
         this.controller.init();
      }
      
      public function destroy() : void
      {
         this.deactivate();
         this.effects.Renamed3062();
         this.controller.destroy();
         this.controller = null;
         this.effects = null;
         this.Renamed3313 = null;
         this.Renamed3079 = null;
         this.callback = null;
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
            this.controller.Renamed3404();
         }
      }
      
      public function disable(param1:Boolean) : void
      {
         if(this.enabled)
         {
            this.enabled = false;
            this.effects.Renamed3062();
         }
      }
      
      public function reset() : void
      {
         this.enabled = false;
         this.effects.Renamed3062();
         this.Renamed3485.setInt(0);
         this.Renamed10096 = false;
      }
      
      public function getStatus() : Number
      {
         if(this.Renamed10096)
         {
            return MathUtils.clamp((this.Renamed3485.getInt() - getTimer()) / this.Renamed10095.getInt(),0,1);
         }
         return MathUtils.clamp(1 - (this.Renamed3485.getInt() - getTimer()) / this.Renamed3484.getInt(),0,1);
      }
      
      public function Renamed769(param1:int, param2:int) : void
      {
         if(this.Renamed10096)
         {
            if(param1 >= this.Renamed3485.getInt())
            {
               this.Renamed3454(param1);
            }
         }
         else if(this.enabled)
         {
            if(param1 >= this.Renamed3485.getInt() && this.controller.Renamed3403())
            {
               this.Renamed4935(param1);
            }
         }
         this.controller.Renamed3404();
      }
      
      private function Renamed4935(param1:int) : void
      {
         this.Renamed10096 = true;
         this.Renamed3485.setInt(param1 + this.Renamed10095.getInt());
         this.effects.Renamed10083(this.Renamed3110.Renamed1071(),this.Renamed3110.Renamed1020(),this.Renamed10095.getInt());
         this.Renamed3110.Renamed1059(Renamed9796);
         this.effects.Renamed5252(Renamed9796.Renamed693);
         this.callback.Renamed10097(param1);
      }
      
      private function Renamed3454(param1:int) : void
      {
         var _loc2_:Renamed3298 = null;
         this.Renamed10096 = false;
         this.Renamed3485.setInt(param1 + this.Renamed3484.getInt());
         this.Renamed3110.Renamed1054(Renamed3195);
         this.Renamed3110.Renamed696().addWorldForceScaled(Renamed3195.Renamed693,Renamed3195.direction,-this.Renamed3313.Renamed3068());
         this.Renamed3110.Renamed1032();
         if(Renamed668.Renamed688(this.Renamed3110.Renamed696(),Renamed3195))
         {
            _loc2_ = new Renamed3298();
            _loc2_.Renamed3356(this.Renamed3079.target(Renamed3195));
            if(_loc2_.Renamed3143.length > 0)
            {
               this.Renamed10098(_loc2_);
            }
            this.Renamed9239(_loc2_,Renamed3195);
            this.callback.Renamed3444(param1,_loc2_.Renamed3357(),_loc2_.targets,_loc2_.Renamed3143);
         }
         else
         {
            this.callback.Renamed10099(param1);
         }
      }
      
      private function Renamed10098(param1:Renamed3298) : void
      {
         var _loc2_:Body = null;
         var _loc3_:Tank = null;
         var _loc4_:Number = 1;
         var _loc5_:int = 0;
         while(_loc5_ < param1.targets.length)
         {
            _loc2_ = param1.targets[_loc5_];
            _loc3_ = _loc2_.tank;
            _loc3_.Renamed1029(param1.Renamed3143[_loc5_],param1.shotDirection,this.Renamed3313.Renamed3067() * _loc4_);
            _loc4_ *= this.weakeningCoeff;
            _loc5_++;
         }
      }
      
      private function Renamed9239(param1:Renamed3298, param2:Renamed664) : void
      {
         var _loc3_:Vector3 = param1.Renamed3357();
         if(_loc3_ == null && param1.targets.length > 0)
         {
            _loc3_ = Renamed10058.Renamed10060(param2.Renamed689,param1.shotDirection);
         }
         this.effects.Renamed10084(param2.Renamed693,_loc3_,param2.direction);
         this.effects.Renamed10085(param2.Renamed689,param1.Renamed3357());
         if(_loc3_ != null)
         {
            if(param1.hasStaticHit)
            {
               this.effects.Renamed10087(param2.Renamed693,param1.staticHitPoint,param1.Renamed10100);
            }
            if(param1.targets.length > 0)
            {
               this.effects.Renamed10086(param2.Renamed693,_loc3_,param1.Renamed3143,param1.targets);
            }
         }
      }
   }
}

