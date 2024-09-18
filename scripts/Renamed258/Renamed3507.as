package Renamed258
{
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.tank.Renamed2408;
   import alternativa.tanks.models.weapon.Renamed664;
   import alternativa.tanks.models.weapon.Renamed3031;
   
   public class Renamed3507 extends Renamed4598 implements Renamed3513
   {
      [Inject]
      public static var battleService:BattleService;
      
      private var Renamed3107:Renamed3031;
      
      private var Renamed6799:RayHit;
      
      private var Renamed6800:Vector.<RayHit>;
      
      private var self:ClientObject;
      
      public function Renamed3507(param1:ClientObject, param2:Number)
      {
         this.Renamed3107 = new Renamed3031();
         this.Renamed6799 = new RayHit();
         this.Renamed6800 = new Vector.<RayHit>();
         super(param2,this.Renamed3107);
         this.self = param1;
      }
      
      public function Renamed3524(param1:Renamed664, param2:Vector3) : Vector.<RayHit>
      {
         this.Renamed3107.Renamed3032 = this.getTank(this.self).Renamed696();
         this.Renamed6799.clear();
         this.Renamed6800.length = 0;
         if(raycast(param1,param2,this.Renamed6799))
         {
            this.Renamed6800.push(this.Renamed6799.clone());
         }
         return this.Renamed6800;
      }
      
      private function getTank(param1:ClientObject) : Tank
      {
         return Renamed2408(OSGi.getInstance().getService(Renamed2408)).getTankData(param1).tank;
      }
   }
}

