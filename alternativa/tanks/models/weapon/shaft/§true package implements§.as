package alternativa.tanks.models.weapon.shaft
{
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   
   public class §true package implements§
   {
      public var staticHitPoint:Vector3;
      
      public var targets:Vector.<Body>;
      
      public var targetHitPoints:Vector.<Vector3>;
      
      public function §true package implements§()
      {
         super();
      }
      
      public function §return const do§(param1:Body, param2:Vector3) : void
      {
         if(this.targets == null)
         {
            this.targets = new Vector.<Body>();
            this.targetHitPoints = new Vector.<Vector3>();
         }
         this.targets.push(param1);
         this.targetHitPoints.push(param2);
      }
      
      public function §=X§(param1:Vector3) : void
      {
         this.staticHitPoint = param1.clone();
      }
   }
}

