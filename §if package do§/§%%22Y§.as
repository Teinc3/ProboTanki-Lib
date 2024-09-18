package §if package do§
{
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.models.weapon.§ !8§;
   import alternativa.tanks.models.weapons.targeting.§package for extends§;
   
   public class §%"Y§
   {
      public var distance:Number;
      
      public var body:Body;
      
      public var position:Vector3;
      
      public var direction:Vector3;
      
      public var normal:Vector3;
      
      public function §%"Y§()
      {
         this.position = new Vector3();
         this.direction = new Vector3();
         this.normal = new Vector3();
         super();
      }
      
      public function setResult(param1:§ !8§, param2:§package for extends§) : void
      {
         if(param2.§return const final§())
         {
            this.§6!l§(param1.§if package var§,param2.§do var§(),param2.§throw for const§());
         }
         else
         {
            this.§super return§(param2.§do var§());
         }
      }
      
      private function §6!l§(param1:Vector3, param2:Vector3, param3:RayHit) : void
      {
         this.distance = param3.t;
         this.body = param3.shape.body;
         this.normal.copy(param3.normal);
         this.direction.copy(param2);
         this.position.copy(param1).addScaled(param3.t,param2);
      }
      
      private function §super return§(param1:Vector3) : void
      {
         this.direction.copy(param1);
         this.body = null;
      }
   }
}

