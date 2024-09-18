package alternativa.tanks.bonuses
{
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.scene3d.§else if§;
   import §extends for const§.§1Q§;
   import §extends for const§.§["D§;
   
   public class GroundSpawnRenderer extends §["D§ implements §else if§
   {
      [Inject]
      public static var battleService:BattleService;
      
      private static const SCALE_SPEED:Number = 0.005;
      
      private var bonus:BattleBonus;
      
      private var param:Number;
      
      public function GroundSpawnRenderer(param1:§1Q§)
      {
         super(param1);
      }
      
      public function start(param1:BattleBonus) : void
      {
         this.bonus = param1;
         this.param = 0;
         param1.onRemove.add(this.destroy);
         param1.onPickup.add(this.destroy);
         param1.onDestroy.add(this.destroy);
         battleService.§3l§().§9"N§(this,0);
      }
      
      public function render(param1:int, param2:int) : void
      {
         this.param += SCALE_SPEED * param2;
         if(this.param > 1)
         {
            this.param = 1;
         }
         var _loc3_:BonusMesh = this.bonus.getBonusMesh();
         _loc3_.setScale(this.param);
         _loc3_.setAlpha(this.param);
         if(this.param == 1)
         {
            this.startFlashAnimation();
            this.destroy();
         }
      }
      
      private function startFlashAnimation() : void
      {
         var _loc1_:SpawnFlashRenderer = SpawnFlashRenderer(battleService.§class while§().getObject(SpawnFlashRenderer));
         _loc1_.start(this.bonus);
      }
      
      private function destroy() : void
      {
         battleService.§3l§().§0!n§(this,0);
         this.bonus.onRemove.remove(this.destroy);
         this.bonus.onPickup.remove(this.destroy);
         this.bonus.onDestroy.remove(this.destroy);
         this.bonus = null;
         recycle();
      }
   }
}

