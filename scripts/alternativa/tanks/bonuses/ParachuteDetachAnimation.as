package alternativa.tanks.bonuses
{
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.scene3d.Renamed919;
   import Renamed356.Renamed1443;
   import Renamed356.Renamed1444;
   
   public class ParachuteDetachAnimation extends Renamed1444 implements Renamed919
   {
      [Inject]
      public static var battleService:BattleService;
      
      private static const ALPHA_SPEED:Number = 0.001;
      
      private static const XY_SCALE_SPEED:Number = 1 / 4000;
      
      private static const Z_SCALE_SPEED:Number = 1 / 3000;
      
      private var parachute:Parachute;
      
      private var cords:Cords;
      
      private var fallSpeed:Number;
      
      public function ParachuteDetachAnimation(param1:Renamed1443)
      {
         super(param1);
      }
      
      public function start(param1:Parachute, param2:Cords, param3:Number) : void
      {
         this.parachute = param1;
         this.cords = param2;
         this.fallSpeed = param3 / 1000;
         battleService.Renamed621().Renamed1287(this,0);
      }
      
      public function render(param1:int, param2:int) : void
      {
         var _loc3_:Number = NaN;
         this.parachute.setAlpha(this.parachute.getAlpha() - ALPHA_SPEED * param2);
         if(this.parachute.getAlpha() <= 0)
         {
            this.destroy();
         }
         else
         {
            this.cords.setAlpha(this.parachute.getAlpha());
            this.parachute.addZ(-this.fallSpeed * param2);
            _loc3_ = param2 * XY_SCALE_SPEED;
            this.parachute.addScaleXY(_loc3_);
            this.parachute.addScaleZ(-param2 * Z_SCALE_SPEED);
            this.cords.updateVertices();
         }
      }
      
      private function destroy() : void
      {
         battleService.Renamed621().Renamed1289(this,0);
         this.parachute.removeFromScene();
         this.cords.removeFromScene();
         this.parachute.recycle();
         this.parachute = null;
         this.cords.recycle();
         this.cords = null;
         recycle();
      }
   }
}

