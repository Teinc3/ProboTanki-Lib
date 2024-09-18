package alternativa.tanks.models.weapon.smoky
{
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.objects.tank.Renamed925;
   import alternativa.tanks.battle.objects.tank.Renamed990;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.weapon.Renamed664;
   import alternativa.tanks.models.weapon.Renamed3065;
   
   public class Renamed3476 implements Renamed990
   {
      private static const Renamed3077:Renamed664 = new Renamed664();
      
      private var Renamed3313:Renamed3065;
      
      private var effects:Renamed3471;
      
      private var Renamed3110:Renamed925;
      
      public function Renamed3476(param1:Renamed3065, param2:Renamed3471)
      {
         super();
         this.Renamed3313 = param1;
         this.effects = param2;
      }
      
      public function init(param1:Renamed925) : void
      {
         this.Renamed3110 = param1;
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
      
      public function Renamed3477() : void
      {
         this.Renamed3110.Renamed1054(Renamed3077);
         this.Renamed3348(Renamed3077);
      }
      
      public function Renamed3478(param1:Vector3) : void
      {
         this.Renamed3110.Renamed1054(Renamed3077);
         this.Renamed3348(Renamed3077);
         this.effects.Renamed3473(Renamed3077.Renamed689,param1);
         this.effects.Renamed3472(param1);
      }
      
      public function Renamed3479(param1:Tank, param2:Vector3, param3:Number, param4:Boolean) : void
      {
         this.Renamed3110.Renamed1054(Renamed3077);
         this.Renamed3348(Renamed3077);
         var _loc5_:Vector3 = param2.clone().subtract(Renamed3077.Renamed693).normalize();
         param1.Renamed1029(param2,_loc5_,param3 * this.Renamed3313.Renamed3067());
         this.effects.Renamed3472(param2);
         if(param4)
         {
            this.effects.Renamed3474(param1.Renamed696().state.position);
         }
      }
      
      private function Renamed3348(param1:Renamed664) : void
      {
         this.Renamed3110.Renamed696().addWorldForceScaled(param1.Renamed693,param1.direction,-this.Renamed3313.Renamed3068());
         this.Renamed3110.Renamed1032();
         this.effects.Renamed3348(this.Renamed3110.Renamed1071(),this.Renamed3110.Renamed1020());
      }
   }
}

