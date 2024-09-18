package alternativa.tanks.bonuses
{
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.scene3d.Renamed919;
   import Renamed356.Renamed1443;
   import Renamed356.Renamed1444;
   
   public class GroundSpawnRenderer extends Renamed1444 implements Renamed919
   {
      [Inject]
      public static var battleService:BattleService;
      
      private static const SCALE_SPEED:Number = 0.005;
      
      private var bonus:BattleBonus;
      
      private var param:Number;
      
      public function GroundSpawnRenderer(param1:Renamed1443)
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
         battleService.Renamed621().Renamed1287(this,0);
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
         var _loc1_:SpawnFlashRenderer = SpawnFlashRenderer(battleService.Renamed618().getObject(SpawnFlashRenderer));
         _loc1_.start(this.bonus);
      }
      
      private function destroy() : void
      {
         battleService.Renamed621().Renamed1289(this,0);
         this.bonus.onRemove.remove(this.destroy);
         this.bonus.onPickup.remove(this.destroy);
         this.bonus.onDestroy.remove(this.destroy);
         this.bonus = null;
         recycle();
      }
   }
}

