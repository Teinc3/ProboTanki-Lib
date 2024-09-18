package Renamed408
{
   import Renamed206.Renamed5125;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   
   public class Renamed8525
   {
      private static const Renamed8624:Class = Renamed8621;
      
      private static const Renamed8625:BitmapData = new Renamed8624().bitmapData;
      
      private static const Renamed8626:Class = Renamed8627;
      
      private static const Renamed8628:BitmapData = new Renamed8626().bitmapData;
      
      private static const Renamed8629:Class = Renamed8623;
      
      private static const Renamed8630:BitmapData = new Renamed8629().bitmapData;
      
      private static const Renamed8631:Class = Renamed8632;
      
      private static const Renamed8633:Dictionary = new Dictionary();
      
      private static const Renamed8634:int = Renamed8630.width;
      
      private static const Renamed8635:BitmapData = new Renamed8631().bitmapData;
      
      private static const Renamed8636:Dictionary = new Dictionary();
      
      Renamed8633[Renamed5125.NEUTRAL] = Renamed8628;
      Renamed8633[Renamed5125.BLUE] = Renamed8625;
      Renamed8633[Renamed5125.RED] = Renamed8630;
      
      public function Renamed8525()
      {
         super();
      }
      
      public static function Renamed8532(param1:Renamed5125) : BitmapData
      {
         return Renamed8633[param1];
      }
      
      public static function Renamed8613(param1:String) : BitmapData
      {
         var _loc2_:Number = param1.charCodeAt(0) - "A".charCodeAt(0);
         var _loc3_:BitmapData = Renamed8636[_loc2_];
         if(_loc3_ == null)
         {
            _loc3_ = new BitmapData(Renamed8634,Renamed8635.height,true,0);
            _loc3_.copyPixels(Renamed8635,new Rectangle(_loc2_ * Renamed8634,0,Renamed8634,Renamed8635.height),new Point());
            Renamed8636[_loc2_] = _loc3_;
         }
         return _loc3_;
      }
   }
}

