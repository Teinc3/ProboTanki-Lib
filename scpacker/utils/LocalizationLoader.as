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
   import scpacker.networking.protocol.§?"s§;
   
   public class LocalizationLoader
   {
      public static var localeService:ILocaleService;
      
      private var §with const implements§:LocalizedFileFormat;
      
      private var §>#;§:BatchImageConstructor;
      
      private var §break const static§:Function;
      
      public function LocalizationLoader()
      {
         super();
         localeService = ILocaleService(OSGi.getInstance().getService(ILocaleService));
      }
      
      public function §try package while§(param1:String, param2:Function) : void
      {
         this.§break const static§ = param2;
         var _loc3_:CacheURLLoader = new CacheURLLoader();
         _loc3_.dataFormat = URLLoaderDataFormat.BINARY;
         _loc3_.addEventListener(Event.COMPLETE,this.onLoadingComplete);
         _loc3_.load(new URLRequest(param1));
      }
      
      protected function onLoadingComplete(param1:Event) : void
      {
         var _loc2_:§?"s§ = §?"s§(OSGi.getInstance().getService(§?"s§));
         var _loc3_:ByteArray = URLLoader(param1.target).data;
         _loc3_.uncompress();
         this.§with const implements§ = LocalizedFileFormat(_loc2_.getCodec("scpacker.networking.protocol.codec.custom.CodecLocaleStruct").decode(_loc3_));
         this.§class set false§();
      }
      
      private function §class set false§() : void
      {
         var _loc1_:StringPair = null;
         if(this.§with const implements§.strings != null)
         {
            for each(_loc1_ in this.§with const implements§.strings)
            {
               localeService.setText(_loc1_.key,_loc1_.value);
            }
         }
         if(this.§with const implements§.images != null && this.§with const implements§.images.length > 0)
         {
            this.§override catch finally§();
         }
         this.§break const static§();
      }
      
      private function §override catch finally§() : void
      {
         var _loc2_:ImagePair = null;
         var _loc1_:Vector.<ByteArray> = new Vector.<ByteArray>();
         for each(_loc2_ in this.§with const implements§.images)
         {
            _loc1_.push(_loc2_.value);
         }
         this.§>#;§ = new BatchImageConstructor();
         this.§>#;§.addEventListener(Event.COMPLETE,this.§<"E§);
         this.§>#;§.§default var implements§(_loc1_,5);
      }
      
      private function §<"E§(param1:Event) : void
      {
         var _loc2_:Vector.<BitmapData> = this.§>#;§.images;
         this.§>#;§ = null;
         var _loc3_:Vector.<ImagePair> = this.§with const implements§.images;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.length)
         {
            localeService.setImage(_loc3_[_loc4_].key,_loc2_[_loc4_]);
            _loc4_++;
         }
      }
   }
}

