package Renamed37
{
   import alternativa.physics.Body;
   import alternativa.tanks.models.weapon.shared.Renamed615;
   
   public class Renamed5316 implements Renamed615
   {
      public function Renamed5316()
      {
         super();
      }
      
      public function Renamed3416(param1:Body) : Number
      {
         return param1.tank.tankData.health > 0 ? Number(1) : Number(0);
      }
      
      public function Renamed3417(param1:Body) : Boolean
      {
         return false;
      }
   }
}

