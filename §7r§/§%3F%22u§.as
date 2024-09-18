package §7r§
{
   import alternativa.tanks.loader.ILoaderWindowService;
   import §do static§.§[!H§;
   import §do static§.§native const try§;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.resource.types.LocalizedImageResource;
   
   public class §?"u§ extends §[!H§ implements §native const try§, ObjectLoadListener
   {
      [Inject]
      public static var loader:ILoaderWindowService;
      
      public function §?"u§()
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

