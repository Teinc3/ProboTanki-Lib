package Renamed63
{
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.tanks.battle.objects.tank.Renamed925;
   import alternativa.tanks.battle.objects.tank.Renamed990;
   import alternativa.tanks.models.weapon.Renamed664;
   import alternativa.tanks.models.weapon.Renamed3046;
   import Renamed91.Renamed92;
   
   public class Renamed10173 implements Renamed990
   {
      private static const Renamed10178:Renamed664 = new Renamed664();
      
      private var Renamed3066:Number;
      
      private var Renamed10182:Renamed4670;
      
      private var effects:Renamed10140;
      
      private var Renamed3110:Renamed925;
      
      public function Renamed10173(param1:ClientObject, param2:Renamed92, param3:Renamed10137)
      {
         super();
         var _loc4_:Renamed10137 = param3;
         var _loc5_:Renamed3046 = new Renamed3046(param1);
         var _loc6_:Renamed4670 = new Renamed4670(_loc5_,param2,_loc4_.Renamed3126(param1));
         this.Renamed3066 = _loc5_.Renamed3055().Renamed3068();
         this.Renamed10182 = _loc6_;
         this.effects = _loc4_.Renamed10139(param1);
      }
      
      public function init(param1:Renamed925) : void
      {
         this.Renamed3110 = param1;
      }
      
      public function Renamed3454(param1:Vector3) : void
      {
         this.Renamed3110.Renamed1054(Renamed10178);
         this.Renamed3348(Renamed10178);
         var _loc2_:Renamed10141 = this.Renamed10182.Renamed10189();
         _loc2_.Renamed6065(Renamed10178,param1,this.Renamed3110.Renamed696());
      }
      
      public function Renamed10174() : void
      {
         this.Renamed3110.Renamed1054(Renamed10178);
         this.Renamed3348(Renamed10178);
      }
      
      private function Renamed3348(param1:Renamed664) : void
      {
         this.Renamed3110.Renamed696().addWorldForceScaled(param1.Renamed693,param1.direction,-this.Renamed3066);
         this.Renamed3110.Renamed1032();
         this.effects.Renamed3348(this.Renamed3110.Renamed1020(),this.Renamed3110.Renamed1071(),param1.Renamed693);
         this.effects.Renamed9475(this.Renamed3110.Renamed1020(),this.Renamed3110.Renamed1071());
      }
      
      public function destroy() : void
      {
      }
      
      public function activate() : void
      {
      }
      
      public function deactivate() : void
      {
      }
      
      public function enable() : void
      {
      }
      
      public function disable(param1:Boolean) : void
      {
      }
      
      public function reset() : void
      {
      }
      
      public function getStatus() : Number
      {
         return 0;
      }
   }
}

