package alternativa.tanks.battle.scene3d
{
   public class §switch set extends§
   {
      private static const §catch const set§:Number = 12;
      
      private static const §6#g§:Number = 16;
      
      private static const §9F§:Number = 9;
      
      private static const §"C§:Number = Math.PI / 2;
      
      public function §switch set extends§()
      {
         super();
      }
      
      public static function §else for static§(param1:Number, param2:Number) : Number
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = param2 / §9F§;
         var _loc7_:Number = param1 / _loc6_;
         if(_loc7_ <= §catch const set§)
         {
            return §"C§;
         }
         _loc3_ = _loc7_ - (§6#g§ - §catch const set§);
         if(_loc3_ < §catch const set§)
         {
            _loc3_ = §catch const set§;
         }
         _loc4_ = _loc3_ * _loc6_;
         _loc5_ = Math.sqrt(_loc4_ * _loc4_ + param2 * param2) * 0.5 / Math.tan(§"C§ * 0.5);
         return Math.atan(Math.sqrt(param1 * param1 + param2 * param2) * 0.5 / _loc5_) * 2;
      }
   }
}

