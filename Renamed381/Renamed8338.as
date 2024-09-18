package Renamed381
{
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.models.weapon.Renamed664;
   import alternativa.tanks.models.weapons.targeting.Renamed3072;
   
   public class Renamed3073
   {
      public var distance:Number;
      
      public var body:Body;
      
      public var position:Vector3;
      
      public var direction:Vector3;
      
      public var normal:Vector3;
      
      public function Renamed3073()
      {
         this.position = new Vector3();
         this.direction = new Vector3();
         this.normal = new Vector3();
         super();
      }
      
      public function setResult(param1:Renamed664, param2:Renamed3072) : void
      {
         if(param2.Renamed3103())
         {
            this.Renamed8336(param1.Renamed689,param2.Renamed1013(),param2.Renamed3102());
         }
         else
         {
            this.Renamed8337(param2.Renamed1013());
         }
      }
      
      private function Renamed8336(param1:Vector3, param2:Vector3, param3:RayHit) : void
      {
         this.distance = param3.t;
         this.body = param3.shape.body;
         this.normal.copy(param3.normal);
         this.direction.copy(param2);
         this.position.copy(param1).addScaled(param3.t,param2);
      }
      
      private function Renamed8337(param1:Vector3) : void
      {
         this.direction.copy(param1);
         this.body = null;
      }
   }
}

