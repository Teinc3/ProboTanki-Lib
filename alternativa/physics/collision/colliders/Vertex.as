package alternativa.physics.collision.colliders
{
   import alternativa.math.Vector3;
   
   public class Vertex
   {
      public function Vertex()
      {
         this.local = new Vector3();
         this.global = new Vector3();
         this.transformed = new Vector3();
         super();
      }
   }
}

