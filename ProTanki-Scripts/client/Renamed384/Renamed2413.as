package Renamed384
{
   import alternativa.physics.Body;
   import alternativa.tanks.models.weapon.shared.Renamed612;
   
   public class Renamed2413 implements Renamed612
   {
      public function Renamed2413()
      {
         super();
      }
      
      public function Renamed3380(param1:Body) : Boolean
      {
         return param1.tank.tankData.health > 0;
      }
   }
}

