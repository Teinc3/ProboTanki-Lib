package alternativa.tanks.models.weapon.shared
{
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.physics.PhysicsMaterial;
   import alternativa.physics.collision.primitives.CollisionBox;
   import alternativa.tanks.battle.BattleService;
   import §for set super§.§!"N§;
   import §for set super§.§super const continue§;
   
   public class §@"e§
   {
      [Inject]
      public static var battleService:BattleService;
      
      private static const §@Y§:Number = 6.5;
      
      private static const §3#6§:Vector3 = new Vector3();
      
      private static const §get package for§:Vector3 = new Vector3();
      
      private static const direction:Vector3 = new Vector3();
      
      private static const axis:Vector3 = new Vector3();
      
      private static const COS_ONE_DEGREE:Number = Math.cos(Math.PI / 180);
      
      private static const collisionBox:CollisionBox = new CollisionBox(new Vector3(1,1,1),§super const continue§.§finally catch while§,PhysicsMaterial.DEFAULT_MATERIAL);
      
      public function §@"e§()
      {
         super();
      }
      
      public static function §final var override§(param1:Vector3, param2:Vector3) : Boolean
      {
         §set package null§(param1,param2);
         var _loc3_:§!"N§ = battleService.§'x§().§const const true§();
         return _loc3_.§switch catch get§(collisionBox);
      }
      
      private static function §set package null§(param1:Vector3, param2:Vector3) : void
      {
         §get package for§.diff(param1,param2);
         §get package for§.y = §get package for§.length() / 2;
         §get package for§.x = §@Y§;
         §get package for§.z = §@Y§;
         collisionBox.hs.copy(§get package for§);
         §3#6§.sum(param1,param2);
         §3#6§.scale(0.5);
         var _loc3_:Matrix4 = collisionBox.transform;
         _loc3_.toIdentity();
         _loc3_.setPosition(§3#6§);
         direction.diff(param2,param1);
         direction.normalize();
         var _loc4_:Number = direction.dot(Vector3.Y_AXIS);
         if(Math.abs(direction.y) < COS_ONE_DEGREE)
         {
            axis.cross2(Vector3.Y_AXIS,direction);
            axis.normalize();
            _loc3_.fromAxisAngle(axis,Math.acos(_loc4_));
         }
         collisionBox.calculateAABB();
      }
   }
}

