package alternativa.tanks.bonuses
{
   import alternativa.tanks.animations.AnimationTrack;
   import alternativa.tanks.animations.KeyFrameAnimation;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.scene3d.§else if§;
   import §extends for const§.§1Q§;
   import §extends for const§.§["D§;
   
   public class SpawnFlashRenderer extends §["D§ implements §else if§
   {
      [Inject]
      public static var battleService:BattleService;
      
      private static const times:Vector.<Number> = Vector.<Number>([0,0.05,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45,0.5]);
      
      private static const values:Vector.<Number> = Vector.<Number>([0,130.05,255,201.45,140.25,104.55,66.3,40.8,25.5,10.2,0]);
      
      private static const animationTrack:AnimationTrack = new AnimationTrack(times,values);
      
      private var colorTransform:AnimatedColorTransform;
      
      private var animation:KeyFrameAnimation;
      
      private var bonus:BattleBonus;
      
      public function SpawnFlashRenderer(param1:§1Q§)
      {
         this.colorTransform = new AnimatedColorTransform();
         this.animation = new KeyFrameAnimation(animationTrack,this.colorTransform);
         super(param1);
      }
      
      public function start(param1:BattleBonus) : void
      {
         this.bonus = param1;
         param1.onRemove.add(this.destroy);
         param1.onPickup.add(this.destroy);
         param1.onDestroy.add(this.destroy);
         param1.getBonusMesh().setColorTransform(this.colorTransform.colorTransform);
         battleService.§3l§().§9"N§(this,0);
         this.animation.start();
      }
      
      public function render(param1:int, param2:int) : void
      {
         if(this.animation.isComplete())
         {
            this.bonus.enableTrigger();
            this.destroy();
         }
         else
         {
            this.animation.update(param2 / 1000);
         }
      }
      
      private function destroy() : void
      {
         battleService.§3l§().§0!n§(this,0);
         this.bonus.onRemove.remove(this.destroy);
         this.bonus.onPickup.remove(this.destroy);
         this.bonus.onDestroy.remove(this.destroy);
         this.bonus.getBonusMesh().setColorTransform(null);
         this.bonus = null;
         recycle();
      }
   }
}

