package Renamed63
{
   import alternativa.tanks.battle.objects.tank.Tank;
   
   public class Renamed7400
   {
      private static const Renamed2393:Number = 0.65;
      
      public function Renamed7400()
      {
         super();
      }
      
      protected static function Renamed10192(param1:Tank, param2:int, param3:Number, param4:Number, param5:Number, param6:Number) : Number
      {
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         if(param1.tankData.health > 0)
         {
            _loc7_ = Renamed2393 * param3 / param5 + (1 - Renamed2393) * param4 / param6;
            _loc8_ = param2 == 0 ? Number(2) : Number(0);
            return 1 - _loc7_ + _loc8_;
         }
         return 0;
      }
   }
}

