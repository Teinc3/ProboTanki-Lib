package Renamed37
{
   import alternativa.physics.Body;
   import alternativa.tanks.models.battle.battlefield.Renamed2391;
   import alternativa.tanks.models.weapon.shared.Renamed613;
   
   public class Renamed5311 implements Renamed613
   {
      public function Renamed5311()
      {
         super();
      }
      
      public function Renamed3385(param1:Body, param2:Number, param3:Number, param4:Number, param5:Number) : Number
      {
         if(param1.tank.tankData.health > 0)
         {
            return Renamed2391.Renamed2392 - (Renamed2391.Renamed2393 * param2 / param4 + (1 - Renamed2391.Renamed2393) * Math.abs(param3) / param5);
         }
         return 0;
      }
   }
}

