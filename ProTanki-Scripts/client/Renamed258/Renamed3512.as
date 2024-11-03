package Renamed258
{
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.tank.Renamed2407;
   import alternativa.tanks.models.tank.Renamed2408;
   import alternativa.tanks.models.weapon.Renamed664;
   import Renamed56.Renamed6797;
   import Renamed373.Renamed665;
   
   public class Renamed3512 extends Renamed4598 implements Renamed3513
   {
      [Inject]
      public static var battleService:BattleService;
      
      private var Renamed6525:Number;
      
      private var collisionDetector:Renamed665;
      
      private var Renamed6798:Renamed6797;
      
      private var Renamed6799:RayHit;
      
      private var Renamed3529:Vector.<RayHit>;
      
      private var self:ClientObject;
      
      public function Renamed3512(param1:ClientObject, param2:Number)
      {
         this.Renamed6798 = new Renamed6797();
         this.Renamed6799 = new RayHit();
         this.Renamed3529 = new Vector.<RayHit>();
         this.self = param1;
         super(param2,this.Renamed6798);
         this.Renamed6525 = param2;
         this.collisionDetector = battleService.Renamed619().Renamed692();
      }
      
      public function Renamed3524(param1:Renamed664, param2:Vector3) : Vector.<RayHit>
      {
         this.Renamed6798.addBody(this.getTank(this.self).Renamed696());
         this.Renamed3529.length = 0;
         while(raycast(param1,param2,this.Renamed6799))
         {
            this.Renamed3529.push(this.Renamed6799.clone());
            if(this.Renamed6799.staticHit)
            {
               break;
            }
            this.Renamed6798.addBody(this.Renamed6799.shape.body);
         }
         this.Renamed6798.clear();
         return this.Renamed3529;
      }
      
      private function getTank(param1:ClientObject) : Tank
      {
         var _loc2_:Renamed2408 = Renamed2407(OSGi.getInstance().getService(Renamed2408));
         return _loc2_.getTankData(param1).tank;
      }
   }
}

