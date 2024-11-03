package alternativa.tanks.models.weapon.shotgun
{
   import Renamed226.Renamed3433;
   import Renamed34.Renamed35;
   import Renamed3069.Renamed3070;
   import Renamed301.Renamed3044;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.Renamed668;
   import alternativa.tanks.battle.objects.tank.Renamed925;
   import flash.utils.getTimer;
   import Renamed381.Renamed3045;
   import projects.tanks.client.battlefield.models.tankparts.weapons.common.Renamed667;
   import projects.tanks.client.garage.models.item.properties.ItemProperty;
   
   public class Renamed3440 extends Renamed3070
   {
      private var params:Renamed125;
      
      private var Renamed3449:int;
      
      private var Renamed3450:int;
      
      private var Renamed3451:Renamed3418;
      
      private var Renamed3452:Number;
      
      private var Renamed3453:Vector3;
      
      private var Renamed3441:Renamed3438;
      
      private var Renamed3321:int;
      
      private var effects:Renamed3433;
      
      public function Renamed3440(param1:Renamed125, param2:Renamed3438, param3:Renamed3418, param4:Renamed3433)
      {
         this.Renamed3453 = new Vector3();
         this.params = param1;
         this.Renamed3441 = param2;
         this.Renamed3451 = param3;
         this.Renamed3321 = param2.Renamed3049();
         var _loc5_:Renamed3044 = param2.Renamed3058();
         this.Renamed3452 = _loc5_.Renamed3430();
         this.effects = param4;
         super(param2);
      }
      
      override public function getStatus() : Number
      {
         if(this.Renamed3449 == 0)
         {
            return 1 - (this.Renamed3450 - getTimer()) / this.params.magazineReloadTime;
         }
         return this.Renamed3449 / Number(this.params.magazineSize);
      }
      
      override public function Renamed769(param1:int, param2:int) : void
      {
         if(Renamed3091() && param1 >= this.Renamed3450)
         {
            this.Renamed3454(param1);
         }
      }
      
      private function Renamed3454(param1:int) : void
      {
         var _loc2_:Vector.<Renamed667> = null;
         if(this.Renamed3449 == 0)
         {
            this.Renamed3449 = this.params.magazineSize;
         }
         var _loc3_:Renamed925 = this.Renamed3095();
         --this.Renamed3449;
         if(this.Renamed3449 == 0)
         {
            this.Renamed3450 = param1 + this.params.magazineReloadTime;
            this.effects.Renamed3455(_loc3_.Renamed1020(),this.params.magazineReloadTime);
         }
         else
         {
            this.Renamed3450 = param1 + this.Renamed3321;
            this.effects.Renamed3456(_loc3_.Renamed1020(),this.Renamed3321);
         }
         _loc3_.Renamed1054(Renamed3077);
         var _loc4_:Renamed3045 = this.Renamed3441.Renamed3055();
         _loc3_.Renamed696().addWorldForceScaled(Renamed3077.§if package varRenamed35=#0§.direction,-_loc4_.Renamed3068());
         _loc3_.Renamed1032();
         if(Renamed668.Renamed688(_loc3_.Renamed696(),Renamed3077))
         {
            _loc2_ = this.Renamed3451.Renamed3376(Renamed3077,_loc3_.Renamed696(),this.Renamed3453);
            this.Renamed3441.Renamed3457().Renamed3458(param1,this.Renamed3453,_loc2_);
         }
         else
         {
            this.Renamed3453.copy(Renamed3077.direction);
            this.Renamed3441.Renamed3457().Renamed3459(param1,this.Renamed3453);
         }
         this.effects.Renamed3348(this.§1#CRenamed35=#0§,_loc3_,this.Renamed3453);
      }
      
      override public function reset() : void
      {
         super.reset();
         this.effects.Renamed3062();
         this.Renamed3449 = this.params.magazineSize;
         this.Renamed3450 = getTimer();
      }
      
      override public function Renamed3095() : Renamed925
      {
         return super.Renamed3095();
      }
      
      override public function destroy() : void
      {
         super.destroy();
         this.Renamed3441 = null;
         this.Renamed3451 = null;
         this.params = null;
         this.effects.Renamed3062();
         this.effects = null;
      }
      
      override public function disable(param1:Boolean) : void
      {
         super.disable(param1);
         this.effects.Renamed3062();
      }
      
      override public function Renamed2721() : ItemProperty
      {
         return ItemProperty.SHOTGUN_RESISTANCE;
      }
   }
}

