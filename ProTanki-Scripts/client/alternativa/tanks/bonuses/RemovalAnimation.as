package alternativa.tanks.bonuses
{
   import Renamed1.Renamed1450;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.scene3d.Renamed919;
   import Renamed356.Renamed1443;
   import Renamed356.Renamed1444;
   import flash.utils.getTimer;
   
   public class RemovalAnimation extends Renamed1444 implements Renamed919
   {
      [Inject]
      public static var battleService:BattleService;
      
      private static const MAX_BLINK_INTERVAL:int = 500;
      
      private static const MIN_BLINK_INTERVAL:int = 22;
      
      private static const BLINK_INTERVAL_DECREMENT:int = 12;
      
      private static const ALPHA_SPEED_COEFF:Number = 10;
      
      private static const DELTA_ALPHA:Number = 0.5;
      
      private static const MIN_ALPHA:Number = 1 - DELTA_ALPHA;
      
      private static const REMOVAL_ALPHA_SPEED:Number = 0.001;
      
      private static const REMOVAL_WARNING_THRESHOLD:int = 10400;
      
      private var bonusMesh:BonusMesh;
      
      private var startTime:int;
      
      private var canRemove:Boolean;
      
      private var blinking:Boolean;
      
      private var started:Boolean;
      
      public function RemovalAnimation(param1:Renamed1443)
      {
         this.blinker = new Renamed1450(MAX_BLINK_INTERVAL,MIN_BLINK_INTERVAL,BLINK_INTERVAL_DECREMENT,MIN_ALPHA,1,ALPHA_SPEED_COEFF);
         super(param1);
      }
      
      public function init(param1:BattleBonus, param2:int) : void
      {
         var _loc3_:int = getTimer();
         this.bonusMesh = param1.getBonusMesh();
         this.startTime = _loc3_ + param2 - REMOVAL_WARNING_THRESHOLD;
         this.started = false;
         this.blinking = true;
         this.canRemove = false;
         if(param2 < REMOVAL_WARNING_THRESHOLD)
         {
            this.blinker.Renamed1451(MIN_BLINK_INTERVAL + (MAX_BLINK_INTERVAL - MIN_BLINK_INTERVAL) * param2 / REMOVAL_WARNING_THRESHOLD);
         }
         else
         {
            this.blinker.Renamed1451(MAX_BLINK_INTERVAL);
         }
         battleService.Renamed621().Renamed1287(this,0);
         param1.onPickup.addOnce(this.onBonusPickup);
         param1.onRemove.addOnce(this.onBonusRemove);
      }
      
      private function onBonusPickup() : void
      {
         this.bonusMesh = null;
         this.destroy();
      }
      
      private function onBonusRemove() : void
      {
         this.canRemove = true;
         var _loc1_:int = getTimer() - REMOVAL_WARNING_THRESHOLD;
         if(this.startTime > _loc1_)
         {
            this.startTime = _loc1_;
         }
      }
      
      public function render(param1:int, param2:int) : void
      {
         if(param1 >= this.startTime)
         {
            if(this.blinking)
            {
               if(!this.started)
               {
                  this.started = true;
                  this.blinker.init(param1);
               }
               this.blink(param1,param2);
            }
            else
            {
               this.fadeOut(param2);
            }
         }
      }
      
      private function blink(param1:int, param2:int) : void
      {
         var _loc3_:Number = this.blinker.Renamed1452(param1,param2);
         this.bonusMesh.setAlpha(_loc3_);
         if(this.canRemove && param1 >= this.startTime + REMOVAL_WARNING_THRESHOLD && _loc3_ == MIN_ALPHA)
         {
            this.blinking = false;
         }
      }
      
      private function fadeOut(param1:int) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = this.bonusMesh.getAlpha();
         if((_loc4_ = _loc4_ - REMOVAL_ALPHA_SPEED * param1) > 0)
         {
            this.bonusMesh.setAlpha(_loc4_);
            _loc2_ = this.bonusMesh.getScale();
            if(_loc2_ > 0)
            {
               _loc3_ = _loc2_ - 0.002 * param1;
               if(_loc3_ < 0)
               {
                  _loc3_ = 0;
               }
               this.bonusMesh.setScale(_loc3_);
            }
         }
         else
         {
            this.destroy();
         }
      }
      
      private function destroy() : void
      {
         battleService.Renamed621().Renamed1289(this,0);
         if(this.bonusMesh != null)
         {
            this.bonusMesh.removeFromScene();
            this.bonusMesh.recycle();
            this.bonusMesh = null;
         }
         recycle();
      }
   }
}

