package Renamed270
{
   import alternativa.tanks.loader.ILoaderWindowService;
   import Renamed341.Renamed7072;
   import Renamed341.Renamed4478;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.resource.types.LocalizedImageResource;
   
   public class Renamed4475 extends Renamed7072 implements Renamed4478, ObjectLoadListener
   {
      [Inject]
      public static var loader:ILoaderWindowService;
      
      public function Renamed4475()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         var _loc1_:BitmapData = null;
         var _loc2_:LocalizedImageResource = getInitParam().preview;
         if(_loc2_.isLoaded)
         {
            _loc1_ = _loc2_.data;
            loader.showTip(new Bitmap(_loc1_));
         }
      }
   }
}

