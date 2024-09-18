package alternativa.tanks.models.weapon.shared
{
   import alternativa.physics.Body;
   import alternativa.physics.collision.IRayCollisionFilter;
   import flash.utils.Dictionary;
   
   public class Renamed3375 implements IRayCollisionFilter
   {
      public var shooter:Body;
      
      private var targets:Dictionary;
      
      private var Renamed3386:Dictionary;
      
      public function Renamed3375()
      {
         this.targets = new Dictionary();
         this.Renamed3386 = new Dictionary();
         super();
      }
      
      public function considerBody(param1:Body) : Boolean
      {
         return this.shooter != param1 && this.targets[param1] == null && this.Renamed3386[param1] == null;
      }
      
      public function Renamed3381(param1:Body) : void
      {
         this.targets[param1] = true;
      }
      
      public function Renamed3382(param1:Body) : void
      {
         this.Renamed3386[param1] = true;
      }
      
      public function Renamed3383() : void
      {
         var _loc1_:* = undefined;
         for(_loc1_ in this.targets)
         {
            delete this.targets[_loc1_];
         }
      }
      
      public function Renamed3379() : void
      {
         var _loc1_:* = undefined;
         for(_loc1_ in this.Renamed3386)
         {
            delete this.Renamed3386[_loc1_];
         }
      }
   }
}

