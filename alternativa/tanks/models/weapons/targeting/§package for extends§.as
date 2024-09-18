package alternativa.tanks.models.weapons.targeting
{
   import alternativa.math.Vector3;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.§+$%§;
   
   public class §package for extends§
   {
      private var direction:Vector3;
      
      private var staticHit:RayHit;
      
      private var §const catch package§:Vector.<RayHit>;
      
      public function §package for extends§()
      {
         this.direction = new Vector3();
         super();
      }
      
      public function hasStaticHit() : Boolean
      {
         return this.staticHit != null;
      }
      
      public function §,!x§() : RayHit
      {
         return this.staticHit;
      }
      
      public function §do var§() : Vector3
      {
         return this.direction;
      }
      
      public function §##2§() : Vector.<RayHit>
      {
         return this.§const catch package§;
      }
      
      public function §+g§() : Boolean
      {
         return this.§const catch package§.length > 0;
      }
      
      public function §return const final§() : Boolean
      {
         return this.staticHit != null || this.§const catch package§.length > 0;
      }
      
      public function §2"%§(param1:Vector3, param2:Vector.<RayHit>) : void
      {
         var _loc3_:RayHit = null;
         this.direction.copy(param1);
         this.§const catch package§ = param2.concat();
         this.staticHit = null;
         if(this.§const catch package§.length > 0)
         {
            _loc3_ = this.§const catch package§[this.§const catch package§.length - 1];
            if(!§+$%§.§ #T§(_loc3_.shape.body))
            {
               this.staticHit = this.§const catch package§.pop();
            }
         }
      }
      
      public function §throw for const§() : RayHit
      {
         if(this.staticHit != null)
         {
            return this.staticHit;
         }
         return this.§const catch package§[0];
      }
   }
}

