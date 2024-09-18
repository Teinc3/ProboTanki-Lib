package Renamed17
{
   import Renamed136.Renamed663;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.Renamed659;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.battle.battlefield.Renamed2391;
   import alternativa.tanks.models.weapon.shared.Renamed613;
   
   public class Renamed5427 implements Renamed613, Renamed659
   {
      private static const Renamed5428:Number = 5;
      
      private var Renamed5429:Renamed663;
      
      private var Renamed5430:Body;
      
      public function Renamed5427()
      {
         super();
      }
      
      public function Renamed833(param1:Renamed663) : void
      {
         this.Renamed5429 = param1;
      }
      
      public function Renamed661(param1:Body) : void
      {
         this.Renamed5430 = param1;
      }
      
      public function Renamed3385(param1:Body, param2:Number, param3:Number, param4:Number, param5:Number) : Number
      {
         var _loc6_:Number = NaN;
         var _loc7_:Tank = param1.tank;
         if(_loc7_.tankData.health > 0 && !_loc7_.Renamed1017(this.Renamed5429))
         {
            _loc6_ = param1 == this.Renamed5430 ? Number(Renamed5428) : Number(0);
            return Renamed2391.Renamed2392 - (Renamed2391.Renamed2393 * param2 / param4 + (1 - Renamed2391.Renamed2393) * Math.abs(param3) / param5) + _loc6_;
         }
         return 0;
      }
   }
}

