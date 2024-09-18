package alternativa.tanks.models.weapon.shared
{
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.physics.PhysicsMaterial;
   import alternativa.physics.collision.primitives.CollisionBox;
   import alternativa.tanks.battle.BattleService;
   import Renamed373.Renamed665;
   import Renamed373.Renamed666;
   
   public class Renamed2943
   {
      [Inject]
      public static var battleService:BattleService;
      
      private static const Renamed3410:Number = 6.5;
      
      private static const Renamed3411:Vector3 = new Vector3();
      
      private static const Renamed3412:Vector3 = new Vector3();
      
      private static const direction:Vector3 = new Vector3();
      
      private static const axis:Vector3 = new Vector3();
      
      private static const COS_ONE_DEGREE:Number = Math.cos(Math.PI / 180);
      
      private static const collisionBox:CollisionBox = new CollisionBox(new Vector3(1,1,1),Renamed666.Renamed690,PhysicsMaterial.DEFAULT_MATERIAL);
      
      public function Renamed2943()
      {
         super();
      }
      
      public static function Renamed2967(param1:Vector3, param2:Vector3) : Boolean
      {
         Renamed3413(param1,param2);
         var _loc3_:Renamed665 = battleService.Renamed619().Renamed692();
         return _loc3_.Renamed3414(collisionBox);
      }
      
      private static function Renamed3413(param1:Vector3, param2:Vector3) : void
      {
         Renamed3412.diff(param1,param2);
         Renamed3412.y = Renamed3412.length() / 2;
         Renamed3412.x = Renamed3410;
         Renamed3412.z = Renamed3410;
         collisionBox.hs.copy(Renamed3412);
         Renamed3411.sum(param1,param2);
         Renamed3411.scale(0.5);
         var _loc3_:Matrix4 = collisionBox.transform;
         _loc3_.toIdentity();
         _loc3_.setPosition(Renamed3411);
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

