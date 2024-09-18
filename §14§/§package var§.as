package §14§
{
   internal class §package var§
   {
      private static var §!!-§:int;
      
      private static var pool:Vector.<§package var§> = new Vector.<§package var§>();
      
      public var §implements set package§:Number;
      
      public var §case set final§:§final var super§;
      
      public function §package var§(param1:Number, param2:§final var super§)
      {
         super();
         this.§implements set package§ = param1;
         this.§case set final§ = param2;
      }
      
      public static function create(param1:Number, param2:§final var super§) : §package var§
      {
         var _loc3_:§package var§ = null;
         if(§!!-§ > 0)
         {
            _loc3_ = pool[--§!!-§];
            pool[§!!-§] = null;
            _loc3_.§implements set package§ = param1;
            _loc3_.§case set final§ = param2;
            return _loc3_;
         }
         return new §package var§(param1,param2);
      }
      
      public static function destroy(param1:§package var§) : void
      {
         param1.§case set final§ = null;
         var _loc2_:* = §!!-§++;
         pool[_loc2_] = param1;
      }
   }
}

