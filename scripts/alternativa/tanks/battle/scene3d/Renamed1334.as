package alternativa.tanks.battle.scene3d
{
   public class Renamed1334
   {
      private static const Renamed1335:Number = 12;
      
      private static const Renamed1336:Number = 16;
      
      private static const Renamed1337:Number = 9;
      
      private static const Renamed1338:Number = Math.PI / 2;
      
      public function Renamed1334()
      {
         super();
      }
      
      public static function Renamed1339(param1:Number, param2:Number) : Number
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = param2 / Renamed1337;
         var _loc7_:Number = param1 / _loc6_;
         if(_loc7_ <= Renamed1335)
         {
            return Renamed1338;
         }
         _loc3_ = _loc7_ - (Renamed1336 - Renamed1335);
         if(_loc3_ < Renamed1335)
         {
            _loc3_ = Renamed1335;
         }
         _loc4_ = _loc3_ * _loc6_;
         _loc5_ = Math.sqrt(_loc4_ * _loc4_ + param2 * param2) * 0.5 / Math.tan(Renamed1338 * 0.5);
         return Math.atan(Math.sqrt(param1 * param1 + param2 * param2) * 0.5 / _loc5_) * 2;
      }
   }
}

