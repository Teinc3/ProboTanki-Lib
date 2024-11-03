package alternativa.tanks.models.weapon
{
   import alternativa.physics.Body;
   import alternativa.physics.collision.IRayCollisionFilter;
   
   public class Renamed3031 implements IRayCollisionFilter
   {
      public var Renamed3032:Body;
      
      public function Renamed3031()
      {
         super();
      }
      
      public function considerBody(param1:Body) : Boolean
      {
         return this.Renamed3032 != param1;
      }
   }
}

