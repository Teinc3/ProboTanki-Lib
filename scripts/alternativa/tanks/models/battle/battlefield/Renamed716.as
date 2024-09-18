package alternativa.tanks.models.battle.battlefield
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.geom.Matrix;
   
   public class Renamed716
   {
      private static var Renamed2526:Class = Renamed2324;
      
      private static var Renamed2527:BitmapData = Bitmap(new Renamed2526()).bitmapData;
      
      private static var Renamed2528:Class = Renamed2319;
      
      private static var Renamed2529:BitmapData = Bitmap(new Renamed2528()).bitmapData;
      
      private static var Renamed2530:Class = Renamed2531;
      
      private static var Renamed2532:BitmapData = Bitmap(new Renamed2530()).bitmapData;
      
      private static var Renamed2533:Class = Renamed2398;
      
      private static var Renamed2534:BitmapData = Bitmap(new Renamed2533()).bitmapData;
      
      private static var Renamed2535:Class = Renamed2523;
      
      private static var Renamed2536:BitmapData = Bitmap(new Renamed2535()).bitmapData;
      
      private static var Renamed2537:Class = Renamed2397;
      
      private static var Renamed2538:BitmapData = Bitmap(new Renamed2537()).bitmapData;
      
      private static var Renamed2539:Class = Renamed2390;
      
      private static var Renamed2540:BitmapData = Bitmap(new Renamed2539()).bitmapData;
      
      private static var Renamed2541:Class = Renamed2399;
      
      private static var Renamed2542:BitmapData = Bitmap(new Renamed2541()).bitmapData;
      
      public function Renamed716()
      {
         super();
      }
      
      public static function draw(param1:Graphics, param2:int, param3:int) : void
      {
         var _loc4_:int = 4;
         Renamed2543(param1,Renamed2527,_loc4_ - Renamed2527.width,_loc4_ - Renamed2527.height,Renamed2527.width,Renamed2527.height);
         Renamed2543(param1,Renamed2529,param2 - _loc4_,_loc4_ - Renamed2529.height,Renamed2529.width,Renamed2529.height);
         Renamed2543(param1,Renamed2532,_loc4_ - Renamed2532.width,param3 - _loc4_,Renamed2532.width,Renamed2532.height);
         Renamed2543(param1,Renamed2534,param2 - _loc4_,param3 - _loc4_,Renamed2534.width,Renamed2534.height);
         Renamed2543(param1,Renamed2540,_loc4_,_loc4_ - Renamed2540.height,param2 - 2 * _loc4_,Renamed2540.height);
         Renamed2543(param1,Renamed2542,_loc4_,param3 - _loc4_,param2 - 2 * _loc4_,Renamed2542.height);
         Renamed2543(param1,Renamed2536,_loc4_ - Renamed2536.width,_loc4_,Renamed2536.width,param3 - 2 * _loc4_);
         Renamed2543(param1,Renamed2538,param2 - _loc4_,_loc4_,Renamed2538.width,param3 - 2 * _loc4_);
      }
      
      private static function Renamed2543(param1:Graphics, param2:BitmapData, param3:int, param4:int, param5:int, param6:int) : void
      {
         var _loc7_:Matrix;
         (_loc7_ = new Matrix()).tx = param3;
         _loc7_.ty = param4;
         param1.beginBitmapFill(param2,_loc7_);
         param1.drawRect(param3,param4,param5,param6);
         param1.endFill();
      }
   }
}

