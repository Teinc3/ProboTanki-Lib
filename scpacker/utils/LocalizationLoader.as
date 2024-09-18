package scpacker.utils
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.startup.CacheURLLoader;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   import platform.client.core.general.resourcelocale.format.ImagePair;
   import platform.client.core.general.resourcelocale.format.LocalizedFileFormat;
   import platform.client.core.general.resourcelocale.format.StringPair;
   import platform.client.fp10.core.resource.BatchImageConstructor;
   import scpacker.networking.protocol.Renamed536;
   
   public class LocalizationLoader
   {
      public static var localeService:ILocaleService;
      
      private var Renamed10777:LocalizedFileFormat;
      
      private var Renamed10778:BatchImageConstructor;
      
      private var Renamed10779:Function;
      
      public function LocalizationLoader()
      {
         super();
         localeService = ILocaleService(OSGi.getInstance().getService(ILocaleService));
      }
      
      public function Renamed3(param1:String, param2:Function) : void
      {
         this.Renamed10779 = param2;
         var _loc3_:CacheURLLoader = new CacheURLLoader();
         _loc3_.dataFormat = URLLoaderDataFormat.BINARY;
         _loc3_.addEventListener(Event.COMPLETE,this.onLoadingComplete);
         _loc3_.load(new URLRequest(param1));
      }
      
      protected function onLoadingComplete(param1:Event) : void
      {
         var _loc2_:Renamed536 = Renamed536(OSGi.getInstance().getService(Renamed536));
         var _loc3_:ByteArray = URLLoader(param1.target).data;
         _loc3_.uncompress();
         this.Renamed10777 = LocalizedFileFormat(_loc2_.getCodec("scpacker.networking.protocol.codec.custom.CodecLocaleStruct").decode(_loc3_));
         this.Renamed10780();
      }
      
      private function Renamed10780() : void
      {
         var _loc1_:StringPair = null;
         if(this.Renamed10777.strings != null)
         {
            for each(_loc1_ in this.Renamed10777.strings)
            {
               localeService.setText(_loc1_.key,_loc1_.value);
            }
         }
         if(this.Renamed10777.images != null && this.Renamed10777.images.length > 0)
         {
            this.Renamed8530();
         }
         this.Renamed10779();
      }
      
      private function Renamed8530() : void
      {
         var _loc2_:ImagePair = null;
         var _loc1_:Vector.<ByteArray> = new Vector.<ByteArray>();
         for each(_loc2_ in this.Renamed10777.images)
         {
            _loc1_.push(_loc2_.value);
         }
         this.Renamed10778 = new BatchImageConstructor();
         this.Renamed10778.addEventListener(Event.COMPLETE,this.Renamed10781);
         this.Renamed10778.Renamed4102(_loc1_,5);
      }
      
      private function Renamed10781(param1:Event) : void
      {
         var _loc2_:Vector.<BitmapData> = this.Renamed10778.images;
         this.Renamed10778 = null;
         var _loc3_:Vector.<ImagePair> = this.Renamed10777.images;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.length)
         {
            localeService.setImage(_loc3_[_loc4_].key,_loc2_[_loc4_]);
            _loc4_++;
         }
      }
   }
}

