package alternativa.tanks.models.weapons.targeting
{
   import alternativa.math.Vector3;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.Renamed668;
   
   public class Renamed3072
   {
      private var direction:Vector3;
      
      private var staticHit:RayHit;
      
      private var Renamed3529:Vector.<RayHit>;
      
      public function Renamed3072()
      {
         this.direction = new Vector3();
         super();
      }
      
      public function hasStaticHit() : Boolean
      {
         return this.staticHit != null;
      }
      
      public function Renamed3530() : RayHit
      {
         return this.staticHit;
      }
      
      public function Renamed1013() : Vector3
      {
         return this.direction;
      }
      
      public function Renamed3531() : Vector.<RayHit>
      {
         return this.Renamed3529;
      }
      
      public function Renamed3101() : Boolean
      {
         return this.Renamed3529.length > 0;
      }
      
      public function Renamed3103() : Boolean
      {
         return this.staticHit != null || this.Renamed3529.length > 0;
      }
      
      public function Renamed3528(param1:Vector3, param2:Vector.<RayHit>) : void
      {
         var _loc3_:RayHit = null;
         this.direction.copy(param1);
         this.Renamed3529 = param2.concat();
         this.staticHit = null;
         if(this.Renamed3529.length > 0)
         {
            _loc3_ = this.Renamed3529[this.Renamed3529.length - 1];
            if(!Renamed668.Renamed687(_loc3_.shape.body))
            {
               this.staticHit = this.Renamed3529.pop();
            }
         }
      }
      
      public function Renamed3102() : RayHit
      {
         if(this.staticHit != null)
         {
            return this.staticHit;
         }
         return this.Renamed3529[0];
      }
   }
}

