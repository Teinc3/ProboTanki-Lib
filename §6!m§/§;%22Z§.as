package §6!m§
{
   import alternativa.math.Vector3;
   import alternativa.physics.collision.IRayCollisionFilter;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.§+$%§;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.models.weapon.§ !8§;
   import alternativa.tanks.models.weapon.shared.§@"e§;
   import §for set super§.§!"N§;
   import §for set super§.§super const continue§;
   
   public class §;"Z§
   {
      [Inject]
      public static var battleService:BattleService;
      
      private const §static const var§:Number = 0.9999;
      
      private var collisionDetector:§!"N§;
      
      private var §1#0§:Number;
      
      private var filter:IRayCollisionFilter;
      
      private var §true const static§:Boolean = false;
      
      public function §;"Z§(param1:Number, param2:IRayCollisionFilter)
      {
         super();
         this.§1#0§ = param1;
         this.filter = param2;
         this.collisionDetector = battleService.§'x§().§const const true§();
      }
      
      public function §["v§() : void
      {
         this.§true const static§ = true;
      }
      
      protected function raycast(param1:§ !8§, param2:Vector3, param3:RayHit) : Boolean
      {
         var _loc4_:Vector3 = null;
         if(!this.§true const static§ || param2.dot(param1.direction) > this.§static const var§)
         {
            _loc4_ = param1.§if package var§;
         }
         else
         {
            _loc4_ = param1.§6u§;
         }
         if(this.collisionDetector.raycast(_loc4_,param2,§super const continue§.WEAPON,this.§1#0§,this.filter,param3))
         {
            param3.staticHit = !§+$%§.§ #T§(param3.shape.body) || §@"e§.§final var override§(_loc4_,param3.position);
            return true;
         }
         return false;
      }
   }
}

