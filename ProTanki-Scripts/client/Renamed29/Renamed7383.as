package Renamed29
{
   import Renamed136.Renamed663;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.Renamed660;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.battle.battlefield.Renamed2391;
   import alternativa.tanks.models.weapon.shared.Renamed613;
   
   public class Renamed7383 implements Renamed613, Renamed660
   {
      private var Renamed5429:Renamed663;
      
      public function Renamed7383()
      {
         super();
      }
      
      public function Renamed833(param1:Renamed663) : void
      {
         this.Renamed5429 = param1;
      }
      
      public function Renamed3385(param1:Body, param2:Number, param3:Number, param4:Number, param5:Number) : Number
      {
         var _loc6_:Tank = param1.tank;
         if(_loc6_.tankData.health > 0 && !_loc6_.Renamed1017(this.Renamed5429))
         {
            return Renamed2391.Renamed2392 - (Renamed2391.Renamed2393 * param2 / param4 + (1 - Renamed2391.Renamed2393) * Math.abs(param3) / param5);
         }
         return 0;
      }
   }
}

