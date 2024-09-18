package Renamed63
{
   import Renamed251.Renamed6732;
   import Renamed301.Renamed3044;
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.Renamed668;
   import alternativa.tanks.battle.Renamed768;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.Renamed832;
   import alternativa.tanks.battle.objects.tank.Renamed925;
   import alternativa.tanks.battle.objects.tank.Renamed990;
   import alternativa.tanks.models.weapon.Renamed664;
   import alternativa.tanks.models.weapon.Renamed3046;
   import alternativa.tanks.models.weapon.shared.Renamed3150;
   import alternativa.tanks.utils.MathUtils;
   import flash.utils.getTimer;
   import Renamed373.Renamed665;
   import Renamed373.Renamed666;
   import scpacker.tanks.WeaponsManager;
   import Renamed85.Renamed86;
   import Renamed91.Renamed92;
   
   public class Renamed4668 extends Renamed832 implements Renamed990, Renamed768
   {
      [Inject]
      public static var battleService:BattleService;
      
      private static var shotId:int;
      
      private static const shotDirection:Vector3 = new Vector3();
      
      private static const Renamed1299:RayHit = new RayHit();
      
      private static const Renamed10178:Renamed664 = new Renamed664();
      
      private var Renamed3066:Number;
      
      private var Renamed10179:Number;
      
      private var Renamed3450:int;
      
      private var Renamed3316:int;
      
      private var Renamed3110:Renamed925;
      
      private var controller:Renamed3150;
      
      private var Renamed3079:Renamed10180;
      
      private var Renamed10181:int;
      
      private var effects:Renamed10140;
      
      private var Renamed10182:Renamed4670;
      
      private var callback:Renamed4671;
      
      private var enabled:Boolean;
      
      private var Renamed10147:Renamed92;
      
      public function Renamed4668(param1:ClientObject, param2:Renamed92, param3:Renamed10137, param4:Renamed4671)
      {
         this.controller = new Renamed3150();
         super();
         var _loc5_:Renamed10137 = param3;
         var _loc6_:Renamed3046 = new Renamed3046(param1);
         var _loc7_:Renamed4671 = param4;
         this.Renamed10147 = param2;
         this.Renamed3066 = _loc6_.Renamed3055().Renamed3068();
         this.Renamed10179 = param2.energyRechargeSpeed / 1000;
         var _loc8_:Renamed86 = WeaponsManager.shotDatas[_loc6_.Renamed3048().turret.id];
         this.Renamed3079 = Renamed10183(_loc8_,param2,_loc6_);
         this.Renamed10181 = _loc6_.Renamed3049();
         this.effects = _loc5_.Renamed10139(param1);
         this.Renamed10182 = new Renamed4670(_loc6_,param2,_loc5_.Renamed3126(param1),_loc7_);
         this.callback = _loc7_;
      }
      
      private static function Renamed10183(param1:Renamed86, param2:Renamed92, param3:Renamed3046) : Renamed10180
      {
         var _loc4_:Renamed3044 = param3.Renamed3058();
         var _loc5_:Number = param1.Renamed3051();
         var _loc6_:int = Math.ceil(_loc5_ * Renamed6732.Renamed6735(_loc4_.Renamed3430()));
         var _loc7_:Number = param1.Renamed3053();
         var _loc8_:int = Math.ceil(_loc7_ * Renamed6732.Renamed6735(_loc4_.Renamed3430()));
         var _loc9_:Number = param2.shotDistance;
         var _loc10_:Renamed665 = battleService.Renamed619().Renamed692();
         return new Renamed10180(_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,battleService.Renamed649(),param2.maxRicochetCount);
      }
      
      public function init(param1:Renamed925) : void
      {
         this.Renamed3110 = param1;
         this.controller.init();
      }
      
      public function destroy() : void
      {
         this.Renamed10147 = null;
         this.effects = null;
         this.callback = null;
         this.Renamed3079 = null;
         this.controller.destroy();
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
         this.enabled = false;
      }
      
      public function reset() : void
      {
         this.Renamed3316 = 0;
         this.Renamed3450 = 0;
         this.controller.Renamed3404();
      }
      
      public function getStatus() : Number
      {
         return this.Renamed2961(getTimer()) / this.Renamed10147.energyCapacity;
      }
      
      public function Renamed769(param1:int, param2:int) : void
      {
         var _loc3_:Number = NaN;
         if(this.enabled)
         {
            if(this.controller.Renamed3403() && param1 >= this.Renamed3450)
            {
               _loc3_ = this.Renamed2961(param1);
               if(_loc3_ >= this.Renamed10147.energyPerShot)
               {
                  this.Renamed3454(param1,_loc3_);
               }
            }
         }
         this.controller.Renamed3404();
      }
      
      private function Renamed3454(param1:int, param2:Number) : void
      {
         this.Renamed3450 = param1 + this.Renamed10181;
         this.Renamed10184(param1,param2 - this.Renamed10147.energyPerShot);
         this.Renamed3110.Renamed1054(Renamed10178);
         this.Renamed3110.Renamed1032();
         this.Renamed10185(Renamed10178.Renamed693,Renamed10178.direction,-this.Renamed3066);
         this.effects.Renamed3348(this.Renamed3110.Renamed1020(),this.Renamed3110.Renamed1071(),Renamed10178.Renamed693);
         this.effects.Renamed9475(this.Renamed3110.Renamed1020(),this.Renamed3110.Renamed1071());
         if(Renamed668.Renamed688(this.Renamed3110.Renamed696(),Renamed10178))
         {
            this.Renamed10186(param1,Renamed10178);
         }
         else
         {
            this.Renamed10187(param1);
         }
      }
      
      private function Renamed10185(param1:Vector3, param2:Vector3, param3:Number) : void
      {
         this.Renamed3110.Renamed696().addWorldForceScaled(param1,param2,param3);
      }
      
      private function Renamed10186(param1:int, param2:Renamed664) : void
      {
         if(this.Renamed691(param2.Renamed689,param2.direction,this.Renamed3110.Renamed1074()))
         {
            shotDirection.copy(param2.direction);
         }
         else
         {
            this.Renamed3079.Renamed3199(param2.Renamed693,param2.direction,param2.Renamed3025,this.Renamed3110.Renamed696(),shotDirection);
         }
         this.Renamed10188(param1,param2,shotDirection);
      }
      
      private function Renamed10187(param1:int) : void
      {
         this.callback.Renamed10175(param1);
      }
      
      private function Renamed691(param1:Vector3, param2:Vector3, param3:Number) : Boolean
      {
         return Renamed619().Renamed692().raycastStatic(param1,param2,Renamed666.Renamed690,param3,null,Renamed1299);
      }
      
      private function Renamed2961(param1:int) : Number
      {
         return MathUtils.clamp(this.Renamed10179 * (param1 - this.Renamed3316),0,this.Renamed10147.energyCapacity);
      }
      
      private function Renamed10184(param1:int, param2:Number) : void
      {
         this.Renamed3316 = param1 - param2 / this.Renamed10179;
      }
      
      private function Renamed10188(param1:int, param2:Renamed664, param3:Vector3) : void
      {
         var _loc4_:Renamed10141 = this.Renamed10182.Renamed10189();
         _loc4_.Renamed6065(param2,param3,this.Renamed3110.Renamed696(),++shotId);
         this.callback.Renamed3444(param1,_loc4_.Renamed6071(),param3);
      }
   }
}

