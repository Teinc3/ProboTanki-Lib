package Renamed258
{
   import alternativa.math.Vector3;
   import alternativa.physics.collision.IRayCollisionFilter;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.Renamed668;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.models.weapon.Renamed664;
   import alternativa.tanks.models.weapon.shared.Renamed2943;
   import Renamed373.Renamed665;
   import Renamed373.Renamed666;
   
   public class Renamed4598
   {
      [Inject]
      public static var battleService:BattleService;
      
      private const Renamed6801:Number = 0.9999;
      
      private var collisionDetector:Renamed665;
      
      private var Renamed6525:Number;
      
      private var filter:IRayCollisionFilter;
      
      private var Renamed6802:Boolean = false;
      
      public function Renamed4598(param1:Number, param2:IRayCollisionFilter)
      {
         super();
         this.Renamed6525 = param1;
         this.filter = param2;
         this.collisionDetector = battleService.Renamed619().Renamed692();
      }
      
      public function Renamed6803() : void
      {
         this.Renamed6802 = true;
      }
      
      protected function raycast(param1:Renamed664, param2:Vector3, param3:RayHit) : Boolean
      {
         var _loc4_:Vector3 = null;
         if(!this.Renamed6802 || param2.dot(param1.direction) > this.Renamed6801)
         {
            _loc4_ = param1.Renamed689;
         }
         else
         {
            _loc4_ = param1.Renamed693;
         }
         if(this.collisionDetector.raycast(_loc4_,param2,Renamed666.WEAPON,this.Renamed6525,this.filter,param3))
         {
            param3.staticHit = !Renamed668.Renamed687(param3.shape.body) || Renamed2943.Renamed2967(_loc4_,param3.position);
            return true;
         }
         return false;
      }
   }
}

