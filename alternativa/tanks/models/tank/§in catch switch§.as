package alternativa.tanks.models.tank
{
   import §;"?§.§#">§;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.services.battlereadiness.BattleReadinessService;
   
   public class §in catch switch§
   {
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var §static package set§:BattleReadinessService;
      
      private var §finally set super§:Boolean = true;
      
      public function §in catch switch§(param1:Boolean)
      {
         super();
         this.§finally set super§ = param1;
      }
      
      public function §native catch package§(param1:§#">§, param2:§#">§) : void
      {
         var _loc3_:Vector3 = new Vector3(param1.x,param1.y,param1.z);
         var _loc4_:Vector3 = new Vector3(-Math.sin(param2.z),Math.cos(param2.z),0);
         if(this.§finally set super§)
         {
            this.§finally set super§ = false;
            battleService.§continue package try§();
            battleService.§?#E§();
            battleService.§,!'§(_loc3_,_loc4_);
            §static package set§.§3"W§();
         }
         else
         {
            battleService.§^"S§(_loc3_,_loc4_);
         }
      }
   }
}

