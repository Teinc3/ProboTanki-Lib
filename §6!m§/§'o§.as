package §6!m§
{
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.tank.§finally var return§;
   import alternativa.tanks.models.weapon.§ !8§;
   import alternativa.tanks.models.weapon.§4"z§;
   
   public class §'o§ extends §;"Z§ implements §finally catch return§
   {
      [Inject]
      public static var battleService:BattleService;
      
      private var §3!<§:§4"z§;
      
      private var §6!f§:RayHit;
      
      private var §with for super§:Vector.<RayHit>;
      
      private var self:ClientObject;
      
      public function §'o§(param1:ClientObject, param2:Number)
      {
         this.§3!<§ = new §4"z§();
         this.§6!f§ = new RayHit();
         this.§with for super§ = new Vector.<RayHit>();
         super(param2,this.§3!<§);
         this.self = param1;
      }
      
      public function §7"C§(param1:§ !8§, param2:Vector3) : Vector.<RayHit>
      {
         this.§3!<§.§@"n§ = this.getTank(this.self).§0"t§();
         this.§6!f§.clear();
         this.§with for super§.length = 0;
         if(raycast(param1,param2,this.§6!f§))
         {
            this.§with for super§.push(this.§6!f§.clone());
         }
         return this.§with for super§;
      }
      
      private function getTank(param1:ClientObject) : Tank
      {
         return §finally var return§(OSGi.getInstance().getService(§finally var return§)).getTankData(param1).tank;
      }
   }
}

