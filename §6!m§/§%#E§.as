package §6!m§
{
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.tank.§2!s§;
   import alternativa.tanks.models.tank.§finally var return§;
   import alternativa.tanks.models.weapon.§ !8§;
   import §class for§.§-!w§;
   import §for set super§.§!"N§;
   
   public class §%#E§ extends §;"Z§ implements §finally catch return§
   {
      [Inject]
      public static var battleService:BattleService;
      
      private var §1#0§:Number;
      
      private var collisionDetector:§!"N§;
      
      private var §case package include§:§-!w§;
      
      private var §6!f§:RayHit;
      
      private var §const catch package§:Vector.<RayHit>;
      
      private var self:ClientObject;
      
      public function §%#E§(param1:ClientObject, param2:Number)
      {
         this.§case package include§ = new §-!w§();
         this.§6!f§ = new RayHit();
         this.§const catch package§ = new Vector.<RayHit>();
         this.self = param1;
         super(param2,this.§case package include§);
         this.§1#0§ = param2;
         this.collisionDetector = battleService.§'x§().§const const true§();
      }
      
      public function §7"C§(param1:§ !8§, param2:Vector3) : Vector.<RayHit>
      {
         this.§case package include§.addBody(this.getTank(this.self).§0"t§());
         this.§const catch package§.length = 0;
         while(raycast(param1,param2,this.§6!f§))
         {
            this.§const catch package§.push(this.§6!f§.clone());
            if(this.§6!f§.staticHit)
            {
               break;
            }
            this.§case package include§.addBody(this.§6!f§.shape.body);
         }
         this.§case package include§.clear();
         return this.§const catch package§;
      }
      
      private function getTank(param1:ClientObject) : Tank
      {
         var _loc2_:§finally var return§ = §2!s§(OSGi.getInstance().getService(§finally var return§));
         return _loc2_.getTankData(param1).tank;
      }
   }
}

