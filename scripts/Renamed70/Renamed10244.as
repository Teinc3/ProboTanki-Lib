package Renamed70
{
   import Renamed301.Renamed3044;
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.Renamed668;
   import alternativa.tanks.battle.Renamed768;
   import alternativa.tanks.battle.Renamed832;
   import alternativa.tanks.battle.objects.tank.Renamed925;
   import alternativa.tanks.battle.objects.tank.Renamed990;
   import alternativa.tanks.models.weapon.Renamed664;
   import alternativa.tanks.models.weapon.Renamed3046;
   import alternativa.tanks.models.weapon.shared.Renamed3150;
   import alternativa.tanks.models.weapons.targeting.Renamed3119;
   import alternativa.tanks.models.weapons.targeting.Renamed3071;
   import alternativa.tanks.models.weapons.targeting.Renamed3072;
   import Renamed65.Renamed66;
   import flash.utils.getTimer;
   import Renamed373.Renamed666;
   import Renamed381.Renamed3045;
   
   public class Renamed10244 extends Renamed832 implements Renamed990, Renamed768
   {
      private static var shotId:int;
      
      private static const Renamed3195:Renamed664 = new Renamed664();
      
      private static const shotDirection:Vector3 = new Vector3();
      
      private static const Renamed1299:RayHit = new RayHit();
      
      private var Renamed10253:int;
      
      private var Renamed10181:int;
      
      private var Renamed3066:Number;
      
      private var controller:Renamed3150;
      
      private var Renamed3110:Renamed925;
      
      private var enabled:Boolean;
      
      private var Renamed3079:Renamed3071;
      
      private var Renamed10254:int;
      
      private var callback:Renamed4688;
      
      private var Renamed10182:Renamed4686;
      
      private var effects:Renamed10245;
      
      private var Renamed3326:Renamed3044;
      
      public function Renamed10244(param1:ClientObject, param2:ClientObject, param3:Renamed66, param4:Renamed10242, param5:Renamed4688)
      {
         super();
         var _loc6_:Renamed3046 = new Renamed3046(param1);
         var _loc7_:Renamed3044 = _loc6_.Renamed3058();
         var _loc8_:Renamed3045 = _loc6_.Renamed3055();
         var _loc9_:Renamed4688 = param5;
         var _loc10_:Renamed10242 = param4;
         var _loc11_:Renamed4686 = new Renamed4686(_loc6_,param3,_loc10_.Renamed10251(param1),_loc9_);
         var _loc12_:Renamed3071 = new Renamed3119(param1,_loc6_,_loc7_.Renamed3429());
         _loc12_.Renamed3521().Renamed6803();
         var _loc13_:Renamed3150 = new Renamed3150();
         this.Renamed10181 = _loc6_.Renamed3049();
         this.Renamed3066 = _loc8_.Renamed3068();
         this.controller = _loc13_;
         this.Renamed3079 = _loc12_;
         this.callback = _loc9_;
         this.Renamed10182 = _loc11_;
         this.effects = _loc10_.Renamed10250(param1);
         this.Renamed3326 = _loc7_;
      }
      
      public function init(param1:Renamed925) : void
      {
         this.Renamed3110 = param1;
         this.controller.init();
      }
      
      public function destroy() : void
      {
         this.Renamed3079 = null;
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
         this.controller.Renamed3404();
         this.Renamed10253 = 0;
         this.Renamed10254 = 1;
      }
      
      public function getStatus() : Number
      {
         var _loc1_:Number = 1 - (this.Renamed10253 - getTimer()) / this.Renamed10181;
         return _loc1_ > 1 ? Number(1) : Number(_loc1_);
      }
      
      public function Renamed769(param1:int, param2:int) : void
      {
         if(this.enabled)
         {
            if(this.controller.Renamed3403() && param1 >= this.Renamed10253)
            {
               this.Renamed3454(param1);
            }
         }
         this.controller.Renamed3404();
      }
      
      private function Renamed3454(param1:int) : void
      {
         this.Renamed10253 = param1 + this.Renamed10181;
         this.Renamed3110.Renamed1054(Renamed3195,this.Renamed10254);
         this.Renamed3110.Renamed696().addWorldForceScaled(Renamed3195.Renamed693,Renamed3195.direction,-this.Renamed3066);
         this.Renamed3110.Renamed1032(1);
         this.effects.Renamed3348(this.Renamed3110.Renamed1020(),this.Renamed3110.Renamed1071(this.Renamed10254));
         if(Renamed668.Renamed688(this.Renamed3110.Renamed696(),Renamed3195))
         {
            this.Renamed10186(param1,Renamed3195);
         }
         else
         {
            this.Renamed10187(param1);
         }
         this.Renamed10254 = (this.Renamed10254 + 1) % this.Renamed3110.Renamed1103();
      }
      
      private function Renamed10186(param1:int, param2:Renamed664) : void
      {
         var _loc3_:Renamed3072 = null;
         if(this.Renamed691(param2.Renamed689,param2.direction,this.Renamed3110.Renamed1074(this.Renamed10254)))
         {
            shotDirection.copy(param2.direction);
         }
         else
         {
            _loc3_ = this.Renamed3079.target(param2);
            shotDirection.copy(_loc3_.Renamed1013());
         }
         var _loc4_:Renamed10231 = this.Renamed10182.Renamed10189();
         _loc4_.Renamed6065(param2,shotDirection,this.Renamed3110.Renamed696(),++shotId);
         this.callback.Renamed3444(param1,_loc4_.Renamed6071(),this.Renamed10254,shotDirection);
      }
      
      private function Renamed691(param1:Vector3, param2:Vector3, param3:Number) : Boolean
      {
         return Renamed619().Renamed692().raycastStatic(param1,param2,Renamed666.Renamed690,param3,null,Renamed1299);
      }
      
      private function Renamed10187(param1:int) : void
      {
         this.callback.Renamed10175(param1,this.Renamed10254);
      }
   }
}

