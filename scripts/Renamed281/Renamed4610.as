package Renamed281
{
   import Renamed3505.Renamed3532;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.weapon.shared.Renamed613;
   import alternativa.tanks.models.weapon.shared.Renamed614;
   import Renamed82.Renamed84;
   
   public class Renamed4610 implements Renamed3532
   {
      [Inject]
      public static var battleService:BattleService;
      
      private const Renamed6779:Number = 0.0001;
      
      private const Renamed7203:Number = 50;
      
      private const Renamed7204:Number = 100;
      
      private var Renamed2438:Renamed613;
      
      private var Renamed3427:Renamed614;
      
      private var Renamed6777:Number;
      
      private var Renamed3452:Number;
      
      private var target:Tank;
      
      public function Renamed4610(param1:Renamed84)
      {
         super();
         this.Renamed2438 = battleService.Renamed624();
         this.Renamed3427 = battleService.Renamed627();
         this.Renamed3452 = param1.radius - this.Renamed7203;
         this.Renamed6777 = param1.coneAngle;
      }
      
      public function Renamed1554(param1:Tank) : void
      {
         this.target = param1;
      }
      
      public function Renamed7205() : void
      {
         this.target = null;
      }
      
      public function Renamed3385(param1:Tank, param2:Number, param3:Number) : Number
      {
         if(param1.tankData.health == 0)
         {
            return 0;
         }
         var _loc4_:Body = param1.Renamed696();
         var _loc5_:Number = this.Renamed2438.Renamed3385(_loc4_,param2,param3,this.Renamed3452,this.Renamed6777);
         return this.Renamed3427.Renamed3385(_loc4_) + _loc5_ * this.Renamed6779 + this.Renamed7206(param1);
      }
      
      private function Renamed7206(param1:Tank) : Number
      {
         return param1 != this.target ? Number(0) : Number(this.Renamed7204);
      }
   }
}

