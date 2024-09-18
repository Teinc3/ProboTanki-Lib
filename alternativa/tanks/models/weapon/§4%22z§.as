package alternativa.tanks.models.weapon
{
   import alternativa.physics.Body;
   import alternativa.physics.collision.IRayCollisionFilter;
   
   public class §4"z§ implements IRayCollisionFilter
   {
      public var §@"n§:Body;
      
      public function §4"z§()
      {
         super();
      }
      
      public function considerBody(param1:Body) : Boolean
      {
         return this.§@"n§ != param1;
      }
   }
}

