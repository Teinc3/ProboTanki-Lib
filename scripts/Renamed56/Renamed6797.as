package Renamed56
{
   import alternativa.physics.Body;
   import alternativa.physics.collision.IRayCollisionFilter;
   import flash.utils.Dictionary;
   
   public class Renamed6797 implements IRayCollisionFilter
   {
      private var bodies:Dictionary;
      
      public function Renamed6797()
      {
         this.bodies = new Dictionary();
         super();
      }
      
      public function considerBody(param1:Body) : Boolean
      {
         return this.bodies[param1] == null;
      }
      
      public function addBody(param1:Body) : void
      {
         this.bodies[param1] = true;
      }
      
      public function clear() : void
      {
         this.bodies = new Dictionary();
      }
   }
}

