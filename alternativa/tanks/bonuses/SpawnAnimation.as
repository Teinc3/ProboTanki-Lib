package alternativa.tanks.bonuses
{
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.scene3d.§else if§;
   import §extends for const§.§1Q§;
   import §extends for const§.§["D§;
   
   public class SpawnAnimation extends §["D§ implements §else if§
   {
      [Inject]
      public static var battleService:BattleService;
      
      private static const ALPHA_SPEED:Number = 0.001;
      
      private var bonus:BattleBonus;
      
      private var alpha:Number = 0;
      
      public function SpawnAnimation(param1:§1Q§)
      {
         super(param1);
      }
      
      public function start(param1:BattleBonus) : void
      {
         this.bonus = param1;
         this.alpha = 0;
         param1.onDestroy.add(this.destroy);
         battleService.§3l§().§9"N§(this,0);
      }
      
      public function render(param1:int, param2:int) : void
      {
         this.alpha += ALPHA_SPEED * param2;
         if(this.alpha > 1)
         {
            this.alpha = 1;
         }
         this.bonus.setAlpha(this.alpha);
         if(this.alpha >= 1)
         {
            this.destroy();
         }
      }
      
      private function destroy() : void
      {
         battleService.§3l§().§0!n§(this,0);
         this.bonus.onDestroy.remove(this.destroy);
         this.bonus = null;
         recycle();
      }
   }
}

