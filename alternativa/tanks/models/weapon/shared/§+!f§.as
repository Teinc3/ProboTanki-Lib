package alternativa.tanks.models.weapon.shared
{
   import alternativa.physics.Body;
   import alternativa.physics.collision.IRayCollisionFilter;
   import flash.utils.Dictionary;
   
   public class §+!f§ implements IRayCollisionFilter
   {
      public var shooter:Body;
      
      private var targets:Dictionary;
      
      private var §extends const final§:Dictionary;
      
      public function §+!f§()
      {
         this.targets = new Dictionary();
         this.§extends const final§ = new Dictionary();
         super();
      }
      
      public function considerBody(param1:Body) : Boolean
      {
         return this.shooter != param1 && this.targets[param1] == null && this.§extends const final§[param1] == null;
      }
      
      public function §include package default§(param1:Body) : void
      {
         this.targets[param1] = true;
      }
      
      public function §+"H§(param1:Body) : void
      {
         this.§extends const final§[param1] = true;
      }
      
      public function §false for var§() : void
      {
         var _loc1_:* = undefined;
         for(_loc1_ in this.targets)
         {
            delete this.targets[_loc1_];
         }
      }
      
      public function §]!C§() : void
      {
         var _loc1_:* = undefined;
         for(_loc1_ in this.§extends const final§)
         {
            delete this.§extends const final§[_loc1_];
         }
      }
   }
}

