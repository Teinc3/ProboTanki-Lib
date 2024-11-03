package Renamed251
{
   public class Renamed6732
   {
      private static const Renamed6733:Number = 8 * 180 / Math.PI;
      
      private static const Renamed3419:Number = 90;
      
      public function Renamed6732()
      {
         super();
      }
      
      private static function Renamed6734(param1:Number) : int
      {
         var _loc2_:Number = NaN;
         _loc2_ = Renamed6733;
         return Math.ceil(param1 * _loc2_);
      }
      
      public static function Renamed6735(param1:Number) : Number
      {
         return Math.min(Renamed6733,1 / (2 * Math.atan(Renamed3419 / (2 * param1))));
      }
   }
}

