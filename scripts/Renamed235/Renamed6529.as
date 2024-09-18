package Renamed235
{
   internal class Renamed6529
   {
      private static var Renamed6544:int;
      
      private static var pool:Vector.<Renamed6529> = new Vector.<Renamed6529>();
      
      public var Renamed6543:Number;
      
      public var Renamed6536:Renamed608;
      
      public function Renamed6529(param1:Number, param2:Renamed608)
      {
         super();
         this.Renamed6543 = param1;
         this.Renamed6536 = param2;
      }
      
      public static function create(param1:Number, param2:Renamed608) : Renamed6529
      {
         var _loc3_:Renamed6529 = null;
         if(Renamed6544 > 0)
         {
            _loc3_ = pool[--Renamed6544];
            pool[Renamed6544] = null;
            _loc3_.Renamed6543 = param1;
            _loc3_.Renamed6536 = param2;
            return _loc3_;
         }
         return new Renamed6529(param1,param2);
      }
      
      public static function destroy(param1:Renamed6529) : void
      {
         param1.Renamed6536 = null;
         var _loc2_:* = Renamed6544++;
         pool[_loc2_] = param1;
      }
   }
}

