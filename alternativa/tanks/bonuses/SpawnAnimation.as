package alternativa.tanks.bonuses
{
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.scene3d.Renamed919;
   import Renamed356.Renamed1443;
   import Renamed356.Renamed1444;
   
   public class SpawnAnimation extends Renamed1444 implements Renamed919
   {
      [Inject]
      public static var battleService:BattleService;
      
      private static const ALPHA_SPEED:Number = 0.001;
      
      private var bonus:BattleBonus;
      
      private var alpha:Number = 0;
      
      public function SpawnAnimation(param1:Renamed1443)
      {
         super(param1);
      }
      
      public function start(param1:BattleBonus) : void
      {
         this.bonus = param1;
         this.alpha = 0;
         param1.onDestroy.add(this.destroy);
         battleService.Renamed621().Renamed1287(this,0);
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
         battleService.Renamed621().Renamed1289(this,0);
         this.bonus.onDestroy.remove(this.destroy);
         this.bonus = null;
         recycle();
      }
   }
}

